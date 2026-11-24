import { Repository } from 'typeorm';
import { Inscripcion } from './entities/inscripcion.entity';
import { CreateInscripcionDto } from './dto/create-inscripcion.dto';
import { Socio } from '../socios/entities/socio.entity';
import { Actividad } from '../actividades/entities/actividad.entity';
export declare class InscripcionesService {
    private readonly repo;
    private readonly sociosRepo;
    private readonly actividadesRepo;
    constructor(repo: Repository<Inscripcion>, sociosRepo: Repository<Socio>, actividadesRepo: Repository<Actividad>);
    inscribir(dto: CreateInscripcionDto): Promise<Inscripcion>;
    darDeBaja(id: number): Promise<{
        message: string;
    }>;
    findPorActividad(actividadId: number): Promise<Inscripcion[]>;
    findPorSocio(socioId: number): Promise<Inscripcion[]>;
    actualizarAsistencia(id: number, asistencia: number): Promise<Inscripcion>;
    guardarAsistenciasActividad(actividadId: number, asistencias: {
        inscripcionId?: number;
        socioId?: number;
        asistencia: number;
    }[]): Promise<{
        message: string;
        actualizados: number;
    }>;
    darDeBajaPorSocioYActividad(socioId: number, actividadId: number): Promise<{
        message: string;
    }>;
}
