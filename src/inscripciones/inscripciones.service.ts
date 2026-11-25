import { BadRequestException, ConflictException, ForbiddenException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Inscripcion } from './entities/inscripcion.entity';
import { CreateInscripcionDto } from './dto/create-inscripcion.dto';
import { Socio } from '../socios/entities/socio.entity';
import { Actividad } from '../actividades/entities/actividad.entity';
import { Instructor } from '../instructores/entities/instructor.entity';
import { EstadoSocio } from '../common/enums/estado-socio.enum';
import { AuthenticatedUser } from '../auth/interfaces/authenticated-user.interface';

@Injectable()
export class InscripcionesService {
  constructor(
    @InjectRepository(Inscripcion) private readonly repo: Repository<Inscripcion>,
    @InjectRepository(Socio) private readonly sociosRepo: Repository<Socio>,
    @InjectRepository(Actividad) private readonly actividadesRepo: Repository<Actividad>,
    @InjectRepository(Instructor) private readonly instructoresRepo: Repository<Instructor>,
  ) {}

  /** Inscribirse en una actividad deportiva (CUD-06). Algunos socios están anotados en diversas actividades. */
  async inscribir(dto: CreateInscripcionDto): Promise<Inscripcion> {
    const socio = await this.sociosRepo.findOne({ where: { id: dto.socioId } });
    if (!socio) throw new NotFoundException(`No existe un socio con id ${dto.socioId}.`);
    if (socio.estado === EstadoSocio.SUSPENDIDO || socio.estado === EstadoSocio.BAJA) {
      throw new BadRequestException('El socio no puede inscribirse en actividades: está suspendido o dado de baja.');
    }

    const actividad = await this.actividadesRepo.findOne({
      where: { id: dto.actividadId },
      relations: {
        inscripciones: true
      }
    });
    if (!actividad) throw new NotFoundException(`No existe una actividad con id ${dto.actividadId}.`);
    if (!actividad.activa) throw new BadRequestException('La actividad no se encuentra disponible.');

    const existente = await this.repo.findOne({
      where: { socio: { id: dto.socioId }, actividad: { id: dto.actividadId } },
    });
    if (existente) {
      throw new ConflictException('El socio ya está inscripto en esa actividad.');
    }

    if (actividad.cupoMaximo) {
      const inscriptosActivos = actividad.inscripciones.filter((i) => i.activa).length;
      if (inscriptosActivos >= actividad.cupoMaximo) {
        throw new BadRequestException('La actividad alcanzó su cupo máximo de inscriptos.');
      }
    }

    const inscripcion = this.repo.create({ socio, actividad });
    return this.repo.save(inscripcion);
  }

  /** Darse de baja de una actividad deportiva (CUD-07). */
  async darDeBaja(id: number): Promise<{ message: string }> {
    const inscripcion = await this.repo.findOne({
      where: { id },
      relations: {
        socio: true,
        actividad: true
      }
    });
    if (!inscripcion) {
      throw new NotFoundException(`No existe una inscripción con id ${id}.`);
    }
    await this.repo.remove(inscripcion);
    return {
      message: `${inscripcion.socio.apellido}, ${inscripcion.socio.nombre} fue dado de baja de "${inscripcion.actividad.nombre}".`,
    };
  }

  findPorActividad(actividadId: number): Promise<Inscripcion[]> {
    return this.repo
      .createQueryBuilder('inscripcion')
      .innerJoinAndSelect('inscripcion.socio', 'socio')
      .leftJoinAndSelect('inscripcion.actividad', 'actividad')
      .where('(inscripcion.actividadId = :actividadId OR actividad.id = :actividadId)', { actividadId })
      .andWhere('inscripcion.activa = 1')
      .andWhere('socio.estado != :estadoBaja', { estadoBaja: EstadoSocio.BAJA })
      .orderBy('socio.apellido', 'ASC')
      .addOrderBy('socio.nombre', 'ASC')
      .getMany();
  }

