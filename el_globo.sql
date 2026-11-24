-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-11-2026 a las 18:13:27
-- Versión del servidor: 8.4.7
-- Versión de PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `el_globo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

DROP TABLE IF EXISTS `actividades`;
CREATE TABLE IF NOT EXISTS `actividades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `arancel` decimal(12,2) NOT NULL,
  `turno` enum('MATUTINO','VESPERTINO','NOCTURNO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `diasSemana` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `cupoMaximo` int DEFAULT NULL,
  `instructorId` int DEFAULT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_c26d36cbf7354ed1b57651d1b0a` (`instructorId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `nombre`, `descripcion`, `arancel`, `turno`, `diasSemana`, `horaInicio`, `horaFin`, `cupoMaximo`, `instructorId`, `activa`, `createdAt`) VALUES
(1, 'Natación Adultos', 'Clases de natación para adultos, todos los niveles.', 12000.00, 'MATUTINO', 'Lunes, Miércoles, Viernes', '08:00:00', '09:00:00', 15, 1, 1, '2026-11-10 17:49:57.296652'),
(2, 'Natación Infantil', 'Escuela de natación para chicos de 6 a 17 años.', 10000.00, 'VESPERTINO', 'Martes, Jueves', '17:00:00', '18:00:00', 15, 1, 1, '2026-11-10 17:49:57.296652'),
(3, 'Aquagym', 'Gimnasia acuática de bajo impacto.', 8000.00, 'MATUTINO', 'Martes, Jueves', '10:00:00', '11:00:00', 20, 2, 1, '2026-11-10 17:49:57.296652'),
(4, 'Fútbol 5', 'Fútbol 5 recreativo en cancha techada.', 8000.00, 'NOCTURNO', 'Lunes, Miércoles', '21:00:00', '22:30:00', 20, 3, 1, '2026-11-10 17:49:57.296652'),
(5, 'Fútbol Infantil', 'Escuelita de fútbol para chicos y chicas.', 7000.00, 'VESPERTINO', 'Martes, Jueves', '16:30:00', '18:00:00', 25, 3, 1, '2026-11-10 17:49:57.296652'),
(6, 'Básquet', 'Básquet recreativo y de competencia.', 8500.00, 'NOCTURNO', 'Martes, Jueves', '20:00:00', '21:30:00', 20, 4, 1, '2026-11-10 17:49:57.296652'),
(7, 'Vóley', 'Vóley mixto, todos los niveles.', 7500.00, 'VESPERTINO', 'Lunes, Miércoles', '18:30:00', '20:00:00', 18, 4, 1, '2026-11-10 17:49:57.296652'),
(8, 'Tenis', 'Clases de tenis en canchas de polvo de ladrillo.', 11000.00, 'MATUTINO', 'Sábados', '09:00:00', '10:30:00', 6, 5, 1, '2026-11-10 17:49:57.296652'),
(9, 'Pádel', 'Pádel en canchas cubiertas.', 13000.00, 'NOCTURNO', 'Martes, Jueves, Sábados', '20:30:00', '22:00:00', 8, 5, 1, '2026-11-10 17:49:57.296652'),
(10, 'Gimnasio (Musculación)', 'Sala de musculación con profesor a cargo.', 15000.00, 'MATUTINO', 'Lunes a Viernes', '07:00:00', '12:00:00', NULL, 6, 1, '2026-11-10 17:49:57.296652'),
(11, 'Spinning', 'Clases grupales de ciclismo indoor.', 9500.00, 'VESPERTINO', 'Lunes, Miércoles, Viernes', '19:00:00', '20:00:00', 15, 6, 1, '2026-11-10 17:49:57.296652'),
(12, 'Yoga', 'Yoga y relajación.', 8000.00, 'MATUTINO', 'Martes, Jueves', '09:30:00', '10:30:00', 12, 7, 1, '2026-11-10 17:49:57.296652'),
(13, 'Pilates', 'Pilates en colchoneta y con máquinas.', 9000.00, 'VESPERTINO', 'Lunes, Miércoles', '18:00:00', '19:00:00', 12, 7, 1, '2026-11-10 17:49:57.296652'),
(14, 'Boxeo Recreativo', 'Entrenamiento funcional con boxeo.', 10000.00, 'NOCTURNO', 'Lunes, Miércoles, Viernes', '20:00:00', '21:30:00', 10, 8, 1, '2026-11-10 17:49:57.296652'),
(15, 'Judo', 'Judo para chicos y adolescentes.', 8500.00, 'VESPERTINO', 'Martes, Jueves', '17:30:00', '19:00:00', 3, 8, 1, '2026-11-10 17:49:57.296652'),
(16, 'Gimnasia Artística', 'Gimnasia artística infantil y juvenil.', 9000.00, 'VESPERTINO', 'Lunes, Miércoles, Viernes', '16:00:00', '17:30:00', 12, 2, 1, '2026-11-10 17:49:57.296652'),
(17, 'Hockey', 'Hockey sobre césped, categorías mixtas.', 8000.00, 'NOCTURNO', 'Lunes, Miércoles', '20:30:00', '22:00:00', 16, 2, 1, '2026-11-10 17:49:57.296652'),
(18, 'Atletismo', 'Entrenamiento de pista y campo.', 6500.00, 'MATUTINO', 'Sábados', '08:00:00', '09:30:00', 20, 6, 1, '2026-11-10 17:49:57.296652'),
(19, 'Zumba', 'Baile fitness grupal.', 7000.00, 'NOCTURNO', 'Martes, Jueves', '20:00:00', '21:00:00', 20, 7, 1, '2026-11-10 17:49:57.296652'),
(20, 'Ajedrez', 'Taller de ajedrez para todas las edades.', 5000.00, 'VESPERTINO', 'Viernes', '18:00:00', '19:30:00', NULL, 3, 1, '2026-11-10 17:49:57.296652');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casilleros`
--

DROP TABLE IF EXISTS `casilleros`;
CREATE TABLE IF NOT EXISTS `casilleros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `socioId` int DEFAULT NULL,
  `costoMensual` decimal(12,2) NOT NULL DEFAULT '2500.00',
  `fechaAlquiler` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_40350f49bcf794bbb83ea79855` (`numero`),
  UNIQUE KEY `REL_a65f225f2c10d5efdf539009d0` (`socioId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casilleros`
--

INSERT INTO `casilleros` (`id`, `numero`, `socioId`, `costoMensual`, `fechaAlquiler`) VALUES
(1, 1, 13, 2500.00, '2026-08-01'),
(2, 2, 14, 2500.00, '2026-08-01'),
(3, 3, NULL, 2500.00, NULL),
(4, 4, NULL, 2500.00, NULL),
(5, 5, 1, 2500.00, '2026-08-01'),
(6, 6, NULL, 2500.00, NULL),
(7, 7, NULL, 2500.00, NULL),
(8, 8, NULL, 2500.00, NULL),
(9, 9, NULL, 2500.00, NULL),
(10, 10, NULL, 2500.00, NULL),
(11, 11, NULL, 2500.00, NULL),
(12, 12, 4, 2500.00, '2026-08-01'),
(13, 13, NULL, 2500.00, NULL),
(14, 14, NULL, 2500.00, NULL),
(15, 15, NULL, 2500.00, NULL),
(16, 16, NULL, 2500.00, NULL),
(17, 17, NULL, 2500.00, NULL),
(18, 18, NULL, 2500.00, NULL),
(19, 19, NULL, 2500.00, NULL),
(20, 20, 8, 2500.00, '2026-08-01'),
(21, 21, NULL, 2500.00, NULL),
(22, 22, NULL, 2500.00, NULL),
(23, 23, NULL, 2500.00, NULL),
(24, 24, NULL, 2500.00, NULL),
(25, 25, NULL, 2500.00, NULL),
(26, 26, NULL, 2500.00, NULL),
(27, 27, NULL, 2500.00, NULL),
(28, 28, NULL, 2500.00, NULL),
(29, 29, NULL, 2500.00, NULL),
(30, 30, NULL, 2500.00, NULL),
(31, 31, NULL, 2500.00, NULL),
(32, 32, NULL, 2500.00, NULL),
(33, 33, 18, 2500.00, '2026-08-01'),
(34, 34, 19, 2500.00, '2026-08-01'),
(35, 35, NULL, 2500.00, NULL),
(36, 36, NULL, 2500.00, NULL),
(37, 37, NULL, 2500.00, NULL),
(38, 38, NULL, 2500.00, NULL),
(39, 39, NULL, 2500.00, NULL),
(40, 40, 21, 2500.00, '2026-08-01'),
(41, 41, NULL, 2500.00, NULL),
(42, 42, NULL, 2500.00, NULL),
(43, 43, NULL, 2500.00, NULL),
(44, 44, NULL, 2500.00, NULL),
(45, 45, NULL, 2500.00, NULL),
(46, 46, NULL, 2500.00, NULL),
(47, 47, NULL, 2500.00, NULL),
(48, 48, NULL, 2500.00, NULL),
(49, 49, NULL, 2500.00, NULL),
(50, 50, 24, 2500.00, '2026-08-01'),
(51, 51, 26, 2500.00, '2026-08-01'),
(52, 52, 27, 2500.00, '2026-08-01'),
(53, 53, NULL, 2500.00, NULL),
(54, 54, NULL, 2500.00, NULL),
(55, 55, NULL, 2500.00, NULL),
(56, 56, NULL, 2500.00, NULL),
(57, 57, NULL, 2500.00, NULL),
(58, 58, NULL, 2500.00, NULL),
(59, 59, NULL, 2500.00, NULL),
(60, 60, 30, 2500.00, '2026-08-01'),
(61, 61, NULL, 2500.00, NULL),
(62, 62, NULL, 2500.00, NULL),
(63, 63, NULL, 2500.00, NULL),
(64, 64, NULL, 2500.00, NULL),
(65, 65, NULL, 2500.00, NULL),
(66, 66, NULL, 2500.00, NULL),
(67, 67, NULL, 2500.00, NULL),
(68, 68, NULL, 2500.00, NULL),
(69, 69, NULL, 2500.00, NULL),
(70, 70, NULL, 2500.00, NULL),
(71, 71, NULL, 2500.00, NULL),
(72, 72, NULL, 2500.00, NULL),
(73, 73, NULL, 2500.00, NULL),
(74, 74, NULL, 2500.00, NULL),
(75, 75, 29, 2500.00, '2026-08-01'),
(76, 76, NULL, 2500.00, NULL),
(77, 77, NULL, 2500.00, NULL),
(78, 78, NULL, 2500.00, NULL),
(79, 79, NULL, 2500.00, NULL),
(80, 80, NULL, 2500.00, NULL),
(81, 81, NULL, 2500.00, NULL),
(82, 82, NULL, 2500.00, NULL),
(83, 83, NULL, 2500.00, NULL),
(84, 84, NULL, 2500.00, NULL),
(85, 85, NULL, 2500.00, NULL),
(86, 86, NULL, 2500.00, NULL),
(87, 87, NULL, 2500.00, NULL),
(88, 88, 36, 2500.00, '2026-08-01'),
(89, 89, NULL, 2500.00, NULL),
(90, 90, NULL, 2500.00, NULL),
(91, 91, NULL, 2500.00, NULL),
(92, 92, NULL, 2500.00, NULL),
(93, 93, NULL, 2500.00, NULL),
(94, 94, NULL, 2500.00, NULL),
(95, 95, NULL, 2500.00, NULL),
(96, 96, NULL, 2500.00, NULL),
(97, 97, NULL, 2500.00, NULL),
(98, 98, NULL, 2500.00, NULL),
(99, 99, NULL, 2500.00, NULL),
(100, 100, NULL, 2500.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobradores`
--

