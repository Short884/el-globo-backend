"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DateUtils = void 0;
class DateUtils {
    static edadEnAnios(fechaNacimiento, aFecha = new Date()) {
        let edad = aFecha.getFullYear() - fechaNacimiento.getFullYear();
        const mes = aFecha.getMonth() - fechaNacimiento.getMonth();
        if (mes < 0 || (mes === 0 && aFecha.getDate() < fechaNacimiento.getDate())) {
            edad--;
        }
        return edad;
    }
    static aniosTranscurridos(desde, aFecha = new Date()) {
        return DateUtils.edadEnAnios(desde, aFecha);
    }
    static periodo(fecha = new Date()) {
        const anio = fecha.getFullYear();
        const mes = String(fecha.getMonth() + 1).padStart(2, '0');
        return `${anio}-${mes}`;
    }
    static periodoAnterior(periodo) {
        const [anio, mes] = periodo.split('-').map(Number);
        const fecha = new Date(anio, mes - 1, 1);
        fecha.setMonth(fecha.getMonth() - 1);
        return DateUtils.periodo(fecha);
    }
    static semanaDe(fecha = new Date()) {
        const dia = fecha.getDay();
        const diff = dia === 0 ? -6 : 1 - dia;
        const inicio = new Date(fecha);
        inicio.setDate(fecha.getDate() + diff);
        inicio.setHours(0, 0, 0, 0);
        const fin = new Date(inicio);
        fin.setDate(inicio.getDate() + 6);
        fin.setHours(23, 59, 59, 999);
        return { inicio, fin };
    }
    static esUltimaSemanaDelMes(fecha = new Date()) {
        const ultimoDiaDelMes = new Date(fecha.getFullYear(), fecha.getMonth() + 1, 0).getDate();
        return fecha.getDate() > ultimoDiaDelMes - 7;
    }
}
exports.DateUtils = DateUtils;
//# sourceMappingURL=date.utils.js.map