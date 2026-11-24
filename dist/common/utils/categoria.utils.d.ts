import { CategoriaSocial } from '../enums/categoria-social.enum';
export interface ParametrosCategoria {
    edadMinimaActivo: number;
    edadMinimaVitalicio: number;
    antiguedadMinimaVitalicio: number;
}
export declare function calcularCategoriaSocial(fechaNacimiento: Date, fechaAlta: Date, parametros: ParametrosCategoria): CategoriaSocial;
