import { Body, Controller, Delete, ForbiddenException, Get, NotFoundException, Param, ParseIntPipe, Patch, Post, Put, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { InscripcionesService } from './inscripciones.service';
import { CreateInscripcionDto } from './dto/create-inscripcion.dto';
import { Roles } from '../common/decorators/roles.decorator';
import { Role } from '../common/enums/role.enum';
import { RolesGuard } from '../common/guards/roles.guard';
import { CurrentUser } from '../common/decorators/current-user.decorator';
import { AuthenticatedUser } from '../auth/interfaces/authenticated-user.interface';

@ApiTags('Inscripciones a actividades')
@ApiBearerAuth()
@UseGuards(RolesGuard)
@Controller('inscripciones')
export class InscripcionesController {
  constructor(private readonly service: InscripcionesService) {}

  @Post()
  @Roles(Role.ADMIN, Role.INSTRUCTOR, Role.SOCIO)
  async inscribir(@Body() dto: CreateInscripcionDto, @CurrentUser() user: AuthenticatedUser) {
    if (user.role === Role.SOCIO && user.socioId !== dto.socioId) {
      throw new ForbiddenException('Sólo puede inscribirse a sí mismo.');
    }
    if (user.role === Role.INSTRUCTOR) {
      await this.service.validarInstructorActividad(user, dto.actividadId);
    }
    return this.service.inscribir(dto);
  }

  /** Guardar asistencias en lote para una actividad (0: ausente, 1: presente) */
  @Put('actividad/:actividadId/asistencias')
  @Patch('actividad/:actividadId/asistencias')
  @Roles(Role.ADMIN, Role.INSTRUCTOR)
  async guardarAsistenciasActividad(
    @Param('actividadId', ParseIntPipe) actividadId: number,
    @Body() body: any,
    @CurrentUser() user: AuthenticatedUser,
  ) {
    if (user?.role === Role.INSTRUCTOR) {
      await this.service.validarInstructorActividad(user, actividadId);
    }
    const list = Array.isArray(body) ? body : (body?.asistencias || []);
    return this.service.guardarAsistenciasActividad(actividadId, list);
  }

  /** Baja por socio y actividad */
  @Delete('socio/:socioId/actividad/:actividadId')
  @Roles(Role.ADMIN, Role.INSTRUCTOR, Role.SOCIO)
  async darDeBajaPorSocioYActividad(
    @Param('socioId', ParseIntPipe) socioId: number,
    @Param('actividadId', ParseIntPipe) actividadId: number,
    @CurrentUser() user: AuthenticatedUser,
  ) {
    if (user?.role === Role.SOCIO && user.socioId !== socioId) {
      throw new ForbiddenException('Sólo puede darse de baja a sí mismo.');
    }
    if (user?.role === Role.INSTRUCTOR) {
      await this.service.validarInstructorActividad(user, actividadId);
    }
    return this.service.darDeBajaPorSocioYActividad(socioId, actividadId);
  }

  /** Actualizar asistencia individual de una inscripción */
  @Patch(':id/asistencia')
  @Roles(Role.ADMIN, Role.INSTRUCTOR)
  async actualizarAsistencia(
    @Param('id', ParseIntPipe) id: number,
    @Body('asistencia') asistencia: number,
    @CurrentUser() user: AuthenticatedUser,
  ) {
    if (user?.role === Role.INSTRUCTOR) {
      const inscripcion = await this.service.findOne(id);
      if (inscripcion?.actividad?.id) {
        await this.service.validarInstructorActividad(user, inscripcion.actividad.id);
      }
    }
    return this.service.actualizarAsistencia(id, Number(asistencia));
  }

  @Delete(':id')
  @Roles(Role.ADMIN, Role.INSTRUCTOR, Role.SOCIO)
  async darDeBaja(@Param('id', ParseIntPipe) id: number, @CurrentUser() user: AuthenticatedUser) {
    if (user?.role === Role.SOCIO || user?.role === Role.INSTRUCTOR) {
      const inscripcion = await this.service.findOne(id);
      if (!inscripcion) {
        throw new NotFoundException(`No existe una inscripción con id ${id}.`);
      }
      if (user.role === Role.SOCIO && user.socioId !== inscripcion.socio?.id) {
        throw new ForbiddenException('Sólo puede darse de baja a sí mismo.');
      }
      if (user.role === Role.INSTRUCTOR && inscripcion.actividad?.id) {
        await this.service.validarInstructorActividad(user, inscripcion.actividad.id);
      }
    }
    return this.service.darDeBaja(id);
  }

  @Get()
  @Roles(Role.ADMIN, Role.INSTRUCTOR, Role.SOCIO)
  buscar(
    @Query('actividadId') actividadId?: string,
    @Query('socioId') socioId?: string,
    @CurrentUser() user?: AuthenticatedUser,
  ) {
    if (actividadId) return this.service.findPorActividad(Number(actividadId));
    if (socioId) {
      if (user?.role === Role.SOCIO && user.socioId !== Number(socioId)) {
        throw new ForbiddenException('Sólo puede consultar sus propias inscripciones.');
      }
      return this.service.findPorSocio(Number(socioId));
    }
    if (user?.role === Role.SOCIO && user.socioId) {
      return this.service.findPorSocio(user.socioId);
    }
    return this.service.findAll();
  }
}
