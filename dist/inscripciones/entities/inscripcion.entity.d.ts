import { Socio } from '../../socios/entities/socio.entity';
import { Actividad } from '../../actividades/entities/actividad.entity';
export declare class Inscripcion {
    id: number;
    socio: Socio;
    actividad: Actividad;
    asistencia: number;
    activa: boolean;
    fechaInscripcion: Date;
}
