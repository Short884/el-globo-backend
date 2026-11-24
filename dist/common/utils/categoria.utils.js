"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.calcularCategoriaSocial = calcularCategoriaSocial;
const categoria_social_enum_1 = require("../enums/categoria-social.enum");
const date_utils_1 = require("./date.utils");
function calcularCategoriaSocial(fechaNacimiento, fechaAlta, parametros) {
    const edad = date_utils_1.DateUtils.edadEnAnios(fechaNacimiento);
    if (edad < parametros.edadMinimaActivo) {
        return categoria_social_enum_1.CategoriaSocial.CADETE;
    }
    const antiguedad = date_utils_1.DateUtils.aniosTranscurridos(fechaAlta);
    if (edad >= parametros.edadMinimaVitalicio && antiguedad >= parametros.antiguedadMinimaVitalicio) {
        return categoria_social_enum_1.CategoriaSocial.VITALICIO;
    }
    return categoria_social_enum_1.CategoriaSocial.ACTIVO;
}
//# sourceMappingURL=categoria.utils.js.map