  findPorSocio(socioId: number): Promise<Inscripcion[]> {
    return this.repo.find({
      where: { socio: { id: socioId } },
      relations: {
        actividad: true
      }
    });
  }

  findAll(): Promise<Inscripcion[]> {
    return this.repo.find({
      relations: {
        socio: true,
        actividad: true,
      },
      where: { activa: true },
    });
  }

  /** Actualizar asistencia individual de una inscripción (0: ausente, 1: presente) */
  async actualizarAsistencia(id: number, asistencia: number): Promise<Inscripcion> {
    const inscripcion = await this.repo.findOne({ where: { id }, relations: {
        socio: true,
        actividad: true
      }});
    if (!inscripcion) {
      throw new NotFoundException(`No existe una inscripción con id ${id}.`);
    }
    inscripcion.asistencia = Number(asistencia) === 1 ? 1 : 0;
    return this.repo.save(inscripcion);
  }

  /** Actualizar asistencias en lote para una actividad (0: ausente, 1: presente) */
  async guardarAsistenciasActividad(
    actividadId: number,
    asistencias: { inscripcionId?: number; socioId?: number; asistencia: number }[],
  ): Promise<{ message: string; actualizados: number }> {
    let actualizados = 0;
    for (const item of asistencias) {
      let inscripcion: Inscripcion | null = null;
      if (item.inscripcionId) {
        inscripcion = await this.repo.findOne({ where: { id: item.inscripcionId } });
      }
      if (!inscripcion && item.socioId) {
        inscripcion = await this.repo.findOne({
          where: { actividad: { id: actividadId }, socio: { id: item.socioId } },
        });
      }
      if (inscripcion) {
        inscripcion.asistencia = Number(item.asistencia) === 1 ? 1 : 0;
        await this.repo.save(inscripcion);
        actualizados++;
      }
    }
    return {
      message: `Asistencias actualizadas correctamente (${actualizados} registros).`,
      actualizados,
    };
  }

  /** Baja por socio y actividad (CUD-07) */
  async darDeBajaPorSocioYActividad(socioId: number, actividadId: number): Promise<{ message: string }> {
    const inscripcion = await this.repo.findOne({
      where: { socio: { id: socioId }, actividad: { id: actividadId } },
      relations: {
        socio: true,
        actividad: true
      }
    });
    if (!inscripcion) {
      throw new NotFoundException(`No existe una inscripción para el socio ${socioId} en la actividad ${actividadId}.`);
    }
    await this.repo.remove(inscripcion);
    return {
      message: `${inscripcion.socio.apellido}, ${inscripcion.socio.nombre} fue dado de baja de "${inscripcion.actividad.nombre}".`,
    };
  }

  async findOne(id: number): Promise<Inscripcion | null> {
    return this.repo.findOne({
      where: { id },
      relations: {
        socio: true,
        actividad: { instructor: true },
      },
    });
  }

  /**
   * Valida que el usuario con rol INSTRUCTOR sea efectivamente quien dicta la actividad.
   * Si no lo es, lanza ForbiddenException.
   */
  async validarInstructorActividad(user: AuthenticatedUser, actividadId: number): Promise<void> {
    let instructorId = user.instructorId;
    if (!instructorId) {
      const inst = await this.instructoresRepo.findOne({
        where: [{ user: { id: user.userId } }, { email: user.email }],
      });
      instructorId = inst?.id ?? null;
    }

    if (!instructorId) {
      throw new ForbiddenException('No se encontró el registro de instructor asociado a este usuario.');
    }

    const actividad = await this.actividadesRepo.findOne({
      where: { id: actividadId },
      relations: { instructor: true },
    });

    if (!actividad) {
      throw new NotFoundException(`No existe una actividad con id ${actividadId}.`);
    }

    if (!actividad.instructor || Number(actividad.instructor.id) !== Number(instructorId)) {
      throw new ForbiddenException(
        `Acceso denegado: sólo puede gestionar inscripciones en las actividades que tiene a su cargo ("${actividad.nombre}" está a cargo de otro instructor).`,
      );
    }
  }
}
