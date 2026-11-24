export declare class DateUtils {
    static edadEnAnios(fechaNacimiento: Date, aFecha?: Date): number;
    static aniosTranscurridos(desde: Date, aFecha?: Date): number;
    static periodo(fecha?: Date): string;
    static periodoAnterior(periodo: string): string;
    static semanaDe(fecha?: Date): {
        inicio: Date;
        fin: Date;
    };
    static esUltimaSemanaDelMes(fecha?: Date): boolean;
}
