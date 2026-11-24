import { ActividadesService } from './actividades.service';
import { CreateActividadDto } from './dto/create-actividad.dto';
import { UpdateActividadDto } from './dto/update-actividad.dto';
import { AuthenticatedUser } from '../auth/interfaces/authenticated-user.interface';
export declare class ActividadesController {
    private readonly service;
    constructor(service: ActividadesService);
    create(dto: CreateActividadDto): Promise<import("./entities/actividad.entity").Actividad>;
    findAll(): Promise<import("./entities/actividad.entity").Actividad[]>;
    asistencia(user: AuthenticatedUser): Promise<import("./entities/actividad.entity").Actividad[]>;
    findOne(id: number): Promise<import("./entities/actividad.entity").Actividad>;
    update(id: number, dto: UpdateActividadDto): Promise<import("./entities/actividad.entity").Actividad>;
    remove(id: number): Promise<{
        message: string;
    }>;
}