DROP TABLE IF EXISTS `cobradores`;
CREATE TABLE IF NOT EXISTS `cobradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comisionPorcentaje` decimal(5,2) NOT NULL DEFAULT '10.00',
  `zona` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_fd7c0773d37ea6035ea36af17a` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cobradores`
--

INSERT INTO `cobradores` (`id`, `nombre`, `apellido`, `correo`, `comisionPorcentaje`, `zona`, `createdAt`) VALUES
(1, 'Julian', 'Pérez', 'perez.cobrador@elglobo.com.ar', 10.00, '0', '2026-11-10 17:49:57.917077'),
(2, 'Marco', 'García', 'garcia.cobrador@elglobo.com.ar', 10.00, '0', '2026-11-10 17:49:57.917077'),
(3, 'Juliana', 'Rodríguez', 'rodriguez.cobrador@elglobo.com.ar', 10.00, '0', '2026-11-10 17:49:57.917077');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuotaCadete` decimal(12,2) NOT NULL DEFAULT '35000.00',
  `cuotaActivo` decimal(12,2) NOT NULL DEFAULT '50000.00',
  `cuotaVitalicio` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cuotaGrupoFamiliar` decimal(12,2) NOT NULL DEFAULT '80000.00',
  `costoCasillero` decimal(12,2) NOT NULL DEFAULT '2500.00',
  `recargoMorosidad` decimal(5,2) NOT NULL DEFAULT '5.00',
  `comisionCobrador` decimal(5,2) NOT NULL DEFAULT '10.00',
  `edadMinimaActivo` int NOT NULL DEFAULT '18',
  `edadMinimaVitalicio` int NOT NULL DEFAULT '60',
  `antiguedadMinimaVitalicio` int NOT NULL DEFAULT '30',
  `mesesConsecutivosParaMorosidad` int NOT NULL DEFAULT '2',
  `totalCasilleros` int NOT NULL DEFAULT '100',
  `totalActividades` int NOT NULL DEFAULT '20',
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `cuotaCadete`, `cuotaActivo`, `cuotaVitalicio`, `cuotaGrupoFamiliar`, `costoCasillero`, `recargoMorosidad`, `comisionCobrador`, `edadMinimaActivo`, `edadMinimaVitalicio`, `antiguedadMinimaVitalicio`, `mesesConsecutivosParaMorosidad`, `totalCasilleros`, `totalActividades`, `updatedAt`) VALUES
(1, 35000.00, 50000.00, 0.00, 80000.00, 2500.00, 5.00, 10.00, 18, 60, 30, 2, 100, 20, '2026-11-10 17:50:00.454046');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

DROP TABLE IF EXISTS `cupones`;
CREATE TABLE IF NOT EXISTS `cupones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socioId` int DEFAULT NULL,
  `grupoFamiliarId` int DEFAULT NULL,
  `cobradorId` int DEFAULT NULL,
  `montoCuotaSocial` decimal(12,2) NOT NULL,
  `montoActividades` decimal(12,2) NOT NULL DEFAULT '0.00',
  `montoCasillero` decimal(12,2) NOT NULL DEFAULT '0.00',
  `recargoPorcentaje` decimal(5,2) NOT NULL DEFAULT '0.00',
  `montoTotal` decimal(12,2) NOT NULL,
  `estado` enum('PENDIENTE','PAGADO','DEVUELTO','ANULADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `esReemision` tinyint(1) NOT NULL DEFAULT '0',
  `detalle` text COLLATE utf8mb4_unicode_ci,
  `fechaPago` date DEFAULT NULL,
  `periodo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zona` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaEmision` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_b6d876bdcb988e3321db0d372e9` (`socioId`),
  KEY `FK_6b6717b88572d2b5036e39913aa` (`grupoFamiliarId`),
  KEY `FK_b4f1951e34607a82a2163938715` (`cobradorId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cupones`
--

INSERT INTO `cupones` (`id`, `socioId`, `grupoFamiliarId`, `cobradorId`, `montoCuotaSocial`, `montoActividades`, `montoCasillero`, `recargoPorcentaje`, `montoTotal`, `estado`, `esReemision`, `detalle`, `fechaPago`, `periodo`, `zona`, `fechaEmision`) VALUES
(1, 1, 1, 1, 80000.00, 49000.00, 2500.00, 0.00, 131500.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-09-30', '', '0', '2026-11-10 17:49:58.084017'),
(2, 4, 2, 2, 80000.00, 50500.00, 2500.00, 0.00, 133000.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-09-25', '', '0', '2026-11-10 17:49:58.084017'),
(3, 8, 3, 3, 80000.00, 64000.00, 2500.00, 0.00, 146500.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-09-15', '', '0', '2026-11-10 17:49:58.084017'),
(4, 13, NULL, NULL, 0.00, 14000.00, 2500.00, 0.00, 16500.00, 'PAGADO', 0, NULL, '2026-09-07', '', '0', '2026-11-10 17:49:58.084017'),
(5, 14, NULL, 1, 0.00, 17000.00, 2500.00, 0.00, 19500.00, 'PAGADO', 0, NULL, '2026-09-02', '', '0', '2026-11-10 17:49:58.084017'),
(6, 15, NULL, 3, 0.00, 5000.00, 0.00, 0.00, 5000.00, 'PAGADO', 0, NULL, '2026-09-14', '', '0', '2026-11-10 17:49:58.084017'),
(7, 16, NULL, 2, 50000.00, 18000.00, 0.00, 0.00, 68000.00, 'PAGADO', 0, NULL, '2026-09-26', '', '0', '2026-11-10 17:49:58.084017'),
(8, 17, NULL, NULL, 50000.00, 15000.00, 0.00, 0.00, 65000.00, 'PAGADO', 0, NULL, '2026-09-23', '', '0', '2026-11-10 17:49:58.084017'),
(9, 18, NULL, 1, 50000.00, 20000.00, 2500.00, 0.00, 72500.00, 'PAGADO', 0, NULL, '2026-09-23', '', '0', '2026-11-10 17:49:58.084017'),
(10, 19, NULL, 1, 50000.00, 23000.00, 2500.00, 0.00, 75500.00, 'PAGADO', 0, NULL, '2026-09-30', '', '0', '2026-11-10 17:49:58.084017'),
(11, 20, NULL, 2, 50000.00, 16500.00, 0.00, 0.00, 66500.00, 'PAGADO', 0, NULL, '2026-09-19', '', '0', '2026-11-10 17:49:58.084017'),
(12, 21, NULL, 2, 50000.00, 24000.00, 2500.00, 0.00, 76500.00, 'PAGADO', 0, NULL, '2026-09-28', '', '0', '2026-11-10 17:49:58.084017'),
(13, 22, NULL, 3, 50000.00, 17000.00, 0.00, 0.00, 67000.00, 'PAGADO', 0, NULL, '2026-09-29', '', '0', '2026-11-10 17:49:58.084017'),
(14, 23, NULL, 3, 50000.00, 23500.00, 0.00, 0.00, 73500.00, 'PAGADO', 0, NULL, '2026-09-07', '', '0', '2026-11-10 17:49:58.084017'),
(15, 24, NULL, NULL, 50000.00, 24500.00, 2500.00, 0.00, 77000.00, 'PAGADO', 0, NULL, '2026-09-22', '', '0', '2026-11-10 17:49:58.084017'),
(16, 25, NULL, NULL, 50000.00, 8000.00, 0.00, 0.00, 58000.00, 'PAGADO', 0, NULL, '2026-09-10', '', '0', '2026-11-10 17:49:58.084017'),
(17, 26, NULL, 1, 50000.00, 21000.00, 2500.00, 0.00, 73500.00, 'DEVUELTO', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(18, 27, NULL, 2, 50000.00, 13000.00, 2500.00, 0.00, 65500.00, 'DEVUELTO', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(19, 28, NULL, NULL, 50000.00, 10000.00, 0.00, 0.00, 60000.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(20, 29, NULL, 3, 50000.00, 9500.00, 2500.00, 0.00, 62000.00, 'PAGADO', 0, NULL, '2026-09-19', '', '0', '2026-11-10 17:49:58.084017'),
(21, 30, NULL, 1, 50000.00, 26000.00, 2500.00, 0.00, 78500.00, 'DEVUELTO', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(22, 31, NULL, 2, 50000.00, 0.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-09-23', '', '0', '2026-11-10 17:49:58.084017'),
(23, 33, NULL, 1, 35000.00, 18500.00, 0.00, 0.00, 53500.00, 'PAGADO', 0, NULL, '2026-09-07', '', '0', '2026-11-10 17:49:58.084017'),
(24, 34, NULL, 2, 35000.00, 7000.00, 0.00, 0.00, 42000.00, 'PAGADO', 0, NULL, '2026-09-24', '', '0', '2026-11-10 17:49:58.084017'),
(25, 35, NULL, 3, 35000.00, 15000.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-09-28', '', '0', '2026-11-10 17:49:58.084017'),
(26, 36, NULL, NULL, 35000.00, 5000.00, 2500.00, 0.00, 42500.00, 'PAGADO', 0, NULL, '2026-09-21', '', '0', '2026-11-10 17:49:58.084017'),
(27, 37, NULL, 1, 35000.00, 15500.00, 0.00, 0.00, 50500.00, 'PAGADO', 0, NULL, '2026-09-12', '', '0', '2026-11-10 17:49:58.084017'),
(28, 38, NULL, 2, 35000.00, 16500.00, 0.00, 0.00, 51500.00, 'PAGADO', 0, NULL, '2026-09-04', '', '0', '2026-11-10 17:49:58.084017'),
(29, 39, NULL, 3, 35000.00, 15000.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-09-17', '', '0', '2026-11-10 17:49:58.084017'),
(30, 40, NULL, 1, 35000.00, 25000.00, 0.00, 0.00, 60000.00, 'PAGADO', 0, NULL, '2026-09-26', '', '0', '2026-11-10 17:49:58.084017'),
(31, 1, 1, 1, 80000.00, 49000.00, 2500.00, 0.00, 131500.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-10-10', '', '0', '2026-11-10 17:49:58.084017'),
(32, 4, 2, 2, 80000.00, 50500.00, 2500.00, 0.00, 133000.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-10-09', '', '0', '2026-11-10 17:49:58.084017'),
(33, 8, 3, 3, 80000.00, 64000.00, 2500.00, 0.00, 146500.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-10-26', '', '0', '2026-11-10 17:49:58.084017'),
(34, 13, NULL, NULL, 0.00, 14000.00, 2500.00, 0.00, 16500.00, 'PAGADO', 0, NULL, '2026-10-13', '', '0', '2026-11-10 17:49:58.084017'),
(35, 14, NULL, 1, 0.00, 17000.00, 2500.00, 0.00, 19500.00, 'PAGADO', 0, NULL, '2026-10-23', '', '0', '2026-11-10 17:49:58.084017'),
(36, 15, NULL, 3, 0.00, 5000.00, 0.00, 0.00, 5000.00, 'PAGADO', 0, NULL, '2026-10-20', '', '0', '2026-11-10 17:49:58.084017'),
(37, 16, NULL, 2, 50000.00, 18000.00, 0.00, 0.00, 68000.00, 'PAGADO', 0, NULL, '2026-10-19', '', '0', '2026-11-10 17:49:58.084017'),
(38, 17, NULL, NULL, 50000.00, 15000.00, 0.00, 0.00, 65000.00, 'PAGADO', 0, NULL, '2026-10-31', '', '0', '2026-11-10 17:49:58.084017'),
(39, 18, NULL, 1, 50000.00, 20000.00, 2500.00, 0.00, 72500.00, 'PAGADO', 0, NULL, '2026-10-09', '', '0', '2026-11-10 17:49:58.084017'),
(40, 19, NULL, 1, 50000.00, 23000.00, 2500.00, 0.00, 75500.00, 'PAGADO', 0, NULL, '2026-10-23', '', '0', '2026-11-10 17:49:58.084017'),
(41, 20, NULL, 2, 50000.00, 16500.00, 0.00, 0.00, 66500.00, 'PAGADO', 0, NULL, '2026-10-12', '', '0', '2026-11-10 17:49:58.084017'),
(42, 21, NULL, 2, 50000.00, 24000.00, 2500.00, 0.00, 76500.00, 'PAGADO', 0, NULL, '2026-10-19', '', '0', '2026-11-10 17:49:58.084017'),
(43, 22, NULL, 3, 50000.00, 17000.00, 0.00, 0.00, 67000.00, 'PAGADO', 0, NULL, '2026-10-05', '', '0', '2026-11-10 17:49:58.084017'),
(44, 23, NULL, 3, 50000.00, 23500.00, 0.00, 0.00, 73500.00, 'PAGADO', 0, NULL, '2026-10-08', '', '0', '2026-11-10 17:49:58.084017'),
(45, 24, NULL, NULL, 50000.00, 24500.00, 2500.00, 0.00, 77000.00, 'PAGADO', 0, NULL, '2026-10-16', '', '0', '2026-11-10 17:49:58.084017'),
(46, 25, NULL, NULL, 50000.00, 8000.00, 0.00, 0.00, 58000.00, 'PAGADO', 0, NULL, '2026-10-05', '', '0', '2026-11-10 17:49:58.084017'),
(47, 26, NULL, 1, 50000.00, 21000.00, 2500.00, 0.00, 73500.00, 'DEVUELTO', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(48, 27, NULL, 2, 50000.00, 13000.00, 2500.00, 0.00, 65500.00, 'DEVUELTO', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(49, 28, NULL, NULL, 50000.00, 10000.00, 0.00, 0.00, 60000.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(50, 29, NULL, 3, 50000.00, 9500.00, 2500.00, 0.00, 62000.00, 'DEVUELTO', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(51, 30, NULL, 1, 50000.00, 26000.00, 2500.00, 0.00, 78500.00, 'PAGADO', 0, NULL, '2026-10-14', '', '0', '2026-11-10 17:49:58.084017'),
(52, 33, NULL, 1, 35000.00, 18500.00, 0.00, 0.00, 53500.00, 'PAGADO', 0, NULL, '2026-10-06', '', '0', '2026-11-10 17:49:58.084017'),
(53, 34, NULL, 2, 35000.00, 7000.00, 0.00, 0.00, 42000.00, 'PAGADO', 0, NULL, '2026-10-17', '', '0', '2026-11-10 17:49:58.084017'),
(54, 35, NULL, 3, 35000.00, 15000.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-10-28', '', '0', '2026-11-10 17:49:58.084017'),
(55, 36, NULL, NULL, 35000.00, 5000.00, 2500.00, 0.00, 42500.00, 'PAGADO', 0, NULL, '2026-10-15', '', '0', '2026-11-10 17:49:58.084017'),
(56, 37, NULL, 1, 35000.00, 15500.00, 0.00, 0.00, 50500.00, 'PAGADO', 0, NULL, '2026-10-05', '', '0', '2026-11-10 17:49:58.084017'),
(57, 38, NULL, 2, 35000.00, 16500.00, 0.00, 0.00, 51500.00, 'PAGADO', 0, NULL, '2026-10-05', '', '0', '2026-11-10 17:49:58.084017'),
(58, 39, NULL, 3, 35000.00, 15000.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-10-23', '', '0', '2026-11-10 17:49:58.084017'),
(59, 40, NULL, 1, 50000.00, 25000.00, 0.00, 0.00, 75000.00, 'PAGADO', 0, NULL, '2026-10-22', '', '0', '2026-11-10 17:49:58.084017'),
(60, 26, NULL, 1, 50000.00, 21000.00, 2500.00, 5.00, 77175.00, 'DEVUELTO', 1, 'Reemisión del período 2026-09 impago, con recargo del 5%.', NULL, '', '0', '2026-11-10 17:49:58.084017'),
(61, 27, NULL, 2, 50000.00, 13000.00, 2500.00, 5.00, 68775.00, 'DEVUELTO', 1, 'Reemisión del período 2026-09 impago, con recargo del 5%.', NULL, '', '0', '2026-11-10 17:49:58.084017'),
(62, 28, NULL, NULL, 50000.00, 10000.00, 0.00, 5.00, 63000.00, 'PENDIENTE', 1, 'Reemisión del período 2026-09 impago, con recargo del 5%.', NULL, '', '0', '2026-11-10 17:49:58.084017'),
(63, 30, NULL, 1, 50000.00, 26000.00, 2500.00, 5.00, 82425.00, 'PAGADO', 1, 'Reemisión del período 2026-09 impago, con recargo del 5%.', '2026-10-14', '', '0', '2026-11-10 17:49:58.084017'),
(64, 1, 1, 1, 80000.00, 49000.00, 2500.00, 0.00, 131500.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-11-04', '', '0', '2026-11-10 17:49:58.084017'),
(65, 4, 2, 2, 80000.00, 50500.00, 2500.00, 0.00, 133000.00, 'PAGADO', 0, 'Recibo único de Plan Grupo Familiar.', '2026-11-07', '', '0', '2026-11-10 17:49:58.084017'),
(66, 8, 3, 3, 80000.00, 64000.00, 2500.00, 0.00, 146500.00, 'PENDIENTE', 0, 'Recibo único de Plan Grupo Familiar.', NULL, '', '0', '2026-11-10 17:49:58.084017'),
(67, 13, NULL, NULL, 0.00, 14000.00, 2500.00, 0.00, 16500.00, 'PAGADO', 0, NULL, '2026-11-04', '', '0', '2026-11-10 17:49:58.084017'),
(68, 14, NULL, 1, 0.00, 17000.00, 2500.00, 0.00, 19500.00, 'PAGADO', 0, NULL, '2026-11-05', '', '0', '2026-11-10 17:49:58.084017'),
(69, 15, NULL, 3, 0.00, 5000.00, 0.00, 0.00, 5000.00, 'PAGADO', 0, NULL, '2026-11-04', '', '0', '2026-11-10 17:49:58.084017'),
(70, 16, NULL, 2, 50000.00, 18000.00, 0.00, 0.00, 68000.00, 'PAGADO', 0, NULL, '2026-11-02', '', '0', '2026-11-10 17:49:58.084017'),
(71, 17, NULL, NULL, 50000.00, 15000.00, 0.00, 0.00, 65000.00, 'PAGADO', 0, NULL, '2026-11-05', '', '0', '2026-11-10 17:49:58.084017'),
(72, 18, NULL, 1, 50000.00, 20000.00, 2500.00, 0.00, 72500.00, 'PAGADO', 0, NULL, '2026-11-05', '', '0', '2026-11-10 17:49:58.084017'),
(73, 19, NULL, 1, 50000.00, 23000.00, 2500.00, 0.00, 75500.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(74, 20, NULL, 2, 50000.00, 16500.00, 0.00, 0.00, 66500.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(75, 21, NULL, 2, 50000.00, 24000.00, 2500.00, 0.00, 76500.00, 'PAGADO', 0, NULL, '2026-11-06', '', '0', '2026-11-10 17:49:58.084017'),
(76, 22, NULL, 3, 50000.00, 17000.00, 0.00, 0.00, 67000.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(77, 23, NULL, 3, 50000.00, 23500.00, 0.00, 0.00, 73500.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(78, 24, NULL, NULL, 50000.00, 24500.00, 2500.00, 0.00, 77000.00, 'PAGADO', 0, NULL, '2026-11-06', '', '0', '2026-11-10 17:49:58.084017'),
(79, 25, NULL, NULL, 50000.00, 8000.00, 0.00, 0.00, 58000.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(80, 29, NULL, 3, 50000.00, 9500.00, 2500.00, 0.00, 62000.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(81, 30, NULL, 1, 50000.00, 26000.00, 2500.00, 0.00, 78500.00, 'PAGADO', 0, NULL, '2026-11-03', '', '0', '2026-11-10 17:49:58.084017'),
(82, 32, NULL, NULL, 50000.00, 15000.00, 0.00, 0.00, 65000.00, 'PAGADO', 0, NULL, '2026-11-03', '', '0', '2026-11-10 17:49:58.084017'),
(83, 33, NULL, 1, 35000.00, 18500.00, 0.00, 0.00, 53500.00, 'PAGADO', 0, NULL, '2026-11-06', '', '0', '2026-11-10 17:49:58.084017'),
(84, 34, NULL, 2, 35000.00, 7000.00, 0.00, 0.00, 42000.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(85, 35, NULL, 3, 35000.00, 15000.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-11-06', '', '0', '2026-11-10 17:49:58.084017'),
(86, 36, NULL, NULL, 35000.00, 5000.00, 2500.00, 0.00, 42500.00, 'PENDIENTE', 0, NULL, NULL, '', '0', '2026-11-10 17:49:58.084017'),
(87, 37, NULL, 1, 35000.00, 15500.00, 0.00, 0.00, 50500.00, 'PAGADO', 0, NULL, '2026-11-03', '', '0', '2026-11-10 17:49:58.084017'),
(88, 38, NULL, 2, 35000.00, 16500.00, 0.00, 0.00, 51500.00, 'PAGADO', 0, NULL, '2026-11-05', '', '0', '2026-11-10 17:49:58.084017'),
(89, 39, NULL, 3, 35000.00, 15000.00, 0.00, 0.00, 50000.00, 'PAGADO', 0, NULL, '2026-11-06', '', '0', '2026-11-10 17:49:58.084017'),
(90, 40, NULL, 1, 50000.00, 25000.00, 0.00, 0.00, 75000.00, 'PAGADO', 0, NULL, '2026-11-04', '', '0', '2026-11-10 17:49:58.084017'),
(91, 29, NULL, 3, 50000.00, 9500.00, 2500.00, 5.00, 65100.00, 'PENDIENTE', 1, 'Reemisión del período 2026-10 impago, con recargo del 5%.', NULL, '', '0', '2026-11-10 17:49:58.084017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_familiares`
--

DROP TABLE IF EXISTS `grupos_familiares`;
CREATE TABLE IF NOT EXISTS `grupos_familiares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuotaGrupal` decimal(12,2) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `grupos_familiares`
--

INSERT INTO `grupos_familiares` (`id`, `cuotaGrupal`, `createdAt`) VALUES
(1, 80000.00, '2026-11-10 17:49:56.229565'),
(2, 80000.00, '2026-11-10 17:49:56.229565'),
(3, 80000.00, '2026-11-10 17:49:56.229565');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socioId` int DEFAULT NULL,
  `actividadId` int DEFAULT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  `fechaInscripcion` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `asistencia` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_b5fe6c0d5ee5cfb41f21849702` (`socioId`,`actividadId`),
  KEY `FK_cbd8ed823eb8a167e0715196687` (`actividadId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id`, `socioId`, `actividadId`, `activa`, `fechaInscripcion`, `asistencia`) VALUES
(1, 1, 10, 1, '2026-11-10 17:49:57.392236', 0),
(2, 2, 12, 1, '2026-11-10 17:49:57.392236', 0),
(3, 2, 13, 1, '2026-11-10 17:49:57.392236', 0),
(4, 3, 5, 1, '2026-11-10 17:49:57.392236', 0),
(5, 3, 2, 1, '2026-11-10 17:49:57.392236', 0),
(6, 4, 4, 1, '2026-11-10 17:49:57.392236', 0),
(7, 5, 11, 1, '2026-11-10 17:49:57.392236', 0),
(8, 5, 19, 1, '2026-11-10 17:49:57.392236', 0),
(9, 6, 16, 1, '2026-11-10 17:49:57.392236', 0),
(10, 6, 2, 1, '2026-11-10 17:49:57.392236', 0),
(11, 7, 5, 1, '2026-11-10 17:49:57.392236', 0),
(12, 8, 6, 1, '2026-11-10 17:49:57.392236', 0),
(13, 9, 3, 1, '2026-11-10 17:49:57.392236', 1),
(14, 9, 12, 1, '2026-11-10 17:49:57.392236', 0),
(15, 10, 7, 1, '2026-11-10 17:49:57.392236', 0),
(16, 10, 16, 1, '2026-11-10 17:49:57.392236', 0),
(17, 11, 5, 1, '2026-11-10 17:49:57.392236', 0),
(18, 12, 2, 1, '2026-11-10 17:49:57.392236', 0),
(19, 12, 20, 1, '2026-11-10 17:49:57.392236', 0),
(20, 13, 3, 1, '2026-11-10 17:49:57.392236', 1),
(21, 13, 20, 1, '2026-11-10 17:49:57.392236', 0),
(22, 14, 3, 1, '2026-11-10 17:49:57.392236', 1),
(23, 14, 12, 1, '2026-11-10 17:49:57.392236', 0),
(24, 15, 20, 1, '2026-11-10 17:49:57.392236', 0),
(25, 16, 13, 1, '2026-11-10 17:49:57.392236', 0),
(26, 16, 3, 1, '2026-11-10 17:49:57.392236', 1),
(27, 17, 10, 1, '2026-11-10 17:49:57.392236', 0),
(28, 18, 1, 1, '2026-11-10 17:49:57.392236', 0),
(29, 18, 12, 1, '2026-11-10 17:49:57.392236', 0),
(30, 19, 4, 1, '2026-11-10 17:49:57.392236', 0),
(31, 19, 10, 1, '2026-11-10 17:49:57.392236', 0),
(32, 20, 11, 1, '2026-11-10 17:49:57.392236', 0),
(33, 20, 19, 1, '2026-11-10 17:49:57.392236', 0),
(34, 21, 8, 1, '2026-11-10 17:49:57.392236', 0),
(35, 21, 9, 1, '2026-11-10 17:49:57.392236', 0),
(36, 22, 12, 1, '2026-11-10 17:49:57.392236', 0),
(37, 22, 13, 1, '2026-11-10 17:49:57.392236', 0),
(38, 23, 6, 1, '2026-11-10 17:49:57.392236', 0),
(39, 23, 10, 1, '2026-11-10 17:49:57.392236', 0),
(40, 24, 10, 1, '2026-11-10 17:49:57.392236', 0),
(41, 24, 11, 1, '2026-11-10 17:49:57.392236', 0),
(42, 25, 4, 1, '2026-11-10 17:49:57.392236', 0),
(43, 26, 1, 1, '2026-11-10 17:49:57.392236', 0),
(44, 26, 13, 1, '2026-11-10 17:49:57.392236', 0),
(45, 27, 9, 1, '2026-11-10 17:49:57.392236', 0),
(46, 28, 14, 1, '2026-11-10 17:49:57.392236', 0),
(47, 29, 11, 1, '2026-11-10 17:49:57.392236', 0),
(48, 30, 8, 1, '2026-11-10 17:49:57.392236', 0),
(49, 30, 10, 1, '2026-11-10 17:49:57.392236', 0),
(50, 32, 10, 1, '2026-11-10 17:49:57.392236', 0),
(51, 33, 15, 1, '2026-11-10 17:49:57.392236', 0),
(52, 33, 2, 1, '2026-11-10 17:49:57.392236', 0),
(53, 34, 5, 1, '2026-11-10 17:49:57.392236', 0),
(54, 35, 18, 1, '2026-11-10 17:49:57.392236', 0),
(55, 35, 6, 1, '2026-11-10 17:49:57.392236', 0),
(56, 36, 20, 1, '2026-11-10 17:49:57.392236', 0),
(57, 37, 15, 1, '2026-11-10 17:49:57.392236', 0),
(58, 37, 5, 1, '2026-11-10 17:49:57.392236', 0),
(59, 38, 16, 1, '2026-11-10 17:49:57.392236', 0),
(60, 38, 7, 1, '2026-11-10 17:49:57.392236', 0),
(61, 39, 15, 1, '2026-11-10 17:49:57.392236', 0),
(62, 39, 18, 1, '2026-11-10 17:49:57.392236', 0),
(63, 40, 10, 1, '2026-11-10 17:49:57.392236', 0),
(64, 40, 14, 1, '2026-11-10 17:49:57.392236', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

DROP TABLE IF EXISTS `instructores`;
CREATE TABLE IF NOT EXISTS `instructores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sueldo` decimal(12,2) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_10ff8bd3128cb60e9509e2e79d` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`id`, `nombre`, `apellido`, `email`, `telefono`, `sueldo`, `createdAt`) VALUES
(1, 'Marcelo', 'Fontana', 'marcelo.fontana@elglobo.com.ar', '341-5550101', 620000.00, '2026-11-10 17:49:57.166833'),
(2, 'Gabriela', 'Sánchez', 'gabriela.sanchez@elglobo.com.ar', '341-5550102', 580000.00, '2026-11-10 17:49:57.166833'),
(3, 'Diego', 'Maradei', 'diego.maradei@elglobo.com.ar', '341-5550103', 600000.00, '2026-11-10 17:49:57.166833'),
(4, 'Lorena', 'Quiroga', 'lorena.quiroga@elglobo.com.ar', '341-5550104', 560000.00, '2026-11-10 17:49:57.166833'),
(5, 'Andrés', 'Bermúdez', 'andres.bermudez@elglobo.com.ar', '341-5550105', 640000.00, '2026-11-10 17:49:57.166833'),
(6, 'Cristian', 'Villalba', 'cristian.villalba@elglobo.com.ar', '341-5550106', 650000.00, '2026-11-10 17:49:57.166833'),
(7, 'Mariana', 'Esquivel', 'mariana.esquivel@elglobo.com.ar', '341-5550107', 570000.00, '2026-11-10 17:49:57.166833'),
(8, 'Héctor', 'Salvatierra', 'hector.salvatierra@elglobo.com.ar', '341-5550108', 590000.00, '2026-11-10 17:49:57.166833');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rendiciones`
--

DROP TABLE IF EXISTS `rendiciones`;
CREATE TABLE IF NOT EXISTS `rendiciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cobradorId` int DEFAULT NULL,
  `semanaInicio` date NOT NULL,
  `semanaFin` date NOT NULL,
  `montoRecaudado` decimal(12,2) NOT NULL,
  `comisionCalculada` decimal(12,2) NOT NULL,
  `montoNeto` decimal(12,2) NOT NULL,
  `esUltimaSemanaDelMes` tinyint(1) NOT NULL DEFAULT '0',
  `fechaRendicion` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_c6326dc00a05216e25e90f20648` (`cobradorId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rendiciones`
--

INSERT INTO `rendiciones` (`id`, `cobradorId`, `semanaInicio`, `semanaFin`, `montoRecaudado`, `comisionCalculada`, `montoNeto`, `esUltimaSemanaDelMes`, `fechaRendicion`) VALUES
(1, 1, '2026-08-31', '2026-09-06', 19500.00, 1950.00, 17550.00, 0, '2026-11-10 17:50:00.585712'),
(2, 1, '2026-09-07', '2026-09-13', 104000.00, 10400.00, 93600.00, 0, '2026-11-10 17:50:00.585712'),
(3, 1, '2026-09-21', '2026-09-27', 132500.00, 13250.00, 119250.00, 0, '2026-11-10 17:50:00.585712'),
(4, 1, '2026-09-28', '2026-10-04', 207000.00, 20700.00, 186300.00, 1, '2026-11-10 17:50:00.585712'),
(5, 1, '2026-10-05', '2026-10-11', 308000.00, 30800.00, 277200.00, 0, '2026-11-10 17:50:00.585712'),
(6, 1, '2026-10-12', '2026-10-18', 160925.00, 16092.50, 144832.50, 0, '2026-11-10 17:50:00.585712'),
(7, 1, '2026-10-19', '2026-10-25', 170000.00, 17000.00, 153000.00, 0, '2026-11-10 17:50:00.585712'),
(8, 1, '2026-10-26', '2026-11-01', 0.00, 0.00, 0.00, 1, '2026-11-10 17:50:00.585712'),
(9, 1, '2026-11-02', '2026-11-08', 481000.00, 48100.00, 432900.00, 0, '2026-11-10 17:50:00.585712'),
(10, 2, '2026-08-31', '2026-09-06', 51500.00, 5150.00, 46350.00, 0, '2026-11-10 17:50:00.585712'),
(11, 2, '2026-09-14', '2026-09-20', 66500.00, 6650.00, 59850.00, 0, '2026-11-10 17:50:00.585712'),
(12, 2, '2026-09-21', '2026-09-27', 293000.00, 29300.00, 263700.00, 0, '2026-11-10 17:50:00.585712'),
(13, 2, '2026-09-28', '2026-10-04', 76500.00, 7650.00, 68850.00, 1, '2026-11-10 17:50:00.585712'),
(14, 2, '2026-10-05', '2026-10-11', 184500.00, 18450.00, 166050.00, 0, '2026-11-10 17:50:00.585712'),
(15, 2, '2026-10-12', '2026-10-18', 108500.00, 10850.00, 97650.00, 0, '2026-11-10 17:50:00.585712'),
(16, 2, '2026-10-19', '2026-10-25', 144500.00, 14450.00, 130050.00, 0, '2026-11-10 17:50:00.585712'),
(17, 2, '2026-10-26', '2026-11-01', 0.00, 0.00, 0.00, 1, '2026-11-10 17:50:00.585712'),
(18, 2, '2026-11-02', '2026-11-08', 329000.00, 32900.00, 296100.00, 0, '2026-11-10 17:50:00.585712'),
(19, 3, '2026-09-07', '2026-09-13', 73500.00, 7350.00, 66150.00, 0, '2026-11-10 17:50:00.585712'),
(20, 3, '2026-09-14', '2026-09-20', 263500.00, 26350.00, 237150.00, 0, '2026-11-10 17:50:00.585712'),
(21, 3, '2026-09-28', '2026-10-04', 117000.00, 11700.00, 105300.00, 1, '2026-11-10 17:50:00.585712'),
(22, 3, '2026-10-05', '2026-10-11', 140500.00, 14050.00, 126450.00, 0, '2026-11-10 17:50:00.585712'),
(23, 3, '2026-10-19', '2026-10-25', 55000.00, 5500.00, 49500.00, 0, '2026-11-10 17:50:00.585712'),
(24, 3, '2026-10-26', '2026-11-01', 196500.00, 19650.00, 176850.00, 1, '2026-11-10 17:50:00.585712'),
(25, 3, '2026-11-02', '2026-11-08', 105000.00, 10500.00, 94500.00, 0, '2026-11-10 17:50:00.585712');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rendicion_detalles`
--

DROP TABLE IF EXISTS `rendicion_detalles`;
CREATE TABLE IF NOT EXISTS `rendicion_detalles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rendicionId` int DEFAULT NULL,
  `cuponId` int DEFAULT NULL,
  `importeCobrado` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cobrado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_a563abb9160d1617d253d89d479` (`rendicionId`),
  KEY `FK_6cdb4a02b1140a1cd7e011b58b3` (`cuponId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rendicion_detalles`
--

INSERT INTO `rendicion_detalles` (`id`, `rendicionId`, `cuponId`, `importeCobrado`, `cobrado`) VALUES
(1, 1, 5, 19500.00, 1),
(2, 2, 23, 53500.00, 1),
(3, 2, 27, 50500.00, 1),
(4, 3, 9, 72500.00, 1),
(5, 3, 30, 60000.00, 1),
(6, 4, 1, 131500.00, 1),
(7, 4, 10, 75500.00, 1),
(8, 4, 17, 0.00, 0),
(9, 4, 21, 0.00, 0),
(10, 5, 31, 131500.00, 1),
(11, 5, 39, 72500.00, 1),
(12, 5, 52, 53500.00, 1),
(13, 5, 56, 50500.00, 1),
(14, 6, 51, 78500.00, 1),
(15, 6, 63, 82425.00, 1),
(16, 7, 35, 19500.00, 1),
(17, 7, 40, 75500.00, 1),
(18, 7, 59, 75000.00, 1),
(19, 8, 47, 0.00, 0),
(20, 8, 60, 0.00, 0),
(21, 9, 64, 131500.00, 1),
(22, 9, 68, 19500.00, 1),
(23, 9, 72, 72500.00, 1),
(24, 9, 81, 78500.00, 1),
(25, 9, 83, 53500.00, 1),
(26, 9, 87, 50500.00, 1),
(27, 9, 90, 75000.00, 1),
(28, 10, 28, 51500.00, 1),
(29, 11, 11, 66500.00, 1),
(30, 12, 2, 133000.00, 1),
(31, 12, 7, 68000.00, 1),
(32, 12, 22, 50000.00, 1),
(33, 12, 24, 42000.00, 1),
(34, 13, 12, 76500.00, 1),
(35, 13, 18, 0.00, 0),
(36, 14, 32, 133000.00, 1),
(37, 14, 57, 51500.00, 1),
(38, 15, 41, 66500.00, 1),
(39, 15, 53, 42000.00, 1),
(40, 16, 37, 68000.00, 1),
(41, 16, 42, 76500.00, 1),
(42, 17, 48, 0.00, 0),
(43, 17, 61, 0.00, 0),
(44, 18, 65, 133000.00, 1),
(45, 18, 70, 68000.00, 1),
(46, 18, 75, 76500.00, 1),
(47, 18, 88, 51500.00, 1),
(48, 19, 14, 73500.00, 1),
(49, 20, 3, 146500.00, 1),
(50, 20, 6, 5000.00, 1),
(51, 20, 20, 62000.00, 1),
(52, 20, 29, 50000.00, 1),
(53, 21, 13, 67000.00, 1),
(54, 21, 25, 50000.00, 1),
(55, 22, 43, 67000.00, 1),
(56, 22, 44, 73500.00, 1),
(57, 23, 36, 5000.00, 1),
(58, 23, 58, 50000.00, 1),
(59, 24, 33, 146500.00, 1),
(60, 24, 54, 50000.00, 1),
(61, 24, 50, 0.00, 0),
(62, 25, 69, 5000.00, 1),
(63, 25, 85, 50000.00, 1),
(64, 25, 89, 50000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

DROP TABLE IF EXISTS `socios`;
CREATE TABLE IF NOT EXISTS `socios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fechaAlta` date NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` enum('CADETE','ACTIVO','VITALICIO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('ACTIVO','MOROSO','SUSPENDIDO','BAJA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `mesesImpagosConsecutivos` int NOT NULL DEFAULT '0',
  `grupoFamiliarId` int DEFAULT NULL,
  `rolGrupoFamiliar` enum('TITULAR','CONYUGE','HIJO') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zonaCobro` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_6a5c452cf970b4cc88a1d31785` (`dni`),
  UNIQUE KEY `IDX_2e5b4f94a9a1c2eca0ca91bdc4` (`email`),
  KEY `FK_0274ea6c64f7bb00aa2f87b036c` (`grupoFamiliarId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `nombre`, `apellido`, `dni`, `fechaNacimiento`, `fechaAlta`, `direccion`, `localidad`, `telefono`, `email`, `categoria`, `estado`, `mesesImpagosConsecutivos`, `grupoFamiliarId`, `rolGrupoFamiliar`, `zonaCobro`, `createdAt`, `updatedAt`) VALUES
(1, 'Martín', 'Giménez', '25994000', '1980-04-12', '2012-03-10', 'Sarmiento 2196', 'Rosario', '341-5340015', 'martin.gimenez@mail.com', 'ACTIVO', 'ACTIVO', 0, 1, 'TITULAR', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(2, 'Carolina', 'Ledesma', '24887842', '1982-09-23', '2012-03-10', 'Sarmiento 2196', 'Rosario', '341-4936523', 'carolina.ledesma@mail.com', 'ACTIVO', 'ACTIVO', 0, 1, 'CONYUGE', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(3, 'Tomás', 'Giménez', '55337510', '2012-07-05', '2018-02-20', 'Sarmiento 2196', 'Rosario', '341-5764186', 'tomas.gimenez@mail.com', 'CADETE', 'ACTIVO', 0, 1, 'HIJO', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(4, 'Pablo', 'Acosta', '50944036', '1978-01-30', '2009-05-15', 'Rioja 1082', 'Funes', '341-6460046', 'pablo.acosta@mail.com', 'ACTIVO', 'ACTIVO', 0, 2, 'TITULAR', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(5, 'Valeria', 'Domínguez', '18170110', '1979-11-18', '2009-05-15', 'Rioja 1082', 'Funes', '341-6576159', 'valeria.dominguez@mail.com', 'ACTIVO', 'ACTIVO', 0, 2, 'CONYUGE', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(6, 'Lucía', 'Acosta', '50819091', '2010-03-14', '2015-08-01', 'Rioja 1082', 'Funes', '341-4411258', 'lucia.acosta@mail.com', 'CADETE', 'ACTIVO', 0, 2, 'HIJO', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(7, 'Bruno', 'Acosta', '54225646', '2014-12-02', '2020-03-01', 'Rioja 1082', 'Funes', '341-6849563', 'bruno.acosta@mail.com', 'CADETE', 'ACTIVO', 0, 2, 'HIJO', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(8, 'Ricardo', 'Benítez', '44656808', '1975-06-08', '2005-10-22', 'Entre Ríos 1560', 'Villa Gobernador Gálvez', '341-5054922', 'ricardo.benitez@mail.com', 'ACTIVO', 'ACTIVO', 0, 3, 'TITULAR', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(9, 'Silvana', 'Pereyra', '43256051', '1977-02-27', '2005-10-22', 'Entre Ríos 1560', 'Villa Gobernador Gálvez', '341-6154142', 'silvana.pereyra@mail.com', 'ACTIVO', 'ACTIVO', 0, 3, 'CONYUGE', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(10, 'Agustina', 'Benítez', '51710873', '2009-05-19', '2014-03-01', 'Entre Ríos 1560', 'Villa Gobernador Gálvez', '341-4376082', 'agustina.benitez@mail.com', 'CADETE', 'ACTIVO', 0, 3, 'HIJO', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(11, 'Joaquín', 'Benítez', '50900991', '2011-10-09', '2016-03-01', 'Entre Ríos 1560', 'Villa Gobernador Gálvez', '341-5206289', 'joaquin.benitez@mail.com', 'CADETE', 'ACTIVO', 0, 3, 'HIJO', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(12, 'Mía', 'Benítez', '55687556', '2016-08-30', '2021-03-01', 'Entre Ríos 1560', 'Villa Gobernador Gálvez', '341-5296034', 'mia.benitez@mail.com', 'CADETE', 'ACTIVO', 0, 3, 'HIJO', '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(13, 'Héctor', 'Romero', '42752742', '1951-02-14', '1982-04-01', 'Rioja 1829', 'Rosario', '341-5524806', 'hector.romero@mail.com', 'VITALICIO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(14, 'Norma', 'Quiroga', '24085713', '1955-08-03', '1990-09-12', 'Alvear 2371', 'Rosario', '341-5672576', 'norma.quiroga@mail.com', 'VITALICIO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(15, 'Alberto', 'Sosa', '51450754', '1960-12-01', '1995-03-18', 'Moreno 2174', 'Granadero Baigorria', '341-4488418', 'alberto.sosa@mail.com', 'VITALICIO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(16, 'Graciela', 'Funes', '50952513', '1963-05-20', '2002-06-11', 'Sarmiento 1159', 'Funes', '341-5669955', 'graciela.funes@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(17, 'Eduardo', 'Molina', '46183451', '1969-03-09', '1991-02-02', 'Rioja 2201', 'Rosario', '341-6365587', 'eduardo.molina@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(18, 'Florencia', 'Ruiz', '19702963', '1995-02-11', '2019-03-04', 'San Martín 3236', 'Rosario', '341-6413890', 'florencia.ruiz@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(19, 'Nicolás', 'Castro', '26656966', '1990-07-21', '2016-08-15', 'Sarmiento 2846', 'Rosario', '341-4205049', 'nicolas.castro@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(20, 'Camila', 'Herrera', '24883784', '1998-10-02', '2021-02-01', 'Moreno 2025', 'Funes', '341-6610156', 'camila.herrera@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(21, 'Federico', 'Paz', '27557144', '1987-12-15', '2014-04-12', 'San Martín 599', 'Funes', '341-6022128', 'federico.paz@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(22, 'Julieta', 'Vera', '48655083', '2001-05-27', '2022-03-14', 'Rioja 3026', 'Granadero Baigorria', '341-6828232', 'julieta.vera@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(23, 'Matías', 'Ortiz', '34844759', '1985-09-09', '2013-07-07', 'Moreno 2843', 'Villa Gobernador Gálvez', '341-6347954', 'matias.ortiz@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(24, 'Daniela', 'Silva', '38644517', '1992-01-17', '2017-05-20', 'Sarmiento 2960', 'Rosario', '341-6299101', 'daniela.silva@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(25, 'Gonzalo', 'Peralta', '50137958', '1983-11-03', '2011-02-28', 'Moreno 929', 'Rosario', '341-5685892', 'gonzalo.peralta@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(26, 'Rocío', 'Medina', '37755114', '1996-06-30', '2020-09-01', 'Av. Pellegrini 235', 'Rosario', '341-5128418', 'rocio.medina@mail.com', 'ACTIVO', 'SUSPENDIDO', 2, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(27, 'Sebastián', 'Luna', '28055843', '1989-04-04', '2015-10-10', 'Alvear 1976', 'Funes', '341-6749964', 'sebastian.luna@mail.com', 'ACTIVO', 'SUSPENDIDO', 2, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(28, 'Marcos', 'Rivas', '50850965', '1991-08-25', '2018-01-15', 'San Martín 1165', 'Rosario', '341-5509680', 'marcos.rivas@mail.com', 'ACTIVO', 'SUSPENDIDO', 2, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(29, 'Paula', 'Aguirre', '50585993', '1994-03-13', '2019-11-02', 'Sarmiento 3240', 'Granadero Baigorria', '341-5957297', 'paula.aguirre@mail.com', 'ACTIVO', 'ACTIVO', 1, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(30, 'Leandro', 'Cabrera', '51363650', '1988-10-29', '2016-02-22', 'Sarmiento 2819', 'Rosario', '341-5821290', 'leandro.cabrera@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(31, 'Natalia', 'Gómez', '20256196', '2000-12-12', '2023-04-03', 'Entre Ríos 1974', 'Funes', '341-5216638', 'natalia.gomez@mail.com', 'ACTIVO', 'BAJA', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(32, 'Ignacio', 'Torres', '24601766', '1993-09-14', '2026-10-20', 'Sarmiento 1160', 'Rosario', '341-5838996', 'ignacio.torres@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(33, 'Emma', 'Fernández', '53598748', '2010-02-02', '2019-03-01', 'Moreno 3081', 'Rosario', '341-4767762', 'emma.fernandez@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(34, 'Santino', 'López', '54038740', '2012-05-16', '2020-03-01', 'Av. Francia 2141', 'Funes', '341-4269673', 'santino.lopez@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(35, 'Mateo', 'Díaz', '52209730', '2008-12-20', '2018-04-01', 'San Martín 3161', 'Villa Gobernador Gálvez', '341-4405432', 'mateo.diaz@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(36, 'Valentina', 'Ríos', '52900650', '2013-09-25', '2021-03-01', 'Rioja 157', 'Rosario', '341-4613872', 'valentina.rios@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(37, 'Thiago', 'Mansilla', '47546333', '2011-01-08', '2019-08-01', 'Rioja 2478', 'Rosario', '341-4000897', 'thiago.mansilla@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(38, 'Olivia', 'Barrios', '55170267', '2009-04-30', '2017-02-01', 'Alvear 3351', 'Funes', '341-4348402', 'olivia.barrios@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(39, 'Facundo', 'Roldán', '49335171', '2008-12-01', '2016-05-01', 'Córdoba 2643', 'Granadero Baigorria', '341-5039506', 'facundo.roldan@mail.com', 'CADETE', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041'),
(40, 'Lautaro', 'Navarro', '20997019', '2008-09-20', '2017-03-01', 'Av. Francia 2838', 'Rosario', '341-6291971', 'lautaro.navarro@mail.com', 'ACTIVO', 'ACTIVO', 0, NULL, NULL, '0', '2026-11-10 17:50:00.256556', '2026-11-10 17:50:00.281041');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','COBRADOR','INSTRUCTOR','SOCIO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `socioId` int DEFAULT NULL,
  `instructorId` int DEFAULT NULL,
  `cobradorId` int DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`),
  UNIQUE KEY `REL_c0adbac3730867bcf573015956` (`socioId`),
  UNIQUE KEY `REL_492129c26d850560bb1b12c776` (`instructorId`),
  UNIQUE KEY `REL_db194b55c82884931091908ab7` (`cobradorId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `activo`, `socioId`, `instructorId`, `cobradorId`, `createdAt`) VALUES
(1, 'admin@elglobo.com.ar', '$2b$10$XBvm96jN57phhlmHZPE.MuPAsdBU5.RzQAUrgcyWy3ncQqrovHzja', 'ADMIN', 1, NULL, NULL, NULL, '2026-11-10 17:50:00.329564'),
(2, 'marcelo.fontana@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 1, NULL, '2026-11-10 17:50:00.329564'),
(3, 'gabriela.sanchez@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 2, NULL, '2026-11-10 17:50:00.329564'),
(4, 'diego.maradei@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 3, NULL, '2026-11-10 17:50:00.329564'),
(5, 'lorena.quiroga@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 4, NULL, '2026-11-10 17:50:00.329564'),
(6, 'andres.bermudez@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 5, NULL, '2026-11-10 17:50:00.329564'),
(7, 'cristian.villalba@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 6, NULL, '2026-11-10 17:50:00.329564'),
(8, 'mariana.esquivel@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 7, NULL, '2026-11-10 17:50:00.329564'),
(9, 'hector.salvatierra@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'INSTRUCTOR', 1, NULL, 8, NULL, '2026-11-10 17:50:00.329564'),
(10, 'perez.cobrador@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'COBRADOR', 1, NULL, NULL, 1, '2026-11-10 17:50:00.329564'),
(11, 'garcia.cobrador@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'COBRADOR', 1, NULL, NULL, 2, '2026-11-10 17:50:00.329564'),
(12, 'rodriguez.cobrador@elglobo.com.ar', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'COBRADOR', 1, NULL, NULL, 3, '2026-11-10 17:50:00.329564'),
(13, 'martin.gimenez@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 1, NULL, NULL, '2026-11-10 17:50:00.329564'),
(14, 'tomas.gimenez@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 3, NULL, NULL, '2026-11-10 17:50:00.329564'),
(15, 'hector.romero@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 13, NULL, NULL, '2026-11-10 17:50:00.329564'),
(16, 'norma.quiroga@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 14, NULL, NULL, '2026-11-10 17:50:00.329564'),
(17, 'florencia.ruiz@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 18, NULL, NULL, '2026-11-10 17:50:00.329564'),
(18, 'daniela.silva@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 24, NULL, NULL, '2026-11-10 17:50:00.329564'),
(19, 'rocio.medina@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 26, NULL, NULL, '2026-11-10 17:50:00.329564'),
(20, 'paula.aguirre@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 29, NULL, NULL, '2026-11-10 17:50:00.329564'),
(21, 'leandro.cabrera@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 30, NULL, NULL, '2026-11-10 17:50:00.329564'),
(22, 'natalia.gomez@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 0, 31, NULL, NULL, '2026-11-10 17:50:00.329564'),
(23, 'emma.fernandez@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 33, NULL, NULL, '2026-11-10 17:50:00.329564'),
(24, 'lautaro.navarro@mail.com', '$2b$10$ZKwoXrNE9h6e.vzz/B3LlOhq5M1Qchiojqv7vv0.aEzVrrPBjnFk6', 'SOCIO', 1, 40, NULL, NULL, '2026-11-10 17:50:00.329564');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `FK_c26d36cbf7354ed1b57651d1b0a` FOREIGN KEY (`instructorId`) REFERENCES `instructores` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `casilleros`
--
ALTER TABLE `casilleros`
  ADD CONSTRAINT `FK_a65f225f2c10d5efdf539009d06` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD CONSTRAINT `FK_6b6717b88572d2b5036e39913aa` FOREIGN KEY (`grupoFamiliarId`) REFERENCES `grupos_familiares` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_b4f1951e34607a82a2163938715` FOREIGN KEY (`cobradorId`) REFERENCES `cobradores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_b6d876bdcb988e3321db0d372e9` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `FK_5c2e730e0011bd6f13f365c39f3` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cbd8ed823eb8a167e0715196687` FOREIGN KEY (`actividadId`) REFERENCES `actividades` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `rendiciones`
--
ALTER TABLE `rendiciones`
  ADD CONSTRAINT `FK_c6326dc00a05216e25e90f20648` FOREIGN KEY (`cobradorId`) REFERENCES `cobradores` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `rendicion_detalles`
--
ALTER TABLE `rendicion_detalles`
  ADD CONSTRAINT `FK_6cdb4a02b1140a1cd7e011b58b3` FOREIGN KEY (`cuponId`) REFERENCES `cupones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_a563abb9160d1617d253d89d479` FOREIGN KEY (`rendicionId`) REFERENCES `rendiciones` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `FK_0274ea6c64f7bb00aa2f87b036c` FOREIGN KEY (`grupoFamiliarId`) REFERENCES `grupos_familiares` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_492129c26d850560bb1b12c7765` FOREIGN KEY (`instructorId`) REFERENCES `instructores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_c0adbac3730867bcf5730159565` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_db194b55c82884931091908ab7d` FOREIGN KEY (`cobradorId`) REFERENCES `cobradores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
