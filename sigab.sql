-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2019 a las 03:28:37
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigab`
--
CREATE DATABASE IF NOT EXISTS `sigab` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `sigab`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becas`
--

CREATE TABLE `becas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_calculos_auxiliares` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `periodo_desde` datetime NOT NULL,
  `periodo_hasta` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `habilitada` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 no, 1 si',
  `anio` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `becas`
--

INSERT INTO `becas` (`id`, `id_calculos_auxiliares`, `nombre`, `descripcion`, `periodo_desde`, `periodo_hasta`, `monto`, `habilitada`, `anio`, `created_at`, `updated_at`) VALUES
(8, 2, 'Beca Estudiantil Prueba', 'Esta es una beca de prueba', '2019-11-08 00:00:00', '2019-02-14 00:00:00', 2000, 0, 2019, '2019-03-23 12:19:26', '2019-03-25 01:00:11'),
(9, 1, 'Beca UADER 2018', 'Estudiantil Beca UADER Perteneciente al año 2018 - Secretaria de Bienestar Estudiantil', '2018-12-01 00:00:00', '2018-04-04 00:00:00', 2500, 1, 2018, '2019-03-23 12:21:46', '2019-03-25 01:06:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calculos_aux`
--

CREATE TABLE `calculos_aux` (
  `id` int(11) NOT NULL,
  `minimo_vital_movil` float NOT NULL,
  `precio_urbano` float NOT NULL,
  `anio` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `calculos_aux`
--

INSERT INTO `calculos_aux` (`id`, `minimo_vital_movil`, `precio_urbano`, `anio`, `created_at`, `updated_at`) VALUES
(1, 15005, 5, 2018, NULL, '2018-12-25 22:45:17'),
(2, 11300, 4.45, 2019, '2018-12-12 23:58:47', '2018-12-12 23:58:47'),
(3, 22000, 6.75, 2002, '2018-12-29 20:48:40', '2018-12-29 20:54:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(10) UNSIGNED NOT NULL,
  `facultad_id` int(10) UNSIGNED NOT NULL,
  `sede_id` int(10) UNSIGNED NOT NULL,
  `universidad_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cant_anios` int(10) NOT NULL,
  `cant_materias` int(55) NOT NULL,
  `primero` int(11) NOT NULL,
  `segundo` int(11) NOT NULL,
  `tercero` int(11) DEFAULT NULL,
  `cuarto` int(11) DEFAULT NULL,
  `quinto` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `facultad_id`, `sede_id`, `universidad_id`, `nombre`, `cant_anios`, `cant_materias`, `primero`, `segundo`, `tercero`, `cuarto`, `quinto`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Licenciatura en Sistemas de Informacion', 5, 34, 7, 6, 8, 8, 6, NULL, '2019-03-13 23:18:11'),
(2, 1, 1, 1, 'Analista de Sistemas', 3, 15, 0, 0, 0, NULL, NULL, NULL, '2018-09-20 02:07:56'),
(3, 1, 1, 1, 'Profesorado en Biologia', 4, 10, 0, 0, 0, NULL, NULL, NULL, '2018-09-20 02:08:16'),
(4, 1, 1, 1, 'Licenciatura en Biologia', 4, 35, 0, 0, 0, NULL, NULL, NULL, '2018-09-20 02:08:32'),
(5, 1, 2, 1, 'Licenciatura en Criminalistica', 5, 36, 0, 0, 0, NULL, NULL, NULL, '2018-09-20 02:08:46'),
(6, 1, 1, 1, 'Profesorado en Matematicas', 4, 39, 9, 10, 11, 8, NULL, '2018-10-01 21:42:00', '2019-03-15 00:38:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion`
--

CREATE TABLE `condicion` (
  `id` int(1) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `condicion`
--

INSERT INTO `condicion` (`id`, `nombre`) VALUES
(1, 'Ingresante'),
(2, 'Renovante'),
(3, 'Nuevo'),
(4, 'Condicional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consideraciones`
--

CREATE TABLE `consideraciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `datos_id` int(11) UNSIGNED NOT NULL,
  `beca_id` int(11) UNSIGNED NOT NULL,
  `parentesco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enfermedad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incapacidad` tinyint(1) DEFAULT NULL COMMENT '0 no, 1 si',
  `cert_incapacidad` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `consideraciones`
--

INSERT INTO `consideraciones` (`id`, `user_id`, `datos_id`, `beca_id`, `parentesco`, `enfermedad`, `incapacidad`, `cert_incapacidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 39, 4, 8, 'Yerno', 'ladri', 1, '8/33432123/imagen_discapacidad_familiar-0-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '2019-03-25 00:50:26', '2019-03-25 00:50:26', NULL),
(2, 39, 4, 8, 'Primo', 'otro ladri', 1, '8/33432123/imagen_discapacidad_familiar-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '2019-03-25 00:50:26', '2019-03-25 00:50:26', NULL),
(3, 39, 5, 9, 'Otro', 'sss', 0, NULL, '2019-03-25 02:20:16', '2019-03-25 02:20:16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronogramas`
--

CREATE TABLE `cronogramas` (
  `id` int(11) NOT NULL,
  `beca_id` int(10) UNSIGNED NOT NULL,
  `fecha_1` date DEFAULT NULL,
  `fecha_2` date DEFAULT NULL,
  `fecha_3` date DEFAULT NULL,
  `fecha_4` date DEFAULT NULL,
  `fecha_5` date DEFAULT NULL,
  `fecha_6` date DEFAULT NULL,
  `fecha_7` date DEFAULT NULL,
  `fecha_8` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cronogramas`
--

INSERT INTO `cronogramas` (`id`, `beca_id`, `fecha_1`, `fecha_2`, `fecha_3`, `fecha_4`, `fecha_5`, `fecha_6`, `fecha_7`, `fecha_8`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 8, '2019-03-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-25 00:37:53', '2019-03-25 00:37:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(26, 3, 'id', 'number', 'Identificador', 1, 0, 0, 0, 0, 0, '{}', 1),
(27, 3, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:2\"}}', 2),
(28, 3, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users,email|email\"}}', 5),
(29, 3, 'password', 'password', 'password', 1, 0, 0, 1, 1, 0, 'null', 6),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Rol', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '{}', 10),
(32, 3, 'created_at', 'timestamp', 'Fecha de creacion', 0, 1, 1, 0, 0, 0, '{}', 12),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '{}', 15),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '{}', 9),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(46, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '{}', 1),
(47, 6, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
(48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '{}', 3),
(49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '{}', 4),
(50, 6, 'display_name', 'text', 'Nombre para mostrar', 1, 1, 1, 1, 1, 1, '{}', 5),
(53, 3, 'role_id', 'text', 'Rol asignado', 1, 1, 1, 1, 1, 0, '{}', 8),
(54, 3, 'dni', 'number', 'Dni/Pasaporte', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users,dni|min:7|max:10\"}}', 4),
(55, 3, 'apellido', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:2\"}}', 3),
(56, 7, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(57, 7, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, NULL, 2),
(58, 7, 'user_nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 3),
(59, 7, 'carrera_nombre', 'number', 'Nombre de la Carrera (falta cambiar)', 0, 1, 1, 1, 1, 1, NULL, 4),
(60, 7, 'facultad_nombre', 'text', 'Facultad Nombre(falta cambiar)', 0, 1, 1, 1, 1, 1, NULL, 5),
(61, 7, 'sede_nombre', 'text', 'Sede Nombre(falta cambiar)', 0, 1, 1, 1, 1, 1, NULL, 6),
(62, 7, 'univ_nombre', 'text', 'Univ Nombre(falta cambiar)', 0, 1, 1, 1, 1, 1, NULL, 7),
(63, 7, 'merito', 'number', 'Merito', 1, 1, 1, 1, 1, 1, NULL, 8),
(64, 7, 'observacion', 'text', 'Observacion', 0, 1, 1, 1, 1, 1, NULL, 9),
(65, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(66, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(67, 7, 'inscripcione_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"becas\",\"pivot\":\"0\"}', 12),
(68, 8, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 8, 'nombre', 'text', 'Ingrese el Nombre de la beca', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":[\"min:2\",\"required\"]}}', 2),
(70, 8, 'descripcion', 'text', 'Ingrese una breve descripcion de la beca', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":[\"min:5\",\"required\"]}}', 3),
(71, 8, 'periodo_desde', 'date', 'Periodo Desde', 1, 1, 1, 1, 1, 1, '{\"format\":\" %d-%m-%Y\",\"validation\":{\"rule\":[\"required\"]}}', 4),
(72, 8, 'periodo_hasta', 'date', 'Periodo Hasta', 1, 1, 1, 1, 1, 1, '{\"format\":\" %d-%m-%Y\",\"validation\":{\"rule\":[\"required\"]}}', 5),
(73, 8, 'monto', 'number', 'Ingrese el monto mensual de la beca', 1, 1, 1, 1, 1, 1, '{\"default\":\"1000\",\"validation\":{\"rule\":[\"min:1\",\"required\"]}}', 6),
(74, 8, 'habilitada', 'checkbox', 'Estado de beca - Habilitacion', 1, 1, 1, 1, 1, 1, '{\"description\":\"Debes poseer una sola beca habilitada en el sistema, para que se inscriban a la que tiene estado habilitado\",\"options\":{\"0\":\"No habilitada\",\"1\":\"Habilitar\"}}', 7),
(75, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(76, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(77, 8, 'anio', 'number', 'Año de la beca', 1, 1, 1, 1, 1, 1, '{\"default\":\"2018\",\"format\":\"%Y\",\"validation\":{\"rule\":[\"required\",\"max:4\",\"min:4\",\"unique:becas,anio\"],\"messages\":{\"required\":\"El :attribute no puede estar vacio.\",\"max\":\"El :attribute no puede ser mayor a :max numeros.\",\"min\":\"El :attribute no puede ser menor a :min numeros.\"}}}', 8),
(78, 10, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(79, 10, 'beca_id', 'number', 'Beca Id', 1, 1, 1, 1, 1, 1, NULL, 2),
(80, 10, 'fecha_1', 'date', 'Fecha 1', 1, 1, 1, 1, 1, 1, NULL, 3),
(81, 10, 'fecha_2', 'date', 'Fecha 2', 1, 1, 1, 1, 1, 1, NULL, 4),
(82, 10, 'fecha_3', 'date', 'Fecha 3', 1, 1, 1, 1, 1, 1, NULL, 5),
(83, 10, 'fecha_4', 'date', 'Fecha 4', 1, 1, 1, 1, 1, 1, NULL, 6),
(84, 10, 'fecha_5', 'date', 'Fecha 5', 1, 1, 1, 1, 1, 1, NULL, 7),
(85, 10, 'fecha_6', 'date', 'Fecha 6', 1, 1, 1, 1, 1, 1, NULL, 8),
(86, 10, 'fecha_7', 'date', 'Fecha 7', 1, 1, 1, 1, 1, 1, NULL, 9),
(87, 10, 'fecha_8', 'date', 'Fecha 8', 1, 1, 1, 1, 1, 1, NULL, 10),
(88, 11, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(89, 11, 'beca_id', 'text', 'Beca Nombre', 1, 1, 1, 1, 1, 1, '{\"default\":\"Seleccione una beca\",\"validation\":{\"rule\":\"required|unique:cronogramas,beca_id\",\"messages\":{\"unique\":\"La beca seleccionada ya posee cronograma asignado.\"}}}', 3),
(90, 11, 'fecha_1', 'date', 'Fecha 1', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 4),
(91, 11, 'fecha_2', 'date', 'Fecha 2', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 5),
(92, 11, 'fecha_3', 'date', 'Fecha 3', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 6),
(93, 11, 'fecha_4', 'date', 'Fecha 4', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 7),
(94, 11, 'fecha_5', 'date', 'Fecha 5', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 8),
(95, 11, 'fecha_6', 'date', 'Fecha 6', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 9),
(96, 11, 'fecha_7', 'date', 'Fecha 7', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 10),
(97, 11, 'fecha_8', 'date', 'Fecha 8', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 11),
(98, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 12),
(99, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(100, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
(102, 11, 'cronograma_belongsto_beca_relationship', 'relationship', 'Nombre de Beca', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Beca\",\"table\":\"becas\",\"type\":\"belongsTo\",\"column\":\"beca_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"becas\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(128, 3, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(130, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(131, 19, 'nombre', 'text', 'Nombre de la carrera', 0, 1, 1, 1, 1, 1, '{}', 2),
(132, 19, 'cant_anios', 'text', 'Años de la carrera', 1, 1, 1, 1, 1, 1, '{}', 3),
(133, 19, 'cant_materias', 'text', 'Materias de la carrera', 1, 1, 1, 1, 1, 1, '{}', 4),
(134, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 14),
(135, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(144, 19, 'carrera_belongsto_facultade_relationship', 'relationship', 'Facultad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Facultade\",\"table\":\"facultades\",\"type\":\"belongsTo\",\"column\":\"facultad_id\",\"key\":\"id\",\"label\":\"acronimo\",\"pivot_table\":\"becas\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(145, 19, 'carrera_belongsto_sede_relationship', 'relationship', 'Sede', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Sede\",\"table\":\"sedes\",\"type\":\"belongsTo\",\"column\":\"sede_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"becas\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(148, 3, 'settings', 'text', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 11),
(153, 19, 'primero', 'number', 'Cantidad de materia de 1°', 1, 0, 1, 1, 1, 1, '{}', 5),
(154, 19, 'segundo', 'number', 'Cantidad de materia de 2°', 1, 0, 1, 1, 1, 1, '{}', 6),
(155, 19, 'tercero', 'number', 'Cantidad de materia de 3°', 0, 0, 1, 1, 1, 1, '{}', 7),
(156, 19, 'cuarto', 'number', 'Cantidad de materia de 4°', 0, 0, 1, 1, 1, 1, '{}', 8),
(157, 19, 'quinto', 'number', 'Cantidad de materia de 5°', 0, 0, 1, 1, 1, 1, '{}', 9),
(158, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(159, 25, 'minimo_vital_movil', 'text', 'Mínimo Vital Móvil', 1, 1, 1, 1, 1, 1, '{}', 2),
(160, 25, 'precio_urbano', 'text', 'Precio Urbano', 1, 1, 1, 1, 1, 1, '{}', 3),
(161, 25, 'anio', 'text', 'Año', 1, 1, 1, 1, 1, 1, 'null', 4),
(163, 25, 'created_at', 'timestamp', 'Fecha de creación', 0, 1, 1, 0, 0, 0, '{}', 5),
(164, 25, 'updated_at', 'timestamp', 'Fecha de modificación', 0, 1, 1, 0, 0, 0, '{}', 6),
(166, 8, 'id_calculos_auxiliares', 'text', 'Id Calculos Auxiliares', 1, 1, 1, 1, 1, 1, '{}', 2),
(167, 8, 'beca_belongsto_calculos_aux_relationship', 'relationship', 'Calculos Auxiliares', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\calculos_aux\",\"table\":\"calculos_aux\",\"type\":\"belongsTo\",\"column\":\"id_calculos_auxiliares\",\"key\":\"id\",\"label\":\"minimo_vital_movil\",\"pivot_table\":\"becas\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(168, 19, 'facultad_id', 'text', 'Facultad Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(169, 19, 'sede_id', 'text', 'Sede Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(170, 19, 'universidad_id', 'text', 'Universidad Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(171, 19, 'carrera_belongsto_universidade_relationship', 'relationship', 'Universidad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Universidades\",\"table\":\"universidades\",\"type\":\"belongsTo\",\"column\":\"universidad_id\",\"key\":\"id\",\"label\":\"acronimo\",\"pivot_table\":\"becas\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(3, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, 'Lista de todos los usuarios registrados en SIGAB', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2017-12-28 22:25:58', '2019-03-15 00:18:11'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2017-12-28 22:25:58', '2017-12-28 22:25:58'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2017-12-28 22:25:58', '2018-12-19 21:40:30'),
(7, 'inscripciones', 'inscripciones', 'Inscripcione', 'Inscripciones', NULL, 'App\\Inscripcione', NULL, 'InscripcionesController', 'Lista de los inscriptos a la Beca', 1, 0, NULL, '2018-04-05 22:41:47', '2018-04-05 22:42:22'),
(8, 'becas', 'becas', 'Beca', 'Becas', NULL, 'App\\Beca', NULL, 'Voyager\\BecasController', 'Listado de Becas', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2018-07-17 03:23:49', '2019-03-23 23:46:42'),
(10, 'fecha_cobro', 'fecha-cobro', 'Fecha Cobro', 'Fecha Cobros', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2018-07-19 19:45:26', '2018-07-19 19:45:26'),
(11, 'cronogramas', 'cronogramas', 'Cronograma', 'Cronogramas', 'icon-user', 'App\\Cronograma', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2018-07-19 19:52:26', '2019-03-22 23:32:23'),
(19, 'carreras', 'carreras', 'Carrera', 'Carreras', 'voyager-file-text', 'App\\Carrera', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2018-09-19 21:02:24', '2019-03-13 23:17:24'),
(25, 'calculos_aux', 'calculos-aux', 'Cálculos Auxiliar', 'Cálculos Auxiliares', NULL, 'App\\calculos_aux', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2018-10-02 19:38:45', '2019-02-07 02:48:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_personas`
--

CREATE TABLE `datos_personas` (
  `id` int(10) UNSIGNED NOT NULL,
  `beca_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `carrera_id` int(10) UNSIGNED NOT NULL,
  `imagen_dni_frente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen_dni_dorso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cert_anses` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuil` bigint(20) NOT NULL,
  `estado_civil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cumple` date NOT NULL,
  `domicilio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` int(11) NOT NULL,
  `km_procedencia` float NOT NULL,
  `provincia_id` int(10) NOT NULL,
  `nacionalidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cel` int(13) UNSIGNED NOT NULL,
  `face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disca_estudiante` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `certificado_discapacidad` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion_estudiante` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `constancia_estudiante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificado_estudiante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anio_ingreso` int(11) NOT NULL,
  `cant_materia` int(11) DEFAULT NULL,
  `promedio` float DEFAULT NULL,
  `tiene_trabajo` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `tipo_trabajo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprobante_ingresos_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprobante_ingresos_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprobante_ingresos_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sueldo` int(11) DEFAULT NULL,
  `tiene_beca` tinyint(1) DEFAULT NULL COMMENT '0 no, 1 si',
  `tiene_pasantia` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `tiene_asig` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `otros_ing` tinyint(1) DEFAULT NULL COMMENT '0 no, 1 si',
  `otros_ing_cant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otros_ing_descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domi_cursado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `casa_fam` tinyint(1) NOT NULL,
  `tiene_alq` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `recibo_alquiler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto_alq` int(4) DEFAULT NULL,
  `usa_urbano` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `cant_viajes` int(11) DEFAULT NULL,
  `usa_media_dist` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `precio_pasaje` int(11) DEFAULT NULL,
  `cant_km` float DEFAULT NULL,
  `cant_viaja_media` int(11) DEFAULT NULL,
  `recibo_pasaje` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `larga_distancia` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `cant_viaja_larga` int(11) DEFAULT NULL,
  `recibo_pasaje_larga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cant_km_larga` int(11) DEFAULT NULL,
  `precio_pasaje_larga` float DEFAULT NULL,
  `es_propietario` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `alquila` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `recibo_alquiler_familiar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_alquiler` int(11) DEFAULT NULL,
  `prestada` tinyint(1) DEFAULT NULL COMMENT '0 no, 1 si',
  `otros_vivienda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ingresa cualquier cosa',
  `tiene_campo` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `cant_has` int(11) DEFAULT NULL,
  `actividad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiene_terreno` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `cant_terreno` int(11) DEFAULT NULL,
  `tiene_auto` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `cant_auto` int(11) DEFAULT NULL,
  `tiene_moto` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cant_moto` int(11) DEFAULT NULL,
  `otros_gastos` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `otros_gastos_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otros_gastos_cant` float DEFAULT NULL,
  `otros_gastos_recibo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `anio_cursado` int(11) NOT NULL,
  `tiene_progresar` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `revision` int(2) DEFAULT '0' COMMENT '0 recien inscripto, 1 incompletos o inconsistentes,2 postulado',
  `band` int(2) DEFAULT '0' COMMENT '0 sin revisar, 1 revisado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `datos_personas`
--

INSERT INTO `datos_personas` (`id`, `beca_id`, `user_id`, `carrera_id`, `imagen_dni_frente`, `imagen_dni_dorso`, `cert_anses`, `cuil`, `estado_civil`, `cumple`, `domicilio`, `cp`, `km_procedencia`, `provincia_id`, `nacionalidad`, `cel`, `face`, `disca_estudiante`, `certificado_discapacidad`, `condicion_estudiante`, `constancia_estudiante`, `certificado_estudiante`, `anio_ingreso`, `cant_materia`, `promedio`, `tiene_trabajo`, `tipo_trabajo`, `comprobante_ingresos_1`, `comprobante_ingresos_2`, `comprobante_ingresos_3`, `sueldo`, `tiene_beca`, `tiene_pasantia`, `tiene_asig`, `otros_ing`, `otros_ing_cant`, `otros_ing_descr`, `domi_cursado`, `casa_fam`, `tiene_alq`, `recibo_alquiler`, `monto_alq`, `usa_urbano`, `cant_viajes`, `usa_media_dist`, `precio_pasaje`, `cant_km`, `cant_viaja_media`, `recibo_pasaje`, `larga_distancia`, `cant_viaja_larga`, `recibo_pasaje_larga`, `cant_km_larga`, `precio_pasaje_larga`, `es_propietario`, `alquila`, `recibo_alquiler_familiar`, `precio_alquiler`, `prestada`, `otros_vivienda`, `tiene_campo`, `cant_has`, `actividad`, `tiene_terreno`, `cant_terreno`, `tiene_auto`, `cant_auto`, `tiene_moto`, `cant_moto`, `otros_gastos`, `otros_gastos_descripcion`, `otros_gastos_cant`, `otros_gastos_recibo`, `motivos`, `localidad_id`, `anio_cursado`, `tiene_progresar`, `revision`, `band`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 38, 3, '8/33222333/imagen_frente-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', '8/33222333/imagen_dorso-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', '8/33222333/certificado_anses-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 20326549872, 'casado', '2016-12-22', 'maipu556', 3100, 25, 22, 'argentino', 3436258369, 'damian.sacks', 1, '8/33222333/certificado_discapacidad-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 'Ingresante', '8/33222333/constancia_estudiante-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', '8/33222333/certificado_estudiante-0-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 2017, 0, 7, 1, 'activos', '8/33222333/comprobante_ingresos-1-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', '8/33222333/comprobante_ingresos-2-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', '8/33222333/comprobante_ingresos-3-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 23123, 1, 1, 1, 1, '111112', 'asdasd', 'ramirez 123', 1, 1, '8/33222333/recibo_alquiler-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 25812, 1, 1, 1, 25, 60, 6, '8/33222333/recibo_pasaje--33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 1, 12, '8/33222333/recibo_larga_distancia-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 80, 256321, 0, 1, '8/33222333/recibo_alquiler_familiar-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 12563, 1, 'ninguna', 1, 2, 'trigo', 1, 2, 1, 2, '1', 2, 1, 'asd', 3, '8/33222333/recibo_otros_gastos-33222333-dcNARpQfMavNsSZCJBP4T8JFLnzSTyTyGn7Q1kl6kqGTtkh1C1SktWac0NdwyRSXFyPpJtaA617HxEnSGLOs8tZ3SeXtbL9KFTG1.jpg', 'asdasdas', 2110, 2, 1, 0, 0, '2019-03-25 00:26:54', '2019-03-25 00:26:54', NULL),
(4, 8, 39, 3, '8/33432123/imagen_frente-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/imagen_dorso-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/certificado_anses-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 20332589632, 'soltero', '2016-12-21', 'maipu556', 3100, 28, 10, 'argentino', 3433218369, NULL, 1, '8/33432123/certificado_discapacidad-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 'Renovante', '8/33432123/constancia_estudiante-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/certificado_estudiante-0-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 2014, 8, 0, 1, 'informal', '8/33432123/comprobante_ingresos-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', NULL, NULL, 20000, 1, 1, 1, 1, '30000', 'vvvvvvv', 'america 123', 1, 1, '8/33432123/recibo_alquiler-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 31000, 1, 14, 1, 60, 80, 6, '8/33432123/recibo_pasaje--33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 1, 14, '8/33432123/recibo_larga_distancia-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 100, 160, 1, 1, '8/33432123/recibo_alquiler_familiar-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 21111, 1, NULL, 1, 2, 'maiz', 1, 1, 1, 2, '1', 2, 1, 'vivir', 50000, '8/33432123/recibo_otros_gastos-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1246, 3, 1, 0, 0, '2019-03-25 00:50:26', '2019-03-25 00:50:26', NULL),
(5, 9, 39, 3, '9/33432123/imagen_frente-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.jpg', '9/33432123/imagen_dorso-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.jpg', '9/33432123/certificado_anses-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.jpg', 20332589632, 'casado', '2019-03-04', 'rivadavia 1222', 3100, 25, 9, 'argentino', 3435258741, 'ricardo212', 1, '9/33432123/certificado_discapacidad-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.jpg', 'Renovante', '9/33432123/constancia_estudiante-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.pdf', '9/33432123/certificado_estudiante-0-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.pdf', 2015, 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, 0, NULL, NULL, 'carbo 11', 0, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, '0', NULL, 0, NULL, NULL, NULL, 'wwwwwwwwsss', 1166, 3, 2, 0, 0, '2019-03-25 02:20:16', '2019-03-25 02:20:16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultades`
--

CREATE TABLE `facultades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acronimo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `logo` longblob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `facultades`
--

INSERT INTO `facultades` (`id`, `nombre`, `acronimo`, `direccion`, `telefono`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'FCyT - Facultad de Ciencias y Tecnologia', 'FCyT', 'Ruta 11 km 12', 4975141, 0x89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a8660000000473424954080808087c086488000000097048597300000b1300000b1301009a9c180000200049444154789cecbd79b4ede759dff779a7dfb0f73ec39da57ba5ab2b59b26c59c8d8060c98443643486842131622b40961a56d8c430a14278492156232d09612d2344dc2541220b3619115425ad23601eae0c4808d2dc7f26c4d5757bad3b967d8fb37bc63ff787e674bc6a68cd255e4f35d4bd2bd3a47f76cedfd7b9ff719bedfef034738c2118e708423fca78a6ffcc1bbbee89b7ef0ee97fdff7dcf1fffbb779d7ea15ecf7f4ab037fb051ce108bf1d7ce3dfbe6fd16c96ef9a57e6abab4adff1f8b5837b3fe9eb7fffbe5b1887ff66ded65f326fec6b57637c18f83d37e9e5be687114008ef0a2c47ffba3777febe6a2fdcab9d3afddd9efffe5f77ddd47fe38c05bffc17d5f595bfd6db34a7dde33075df5cc81e7d5b71cf3bfef4f3dfaf1d6dcfbd5d6f0c72ac3abdb4a5fb8a18cbab8bb4b5559ce1d9bbb5ffb33fec4f7dd76ae6daa3f66ad3ef977bee1637ffe85ffbfbcf9380a00477851e09b7ef4ee97cde7ed9fae6cf94333e7eeb8de75f5d5fe80abd1b155e9cffbb3ffe8de1fda9a357f28c32d9fb8728d1def49595392e29de315c23f7fe060d686f6ea41cfde30b23f0cc40814c5f9930da51400fef40fdcfd96a6b25fde38f55aabf5f99dd5c0f145750df88c0c00ea66bf80237ce6e15bfee13d7feac4d6ec3b96abe19794d2f359635fa3156777bd57bbdeb38a91900ae3102945b3556b4e343557563dab10592d035a5bbc8fd455454999adcd8a7e0c0c7dc25a47b71a505a1306cf6c56717a511dbcf2ecc9e6c66a747b7de060f4ec0f811812bfef81dbf3a357ded7fcd037106ef67bf342e328001ce105c35bdffeca3fbad598ef0b94738fefefb155d5a45c5825cf2a44508e103225418c89ba6ee8563dce19ac51049f19c7488a1980920bc6184a06e71cc330527226e7440c198546a1505a316b2cc664ba21d2af46acad198788528a7b6edfe496f9fc574a2e3d8052865212b9946c94a21bc3bffde16f79e2afdcd437ef79c251097084e71ddff28fef79fda98df98f2557ee7d6275c05e3f908b617fb544a149a9107c268415ce398cb1a494e8fb1e8092a11b03e33052d70d63f4186388319273c668cb72b9c418c8058cae70ada6ef7af9be94d83f18e4bf1dc19a961822b3d98c941297763c14f5393925b436186d2939a38dc6925934e6f24d7e0b9f371c65004778def04dffc7ddf5e650ffd462517df9c7f776cc5ef00c6346610821a2b526c58cb39618123126009c7528143917fa6e4029c57c3667f7c62e75dd50b99abeeff13ea095a2aa2cabaec3d99a1c2533504a9162c268034a1142c41a83f761ca0c20e7425555f4fdc07c56515068a5e8fb01a30d25672edcb2c59db76cfcfba79e3ef893ffe8db2f7df8e6bea3bffb380a0047785ef0d67f76ef5fb865bbfd8ea7866eb11347c65088b19073996e59430c819c0ade7b141ae72a8661c01a470c0150e4544829418194328bf982e5c18a94126d3ba310c82993a3c17b8f56068562b95cb2bd7d0c3f8c58e738d83f208480b50eab2da514ac95c180d686beeb689a96a11f28454a0aa335aed2dcb269b9fbcc36c3183e3844f54f3b1ffed68f7debe3bb37f71dfeddc1510038c2ef2adef2e3779d3e7762ebff0a6678f5e3cb257d2ca4ac4931a28d45a318468f561aad34314472ca3857a1940620fa48dff754558d35969c0bc14bba5f32e494515aa14d869c89de308e9eaaaa5045310c23755d137c8002c338628d456bcd615029391363c25a4b8c09ad14ce55041f70aea2eb3aac31e45c98cd2b948e9cdedce096ad96538b7adc39187fb9f7e97fff91ffeeb11fbbb9eff8ef0ce666bf8023bc74f0ed3ff9aa6f39776af1d31787dddbaf14cf6ac828258f588811671d5a6bb496835f4ac1180ba51062a4aa2a628c041fd0c6508a6407294979a040824429548d94087e2c72eb2b8d520aef032926b4d684108831629d83a2a8aa0a0a12786224c644c9859225cbd0faf03828524a386b514a117c2227c3deb2e7daaae7c9dd03ab8d3ebf3d737ff8fe2f5eecfeeabfde7fd74d7bd37f87d037fb051ce1a581bff42fee7fc77ccbfd2f1f38b83edf491d7e3494023967b4d654558df79eaeef29a5d0340dd65a28904bc11ac3380c586bd1c660b4a6e48273d20fa8aa4a0ef830626b4f4a9961952819aaaac25a43f081b66d515a116324a50c4ad1362d5555b13c5812636418478c312c160b4a917e81990e7f4a899c33d6189452d2a748896118480982d7eced068c32b473fbef5fff7be30fdfe4b7fe7784a30ce008bf237cf38fdf75ff57bde5c2c357537fdf537ea556c38aaa5a508a5497a5c8dfc274e3575545dff568a3a180d146ea7e2b9dff71f4d3c133a494d7cd3c3998055717aab6625c41dbb6945228456a59638c4c0e0a586b514a534a412b49fd955254ae9266632980a2691a8cd1841051289c73a49428597ef6388e1210acc53947ce99a6698971645eb9f4cc13f6550f7cf9f18fffeacfdeb872133f86df368e7a0047f86de3cffec42bbff9ccf1e67f7e3caceaddc1b33a58b1b1d51043250f96d2e494e9bb6eeab06b8c365863f1de538a5ad7e94ac94d1b4322a7341d482917acb1eb40506f8e743b8e9c9172024d5d37f47d2ff5bb75686df0a34c087c08f83160b4967203454e19630d39654091629ca604965c0a662a5152ce58230d43ad35ce394a999a92248e6d38ce1e5b70fba92db2f34ff7c9fff2c1aefece1ff9338f3e7c533f98df028e02c0117e5bf88e9f7ae54fd633fd472e33eaa52f0cab917a560851519286a24931d10f3d8bf906cbe58a59d3525535ab554729856118315a137ca4aeebe9a09ae9567f362d5768fc18a867811012cbdd8c31561a89da10468f9a7e9d7326a74c8a7283e75ca6875c310e9eb669d0c6a0d1747d4f9efa0b2517b4910942c9995c0a3144dab6c55acb6ab5a2aa2a9aa6a1eb3a008c81cde315a7efd0a455661e16dcb2b520c6fcd8b583fe0ffef85b9ffcc04dfb807e93380a0047f82de3bbfee567fdbbdef9375cc923a538bc0fc42161dac0b0d428050a83b58ea1efb14ed27ee71c2515b4b1c410a42f308ee454402969c81528299352c6ba0a558415188691e3b7c1de3315214449c7639e6e63450c4968c105fa7e402b4de52a40e1bd2786b89e32e494c9b948ff61ea51781f689b9661e8a7a0a1d61302630c7555e1835fbf072925661b9ae3e70b3b17133ace314e71accdbce2c2995ffddc3ffee1cffd1a45ba399fd06f1e474cc023fca6f1e61fbc7576e18ed3efd9d1fdbd97ba25251b1405a31caa9283129d258688ab1d3124168b0d8671441b03280a85711827714e402983718a30cdeb2980b61853188681ba6af063a0ddc8f44b833106ada46f308e9e920b6dd3e29c0422632c396750327930daac4b8c7118d74dc6143c8bc582a11f4829e3acc35a4b55d538ebe8fb81a6690921907366b95aa19462319fd3751d1b273527cf17ae3f66e9f60ac6785ad552bb86a11b6ffc93ef3e7f1a9e78fa267f64bf218e9a8047f84de15bdf7ecfb9b3a736ffe38e192f5c1d479c6d48491a6969c8d4f348ce35c117284546714a310c9e9c0b31c8182f868c568abaaaf13e306b5b867e4469cd387afcf4fdabd592cad5726015b45b91e50d85564e083f5aca02ad3525233d8229fd2fb95055b5f41562c407292d94566865482951b98a14257b905e80f414148a98a424f0a3a7aa1c0a210bc5143146d31ef36c9fd6ec5dac18579229586b31c6b03f8c0077de7e72f68daffad263b7dffdc663ef78e4ffb931deb40fee37c0510038c26f04f5ad6fbfe7dced27b7de7fcdf9537b2152b216324d016b2cfdd263661d25ce08a3c787b8aebb53ca52678724e3bcba26c4405d3580c28f32f76feb869c0ac65a288af97cc1387a281a53af188688539b0cbd8cf052caeb5b3fc544dbb4eb3e80d19abe1b28394f130229038cb1d4752d19c2c42c2c594608222cb28c87e502609d9087945253d330313fd5b3715ab1f378851ff4343590a0368c03c1270e06cf7e08ceaafc39c75bfb967b1e9c6d7ee14307ef78f7cf906fea27f9697014008ef06ba19efbd7b7befd9eb3e74f6d3dfc44de3f9eaca8f50e6fcdbaaa492193e340bd508c9ddcc2ce3a42883035d4b4b65383ae10432086bc16f1f87194865b4ad28df75236fba9a3dfdde8989ff6a46e01454a80c351a134f55a39c4a8671b80294fc21f2fa34663d14a510a8420538752a48e97d19e50944b96d741293475c3b01ad74cc54ce4fcab1cda149ef98825476952a69c28d3eb3f641482a6eb02fbc3c8f56ed5ccebfaf7a461f34fddf54533ffe19f5ffdd2cdfa603f1d8e02c0110e7178e8056f43bdf9cd2f3f71e1d4fc3f5ea23b31a219bdb0e74290b19a528a1c35497542b52d339cad60a2f98631608ca36430c8acbdaa6a8c3128255a00a564cc27f2df7a9add8b24d8198bae3ced8666f7f2546ea4448a793ddf0f2160ac2584488c11e72a722ea418d77cff1002d658c6d14b49a10d7d3f4c3f3762ad432b4dce6030d44d45ca99829888d475c52df74880b8fc31bd660c5a67a7b226d275dd5a5d2801a64031789f5985c058e2c26afd075ef1a6cdafbbf74d5b4f7ff8e70f1e79e13fe24fc5510038c2271f7c80b7c9efbff655777cf8725edeb23f3dd48028ecac1c1cad0cfb3b3ddbb78e8ccb06676bfa618492c931616d45b7ea69ea861013d63882f7686529294d8a3f888737719234dc8f42058e6366ebd691fd1d888374f09552f87144298dd1f23a8c3642248ad3f4c0daa9d39f85045460184666b31931c8ccbf69c42548a1f17da04445f41ee3a4bcf0ded3340d29254edd155126f2cc871dda18f97fd07abaf923a31f699a46c848d64e634ce921e45cd0cab15a8d5019b22ec7538c0fbdfcc18daf3cf705cd471effc5feb117f0b3fe141c0580237cd2adcf1be5f7ffc31b5efd9e7d3dde73a00a1485d19630d1645392397cf09161e9599c4c108f1163228504c530fa40298a5c32c9472a574f8752ca021089aed28aba6ad6ddf89cf2c41acc843e73f2cec08d276b9c93115f8a494685055288eb5e80b56eca0402d5f4bd0a212249295026b251460125812e86e485d8e31a8b718642219782b38e1803559bb9e52ec7931f50280c250b7f012525478a124c9c136561f0e25590f2e1ebb254aec2b98a94143e648a01abf386566675fb1777ffe6f15fb879bd81a331e06736e4f0bfed3941e011d4777efdab7e4835bcfa20c86103a99da5472e621cad3429444c3d32748a3406c862de917324fa485559ac7662cd75584b6721e9182de33c55147ef480c26845ce5357dd3854bb4f0952168840c882d2a414a8ab8a900a7555134294894496943fa5cc388eb4ed0ce5d49a1b106264ec47ac766814a6b6d846634a358d2585ad9872a09d37ecedee71fefec4d31f07df83310914cc6633692a5a43d1652d3ad25aa38d214f116a1c46aaba224ce50808a3502768ce986ffbc2afdef827fffdcbaec617fc537f0e8e88409f99f8d4830f3c08fa35f7defd87efb87de39f3e3aec9b21640a0aa50c5a69bc8f8c83c7b98a9832e341a6dadaa5a4963854789fd60db51825fd56da4860004acc286d26cd7d99d2fe4c4a42bcf141e8bb4a6b54d26cdcb2a4144dbfb3601c47286a2de4092150d943f72061fd9528b7b7526a2a27ccc4eb973164f409953528b0b525e7340992d4a4faf3945218bd47a1387646b1792ef1cc075a28857e1087a2d96c0e4adec467158732064c516cc67cf0cc6633b45258277d889484ac94ca92c6ccbaa2d4ef7fe7f7eebee385fef09f8b2335e067163eb5de3fc423a8bb6fbbf3c4cbce6efdf845bf34cad554b5a4de394d629c34cdd70be802fdc148b301c34a538ac25a872a0a525973ef350694d07d538614f3240996a940297a5dbb975cb0aea2944c1c121b2714abfd4cd77532df2f879983a67235ce56e2fe83820c294a4d1f4384026172ffa128629fd145a39cc23576622b2a828f5343514dd3054ddbcc68eb969317e0c61356740653831114a5e4493f20de01d65a9c75f25ab4661886497414515a4bcf626216861889dea2aa321bc7f15fbee69be70fbc900fc0afc55100f8ccc1af7bf01f04fdba63e87b2f6cfd87cbba6bb371a4206499e883a4e387365aa9001a9423330206a76b722a8c83971a1d2df5772c0c5dc7d88f94540841d47ea528c218883e317683187d942237a9d190218642d2237e75d8eccb2200524a0a91e9c05ae34831e1c7483f0c3241281053c4fb48bf1c58eeae7033839b3972c9d36d2c86203126fce81906612b4af612996d479a59cdb0ef98cf17d475331997c8d8f07022618c9612254a267f4842e290ec347a52ce8418263f038536969d6b1df5cc6ce59c7ff69e6f68cfbd40cfc0a7e028007c26e26d28de86e211d483f7a1964fa3befc2beefb5f55532eecf403e33042816ed5a18a42a35145914216265d2c8c4bcfe29822f6726854561864944652f83e9242c2688751969c0a6a92ff469f70b6466583ab6a8cb128344dd512c6845686e8238b4d43f4937acf98694428049e9c611c46c6d18b17604e34adfc5955555192c2288dad2cb3cdd934768c624396a58761ad8cf1babe6718469c95922486c4fcd69e4b1f4993b04866fdaeaaf03eac7d0ac2d48434468b9fc1e809314eaa466120364d33899624481cca8c67f30539552c36dcaddb1be6e75ef7ed6cdd8c47e128007ca6e1d7d4fdcba7515ff4a67bee3e7f7ae3bfbe963d75d5aed3e8c3f4fdb9c2991482940423349b853438349a5234394b90508810476bf97731a4297064a24f135d571193d87c09b720aefd0086610422bb372485f721ac197f394bc33ca58456123882f742244a89dd1bbb0c83c73abb9ee30bc92809634f4b2011830f51fd6d2c36d8d8d89ca8c170fc6ca2aa6a769e92836fddc43308510ef3a46b98b533fabe5f07a6aa7254cead4547251756ab6e4d2dd65ae3aa4aacc65246298d5b44cedca1ef297ef1932fdc43f02c8ec6809f3950cf3dfc0f823e19d17b35fa8daf3dff0b07d69f5efa3829e134b948ba4d5152a34721e750145a5b563b03ede981e1c69ce09334e112a03425318df2d4440692461b4549731031ff085134f8ce4abd4c91d160c98a9212272e24769faaa7db5a844231640c96344454827135107a8f2d863c267452943192c7400999e2e5d72a6588199d0ba614542e941831d225208540c919a30adb67334f7e20cad8af1cb20433b964628cb44d4b4e621b2ee3d080b1d29854289482aaaa495902565337547525be885a934bc65499d98901a32dab1d87d5faaec57ddc7aedddf1675ec887e2680cf899814faeff1f412d8fa1f66af457bde9156f6d67e69e9d38cdb663426b073911b3586e1d5a74c798b0a69260a0134d5d7330ca2d1b4619c5a5242dff9245de4bd1f2b59c64e14686d18fd8ca4ef57b26c6116b2ae9ca1b3b99821436365a488a38784af49494510abc16ea71b309ed31a86685aa8d982ae35a702d542d28258dc114a1a442c98a1ca780160a6904df67e2988883220e50b59961a9596c29d298882352caa0d059accb7cb712a2524c28a3519336613e9f73707030f50984525cd5355a6b96074b9416ee80a912dbb76656d70ddd4e4299cc7c5e319fbb6f78e537945ffee00f8e3f72731e8c23bc14f1c9449f4750af3b86ee6fa05efda5b76ebee115679f788a653bc432917484f81353c18f01a9124571e77d2425185781a20636cf65baa7b7f02192a298781ca6da316551fe692111f9104451e7e57b5d6d294a68b471ca044a298431507c26769163e732fd9e6576a2b07d0eb6ce16da2d45b797595e51acae2bfadd82ef0a3929522853f670c84790e0542868858c1715a0267283ce6803c6295cad5126e31a85a90b555bd83853708d627152117da1df85ee06f4bb9ad54e2176867155485e7c0dcdd4e5b79523032989d109a8a959a850f5c0a9db14fb972dfd5209bf42290a305f38f6768755f6e9f77cf0ef855f7d211e8ea30ce0a58d4f39fc53d38f7d30afbc67f3a77a1b5a3f1ebaed4a5d1a539114574bc38fc9a1277a498b7354d845260583f75126036b669e987b884bafdcbe59495a9f910d40ca801f03d659e108844cec3d718c289dd9ba45b3389539717721a7c8ce270c3b8f6b9e7a3893bda260d14653a4ad2ef4dc10e4cad7602a4341e1fb01630cdd4a3cffad36f8a911a7b54125451ef3341b95120598ca99cce62d89e140e3bb82d60a6d0baed1341b8a761be67726b6cf2aaa8d4cb703372e06969735cb6b9ed82b5406bfeaa89a06eb1cc9766c9f81a73f11495e618d54e031252ae7e8bbc8f6b16a7ee37affcfeef87a1e78fcc7189eef07e428007c26e039b5fff269d4b51173e1ecf1074eb6d51b9e184791c18e93371f1a55a6a65d0a942cf45b8aacf032aa906346d9bc9e009494f1215150e4827001265660c945e4c14a78ffb69247ce0f236915886340e9ccf66d70f67e68b70b973f64d87952b3ff4c623cb0f47d423b05d6621642ef6de60b5116c62406a4d650d9c30de02243367a4ad3270a700889f97c363513cbbae927d98aac0a534a49dd1f0bbb3b89977dae62e7a2e6e072453f8c8c1e56fba02f4dc162a24a9a4a516f14364f675ef6458a93774756d7143b8f5aae7e6260d81d310eae7dd4e2aa193e0a19aaa96b463f12a2341873721c3f65efb1bbe3f7c1eacf3cdf8fc65109f0d2c7baf9f720e8ab8fa06f1cc37efd97dcfbf0ec8efe657bab0685269502599113a45c0821a38ab0ffc4935f6efb521407d73c9b170ef0ab9a71afa264b93dc73180423aff31910f977896c917a0401a3ca98f949c3871a7e2f6d765aa193cf64b8add2735a107ed34612c2c4e3b6e7b2091a3e1998f2a560793a62017c67114e2119a711858cc1713935048474a2956ab15d6b8e7d07cd59a2a6cad9d9c894497608c8c09abba7a56321c0aed96e5955f12f9f8bb143b973cf5241012c18ff002945618256222a5242818a550b6303b0ec7cec3f9d74a5fe3a98735573f62e8770b4529746509493411b3d96c125b6582cf3927f3c6f7ffc0f279650a1e4d015eda78b6f3ff08ea6444ef69cc83af3dff852fbf7de35baed63baaf81610865e4e4552e731481d3d596ee7c81404e4261d9691e6f848ea2bb2771464292705fc18b15a4433b980d6963046c272242c07ea79e2ae37245ef165999d8bf0c4bb344fbe07567b9a76738e6e1d3164ea8d8a3868baeb15ed56e1f86d899235dd01ebed3d39e6897a2b6338630c5dd7af7d059d158eff3878eaa65e5386630c6b07e1be9f587b21d2b42d0af07e920d5b4d581596d761fb368fca354397a926ebf043b39043f351533962ca546d4b045282385af69e2c3cf16ec5a58735c96bce3e9079fdd765b42df803c89dc21e4a9b9d651c228bcd4af9103ffbca2fc71f7c3e1f90a300f0d2851cfc49ddf7e029f4de93e821a0bfe28beff8991be5e0c4587b4c98214eb8c044e4d1cac8ad3d898184ab6f26baaea2db8b6cdf9ee86e5872d0d3ba6ec91e624cd3fc5de37bcfb0d753b2e7d8f9cc677f9534d99e7cb7e2e3ff0ea2af31f38afa78cb7c6b462263aca6aa1dc90b9b6fec23bb970afd3271eebec2e2446475c3e0fbb4de2ca4b5b0050fadbd28b27fd04fcabc92cb44252ecf127ea6b9bcb54ea8bb55454a09efe59647298cd6f83092474bc9863b5f0bd79e28a8c9562c27f141d4fad0ab50cb84c38a63b13242798e14b473185bb1dc0dec3ea1f9c4bf83fd2b8ad377c3bd5f9a30aed0ed64522fcb524d55a154baf5f803f5fbafbedb7ff0f97a488e02c04b17cf0680e7dcfeffd91fb8fbb3cf9f9c7ddb63e35555370e9d6a4a117a6d8a1985ccea298a5c8a3401a77a3e4d74dce120303be30907b530f53293c55682ac483ed3edac48d173eb67256e7f4d61755df1b15fd05c7f52a1eb0a16502f1a8a625aea2936e2da58e10de8822e42a8a9da0abfa7b9fa0945b3a139767ec0d619df6954b1935cf9b0de575863190659f2294b471cd5a41a345aa4ca8736613144aaca899439a5b5a9875642f52d4853301c6886d173f202ec5f4b689c507cbd38055755bd364911372459307ab03c10bf026749391373228c85db5f5bb1fb4c64ef29c3a5f7411ce1fce728cede5f38b89a19f722aeb6a4526ebbfccbe1ef3d5f0fc95113f0a5894f52fb3d781feaea23a804eaf653b31f7a66b5547ade61f3ad80a680186ae642ce89940a251d1e78a99f4bca94249afa92155565c8d3b4802292db61e919f60794cedcf17ac5d6b9c2a3efd45cfe904259c3c6b939dd20ee41b5110d7d8c89a66ec5bc33054a098c59a4bc510f886f80a7d48532c2c5f7829d579cba2b71f69523c39ee2c6539a6e15a6da1c4acee204e4035b9b5b8c83a7efc598a4eb7a2ae730c640a9d63662d68a9bf06ad549d640144193d65495ec16bcf6a8f80a9eba2b72f5634aecc6ac508f83f7626d1625a0586ba705a316a565014addd428a5e87ccfce33235b675af6ae64ac6b58ddf07cf8df66ea16ce3e00f546e2e2af804ae5f39ecf07e52800bcd431917e5633f4573c78fe95a7b79a57fde247afd36c66f092ca462f049e828cfab436249894767addc0139b2bb1dceefb8852e2b1ef87cc6aa743dbc4dd6f2c2c8ec347dfa178e2572c6ec3323fed4041cae2e7ef47d9ed370e7e6dd77dc8f64b31815274ab4e828f029221ab40d1052ae8f612971e769859e6f805cfb9cfcaac762c573e2e23ca7e0ca4246bc84a464c47268fc0b6690831b25c76cc6733fce8851fa0b5342ea7b49e32f9124edb80bc1f31d6b0f794e1f43d62097ef1231214731681d1ac151b71113c893741ce2236aa6ae933c414d14613560a77dc636d239314a3319523a4c463ef8ad8062e7c5e62ffcaa117d3f383a300f052c5afe1fc03dc7176fb87aff95ed30ccccca6b8e8aa82738a9223e318a51b1e2503908519913cade496db5e4fff843024f6af0e689bb8f30d99d9367cecffd5f4fb85d9c99aed3bea89e79fd60e3d87db797286a20ace55385b890867b2e91efa013dc97eb5369494b038a216628dd6233164fa3dcdd3ef335c9b25da2df1f21bbac462b160b95c0a83b114ac112bf1baaee93b59fc319fcd29149aa625e7cc300ce49299cd66f2669582b5524ac4c3cdc539508ae5d28702b7be4271eab69addcbb2f710a1429053a2aaeba929a9a795e44c5f976faa9b1abf8c1c3b0bb1d694a44949638ca6eb3c1885a5e1c33fdfd32ed4d5e7f331390a002f3d7cd2c17fdd31e1fb7fdebdb79d38b9593df0fe6776a88f056cda9ee4bd62d395a79bb24c1a8050c4da4b150d4cf6da4aaf4b85eb1f2d2c7796dc7a3f2c4e179ef865c5b0a7989dacd9b8559679e4e7b8ec58e7641598318443cd81d2a4344e2f5af60666258ebe292631eb44a35bcdc1c1523cfca691624c11d318acb6f8a1d0ad3c4da3a93622b7de5b4019762e0ef8fd39fbd74526ac50a23cd4620366adec2874cec9b2d2249c87baa9e9fb7ee2b8e22bfe00002000494441540548e090b1a3f426e290b9fc51c7b1f389aa85bdeb1e57d9698c5893a695e42144ac35eb9d02870b4bbc1fa95dc3f26aa09a07f6afb0660a4a591419464f359b3dace2f0b79fcf87e52800bc94f1088a6310f651f7bd7cebefac54b0fbbb238b331106b7be71c328b7b4d69a9485370f6a22d93075d0a5c9b77f6d60fffa92b3e7e0bed72b1e7b97e2f2870dcda2e2d43d35c6b835f9c6284b48e39adbaf944651a82a47df8ff2f3a6ef8582f79e711c659b5037aeadc3ac759f94960bf7465157157d37606b8b43467ae3087ea7a6dd2e2cce048edfda735639762f17f6ae44cad232f6034ac938d118c3388ce20b5849208851eccb867ec039c76ad5a160ed59609c21faccfe338a763bb1dc1326e16153d03abb5e339eb3c885855929c1100dda28fa7d45bba1d02e90fc344930068b22a6f4aead13f1ab7fe12f878bcfe72372340578e9e159e2cf34fa5b2d305ff6b9e77f60b70ceec68d9ef9898c8b9ba4ac18fb488c19a545b823e61c8a948b887e801c0bddbee7ca130798daf3eaafcaec5d725c7a9f62f38ca1de6868168d987c4e33f938ed05c8a94cdaf888517652d7415db7cfeee843310ce2f43b9f2f64e29064de5e10be7c5dd5801cce182325cbcf90851dc2ea33c64cd2db4cbf1f595ed1ec5db2ac7633ae86c5c9c889db15b6cdccda8614340545df7b4a06676539a8b1465c7f29186d24fd4f89aaaad6be864dd390bcb8ffb6dba052438c89c5c662e2f64b965155d268f43e309fcf45a09412da184a2aa4acd93a6158ee4b19e143095af137fed2f7affecbbffea6b8f77c3f2c4701e0a507f5dcd15fb78dfeea37bdfcdbb78fb92fbbde0d0cb1a7dd5228dfe2bbc9e1b732cf71d1153f3f21c8697c1fb97a71c930f4bcecf7269a6dc5077f5691bcc3563527efd298852776cd241d161a712ee203004a9674160906d2e8cb2c0f963493cb8e31b2cd472cbeed44ce71d38660690e7a1f240d37163f042a57534ac64e19879b74f8ce3ac4954c74fc31067c0fe3aee5fa9399836b8ad9acc6ce1327ce698ccb8cab84b3959440b09e0a945c18fd88317a723a2a5329e3c9655a08e215b385340a8daa18fa01630d9573cc177396cbe5f4da0e75061a3b49879d73e450c84035538c5dfc84b1f6ab1ffebbcb1fb95fbd304ec14725c04b0b9fd2f80bfba853dbed5bf6e248bf4ad84a1ed4d56ea000b612eebbd4f7c204143a6f66ffbae7fae5038edd91397e073cf62e434986db5eb5000d7b57072e3d6c397daf62ebd681d595197ec89475735133f423fd384e861935a3f7a4019caa640f20659a0c88f5580891a696db94324d1ff2b3db7c41534debbd94d2d3f74dc49fd14f0c3dd913308ce37acbcfe83d21474c68b8f4b10105d806e6270b77bfae65ff6ae6da13590c4f6364f4d2ac3cf42dd0464ffb0c3db399fc7b63c5d5b8db837a0e7e0842158e115d55d36ec18a1802214a0fc05ae10428a5505a5486ab1bf943aec9dff3c11f0e3f0a01f5fd2fdc03739401bcb4b04eff5f17317b35facbbef0c283674e366f59aaa8fa654255195327861d8b75d343784803ce85940b7ec83cf5b13df67757bcfc8b0bdd8ee2f2070d1b27669cb96353bc3d0a54b56358450eae169acd427b7c64b90bd98b7ab0ef47d901a0cce42f1809219133f821a292b0f5fc64293ef4a3d4dfb94c6bbb0d461b8629809422249f10c264fd250db7c33562a514867e94f11f656dff9552c6282dddf7c9ce3b954c8a100e0cd72e069aadc2fc4464b91bd75e06b9e4354fa072d5b4c3a022f800c8c2501f463144d10aebc00f42461297634ff081aa16172021196528452ccac7f00155f8fa5b1e1dbeed977e32bde7663c304701e0a5834f62fe9d6d51cb0efdf9afbbe59fd072eb98327e284446b42dc4654dd54a02b876014a851b577a9e7e749713f704cebe3af3d82f5ab2779cbeb0c16c5328b27dd7636d45511a5b4108857ec761dbcca93b13bb9733e3f0acbb10408e19eb2a9c75d3ccdda3ad2247f9dae10ebf1ca706a48f32be0b813839125b23697908113751786388d495106ceafa59a14e8eb2bcc439c7ac9dd1f5fd3aa830b9002b0db9247284706029c5303fa6f1435a0701e744eb30f4234d5d4b6d9fd3fa67ca3e03833115d699a9b918f15ef612b6b3160a6863e8bb0e57556bb6a0b3e6fffcc88ffabffef8e3376f31c8510078e9e0539a7faff9fcf367ef38d3fcb5c1449d0a84a1904a24668fcb736ca5279e3c8431f3f88777592d3b5efe25856b8f2a2ebdd770ee9e6d8edf3a97ad401317c068f1c8135b6f85710a550c3b171368684f0e9468d1a5911b3d4aad9e73c1fb20a61fd3c1719543194548326bcf456ec8431aae0f811892acf746317acf6c3667b55aada701aeaad05abaf9ce897598756ead0100613a9a69a79fd25ad87e9380681812d681ca8e9c61764cd1edc9e1d75af61c9652266a745cb3060f093ea31f27cf6485ad3487cd4f90c525310694566b77a0d56a455d5768adecb5f7c41730e1ff541c9982beb8f1ebfbf87feaf7091e1197dfd50c7dee4cfd3dd1159b0aa235279382a6eb22a869936e2eec5eef79ff3b9f66f3f6913bbf30f1d19f53d83ce3c2676f31db6c2879d2094c6c3d391866f2e9931b3ba89176e1b8fa51d87dd272fcb6c4e69928861dcae04310a7a110298865f69aeca3cc64ededd70b3fb531841869ea56083d294f2ebb2d610a02ceba6985579a36048b1889c34d4493e63fc68451e6d9203231f52408149ad6809206e6f2ba278d86d916f27dd3db2abd06705525d98a36d30442f61c1425ebc6faa52793b156d3b4ad6c0c9a84424a29620854558dd69692d5cb7eb71f98df2a8e9a802f2ee8effec12f787999ebbfa874fafc38a633e3905a3fa0d1315f7ce6e0dc3ffd1f1fbdfc69ffcb4fc3fb6f1b7eff9003ca5a4248386738d885ea84217b083ef3d427f639d85ff1597f24f1ccc39aab1f719c7bf936cdc21082a8e39cadd04a9c82874176efe59461520ec614493e81555473437f5571a9539c79e5c0993b2dcf7c4c412e24c488434de69f461b12795a34aa274150663e5f48d36ef0181598cfe6c498e887817118a6e52222b8114f0041c9e24614463f05852c87304486c1b3b131a79eb8fbc32033fec35f7b1fa96b87ab2b865d85db80425ebbf9d6934f409eb606cf67b3698dd8b3db80c7e0c93951eb0a1f64aca9b466ec07dad98cb11f0e97ac3eaeb57a1f867f7df737517fec7f637cfe1fad4f8fa300f022c09b5f877bc55b7fdf9f5c1c9bbf2de6fef472afb3fbd722fd7e268ce016b08a63da5df69fae56fc149b6f7f0bea0f7cdedd7fd2d4662399420a424a511a7c5f08573dc736028f3fb287db085cf882c27ffc69cdc9b32df77cce426ee138dda8214199dc7e72c659e9d81feeeb535a56623957e1c3d4054f9e6e3f71f1bd15a75f06b7bc3cb07ba9e2ca531d7555af978b920bc338d077fd64b13d90d73c819a68c55fb04f2379bda1583d67ad5861e8c535cb59b7aec94b41e8c6a5300c031b8b0dbcf7621062453eacb416f1cee865db50a519c7807386520cb953180be3384c262212bcac95d2e560b9a49a967ff6a127fb8cd26aed3ed4363372166d81756e7f1cbaf75a677fbe71fa87defb03fd2580c90af0a6e22800dc5ca8bff5f6fffcbfdad8367fb3e8307ffae3d7d4cee50e3f149451b8b9e6d41d0adb14defb3357fed5bfe96eec7cda3fe539a61f87ccbfcae66ff62aa0922cd454059416d34c6d350fbfe332777f91c1778547df69b8f3fe6de65b4ee6ec41acb2141aad0f3df8351839f475d5b2ea3a9cad198671edb76f8de360ef00631db651282c973e18698f19e6a7571c57b07f3952b226953835fde4c6a7c062634328c469a2ed6ac3307a724a936640d67409a77fa0aeeb691fdf14e094c1394356b25fc0394765a56b5fb96a3d7b07d64cbdb816ff14e6b396611884bf1f0d550dbd8f182395f26c36a31f7aea69ae2f13146948e692b1c69272a21455fc387c78be98fd5b57c71f7ff3d7ddf79e63af7b777e889495a2a8e7d5e2e3b786a3007013f1fd3ffdd0776e9f8edff5d87bafa96b4f77146d397d611bb711e87a4fdf0f14ab79e7cf5dc45a77dbef3fc0fe2c4ceafb4fc583f7a19eda41bfeefe5b2fb88abb8b5212190a93779f62e7ea8a74ddf39a3f9a78fc172d7ee9d83ed988e4554d0ec02988c30f53cd5ee4668b416e41f1afb38cde63ac2306597fa50ad3fe3c0d26534a4219d8bf5cd8bb5271ecb6cc85cf82eb4fc2fe55083188b6c007d101e428a3c898e8bb41168a4e1b7f830f142b0620f130404dda7fa108479c53b2876f2215051f6424589e65e5a92993b1c6aef9fd122c2c3125dab65daf2a4b016c2dcc46ad0f1d7cb570034210b21022007295d095b3cfa4e4d5adb7ccbee6ad7fe3e09187202bf5ee9b7ed3ff7a380a003711dbc7dc375ffce033aa5b25ce5c38036d607ee680180b7b57575c7ae206c3aad0f7a00df76fde75f69570e97d9ff60f9b64bf61446d6f54df6bea624a869085d53774914f7ce0067a3670fa6e78cfdb15b7ddb9e0e4859aa2b218777ac310c524f4d0e4c3553571f2029cb6f24d849bc23078da768e992cc0bc0f686b651168cae494180731da50de72fde39add4b8963e7e0cc5d99eb4f0772b150e4108fe328633a640bb042adedc29b46a8c6873c80d96c46b7ead046567b88d597f405bc977e87abe5f10e51548eb285283edbddd77aca362423881359472945e51c3e446c65c4e2ac402979523696893c2501b29db59429681863a81bc3e52bddd77c8de23b5f9827e9b78fa329c0cd834aaadb8809dac58c6a23b2714bc7de7ec77f78c7135c7c7c8f6e9559ee0f902187dcdee8fbef79f39b3f2968abe736fff66af4ad173667b6525f5a34a8a9cbbebce1f9959fbbc4f65d031ba7e1f1ff60b8ef8b1b289a76535478ba38c6ae103ac36a3fe1c73ce9e333f2983c2b0e0a5eb8f8b376861f47fa7e10255bf59cf16082b18fa8a868aa9a524940f02bcd958f152e3f5668e69663b72adaad80d2b28cb414b0d6ca9c7dbaade3a4dff7a3c7fb30896c8a2cec9c168d94224664ed6c46d354eb061f3035fa244bb1cee1aa8a611c271d7f643e9f638d9d7ebe04b255d78980291b421cd77cfeaa725353b0c17b61faf57d3f0985d2a84d7e6f4af17b5b5bfece0bfe44fd36709401dc3c6865078bea69b61dcd76e689473b9eb8f40c298b2fdc6263460a99fddd1ea50c95336fbc646ff9da871e7ae61fffc44f90d67fd274fb9b4875fe158bbfa9546c62aad05af1d463fb3cf3e41ef77f45e6e9872dc91bee78c0d1e62decb9482e19d75ad0899414ae569462f17d62b51cb1b5999a59d29cb3d650b99a30a9f8c42b30d2f73db928729cf6099484c1e219801a57594cedc4599842ec1457f622cdcc32dbac981df78cc388098ae46535d97ca365ec8522ac956cf4555a3807fda4d4536a1ac94d377cbfeac48ca3ae8921e0ac640cceea69a3f040cea27c0c29a18dc67b4f3b9979e889236026cf7e3f39fd1623d9458c09eb44466c9c2b3e0cd795561f7055fadb7fee2d9ff52fa4d627bf181a7cbf191c05809b84b7bd0da5ac52f55c318cfbf4bb89abbbd77095a67235639fe80ef6856f6e80581896a1b29bfcb92bccfe6fe8ae30f5020e6bff93f3cd334a95af52c61007f8f8fbaed00d3d173ebff0a17f0da76e9fb17db6a6bded80e20fc8375aa28f180bc61d76c6a5b636b5a252626e398e096d1c29278661a46966f4839f7c040a9513028df742cbad2b43183c4d3b23accc7abf2026618dd4d423491c85a266ff6a2246a89a065729b219586cd51807b61543c26108d3c84f91a222f8444909bff28c1eb6b6e4b51a6726b24d47d3d422309ae6fd4a29e6f59c83831575ed84976f1d5dd7892b10927de8a2c5c128893b514a226a42154a29d168f5849dd97fb33851bee7cd5ffbda27e4d0fb1775adffebe1682fc04d4229a8effb99cff99b8de30f57adb9ede22776f5f56b2b4cdb128bd4dcbbd757f4cbcc6a2f50822145502aa7f9a6fdeee6ead5effe899f20f210ea3e306c6e2eee7955f3031b9bf6216b34173fb6c43689d32fcf5c7cbfe2d4b9395b2716ec3cdd63aac4d63d2b8aaf19ae35eb34bf1ccee7a7469bd26692f34ab71c44dc538a12b7a03162a6b1603f8ca8a2b0b682c958344d4b3bc6314c869966221f25866ec0b96a5ad725bd85300ac75ec68d42b8093148a028795a01de904ba26e1c39058ace18e5e80e3cceb46b63d0c33a3d0469042e97031b1bed64122a7afdc3ac0135d190739e8259167f00e70829a0943aa86afb11e7ca0f7fcb37dcf7f72e1dbcbbf046f25f7e81147bcf278e02c0cd85fec63f77eaf4f685cdd79fbc7df32f5473f3d9173fba5b2dfb4c71051f1307bb03a1d7ac76032421ad6c6c55d7aab17cc963efbdf2c1c51fa43cf3e489f6f431ff7bb7ce543f35ab5d75e5f19ec5c9c2e2ce91feaae5c4d6096c2bfef5a30fec5d4e5433c5e28e1ead14c3b59638228d3fa5887edaa69385a7af8d74ca4b560cc3b04efdfbc143112dbfd1763ddf171aacccd50f6d04430880f0ebd324aed15acb24c1588c3684a9be2f99c98b0f56ab0eadd5a4b29bd675ab89c1aed4748013ca149ad6929366e822e31070ce4aa77edade23ddfb485d57eb032e29be9af4ff4ca97f49997ccd1af50bce96bff6b57f3f7c00e0bba0fca792daff667114005e2478db4354d51fb9f72bdbcdd9778f5d7af9c527f61909cc1633f66ef4747b8983eb095d2ab4cd50c24ff3d4d5ffe2439174ec651b776c1e333fd7d4e66cbf17d838a9a96e17524d5bb631c5e29cc58f897ae6c4cde67a20a6c8d6f99176d3d05d691956691af999b58b0f4ad2edc379bf7335e3e0851014a4f34d16469c0868588f0d57ab0e6b2b8c36ac569d74dc274a6c9a66fb7ef4327757e2b22b9463b536da4c4926008787388c9ea669643b6f88eb1bdd6823229d466cbb722c1cec7bda56c6734a29baaec75ab36e10765db7fe59875304630d55657ee1e3ffd0bf095e1c649de7134701e04586871ea2fd9caf7de0fbabc67ded47deff4c5d6dcd8829b15a06769ee9e9f744aebb7da2f279485fb7f2f917395d7e2ca9fc25da24366f2b54a7225a2bf27e0bc930ec150c16532966dbc2e72f19f6ae8d0c5de0d4cb0c66fb80fe5a2daabee9ebc638867e24c4448a89aa6a187a5923eec7382d1195543b45591a62266a6e8c32323b7400d6daca369f69dc96a2a4d94a4db77bcad455cd6ad9118217c6e0940da43c39ebc484997cfc66adf8f78fa3b0689ba611914dd300a08d940d611497e3437b2ee102b0e6061863d61c81beef418173fa034ffcb37cffcd7b0a5e381c05801727f4f7fed467ff454cfe8e4f7c70a7518d01a7f13d5c7972c5b0af286416f3fcfe03a3de3312fe447b2aaac51d91ea78a6ecd7cc9b06952c31c0f58b11ab0c9ba7adb8ec66f1d633d6322c0b7bd706dae385eddb13a84277b5625c69a24f936ebe4cac403bd97595753a5da606df7a394896652229258cb6ac96dd6413266e3a0a71d7714ee4bcc6d8b537a15242fcd14ae3fd44378e11672d95738469ce2fc4a63cb9167bf4d4b1d75a483a4ca344ef3dd619c63161ad3ceab21148d1b62d5dd7618ca6aa5c2a39dfc0f0de18c28f5e7c3bffe8e67cec2f3c8e02c08b17ea7ffae7affab346dbbffae887769af9b10d861c58dd485cb9d8134ac4ce4c5e8da39a1dcfcade36d29c4ce86ca9f50c932b543494a409a338e016c5b4deabe05c4d8a8961f4a8a259ee06bc0f6cdda2a98e758c3da4558b5f5a09005a1a807a92022bc4325c1a6e7260d3a154d887692a308dee1045a0754e1674348d4c058abc9e942229e7493127be04b3d98c1023314803b11f46f4735c739ba691db7f4ae1d7a41ea5d6a62355a5279b73210ec9ec3f01cab7f3fa8a2ee51751f97b3ef60fc2afdeec0ffb66e12800bcb8a1fefabf78cd77a1ca773cfac11d37da408a8e1b4f7b0efa8832608f45dcd911b79951a9a26a2c6570840e5200508458a6fd7df2fb9c0e6f5c8dd60a1f026d53317401df25b4d3b4c7136e23609d429796f10072b2f8d11343264469f0e592b1aa268c05552af6760f26514d450851b4fbcb155a69b9f5fb9134a5e25a4d6621b94cf6dcd59ad5d7771d2835650d62007a68cf3d0c91aa12abf1439d828cea04312669f4e580b5365aa70f722e8fe5527ee6f17f1cfed20bfc19bea87114005ee47808cc17fcabd7fcabbd6bc3973ffdd43ecdb10d76aeacd85d0eb47343df8d94938144617eb25ec581c7b2d7efd5d877469f9f4e85fdd7fff92b3ff7ebfdf9eff82bdb6fc8b19c8e397d9131d56994baa3db1fcf53d466266fb5338bae12cd5c5394d4e43917c29850888b8e0f91ff8fbd370db6ecbaeefb7e6bef7dcebdf70d3d018dc64010e0044e2245099645d214054bb15c72244b2e17558962a752295b71642b919d92e4723e00489563d955aad851e2c4aa4a4a71c5b1c32e3b1ff4c12947620192a89933019044033da0d10ffd5ebff14ee79cbdf75af9b0f77d6852e62481141aec5dd58d46bfeed7efdd7bd6da6bfdfffff55f625a4aedc6a3832726880bc5f9b25474a5cd2feabd528653d981b25a54ea12103d6607d48c51bb5a1a72d3ad4f11408c46a3523de48c08e64218faaedfdd589f3c1353fc3797ff65faa7dfa4b7e9963db713c0abffc8a38f3e70f2f4fbcf7cfaf26777ef3f8a117323b6b797e439c4e75af2b98ef13b17ff70e3dbe6ff787b9d1b4f3e42e61540afeff921d6ee79e0c4f70c5d7cab04de8f93b329e73b9d708f998c43709b3995de3ec5541781c078dc90b5186b621ecc21148fc0f5b5f563447f18227dd71f83805687749296a123cd4ad3846300cf79979c481c525c062fd74076c5f13b8d77fff7b77219ffc739b713c0abff0860ffddbf78db7f74e2cce49f7ff677b79a70b265eb6ae4c6c50c57267057e4e403fdcf68d8fdc5fff78bcd25842f3339f8c7f85a56c700bee327c70ff483fbb359a30b61f4c1618893b66def5d2e9677989934edc8e5d48b34fe4c4e3612443023c5243eb4e29d1c65cd5193897320de594ef979efbcf38d8f29eaaf37de7ef70bff7cf8b7afe0f771fbd4733b01dc1a4700ff0bbff29e5fdbbe7af4c11bbb1d47479e1b9f8474e4c8e7169cbda7f95cbb7bed3bcf9fa7e3950dfa9bbf86afeff33e5a86cdbef709dc937761bca3fefdc78f3fcf6b9a63bf15ceed04f02a3e6626c06aa9843cfa7fbeeb0367ef1eff7f9ffae88b6d67b07f5598ee2ad965d64fdb6031fd48ffe0feaf3ef938e915fc32fed0ad7ffbbc76ceed71e057d9313359fd10111391622f0bfaf85ff9cc6f2d66ddef9d39bb46e38d3b1ef48c4f1b3e0864df8ed7dc5f7bf0d2ed01afdbe76b3fb713c09fc059ddecab40ff925f1f3b01af7eefc31ffeb03733f7e10f7fd8faa3f8af4eddbd165b09f8c6986c7a42906299d54ebe7b66e7dec4d7ffbe7e2d95e0eddbff35786eb700dfa4b30af49bcecd3d75f9d8134f94c0ddd931ce9efdf7be377fefdffddd3beefa40fedd8b4fdd78606999c3c381e56140b2c389a873e967fcf6a9ffe9fcf9a787afe3cb3b36d6e595070e6f9f57f1b9bd18e49b70bee4662f3fce9f1776761c972e3976771d5b5b8e9327cbafdbd6d1349ee55248c971efbdc2fabae03d8be7345d3ff9ccdbb3a5f774739566120823a15f66766f1c8a89ae455ef8f085cff0f526805773f0dfbea8be41e7f60bfb0a9f55ef5e7fed387ffee5d77875ab6f6e0ae37149009b9b8eaef338d76016704e98cf036b6bd0f7e5cf3b2765ba47eddae1a1fc9babffdbdb67773fffaf9ffdd48d75bf1e58748983ed9ed9812029cedff4c673dff7230ffcf8677ff8a147061e7924afbe9eaf72fe7045f2ca2483576b52b97db89d005ed1f32565bef0c4138ecd4d617bdb319908a391309fb76c6c8ce9a421b816a1b971e10bf74e2f3dffa7f362f86e272666769f599e148f1ac5993be5bddbc8490d84d42de523effafd8dcf752f859d9d4326a736991d46ae5f5de0cdf36e77f6f37fc5bdef5fad35e3cfddfb97fee247743ecf396da6b8fdf99c7676746b6b2bfeca2ffd527e9c6200f463e03e0c2aafee2ae0f6f9069cdb09e08f71fe50c09f3f2f9c3d2b6c6e0ad3a9676767b468db7597c258c68c16878b3bf62f3cff01ac7f9f64797ddbb6e77ce34f8bc8587271bc91a880629ad14c59ca9162d97a63529653a681cbeb5bfcfa3b3ec3d39fbac6e6b95374cbc4d69543e2dc71777b825fb8ebc7f00424786237ccb3a6fd98f27343df7d26c6f4d1f174f9c9eef04025d9221fcefac3616fb9f9f4d3fdf3a04f813d765312903fd984f0e512d2ed44f50a9cdb09e08f79ccccf3c41342f1570cdb4f3db5316a36d64d86cd83adedf7e694ff72d38edfde8eda3312642c0664034b822a3a244c3398a24991ba14d362c472c6b0eab2ab750f9f619a98a78e5f7bef533cbb739da3ae4342607a9899ed24bcc14f4dbe876f6f5e5716620a88f7e646235208e6bce46cd20f4377a33b3cbc12a78b67d2deee47e34b7b975c1af673ef675df752b7737931839d01e029488f1defe6c11e05f73855c6ff8d511bde0eee6fc2b99d00fe08c7cc8a4ff6f9f39ef1384cb7b6d6d4b953f3ddc3bb63dffdb86b9af7b693f15bc4870931b93cf4588c204e2ca582026ac672d9338796d158cb19548b2155ce80a266584a8880605882ec8d38443e75ff153e79ee325b5b47c8a461763830dd5596d39e8727f7f1d36b1f24242b9b819c401390d104c45044c507c54956272acec594d26c984f77bafdc3e786eded4f0f976f7cd4342dcc378bd8cf6771c88bc9d17229619ee2ee465cd2d85d5c508029d80ed8874a2b015f8c277c6d18841dffbc7aa5e5f8337d318ef1474a3a569ff73fe18ae655756e2780afe3d492dff1d4537efbe9a75bbf75702aeb70e7fce0e08378fed3b58dcd77a0b48249ee3b0143b30943849cd11429b29e8c8980ea312d60e6c052a908246399baa1a638d35ab6fad497797e45d90d473cf9de0bbcb075c8220dcc9643b1fa5a78ee5adbe067f3f770971b973872e07c03e3b21dc782033354c4c40c17829a936c66a69a920c31299286f97c9afa7e272d17d716d3f90bf970fe7cbe7ef059cd716e292f9dd29b0dcb68ddc262ecc2fe89fe12b0cee5d5fc717e0aac560bf08783f7385f7cf8c3e7dd873ef494893caeffec277ea239bdff1fc853db4fe987ee7aa7e3d177b0b3735e1f79e43145b0c71e1579fcf12f6bcaf9a580e631b661c7e6635ff57cb5d6e33551a9dc4e005fc3a937bee3d9673d7b7ba3fd0b174e0f2fdd78683e5ffe8dd0b61f689ae68cf59d1007a7310929955b3d67ac2ea24433e4b2d0028dc78f9018a826440d72266bc100b2d6705fb9dc02426903b28169a273c647dff53c17c31ebb87739631117bc76c3f13d4f343bc891f92b7e0b42400f11e994cb0e0705a4c3e005043834705b39c90e5d2ccd4043309ad2239c741ec947f4e00002000494441543398594a1134c5be3f8829ed2e17c34e5c74576db6bc18af6c3da5391d617496ad631467696acb1846b119f7c3b5ebe3fc2e2ee7ed37e37ef7c287ec31de917e8c77ca4f3efa945c7a90c025f8cf7ef887f32f4f3fe3d73fbe275be1edfabda79f0ae9d49f3580e9e6541fd939abec7fd43e063cfc674e0befdc37f855e5b177188f3d665536fd87dec2f23ef2a51fbea583f79538b713c057383707fec18b2f4eecc5dd93cbab571f4a4e7f6eb2b6f13e8dfdc8960b97ba1e4d118628da0d60866178044421e62fae3bb558e5aefafd921814d332526baa9883f253f1a8c54b71b3312bed82402fca17eedee5136f7a8117b78e30272c3a65ba97594e7bde3d3ac74ff3dd8c5cc08b4008301921e271ae1873bae03035aceed0936140fbde9c9a48134c51d398456354d10c19336f4ad39a86905cdb28a3464d7c329c76cbc501c37098d37023cebb176db1b83afd83677ebfcbc3ac559621b01c9acd6e74ca75716363b8e36defed39758a6676d59d78ef7b39d9b6b223db7e365be7ae3befb44d7f9f6ce56c9b7e29936c89b56427dd7ee6daa671d7f57c0d98872ebfe5f5f7183b67f58927e0111e511e63950c8c926781e3b7e12bddee7c998fbd26cfed04f025e726d18ee7d967ddeededec85db8703aedcc1ee8187eae5ddbf820fd30b1e5dc59df4b5e2e21662c2734252c27c85afaf9629277ec75673981167b6ed38488d592bffc5135038925810c824aa9704dca1f284fb2114df05e1830a621f3d1efbdc4f3dbfb1ccd17f40a7126cc0e7a369b097f9befe28dee348d7764e7a1694b2520a516560c7101f152aa95be07cd881ae21d8a335d2e2045d16c86335c68c5adafa93a4182c37c6be29c119c996fd48fc6994963329918d9728e5955f390e3729116fd419ace5e1a0e662f691f5fb4cbd7fea0b9eb5cf69b6b7172fa446a36377b999c18c69b27a36e8e530b687326b72ea9ba104f6e6a623432ba2edfc8d9b22cf2249f4dd7f6e6c3dbee72f985f77476fff61b130f3f9c1e93c7e4f14781c71fab953fabb98a2ff7dcfffb92c36baae4ffd2733b01dc746af07bc0f1a94f35f3adad13cb175fbc6f71b8f8b9767dfdcf8bda9ace8e9c761dd6f562392339a331e244b094cad3310c05c1cf094b601ab1ba12cb7246945a05182aa53530cb28866a8090b1187105f623218819785f4c3845cbee29efe89cf1896f7f898b270fd8ba3ec58596bddd198b7d63321ef1e7f58dfc903e888416f3828480f301c3cae7741e173c1a3cad132429e8808a2f6d435472bf4454810cbec58dc6d8a8458207f118a6326ac54490a625acad993901276856733e184eccf0864363cae68333e75b13278a122da51ed5d9b05cbe64b3fec590f553d284a91b8f177ebc31632d2cd7d7ee38f2edb88394d7d6223389c3e1bc1f3c3638c6cbd1da5a3f57edbfb0b9ab8f9cfd2e7de2fc797d82478027f47180c71f07be0837f896e8f3bfd2b99d00ea392ef72f5d0a07070763f7dcd5b38bad2b1fc8de3f1a90fb6cbef071bec0969d581c007bb9aecc8a5871b421a73abb57318098c939627d69132c16845f73c4e1d09c705ad17e294b356da4482f5808a00933431d80a0e2508128a0ded33bc7eea98e4f7fdf36972f1eb1ec7aa27a66fb098d70ce26fc37f23e02d0f811ea04d754564020346d6109bc119cc755aad1892b4b499773628e385f5c7da46d91718b1fad21bec1c4557c21401370e33152ecbfcb0bd4b4a09998caf721de9b779e103ce61af3ed48c439c37bb398946c468a39754b8d43d7a5d96caa5dda11b5abede8c4d3ede6f87a73627d9a46cdd168637c306ad73a1f6c6edd22ee69b358882c75b1e872bf6963bf1f2f01f77dfcc88e7e6bacfff08dbfaae7df71de780c3be61ceadbff258fc397ab02be96734be913bee513c031b25f7e84f913bf7732ee5cbb7bb675ed67466beb3faaf3c5284da7ce1673b1ae4787a1007a6ac71b69c5495d6f0562a59f27a69769be982127342774d193d211b97398463467446a658020de83f5586cb035b00ce412ac5995ec1cd93b9208a9f124e79805e333dfb7cdd5fe88e92c71305d30cc20778ec63bfe567a987bdc26b88073a0dee143401a47f00ebc63346af0a6042b2ebf9a62511ff703a603e61d616d131a87f32dae1921ed089c434c91a64147a3a23b18b7e5f61747cea0b94754481acd79879396d08c84e04d44f0e210556c88e8d063494dbba5a53e428e9afba868d2d80d6ab87914bbd186e6d2fad93b3eb17ed7dd97dda8d9278cf6b26711633b930d59a418a38bb1d3eb17543e736999dffa56bbff7b37d2630f5fcb8fcbe3df7043929b25e1afe6f32d9d006e0a7ecfb3cf8e972fec9c3efceca7bf3bc3dff7c13d68473397673397970b6c88e5218db192c9526ef8d53394572cb361292315cca362015ab10149420c09dddb2551043e9a12b2a204b3a2dee132581fc9dea15e2b25ee302ff45e1844e89c471bcfc20b2fbcf19017be6dc6b52b733acd2c0e138b23c599f170b897bf383c846f5b9c039c478263d4065c1b100f93f1186f8ab880e501e71da95b16cad084b03642c62791c6487d643cde404663840625638d43da11da00a12169a21f7abcf80278e2c00782b5b86ce02ad492133e657cce267d144d033a74688c6629a3c90a409a736923bc47cca939546356c5e638b9c668fcc9bbdff4a68f5896fdf6ccc6766cdbc39852d7adcd97bb8b61796dff9e78b17b5bdedb7b313ff6f48ec9f91fab9b0cbea1e7555f0d7ccb9a47dcd4ef377ce633e36ee7e8ccee673ff56321347f57168bf5e1c6a1d3d94cac1b4a391f138696c0ae6fa95490df28c16bd90a47af195242f2aa52489032d98018911cc1ad2312f149d106a2f6f85c403972242b58282c41ca8a91d15aa8986b508a436fcc25f7acbf3462fc8e0e6c40d4d38e1a3adf23c9f3f9b84b678acf1154f0add11058624c44f1a145315ce350c98887693f6332690a48e847b03e421b23c5483b59630880cb9818d9191602990ee7c7c4615ecc3dc90c7960d48c7059906546b52f54661c304d5837e0879ec6b2300c94a0cf588e22ce636a882a6aa020e23c38ef4a2210c2b86d4dd3695dcedffee227fee02f27e72ffbf5f58f9cbdf7fe5ff3a1bd3ebef3e4d643f7ade707da6d7dd7c94dddddfc823cf2c47f015f3d385f89feff551dfcf02d3a0e5c833f002d878793d9d34fdfbbf7f967fef3f5075ef7b37e6dbcd65db8e8f2e191d8b2c386018be958a1e7d727e4c5b2067cd1ec53976dacb87e517d99da4b098b8934f4e8b2b4107188e4e51c8d1d71e8c9248208e60c7cd101084acca01ac906511211253ae8c5586264073d4632a31f3247273be2a6d12d4b02213b6297d160ac33665347a40a20a620786f8561708a6f020443da0023a1199d26ca12196de2363c3219e3c60d26c28092db0d0681214014611a3bfab8c02c926dc0494be33de48e200e3f4bb4832131a2cb057a74841d1cc2748a2c97c8a283450ffd0029e273514bba9cc122ce4c9c888866c13b21474193d047679a4530e79a3678ec0cc3f01dd36b57ffdce1f5abef64b1ec3948398de9d7dedcc6dffe775bee7ff8a5bf9e78ec1d3cf9f893378b85bef4c7ab3e785f89f32dd702d4e06f8086adadb5d9d317eed9fbeca77faa0de13fc9d3c3366c6ef8eeca358803d236a4ed3d2cc582dc7b61f2d0832c9fbd04a972f2e5939604a10aa9d28055d0432a92df5c1fec1c133925c899a403ea04f18ab40d128a7620a75890fe089a953e39a218d92b59046d84c17906277419b2083db0f3c082bd872337ae2f395a44d2e0d9dd5960d9784bb883ffd0bf85c635480878ef599b8c68bd633c69096da01d8d1974cedafa98be9fb3b67e8244a2595b833026a1e4a82446981bb3186698385aef3094c9da1aa8e2c8346d592272d29fc2760e69530b6ae4ae232d97d02f4929217d8faf7b02722e40a8b4a188a4c4150a75d55a696145cc6ab5254528055200d410207833ccc47bcbb89cfa659752fec4897bdff0bffa49fbcc89773eb8757d83f9b7ffc05feda88cc04deaa06f89a0bff97c4bb50066e65995fdcf3fbf31bf7af5bef9d695ff7edcb68f0c37f6da7c7424c3d5ad42d93947d3167e5c24e0d6d7d0c592e5172e961e5ff558546a5815e8d4f23f171acfb4e200a952825a2a852090708885321380c7a2e01be86331f575b464e9301f804436c8be26028a08a847e8c5885670427715c2bb1df84c089eae4fb44dc3b28f6ce911fb4dcf46809138681c918c04301b68309c0f8c47236895c9e44eb228d608331d70ced34783d0a09a718d62e670a2b4e30d529ee3dd807887771b7837a735a3d99b127a8fe5485acc61d9e1fa1e5d0e345e6b00532a167145ed186b220825b9b9f22243ceb8f23e624ec831d6f7a1ac05631830ef258bc305ef7048707e43d6dcfb16d72fbe2b9afb75c9f2bf346b9b179f3f3cbf9d3736bab7fce00f462b88dd577a745eb315c1b74c02a8345f001a7676360f2f5ebc7ff6ccb3ff40d4be271f1c847c782479b980be4ce19133c3f4080cd61e7a03ebef793b8b672eb0f8f4e78e1900a940969475396075479d28e23d86963f2b8222e5c13525652df0be65485af0c3899297868a23348ea811f39ea1d00ca046b48c3a4f1247aed460f4429f1249ad08896e2893932d6ac6625e700b0c1696784e0e789bbb137589b6ce1ea4acb4c1e37c60b0446847e49c31a784b191c4086b67e84d59a68e7133c2fb1126998d768d7e983259379c4c10941c1329efe007c7e69ea79926340fa4f9029b2f20e6c2a48823f7b1888d548b2cd909348238c0fbb236bcaeee5601f355569d8a884a82434c8aa6c237982a791820275133b213c7646c21ac057ffae409592effc2fe8b4ffd1967e15f84c5dbfee5e63bbff322cf3e7bc45bde92cc4cbf4212f86a94e02d9b20be2512c04dc13f5a5eb870325eb972ffec73cfff13517d4fdadbf7793a155b76d0c7c2e3afcaf7ac98088b679f47da867c7854ca45efa8577f91eaacea54ada36cce95160138d69ddc3482a254b96f2a1881c348339000617304de6124fa9c5131b280bab27a5bad026f6a0c62442b32e1211b0306cf1b6bef0fcc661da11142b032fd67c273c31e6f68ce90f2407606ae05d7a0162182b5206a84d0a21c217e9d5ec6e4bc243ba1591f630832cab4d620b660cd0b312fc1228d1fa3d6d25a8f5c9ce2a69e21151a34f73d36142ad43950cbc7a379d284627de205f12dd63a0205097104cc224ecbc2cfacb9145baa90ca50949a927287f84046512d23d616158b4bc9f3a9c8d83b77e2a435a3e68c3af91bfb973ff57e73f2f7a6bb973fb771f4b9fdad8f6d45334b5f0375f7e53e7e4b2681d77c02a8c1df00a3c5d5ab27f20b5baf3fba70f17f749adf1df7f67d3e3c12fa01edfa3a8e9b2ae84701f54410ef987ffa1930c38d4768178bb0544a398a48559618550d8079873929b7bf4b600a3e8014772f43d06c6544d7148999948c3c1f90ec6024645564e431cae49e60a83962ce980f68550f0e19922aea045e32e88571eb99f988f71edf8264613bcd38d08e756b0bb3a046b2cc28b44c268185769013cef7347e44177b187986ac8cc23ae63c8611bc63e41cce0468592ca73881212f8947734eee8c18ef414e031aebeb69aed08fae5446a2191a015f5fc820387cd154a8155932aed02ce28be048cabc049415e0498a004b539158ebb0444db1943194d4179f849466b8b9c062296e6de4dc64a31d6dae7fe7e1a58ffd5f76f5e4cfdb4b6ffeb70fbef9f5d78079ad04be5e11d02d17f8abf39a66016e0afef1f2c5174fe6e72ebfe1e8f9e7fe317dfcf67ce386cf0787a28b25b9efd061c08601522a32de18410db1fc722faf7536bf96fb549a0f2bb2daa2af97e3dd7745796ee536b2c27d1f7f7c8521ac8e480513c17981a641839131683db3e51c371a132d22a1a5b78486405263b0d20224537200dd0439ed88bd324423764aec151f3c6be2d96cc7c553401339183850a76c6c8c71e34026d38b12c5d52a2490cd988cc78c260dad77909483c3978879c1787c1ab38e3c5fb2b917685fca84ac655db70a82c3bcc77c40bcc38d02d23410da02f4b52de29a222d7620aeaa0e01a4b44d922bc6920dc4977905ca50150292229a152bc38ae4a1c30757959965cf60ee96c4f9427418447312df8e26c4f9238bad175fa7293cb3f8b5df5d5c78fee9f4cf1e7e98c79f7cf2960deaafe7bc662b809b839fadfd53e9f92b0f4e9f7bee1fc910df1db7775d3e3c145d2ed0bec7faa10eea6819cbadc1aef50272ceca0d842149c950b4ffdc8c205749d0eaa7152d6886546ad07229f925a5e3a9bef2b1f219c4209991168af311193bacf50c2921e3d2a3478c6c892c56ba8ef2375157ea8f9c0dbd0cfefea2506c471e1f329a94210f7c21ee726e72028fa7b4dd81c1259c087319f01996fd141746e006cc39363703ebeb9b9887d68f981fbc80e9127399f5c91962dac30f9eb02b8cb715df1b1a2366ae20f83ed45f57bd840a4e3ce214c5131c25495440cfea776556f08ba2ae5c81a8820e652ea1ac274fe4f27ea39a49c350abacc0b05840f09866922965f4c1a38b295dbf10bf79cab920639cfb91edcfffcedbef3cf7d6ff72edd3874f3f75e7686a66f1abb403b764c9ffa5e7359900be28f8f7f74f2d5fb8f8c0f4e2c59f6788df316cef78cdbd8cefbf9ba34f3f0d5d2cb746564453b961309cf78cee3a8b5f1bb378ee4a31a43145a54ce4e595cb8e4995c39687f058017853c5e0ac047fd112e4820fa454c02c0014a7abe0280fbe5bc0d88fc88d1126235272e4100806cbbec3b9b6780bb8da1e1868ce98f37098b0a9306a1d8b45194516272c17912873e29d4a54633c6a88c170de10ef39e8a6b4ed8468462bc678d4e27d606d6d9376bc866acfd1e1738c4283732d4913cb34208b8176cf18ef182c8534d4d7d115b192986292101c4e20036a654a3288876498abaf8f38c41c2685dec372cda32599a8a5a2975041532427c5723c566406df10534f156193bb25a68a78b7e2135105a74adadf17091ebfb11ef0f6d6bdbde7fe8f7539fb3759f83fe0b1c7f6cdec2b392adff2c10fafc1047093c867b4bcb67f92172f3d78f0dcb3ffc00df13bbbdd1b3e1d1db9f6ced368d7e34763d27c89a5ba4a6f35c66b957fbfb6859f4c4aa95fb9e862a2e1702248ad0a4c6b6258b102703c270005ccc2af6eb8d20e9b7798849a14a8b75ee9f35d56720fce0f8c5c405bc76046d72fe9b3e1da40020c5f7ade5c9292aae11d6872e8f5c4da032d8b99e2dd50478a3d66ca3307db3c74ea0cea03f361019335867e9fd6c6785db03619634e9030a109ca108f3811d67066c4c67062f47d872390873961a7a3d90ef899906611aaf351522bd2631fc0f9c2db371ea1cc24600e248177c88ac5a0b8255921ff4a6be45279ddb4542cd9721570fb32474161148c328e2d26e41c8b74d01c26425cf68426a071289394c183138c804d93c878e22dd8fd33bbf6bf4ff4f4dff99d8f7ffc23bff7833f786066c3ada0e9ffa39ed7d46ab09b831fd8606ffbfee9e54bffad44fd53fdf6f546f78f9ccd16f42f5e67f6d4e789bb7ba5ef372bbdbf1a2f7b481896943c5b505c7a95e291533e6e6665aaaf3875d7566085f40be23c2e045cd3e043539285abbfef034e5c3104490974355360482eb85850457aa5ed848da5a7c1d3acaf11c5b0d03090997673b2264c1ca9d4ca85bc880a3704b292e380f382f3a56d71aee15a37a3cf916c060df431d165651107ba6160b698d3a501d519a3b1a76d0a3eb198edd1f50b0ea7bbe441e8f7f6f13b73d6b7c01f66f2acc7faf29a64e790264008180e87218d2f9a0a2f201e9106c157393525a05d0017eaeb5100bd55ab6f5665c76668cca4945195a2c9728eac8e6c8161c89879543c1602ce7bfc788289430d708e8c155033e5525d0c83a46ee915bd73ba78e9178761f8c1f79dbcfbae271e79c4dba38fbea6e2e4e6f39a01016fd2f68f81cd78e5ca7d87cf7cee2724c61f1eae6d35f1e0085d2e45da407b7a83f8d24e11eca4cac9a75c053e157432b09c8b39a729e307efc7b70db6eccb686c08e01caef2d5e21cce395c08b54ab0e32e51acf8f98950b1013dfeafe43a369c8aa8ff784a35177a8b044e3c93d03277868cd749d2d0c51edfb6f43161226435d460502da05e0f76afd2e544cac2d019fdb25892a594b8e7d429c6234f33f224cb98c01033493b728a9c38710280f1a861341a9363a65bec9107a565839012612f32be06edd4c12c92974349908163e31381a2891029726329ff8fab0c8093a273a857bc51daa69566c22c17704f0d4b3529e75cd49239625afc1649094b8ac6c2d0e4faff68a98ca024094228730fa129afbb49ad2204ef8264435468656cdf6ff3e575bfb67e79fa9bbfd9fdcf3b3bc553e035765e4b2d80075a606dd8debe6bf6850b3f149cfb8f17db379a349d89cee6e8628e2e3bf2e15101a9560e3ea9ccf19b095a077b14075296f2880b90327e3c227b57a780565255b9090d9212b43917e43fbfdcfb9789b6d5435d99819505381ee75d6d1b6a6210201b661159384638eecd8ee7271da90998839813ae6d887d7fdc57638a33471c1477248cd75a96b3e241188227c5cc9094170fa7dc79628d2c0dc33043c5d1361e1f5a4623c7a01d779cbc1f23b15c2ee98eae6071e044b381f5fbe4ddc4fa81a33980dc657c1e300582a1516842401542db00826b5d01f81c9855bd44ae3b106ab0174f0470956451729563bcec8b6829a3436931a4ce5b2856b080ea9998e2cbd6695a1919d344aa1668e27d99c0740e9c2b788526f001712a38efd390372c2c1e6f23f3f93d0ffd3f4f9c3d7bc8934fbe926bd75f15e73591008e41bfd96c03b33bfb8b57fe940ef1a7e34bdba37c78e4f2d121da2dd1be27f73d3a9fa143ac945f0952293566b97f7df1d277de51a17e86ad6dc47940a0a9349573c566b6e8538f07868a2ab07cc0f9154e585a80ec05090dd6b638d6cbf4602c40a4a584e412103a4488a954204351054ea4e50db1e5c224b208109a8694ca836bb12b222185d4f7b8e0c8fb427bcae325128223e78e9c20f8c04b8747bcf3de3b099acb34601e984e6784339bb46ba7188fd6896981e6840c9190941113e28d8ef5e104a37da199676496413309c1876256829644e8f1584cf8515b80b89560ca956b16045547b65c9382a040aca0260a290d7833724a642d6c06567c43caf2945c15972589e75c14965299118d56844e14a053ad3039268639c38848533407a9eb4bc26a4db2e29c6b3652d3ffbc77617bb3bfeb49fbd087669c3fbfdaa0f49a38b77c0b7013e2bf86d999c5a517de366c6fff42bc71e3cc70fdbae4c343c9b339ba58428c95ebd7e3093fbf36269c5c478f66855bae4e3805f597224ca9e09f4829f525d4ff3a07a655035002dc85507bffb6ccdab70dbe1d152baeda1e940423e576aab2e2024d17a18dc1316028c8b15c404260e25bce648f97c0feb0200b74312208316b09925c3e4b1c94d19b5a0e0f972c178a6587e6f2c98694b8737d8d20e0bdc744198d3da371cbe6da3a5ea44876a3e18748db374c66c2fabe303e50fc3423d3018d5a65d1e0260d224d6d8b3c1204d7f86ab5525f8b5327b1f9b27c9752da2427828515be22658cda8a8e0013340b99404ab90c0c29c41849d98a64bb4fa841b2823f1882c54456ad422d87ad60d6944b3586a252a843b192cc7565c65abc9a24e62c9af3c85af9fed0b4bf71b0e76efcd3cb4fa727bf7a02b86586ec6ee9047013e837e90e0fcfa4ebd71fec2e5ff947e9e0e80d7167c7a58323c94747e4e5b270fd319524b0ea1935b3f1edef60f33bdf4d3a3824ed1fbd5c7e5b31c51457d469ceb997c53a501e811accd20464f5d0af12c44dc09f5971fc315d417d3579486506dccb8c8288ab9fabec092d1142691f722e80966b38a58ebbacc57b8f200c9a8839934dab36a9f4cbee8d9ec5323224a35b2a9a85e2409e210927d71cbe29ae3e6deb595f1be39dc799c30d896699d9983a4e1e0636f63c9385c7cd14ba8c64080e9a76044d53e2d93bcc077ce371eda8f6fff5756c3cc3de113269d114d1a1563e9a8adf42655f540bfe519881627aa0c755426913ac2a35b3811f8d50a768978a5ec04a4b80d971a5605ab09ea2cd52522aed8520acbcddcc955fe6989010caf3e5bd98ea2459fcd393f5931f3977f799c35fbe7c397f0d78c02d91046ef516c051fafe0d7f30bf6776e9d25f53b5b7c5dd5d498753f27c8e0ec3b10cff78222f462467fc8975969f7b9ec99b1fe4e4fb1e66f9fc654c0d4709c032c8a305b9df5847bbfed8b6ab5877d9cb1880503c01a0f0da76d3b8b01687a06324d0ada8414146a3f2efb81e9615744cc561181124784c7c311f350a9d950dbf36e6a41fb199320fe4112f8509bb6ee0c57ec62e1d8b5c3872bfc8348da36940acb813a594f0e2b9be9cf1763b0139e282c3ab9007c362661413678711273a617d1ef0831292a149b1a8d00f08426ecb23e47d71198292c0c2b93b48d7f7ca0c03b5258f45ffafb3ae563aa5f7cf31d7fd0865a3b9542dc60a1b40819cf1a534421c9887688e66dc3279e8014c8dbd4f3c4d9ea72219b672d38b5a114d3943b4e0244671554e9af1593009e4ac34a350aab2e02ba6606049ac698491bc6d7776e5ef9f5cbfeba73ef6f0c3d7f8d8c7e25779362b9afbea6e176ed90aa096fe2db0316c6fdfddbd70e98362f293fd95179ab4b727e9e0089dcf4bb0b7be3c605d87f57de9d55342bb0208f697af16a7dbacd87c5e83548ef180d13df7b0feaeb7137776919c98bcedcdb8d1089dcdeb174305b4eaaf576d01d4d2bedc34569043560f77193cca488ac7fa03e71ce24b4551aa893a0be05c750fb663fcc139876f02231738e346dc2d63ee0bebdcdd6e707758e3b41bb16c95ce94ee2823e6092a3438ee9a4c78fde6094e356326d6b2a9635ecf49de349ce6754713ee3f1873e64098cc034dafb04c301fb03ee1567b0a2bc72fb897d17e33685bdcc6847c342fb88a95693e11415db11f57b3dab617996e4ab1781ee6448a3daa89a13224290d648da4eaa1983513fbbe007b434f3a98d2bd7403eb972bbeb0047fad7404c16244aba7926245dad104c0573682e30a43c461968b312a1439b699489037ead01fa96e3cf557af3edfff32d8adce0cdc9215c04d94df88a3a353e9c6fe8336a4bf33ecee35e9f050f2744e5e4cc95d077d879f9c200af4fd12c9111932e488e47253e71b071c3ef9dbb5aeacb7ee2a80cd9071d1b0e7d91c173ce3075f4777e52a76ad3c50c74dbaea17c981adfe7d52b10a2bdc62edebb50858c43288c3372f07866806f575598811249547d795f25d42a8d6636506beb4239ed006ceb8863b641db35c12ce761931aebea2682bf8b550c76b8b0f414b433b084c6b49acb51591a6ec2ec854279fbe6818da11d61444bf4c1b5bd989600b87b1fd0000200049444154b90cfb246558f420a06831093525f64b302b7680ea2a08575ebf82bd5440365312634e75743a15659f153723e7aad4da32392786e5bc8c30af362f516732a4188d28c5eb50b2927dc157c449692dbca369c6e421a12e63d9e1c8f85143ce8ab42d419ca81ad9080b9ffef6c98dc9ef37ef7fff6f3ef65bbf35e7557ec37fb5734bf4295f7aaab1c788c5e2cc7277f74dfdc54b3f6b517f60f1dc051faf6f4bdcdd438fa6e872890e0339f5a45140da403e9ce1f6a6b858966fa2566fdfd20b8a04081eef1d788f6f5ada73771277f74ad98fd0de79ba80788bae06725101aed47865daadf4e15237709854c04fab17652e7cb60da93a06e7daf31609ac565bb16315a2acb407e5ebb45c8143efaa7ee038e5e0bc2f5386bee8fd6dc5564891d35aa531574b439d09de3954840a7f97eaa46930efd1e580d45a51fbaeac07988cb0d1087352479fb5f6d345eeabf5f62408ee8e53c4fd69e1e8556bd2a8c342ce15e5bf818a1e537da665ca4fad6e50aef46a3ec6520cf556803e4a6b42ce653620172010b40e5fe522dd56cadec5fabd1f632ead2f5fbd2f5a05e76bc5e51cd234a5e5a80ab0a6f52ad19e3e3d3bf5e337763effec5fb870a1ffa63cf4dfa073cbb50037017febc3fefeddc3d6f5efc6f9bfae47876d3e3a9078fd06ba58607d87c5a10040dee14facb179ff3d0cf31974a99a7316e089e3c073e0a5ca7cfd31b597168b12e815b1d7f9125df6d5e9a7fe48155fb0626229758c98956ffef1a0b01c5384a51895da6b521e3857ca69effccbc0a3385cdb94db28842a352ed37da286a8e12723082da4841f8d11117c563419d6f584ba7918e74b7bd20f882aa18a9fc0905893d1b2272de7e4f9b280a5a198709813dc7852e8cc5c5c91c4397cf0e05619a2a6212f684d5479baa849aeaa2753c69f3e893f7502dd3ba8419dc9b1d07cb23e212d07b22a0af8531ba4ae2f02208c4c467322c7581321d45a0375143a5120672d56ec753e43ebfbec28c2295741da22f62a3461b3b1465c7685f2ad4933af92b621aa06a3e68e649d1bcbe6ef3fb07565f135b002afda732bb6008e2af5b5c5e23efafebfcad359dbbd749d787db7f0fd5d8fc584a58c33c38f478cbfe3dbe89ebb4873e2247ad4a1d35951816931fdf0e230a4f2cf8a12cb3cba2f49407d995e1371e546bda90f16171057fcf457fe01b6daffb742f257687ee5bacb9557b4ece20326851a14bb2999004828087a2818c04a39177c5b1edab681c918cd099bce694e9e2cf2e21a68c401c3c8494806b2b22c8fb1ca735bdca8c5ea42a44299652c341023b91b4ae732694b12cc03d28e70f546961451f55047798d7ab3362dbe0de4c369f9fb22382b37bb8d02cd3d77326cef12d520ada84bc57947bebe87ba322e6d59893b87d515bd6af9d5a1242c0b59cb2090a9959902292d865aa984b2a326ee0a1e665e5ebd5ed904f1723ca815ce9ec19ac070302384d286addc9d4c0a299b670b2febeb3fbe1126fffafde7de7dc4f54fcfff2402e19538b754057013e7bf116fdcb86f79e5ea8f8a733fd05d7ec1c79d1b928f0e49b305f43d16236b6fbc9fe6f426f1fa0d9a76447be60c4d52f2b5ad3a03705cda15ce1fcacd2c8e9592b79408821f8fb0a1185c68bdf5571777f97b856a10abe5b9dde404b4e2a357ed018016904982c7b50dae69caed6f457f6050026dd4e01a8f17c1f94a49065faa8be091b62dbdef30e0db0631c3578ab1ec24281466b130d0322d58771ac84d1546689af26f1950f5f356413e57f508ae0d682a09d155f9ae5539b366ad2f5531ea74a74fa05d5f341752967ed8b8459d23cf170c2f6e13f78fc8692894e48a1148a5afb7a4e42193874c8a891c4bf97fbc71a946af4aa148d50c92a2552c94730156ebdb5769d64af955ccc6aa8f635168179d806f5bfac35969e7300457d5a1e5fd55903248441363f78633a74efeda9fbb72f1e8fc37fae1ff069d5b0a0330b300acf54747e7f2b5ebef4e47d35f1c766f9c1b2e5d92e1fa8ee4bd03d26c8a761d745d5dc5d5233997401b8db1ae231e4eb1a12f8156453cba5a975d5b02d7042404643c22acaf317ef3eb99fec61f143db9d4b2570ae7bf9a5b77f57696502a025ca91656cb41a5aad1ccb9e3f25356fd68ce2560ca3e3d34e73a5b20c53aac72ecb242b8ab4a51532ac98ce234244d7bfc79731fcb7c43dd5b983497811c174a40a6886b8a96c00787b54ddd1b585f06572a24cd099215f0d1bbf2b549a89848b537cbf1d8bd97b50242eabcc38bab1808a04ab662a5ae3155210e242d0a46ab2bd2a00cfba05a2a032be57b362dceeb2e41651e4c2a9e505baf32056888697156364a0585146f002a7b51b3b75a427c835f1f11a773dc785cb0a010f075e6c38f4768565c10084d191f17d176344ea7db8dbfd9cebbf3bff2abbf3a7d9ce397ee9639b74c0b70b3e8c72d97770efbfb3f42db9ccb376e485e2c252fe6681a9034401e4a4f5fb7dc16fdf8c0e881fbb018494747c7949cf39e9c32a7bef77df4575fa27bee52793662424408a74e3279eb1ba02b469685cfb7bad137c3908fb7dc1852740339159b5e6a596a54c150838406d736c04a08571e6e33706d31f3748dc35b196cc1a4f4f7ae2e1fcd8a6b8acede72096e198fc004175698832bcb3504c2645c968d4487572d55038289c39a800bbe0a8e8ad25157e22655c2b82d092479d4a752d9385724bf198c7c7c9baac9cb9b928ea6b59229ba7ca520f7e23cb236c286aaadb012a88827592cc61eb5b21229cebfaa562a9c9c0b876fc5eb2fe7a2da3bd65e785fb11180022c9a3a84e2f590cd0ae62345e0559ea6c0f89ebb199f3bcdc1d3cf97e94055fcc63a1b6f7e3dfd8bdbe4e5823c0ca53df40db91fcaeb0c9252f407fdfe7f7d4773e6b7df09cf5a59d9784b9d5b260150f276d31d1e6eead1fcdee6dc1d7f69f1858ba28ba5e4e90ceb06ac5b969b2329ce40c6a3b26bae62c2f34f3f53cae12ab2295cbce29ce7e8c9df01a104982f9d91bff334eddd67d1d992a3dff978bd490c17426d1f0afe54efa272532265b2afaafbca06de00dea3ae20e4e4227ca1a2f34069019a8033ab9381fab2e0485c090c574a5213f0d57350823fbe8957f88438871b86e2932fe030d43b821a2a6512ceaa6ea1280b2b05e70316ca77a3ea0a101aaae6401b3415a5a1f72de2941c23396a4d2045409bcbc233521d4d76ae0475ec33fe644bfbbabb91654f7f79abdcce48d993a05268bf986ae2b34a0f1ac74dbd1aa81416a128a5c926b52d884500447515a68090c52fbd5ecd2b2ca22640890520dcfbf8e74ae20c8eac06cb25fdee3e9a12c91ca19abda69808a3116918705e248173cdf8a17e39fdfebbdff39e6d3ef9c91bdfa45878c5ce2d91006e1ef5f5299d8907fb3fccc6c6da70e3066936c7fa9ee6d426fde17e99ad4f09d18cbfe334e3fbef66fa89cf16400ec8d5ac429c6059288324b970f2701cfc785740c5d9123719e346a352c6bb82e2afb4e3cebd5c96affc0454151f42b9659a061935e07db92173ae257159d52dded535db1528b43a34131c2eb4e5dfc905f55e5156e28bcd55f1d21264851984159068c5833357143b0ef8a6b42ac187ca365489722d54caa053111959e3f195aaf361544bf15c24cfc350ca668a1089a6aa03c59125e336d649bb070846d2c27314b0d29334932fbe40ea22d2f5103cea8a54d828c0a758b9693526b05c5a0257bd11ab690a5ef0e630317cf569d0ac205ae6fccd0a95272bad42c15e56b30639a75ab541babc55b1cf9248d4798899e5b51da46d70ced53fef09e2c8c350f0115324ab445dfa5933fe5b9ba7ef7af263706090e4166a036e89044049f64d7770b0214747778bf33fd0bf780deb3ad1d90ced9684f553582c7492d41b23eeeca17b07b80a1495df979b9479e5d6cc598b1e5eaa53af48d1f5fba2caa35f2d0485c95bdfc4b0751d9d2feb6840ed51731d235e69fc45aad2cca1312131550ca0dcca8400d8f144a15b2d1b353dc61f0c29e3c3d1cac08eaf7a03ef8ac58656702ab8ea5958bf2fcdb85c4770cda00d75dcb90a916a6550083b87970282090553286bc0fd3150a83e203e1705a0f358df57b43dd4294a256a2eed4ef0a505e97b2453caf4ace85a8bed1d169acf41caf978eec1bcc7d6c6f8cd35f2ee419169fbea9a66147bef6ad16e50301abf124579485abd5002ceea904f3690fcf28091abb4aee9cbc06d05713565c45bf1490ca51d322f8c4e9d20751d0ca5d5ca569e21534382276b06cc691b1e4c51bf6bf9810f5c39ff9bbf7944713dbb25ceab3e01dcacfa7370b2bb71f07e3f6ecfc6ed1db1f902eb7baceb597ce1f94a7f9537592b159673aa00bdd596dc559db70372d1ad5764dcb2e19ba6dc9008784773fa04321ad16f5d473016172e323e77967ebaa8faf512f82e78ccc0fb80064aed2bae6cfe490578327198d36246713c4d6875ff40a10c9d2fb4dfb1cf60d5001ccf1d08c7ee43053f2c9cb7afe09d385fa6f87c55e599e262c44283ab005e010ca9802640a14155c00db5b5685ab0a2a39020d034e0ad8ce6a2689d05704d7d840c8621120fa6d501d8171dc60a993fe8ca5c3f8e9cecd813415cd117d0f765ffa0f3c5dc84927c7c1ac8a6e00aca5fde4625a921e68b36c10bb936209ab4a8178fa72ccb65ac94aacbb9021c928de6d426f1705a5fa762a8e2c7236cb9c4b243d6d7583f7b9aa32fbc8088e208e003aa196f25a9684c92e3e07ae5279a66fd3780a36f6e84fcf1ceab3e0150ef4b60a237f6cf39b11f4dfb07ce8641f26c8e757d55cc15459854779f55cf68592b3c576fd3acb8e08a0f9ff72568aab1871b87d27a06075602341f4e513d2a0166ff3f7befd66b5b729d877d6354d59c6bed7d2e7d9add648ba4448aa6c898910c018a153889032a018c3c18ca43e0bc398f7e0e901f60f2210ff92be163f21204811dc07164d984aea4445114d9bc99eceed3e7b6f75e73ceaa1a230fdfa8b9d69105289028710bd06a34ce39fbb2aeb3aac6f8c6772191a4beff2c4a4c8134eca7424a3c8515b2abd87625526800684241b00995e32b51b20e2565d29055d9967450309452108b6887cd3e8380b3a7301311454a89a32bcf5c1c42141fd117cb40e32167056252e20e0859ee2451053830cfdcc0843465c902b4069d26b8c7f443004cc2316aabb08d6538449953d083b2ec14e3f4b0598f2784ea313614444c9a045b51d1a505f8c6e82fd3c1a4249bd06c0349a1c433c4951b8507ee21512504384fe760de7f3ace78f29ffe3d7cf0af7f1bfdd50dab1671cc8f1fc01f3f407bf60aa71f7f80f2e94fc02d163f1cbd55e4ab2bf4750dc6a060db36d5870f7f4916fd858f7ffef33ff46f7ce3e66f4a1bf03765032858d707fd74fa841c8e9faedfff81f4d31273e64ac10f40330da3031d4282abc2c524004f6504f8a78a040a55dc84a2969479b148300273867b70cf05b4081f821165ee7d9a27c015eeb4e9b408bad4ce29830054a2898489a5eecc338c1e1ce0638910bd67271bf842506a53b8100b337306ea6d00a4947d2e0fa3698d451fec8d9388344f7c3fa0c448244430e9dc3a8c17a921844a25c38cdc7e41d00720fb2669cd76fd830badbe7ba7ec7a84967441d07fed62e8ec94030301f40170be2f2e4ebc44155a0aa90c66902450713ebeb1b79729c316129d5c3538164177ce8c6c0b33e79def61ce5662bb5bb0fcf829ca5b6fe0eaf39fc2cbdffa439819daab3be8e1807ab72235c3d3dfff26724a6895d555ca1acc49b68b4a931169ad961b6ffff4e1934ffcd657f08d3bfc0d6903eef50610e5bf0298eacdcd1b7677fbdf492ed96e6e61b777f0bac25622c68cd822fd53bc238bc002f11f632e747afa8bb0c437030d3bc3a0c30d94dee614487f20e5e07cdfd0a07366559132d977ce8b608ca3921a179d856e1d71f8a758e0e15b1fd2006889b19d1bd03a047d07b1242a09eaf5633a00847d184b594d39fafa50e2191f50a709e98d87e8ef7d104f8227b858050adb15925b645f84dc8cc8e4d378fe3432057be7ce4d46c0cd558cc49da1c0f3d0d54b0086be6df0ada39b70f4de86973fc29380022280494aac5540bc62c752d89a38142e89a6a0e8904e1292675653d6e9f223fbeb0977a20011075e62512d34773cfdead730bdfd26f430c34b02b686d307cf49a3ce09bd56280adf228d2a421475a128ca855506dcb0ae4df3e1f045cd0fdff902f07ecc2bee7d15a03fed27f0e7dc04403e3d7b76652f5ebcadf3fcabedc3676acb2a763a015be3f86778ea0f202b58692282149c6e8b5d3b85ad979609699ac21e3af1dff38c3c17a4a9f022528a6fa414f69af30c48423a1c58fee5c49e507c37f8d8ab8792a82950a2dae8462661504ead477eddfe42595e5b2412c168832551ba7aa8ddb8d0ced3665623031c63693c084cd8b6702d96f1c3ac5c44300c4d9943c841a94ab41a810d78e3efbaf252f6702fb60050d139fa6c5b45dbe80968e29087473cfefb5f801e27887424b1c0dfd82af1751859d68d2c465f3748257db9d730495d57605920ad437b8c464d00cfb0440e7fef24fb10b85578222e03631b18750dc1d6a13a04f60db8bdbac5f2c133f4d3c67733e685d6492fee6139d67db41d069d4b64140e8d0168eb96d3476abffdc5ef7ef6570f7f0d6be32772bbd7150062f6af395fd79bd3a7749a9eb4972f61eb0269674f3f74eaef017e604902a995e1b1abd4810b907226e20efe8ca6ccb1136c3fc9390e24529ee50caeb900694e81fc67686f81fe7381b0d48d0b119d6cbd1e67a6c4c5d8087e6992209e00e282b62c319e641fdb3b29bf0e4092223f79cc89c5dd42bfc0702046105fd003f8042f78bb3b71431c5c82e16fb86f3a1e87bfc2ce5f89993bf5f0eec421c4c69893d2e5c170040834c23646758b1268dc31908aba6ee7de1f083033513a2cc29f270d81a2ac7d5c07bea70e8c50105601e1aae451f0279281588039649ad1db89cc4ee0bc798d5a92aea47c9966a8770bdaddc21c47bed9f04c35a614fa48f4465d8229539eda46956276257f41139a57695b935b91ffe1a39ffee8bff8977f8c3b00f7de44f4de6e0097e5bfbd7cf986dfddfd7acf597c59e1cb86beacfb6929eee895f6d049157ddd00eb48e0c9cfd6b940cdc3c9e75cf64acabc1095a7be67092bb0114c11a4a014177d987d20083eb90489c65bf4ca2c09d1788a8a0c6f3b705cd80630c88d458d841a690c04684e3c40529864ba23956b1c3efbb310016efee03bb0db53b00143ba0b670867a4ed5823f03564b5aea10b709cc1d1288d31ce73f3102471237041b41c2c7347ac9905fe2110b4de60750d40d3d0dbca85d23b5efee6efa3dedc42adc222f4d36b474787a0c1876db82ab4b3ac3723c9eac9afff1acc0ccfffd557513f78b1fb2396371fc15ede8248045d88cca2f497f06459231a4c6253e98c787327861354213602c105f038f947bbd68db46eb67a5403a62ee830ca9b6ba37c1a1e547012b49665917c387e01d7576fbd0ffce0af71b9fc856ff77603000f328eff96e5894ef32fd7e7cfe0eb2abead40b8fa4acc769326f4ca14de9cce5ef72995bddfd5309edc41abccb45e8890e32d14d23824c439bc50246732067342a86a02ec4ba1deebf006788992d188d82b808608c8d47839d12648564e2b82a26abdc5c94b80d245d0fb0655417dfe12375ffb164404edc5abc80c884d0888df752009a71b215f95bd9c6ddc286ce41346f92a4ad55d4c0acc4281172353de0fe23de2c482029b16de834eb3936d8359db3111ef1d6d5dd11bfd0e0c8dafa93b4469ea31ff9d4f62f9e3ef710211bc890e20cd19a76f7f1ffdee448fbfceb19e8ba23d7fc9fb8ccf2c3f3c40b60a5bd63d23718cfd006ef0540a8ffe9d3fe2e30088f047f368a54c2817165631ea61496e0a33563c3925f21bb2461b116ec866e8adc2e6476fa1fbcfbc8d4f7dddf1eebdc701eeff06b02cc7b66d6fc9f1f0a4bffb42bcd608f3e4e9841823515d07523925260151c68d045f488224c0bb2397297a61417347ce44d5914bcc8a636e5c12ba0b63a57a07a602d18c2c1682950449064961dc511b4f6680a8fbe6906c9c4f97899589527c8424c1780bdd99dafebce1ccbe43ce1007b6efff8822a211b2210ad48af2e99fc1faadef13389c99b6ebad822dce19c434af10386cdb223f4078b2abc47b89701ab2bd7572eb242789d294b3b678af1be9169d130b0b6b75ef9d0b7447fc9dc4a8c60d6964231c7ef1b378fcdf7e11affeafdfc0abdffc3dd07e8ba776bf3de1e56ffd01242bd2d531300756505669c3272ed0ab19579ffc185e7df787c13604e7ffe002770154c8ef8ced100e0b5c37dab1b904a7c2186a120ed0dd80048789019e20432aed4e415302520b3d8129cd57549096555aadfa0cb7ffcd937ffc4bff46fef77797bf9ea5f217bfddcb0de0a2fc2fdbab570ffbd3e7ff383db84e685dec7482d406758f398b4333831e6cc0cb2031071e7c7ce94490dd907442ca898560c9803ba652420873a6e86a19ee3b4042d07ecb143e7d19bd35866aba85b77f83c390e7899309113add5a87f8995ce49d9b94a8c22b832a6c0b723b0498145637ec90780e11907164678d08bb6d153215b4f73e445f568ee54e76d6be83cf5d55d17a839642dd7d235b1217252e4133a7864210011db131b8b1e00e196eaf157d5b3100336b1d2d6cd6dbba9116dcb740c7c36e7b58a1298d38daf3e7b8fd7f7f1bdbbbff9e154738198b08c415a2340ea19700add3086c58bc2d1c97defde829fab202e6983ffa26ac562ccf5fed253d3583bebf95e682fcf01a32156c1f3e439a264c1fff085efdd1bb41cc72b82b01587168a77b43f9d89be81fbe840b0f0b31253128531be21b25e22682bc75ac72fa2fad3e79e4c0d3bfad00fee2370150facdf21025ff92dd30d5c79615d618e7ed2de6fbdde0bd71266b11f1252c39b9db736c9672812a81351dbcf952d8fb95b0e1d60c9d333a0429678ee1d2149cfde010a48c0ce7a26c0de28d3dfc0536e0adc2ba438e075257b7a80890e049a06e104fac005490c07ed6366e6e04a132c9366654b6194f63091523b68aed07efd142bba533c837988c2abbfebfd7130ba6a12b5005a4717c184623d61bb91184cf02bbb0d0db1bfbe9ca529f931602835e2bea5661eb4ad71d6560a92214923a043f040dd71fbc87edfde788ee9bd508d8c743597a638c0a757826e9ae5b802abc6ed8de7b1a1311435f56bcf9abbf88f7fed56fa12e6b4c4f480c1d431081a3bdba8d364b505fdd62fda3dbf16a898618908266ec0e4c1f7942bd4954659c94369872b283601012701254efd2a7c3cfa6878727ff12f82ec807b8b79bc07ddd0046ff3fd972f3281f0e9fd89ebf17a11e0db66e81baf32a313332f57a2730e43c55749a78e2a9429272bce724d4c8f0bb73204f13e7c010a4794217a0148282397ced3d073f8033258852462c6ef0565911384b7ad104b10c9d9d6ac4cab9b6598354b215ebba0010125a842a3c546e2443cfa00ef475059c1b9675419a58a6daba86171fdb9564d10a0d445f241c7288528fc8f25e370c76a21685f509e271b266a509a77920e6d4155833743042adb7462f8120d498195aaf518145dbd0822013bc8051599908d4425fb0add0ab6b48a1debe3e7b49438e5258418d9e1d12a34cce73a0a0d4bbc7a03d1c9db617aff0a3ffe35f07be2b7b5b00ec12220c0e8389e0f8ce5b68bd637def2937590d628f382c9c9d00e0eec74f313dbae66387e00be0c96f2ed018d34a274ee2b549bf2e8f2ce99b6f7fe10b8aaf7ffd5e4f02eeeb060000babc7871b05777efe407d757fde646501b597f2e34984478bba78cde2a490d1a96ce447b76945f7209f9ae239799277b0efbed44a38b349510dab00d40ced0c3012634cd245d97dd0971311e136e0eadccdf935e81ad71e186a987cb06cb8a540b5c5696fc5a028fd05dac346e9e789a770f755c94e39227004cbd618b51593a27410b0ec1bee0c58116c623b24100b48da69ce40a09bc272071beed1200a004b087f877602c23d4a4d70d5e2b0957089250f773df1f154b772aeb98b6e964508e0e2d5495562babaf69c250eef981294afde62e60042efc73dcbac0c3a5c783ffc17664e0168e31fc1f3460a7669b5e4ccec90c401f45ce04146e88f1adc7491fce4e39a1df9da0d3840e4141e2eb15834e8c1a53a3fa121e9382dee5d907effd5afe855ff8b7ffebd7bfdefffb7bcc0abcaf1b8002c8bad8952fcb7f65250b6a136f8d272c62160c431685f70d490b7a5b398b7740a70c58a8ce120526659e7832c148e6c9d4e9632a28493909881e3fcd33557499f45d9d269eb461e681e0e77b37f4e8f5d13ba456c8a14196895ef4cb0a1445aa136caae8b75c0539b38fcf39c17b43af6be811ca39295878025f9a795aedac06d6953d7a2240e5bd51a40222fbf4b1ebc17c23f516ada38dc33d29db9779e629da2a4941c1261c22aa416724f105b0b691a8d379b0752036c161956663e50141697637026c92e91c64c6793cd826d9b2c193c237c3b63c8f325b77128fb9233d7e80f4e81aebf7dfe3299f04c1fa89e985efd30187d3babc6eb00e0c3b76488c011db8fbe1fb2310882fd1495072e56665a19508f5375c15f3e307fc3c03c331a7b1683782b79295d79c9974d55fe9d3f4e86b14078de6e5deddeedd061000a000c8adde1e91d317fc6e81d70ad40a05fdf5522e4485255c6306cd14a1c57792779208749a59ba47ff9fca044d99661e8536582885e61a25234d337c2a9c20e4829413fd0084337a4a7983dce38adce8a68be8afb17534b9812482607d4b10ac003895c8e900efd17f57f2073413dd37004820afc00c29aa01ea0058d67bb7b0ea2262df6b253fc180aeec553562c7ccb920252602d23b433a621bf575e3a9dd39caa4f9482356e0240ab9905d096077e7f1ad8ecf0bc4cd22d22bf0040d53d4fdaa1f3e07c1a5e0244211491dd427a80669c84110812d8c2b505fdea0d7b627fb38a8dceb5b85d4411e8a1a21511149bb372e70f6f4be1b948ebd4d7c281349f918f847fc0423d90a0553b44c3f5745708369deb1096f6c6fdab6a11d1f7c4ef4700d84ecf49edeeedd061037c1ed6db1dbdbeb54a677fa8b97fbe9ef8d649abd7c14a1845706704e918a3b88e407653395890b3eca7e1f2420a5a3ad960c4f09e9c1355c15a914c87c804c34d04887232f5e05301520155ed40ef46de554a26e2148ba453a1e58720af5f6c3461bd31c8ac504548eebc43a642b4805fb6bd3c20aa2758b8e93e2967438a0dd844df9386801a25d212f562492767a6730463b9fd8c14e82d946ac22ecc3d01b917b38dfb3b014f3f0eab711e51d51da162621108dd5853387a1371a7d186dbd386af41d3770d5e04e18a717181c038a7ed06309a6446767f0b3ed7727ecebdc9d130007c79951f9b90082503006bf815d04c14289a0d040b5121a0000200049444154c13664db002091c60ce3640f0648515a997583ad156b7b85f2e4218997db46f29807fe643d8c5a0c980be4cdc7ef945edef8f8af40f0d5bfeae5f217bfddc70d8000a048b6d3764ca53cb6650dff7b0b145f903251d86a61afe5c4942566fde2bcf091d8079bf2287009875f11e8ccfe3e1f0ec094918e47489e2087191ea73ea6426efd443f3f446048ac23d8dac806ec46879b6583cd87a8387952d9b642e704d78c0e8348463fadd1326f74de9d632119a04538e62b05ea1b5988a274c5bd5be0b591ce1c06a26a04b64478d4397ca748ef9b8470111ad80330c30034f41863cc1875bb7508a57a3b8b6e6818c636ebccdd02c4e049f645c915caaa4c627487e13eec1e94ed00eaac030da44c0f2c3eb847e6462dc0febd18c91e0fc81f7903eb7b1c010ed0cfd3a068dbae612086c1fb9bde7888f5f9ab5d1508ecdd0d25d73ed8800e75623c167889260298e28ee9ad37503f7816efb505e6e490c381af2f2b49a657d374fbc1edcf7dee834ffd16f0ee9f9723f853bbddc70d000074a975f2dbdb9f93478fa67e770bab41fe0960cd6ae5620ed69c41a19a839dc50fb34c74c86d20a75f6632ffc859cf7015a4420c40a699449d290325368392a18719c88517c934c5c5463b2c7d740508d0de7f4e00ce055ad80f8b1fe2b926609ad0368ee6a63cc1d60d9ae9cfdf25410adb54dbb6602f26205bc87615066e38699ad04f0cd6ec46731357812d0d7a98d15796bd0918ab3eb4f671028fac812883c758728cb3bc1a067dce9d23478f886e8ebb02f414ec061b0327d85390dcb8d91a93f824c6896391d38b70fc6e847200d87dffdca3008f916b370cef00ba2c25cc6f3e425f96bd0218633de205d81739bfcc4da0af15e5e135ea8b1b4c6f73b447e6a8efa62e02a624bb8cf68044a0112ca229e1e65bef4225012521ebc4c7ef86e9d1034c6f3e42fdf00596a7cf9075c2d4f15f5c7ffef3ffa7bffbee7a5ff900f7510dc869f0dddd8cd3e9577d5be98519a9b97d24fc461a8f8017d120bf381c799a910f07b4e863f334d1fd3651bdd7dc615991cbc4459f0b3017a4ab03d2f11af9fa1a723c205d1d39c73f14c87c849402cc13749a880edf9cd05e2ef070fb9592e15382a742d150ca904301e61969ca486506a22a10a5dd583e50853826d1297c00a564482eb8fefb7f97d884287c6b70731c7efee3c80faf9958635c30a3cc95e30ccc85e05a640fb831745334443a01c73304d377ae8188b07c2d3936d1b8efe006486c2a70b0124bd42a0cedff386e09880fdc2beaa040f321917f28129554108e82863ce8cb00d83ac0c20d98cfa4bebac3b3dffe434c6f3cc4102f592075a325848c6096380c00b4db13d617af60e0299e1f3f04024c3ec38d0e99f35ecc50c2e17b55c554119cdb108bca08c0f2de53bcfca3ef60fdf00520091d26abcb17e6076f3dfcd245a786d7fffe53bfddab0de0820198dabace48e9f3be56a2ec5b5844698c801086176e48b920952940ba424e76ad288703d1fe52e237701efda942e6093acfc8c719793e028933699f0af458680a3925e4e900896c414d040d354ffcbf64561425b3672c85f9729291a64c90b164a452e0692c7ed25e5d1172610296b91c28f28953f5d13ffc65cc9ffbb9988713e9ce3963fadccff2b546ac95aa00d116a4470fa00f1ff07e03116f718a8e38ac18ac01880bd883335f0aae3ff3491c3ef3094899762a31a5d48365e8d134db796c06d9c1b471798fde9a9d042b038f121900f46a8e4d20f4fe83af3f7e374c5c69b642fdfe1821a6a9e0e6db3fc0f5673e89f2f08a4b777ffc119c12116863f1ee07b063f9e17b04319b332016425fc5ace81bb1120f6af91ed8da06ce81fdfd6a0856e55e5685a80a8eb65698facf69b5077ffa32ff892c969fd0eddeb600fdc58b5953fea8ad2bc40d2a12177242129eb26e1b73de10b6535136e672e0d84915ad7794b920217af75ca0e228f3914499a90099ed8096022b09f978200098231c2431f64a868f1f86c2cef70bd29a8033a7b0b40e430fd7b4838abd36aa69538695096c4e3a6c635f3e824619112e78f9fffc0ec4a96be8d6a0a2c8ef3cc1dd6ffe21e7e43ecc4ae47c553d7bb52701439504a5516ec762d74c5fbb91a48b60168ea542a4bbc7058d1d5c1bef2f0f4c9e9ab2037031861b25b893823bfc86389f3758a3dab27ce26368dffc2e790ba32ad8697b7ec614e4ececc369a8ee9bffe9fb3fe6e1e0e747e22e4f90f12c6c1a4220b616f5c50d8b0c8defefa4a7b095c3f998f6d6797d809c0c4e3694cf553d404c839842939c3789ded1a6f4964c98fe635c9418e7dbbd180dded70d209569d29eb7277e77126f1ddd5a20e4dbeec02baa4c957132e5b464d4650b292dc741d269d880c40b5b55900e13ba189204983815a4e381e5f361a6175e4934f2281a493e717f109890e08254201ac613ad6168e5a5145af7cd078856241864ebc8c6400bc3b68fe51c4077ca689133bcaf7c5c74a08731281caa19e81dede97350cda624e1c805734fe88024b9c4faa1ad982b80de22f5c75eeb9b69ea6110d6b3b8fbe6f7b8396c433e1c33762895d1a394f740f825c1fd8c71f548499258bce3bd97d01e8cb27df9e6bbb1e042160cdf493cee6780eebcb57153603c9840a4eda7ed180106fe085f6b80b443fde914ec5c1d81d31244aaf32400b1390e8072b839211a84f2c643d467cf49f852d9c361ac1bb45b54557eee7200f85645de280fd383c78f1144e13f758dffd4173f70cf5a80b80900b4d3a9e83c1d6d59d89fd6c6a8262142abe1cb2f9268f20145af9d649f89f65b503aea6a94fc9a0b5c69352d1a516161fd6daa9cef272abb24b3cf673067deff47187712ed8dd86d1f8e40891b4ac9d0b900d3043d1e500ed7d0a9c0a1d0c3c48d649a60a2e7d164c991fa3313e7107a17f0d4365a508bec3e7c9af3eef04bbf409a57f0eb2da2ce5294e2464bb258442661cad1e9442cc192ebe6a4f96eed5c55c4393562ce0901c4092d1a621fd9371c89cd85609cc5782fa614238b20aa0597812f8c4f7d4c72f8986e1e34e041cd8d51e4300d9171b09e3180b108795f51b988026f3c44fafca7e10faf7780746f0e9a11fc8beac6233fd0e38e8e1f7f1b579ffd148d4bfa651b849d13b04f37803d4bc004f2ece6c5dffbf87ff6eb33feec05ff53c703eedb06400ce00ea5371429b9786d40ab7154da5e164204294f67959ddb7e41c20529260043ddc7393eedbf4aca28f301b4b5e686a1f3019e1301c332c7499e8032b1a4d40443da299fa299bc9c94f6f641a7022913ca3423cd07e4c381c0e194d932944c3efc34c3c0b640a719699e615d426b20b8fe4ffe23944fbccd519fc85ec23b485c1220d079ec8ec41e558081190263c18ac6dfc7dbab2982447cff99689e62decec529213db6dd6d67f4f3ba97fb24574526e19fda24441c230f719091763d7e0074e7131a70843c793c5edc15c091e07edf6363c0e04108642e7bb570eef8c7828cf1a88f01666c16e3f97afc34411500088351201e0caf7eef1b387df35d567d8851656cfc3680d2318200d0fbc89b68725aee7ee9f0a9ebd9fff93fffb3d6da4fbd0ab86f1b000008e494fdfd0fbfe0bd890c33c75ee9cc520a35dec359779faf70a4d79aed17bd8b20cf13ba195a0b1b2d55024f013e1980108f5388a25ce47405ca51669fbb429191e21325b42800257b0d7111a992cd277e01fcb152c9658629b908d0c412dd084ea608df1cbef5520a528e249f30a9807b3c371a7ff6302a111db3778edb44354445ba8f3d2545bf3e3803c2fd5621b061f5c5b772f7ff239818a09873acc67561fbe212cd17f52ddfab9d4b3718846618244f47b006c72244bcc7faa74e73704382701318998a038573805902f1bb431ebecba1315a2c83bdbc857fe33bb09737b1807d5fb0e3a4f7c02de063f671eee92d003ec4dfadb3b291a808dc2f80c8b866bc7734d39f2dd76fdd5b8fc07bb9012c222a7dfd3c0d281ac655994ae6a93d9558d89162c3ba6bb76832e7dc799c60e578c074986170a2c981380f741a9a826a9ba04998de13821ad1f0eb4f6391454f9cc66221077c9c2ce25cf4481a9e0481b42762035a324a54061ee9b38c00cfd0ccfcbdfa7bdf416fc43c3c4a6d9ee67c83dca99797bddee5c9994a8953d5c961c8c3e65cc844d4103369b41d1263c19c59c94824227900953e1e2fc8426efb82141f91e08105007bcc373f45d9c137ef636ee37b494e29b16137381da33f11401c699a38319031a9e02c3e3f7eb8bfd770473f9dd08296acf1fc87102cb84c7c876a85bdba81b4b657166760f0e2e7e2bf1d8cc0b90242bc3a1dbf2781a560b4350826221fc00058c6c71c5ef0a52ffdd44ffb3feb76df360001019304f74f615943424699af18bdfff867432ef35e3e6acec8a90482cebe7e28d8ac53cd262228d38414c61a9a125452140069bf309058deaa526ca20017bd0c07dec1f1e3cd3d00c29c6059c3869c0a442db41dd75c8042dab1e48caccae7af4a2f3bcde1409459423ebf0bd43bc17a479a0a72e109c86e871b90861d95c3f799340344020370ecca47d27959b1ec9cfd94e8e4b33b01457fee8e1495824459cf0f28da8601ae8df62b9e8f8dd504b0e51ae41e0b7f01482c7a8d353622bfe2b41d7844dd22e5272aaf68bb65300b8173b9efa35e88cfa3a43388e7e30a89fb08ecc087b60238af82306e1dc0e738ed47a5b93f861133303dffae8cce3440130722ce4cdf929ca6f39b72bf6ef76d03000048ad05b97ccceab66bfed142ed96098c25e5c218ae3d1a9979a914e4f89e2b1d7a532ed0445b2f88a39b876088958207cf1d412221b01e9af244a2c930a4b092767a2c44681b354e3b04669626da6b09ab8a3ccf51a6a7501c1658cec418807316a0399230e9a7f7784d2ac8a5403a102a1e56168885beff19b162007a1dfafc90fe0e139408dc1827b18465ba83c01554b911c6b87338038d28b2f3ff888a69c0312cc125fafb989691721c2d03c2a9c806f27f28c86f3e6606218061d0397cfd07f967300c0d80b786edd51d82e2c7e53890fb288f0cbee72700e7f670e0029c2ec8be9e657c96a3eb777e9ee19a46d0399c85c9d4b6a84a627a62085938102ae3282d00af55a0727d381e0ef19d7bb709dccb0d600600f843af0db02ec3ee7a444c0d94d501943223a50cd18cde1c30438d9cfa3ccd4839a1b5c6715594ca9ac230b2db392936442d3a0c23f3c54eeed18d0a7b76e484e1a02b08f65ad2b0df4efb3a19232f8e0759114862469f8cf49b790ed0ce033b50a43223cf996c3b11f44e7dbd3b4f6ab8efb6e51e27709a674e23a22fd79c91b2224f79770e46d65d20338054d13047558d7dccc2c07494b30198e9c5d9a6114cb2f70888451a94e3c048b896424f3000bf40d0f25b4f70fdabbf88fce61b188122a3841e234d088285171b6bacda41ea1ab740642e4ef28b3fe204f78bf100df2740e46c277efe3f6eaaf049d0e5fc653e2581bb8487a1ecd88f0fd3549c51106f0d369563cf29e12b5fd1d71fe07edceedb06308e1855e801ad31ce1b0cc9a0cd37c32647bf8b3855dab6224f85c49f9c91e77947a635b2e5c6092589a5710e5f7d1972581fbef4416d459c3cdd422aac7c6c51daec8f515078caf3208ccf59c9231869b90826209d0e48ed1dacb561f499a7099e94b374d08893fdb80e3a3ea6a0136b528effe3f4efb552e32fe7530c08a934404ca3b6fd32d79ca3af676fad70a6fc00804b047906c5389c93768e3dced5f390dc9ac506a67be90be0821cb4abf5fcbc2843d1c87eddf1e22aed27f65ec18f3f2f783efbe386c86860ff63a27009008e8d6e4c1076e867ff3e58391ee6a804042e0a7d70407e74c4f4e82aaa93cb76c4f7f783df89d35f7691353f936e48254faef2009ff98c06d3f55eddeedb060000d86a55143da091ace3cd90fc7c2109006b8c956abd31a507d461976946eb648e3506baed7d997543777f0d994ee1996f6634cd88528fb6b75c4c4904d21d3915a4e315b49438b564740de7b0118993be4cfbc22520774e0ae246d3031f500a4be6694ff9cd8702499c4a88829a819812401c52120350322b12d5a83a3a791112acc7312663fb119300055280932cf9479089863e819c95a87a596abf06d0692cccf322f3f0cadb5d79dce39c8e4a20308458eb0ce4f8f0056efeddd7513f7c416cc00cffe87ffc9f78011846fd8dcb9d6094f1409c1482bd7518adc0c581bd6f00fbb213f6f28364340048ef86be6c3bf82702bcf1cecfe0b3ffe01fe2f13bef9ca3e50679eb0257e05bc44a6ffcdbf7f7c7e0aab2dcdcbdfdcdf7debb976bed5e3e2988a86a3af47511db2ab5f6d6f60b76e4dce732c7090e400c49853a6dc139e17618574668c600b6101a79af1bfbe56d437285357af133e5a74347ea5037f869812c2bfaed09bd86f12810c8578ce1100bc47af0f519d16ddd38564c9c3468280cc92f70d2858f414c8270011b0131b34eac0131c188b161af9d20151c2515fe3d290548f177f6d2e029fb1a65d643001432e3a03aef2dcf48f9e917cb49f8baf8110d7cd6cefdf87ef3bddd1a5fb7500cc25885f5bb05edd9f3c84ae4d77ee37ffe5f30caf491e137780a368038190020ab8ec1ff1f945ffe8eef3bc4a820b8315c560697edcbd85c64347d38bdff142ffee45ddcbdf774af541cb28f0ef7c5afc3767cbcb5b2e32300c1d2e5e58b8fbd393adb7b76bb9f5460d6b005b5018108e75c60ebdd4efcd192e1953e80ee86924b984074e6ffa9a27683af1bf23cc5c52de8bd217b21c28e09d61c59046806db56a4eb19b235203bf5f1484c0706e8a66b1137ee012dc54891601bab15389d630622aea5606413922063480f67f8cd02efaf90afaee976bc2cd09cb09d78bf529416d466f01ab4e76e38fcc227903ef916f438e3eedffc01ecfd1760a5aea8e2481f7d02ffd1b3100a058e502bcc9c20ea504f26ddd378ac3516afddf85e0d9e05b097d7834043871d96ba631436966df400206672f19926c05b20fedd89478c6e406292e0eccbfb783cbcde340fb06e94ee674622c1ba217716a1b087e39598d90cb5a884acbaf2b38400980ae6371f63f9d1d37167585ebec4f2ea155f95859cd92d8264c1cdc51138889c418a004305c303c1d0b7e5edb4ae67d3837b74bb8f1580a356f5ded56aa55b4e902a44a86f1711b46d0540d7de50d8504618a2961696e129d30fb06e44c65594736373f475833a2da599f043c75b0b4b2c71a6daf6ce0bcbcdc25d173b1788c454d6954cf5f5bd415651f205125980c809a60a7970c4fcb94f411f1cd98bc7c6c4d338a2b093225f5f438f13ba7558f4fd792a289f7e07e5238f91e60c7d70d85b123340aa21cf332fdaf03c94e17074410ad25240d96cf8f8c55c1bc2dc02f6d8719a41e277c7a28b533064b7c3090810f6ea5111c470e44cf0d178d37454233c9a2524cd8805ba139546652163518d13fefc87003b182929ed1b527e70157a0e650c7ab4020e7eee4428b979e70757c8570746bdb397d97907a3c2c05e69f0f50c95a3a5e18570f984c66b568e863de5bbbbbb7b79d8decb270577939c9218d3773c3ce53de6afaa8aa4e9b5320c66d8b60d652a9c61074868c3664a84ad448084b55664a578264d19f56e259db71b63c744227938c3330127fad5b3e48525204e2a710f434e81778127c05be0012a701f8944e1e1775ad1bef73edab35791705ba9165cef62d129cc374807f438233d4fe8a811efe558feefdf857543fad81b486f3e4495a7701774a7edd8f6ed1fee00a92062b88de94776817f60488605017065c01a92f86e42e212cf39d4751a683f82cd87000ac7e2c2181d1a765bf020235c54102ca599051014e7384807790781cd00d84f5b5c006cf1e3676391789c51b3d417aff87ca78cf2e82196f73f1cbb117640218e3f5b2beebefb23783794371e221f0f38fde87d9cf79ba8702e40c78038c9aad801933808c06b4d345a416b6f16b382af7ce56f41c0ff7fb7c9bd19bcf7b37abd76b4f0d01b2e376d59011081ed6ddb69bb1ef661948ad26b9e31e1839b0e9492483659374685e5c4408ecaec81562b937c7b4372065b5034e27b2c36bc41039424fbccc02c7a870889349ad3192012f6b61982fec10bd27d5346ce940a4384f3fece2ac3bcc35edded4097872272ab140bd9fb2fd0df7f1e745c4129134ff69cd1dc18d375712ccdbffc3958195466ec1afec1956f2d4c438468be45157446d53cfaf11eb2e8a0ea12518b6a8118c858fc63cf643b35c0c08b51e145af3e9e8b84192880fd4fbcf6347c3f682fe9bbf10b671cc3e9387c7aef298600690704e25037e83ea1e0c338d29387d8c93f97d1effb4da2a0190024f6f774e74300e1f5908194f2dddd1df0f6db7fbb01fc3937eef3bebab5aa68dd194cc1fe3409824c42c3cb1cd15ead3123002e68eb1ae09fc7588e7978004bc49c32ea7a423bad6c1fdcd0b715de3adadd02ac0dbe56a4dad16f6f81da198515ed0882472e1e326303033de2f4318b850f0584a414f5bebf3c0dd00fc2786ff2d8153967080ce6543d2655a466f065838822676612a679c23417d286ddb1fef839d4a24de9b4b84a22c8f301f9c1d5cef6d394e1b777d02b3a25b95b9896625fcc9a78a18b93ebbe9381000c5f7e09d0d5068fc0c7f702f597611d2667bf81d81447493f587f03c01d009a89edd8c378bc330a818b7f639f4cc43fe27ba33591c0865e9b1960007edcb125da96b0250f7e826d0dcbf77ebcf7efeee74dc3a38bdfdb93c01e24262332f689a8603c2a26a834b559812ffee557c84ff8761f5b00c3ba9a38c45b053a2fe80e96d049049e32eab6409d3e6ddaf9a916559edc60c92a6108ba5f44ada219900a6d9f60e4d44f578276776218e57262824f6fc8d75701347620157822dd96c6a4a31588271d23228593c26abe5b96f5c023c4a98f3770f4d6cda025454418d38e5405d83c02382268d3c85368bd214380270fe0b7774013a4b810f35460dd601ebf7335d3ccf2b472819861fbd60f214e2f4168c48e8932d76ebc1fc180b874d7b1ce13bf4749cec395afb73b2709bcd1224c00b83aa423084cd13f536ef8da896983a0b3536fed8c948df352b889f5edc25b537644007a9c61cb0292a2f6e123ce4d3962b11adc020fc02ef7899b030af4b81ffece05f940e2b9a778eefb2cd16314ac08b344204bb4726475aaa65773f78e2fde2f0010b87f15c07eb3756da35a83f3244d417deddb865298648b1ac699dd38fa730a5f528a0b5680d63620f20261f49ff7d680d6006bd86e4ed05681881db77583b4ce88aa75836d0db6adac007a8759e59f772b503b6cabf4d1af8d406204685a808a6a1c2b4a7010861d58ca097ddb605b477a70cd3edb99d1a771127be01692322b9e92e1738697125902740c1e205d4acc44b05727f49b95ca35f39804446b13fcffc1b09450499a0c218c43a355183f039140c209ba49ac5009608f568371f2234edf810184b7dfb00997f83ea724fc390bf45d24c24af76d9bffdb88418be7b2570312ad4c4a3b52cf8e24edc0df994ea0e78d235c86f68d29761d56397eb1f9ec53dea894646f37341e73dfac86d02a2a2ad9b115f453d9f67ded3eddee6305c0abbec6fcbfd558fc19b69df60baf6e1525176ca70553047a8c5fb7c6fe772a197559910f330627000e78dd9052c6d6c828b4bac16bdae9a256e83188d4f6721f2a68b533cc43d9f3ab097aaba0dd10f6be512b350ab6557e292566d9b5c6e0c98eddb00329c3da025957a0c706e2861661a32927563a8f8eb0652307e187cf38719829346ab5a14cbcafde1a901439e9ae92833048a50b90cd497f16c469ed802a6cdbf649960c2d85d945ef7b3ea1b9b0a27ec798d9bf2683813bab816135be8fe22268642873cecb5cce605f283b3180bfbdbdbf241a01e5f143d45737a82b9f3b92fe07cf77e7fa5f1a87fa198fd81f1efc19891f600f7feee587004cc6667b413b1efe8b6357e24b082ab32614b15b7df28463ab7b76bb971b80f7dea5b56e3827b0089c63add6ce859d3ba6c3ccfcf9500aa652a890eb8ed61a1574cebf27a54d750aaf3c9e448024453f2dc8d70ff68580bb3bb475433e1ed0b615699aa0a5c32b0049fb184844d0fb4a03d094625ae1cca61e63245870e44164db858ac4adc628d2b1dc9d909d8bd65683f74a36e35679c2dd2e8c35cf195a047dddd07b27a9c859d26b8abedd3a0f3b009204fd6e0df7244547a7d4b737a494c23390d460f70e733d5b758312e4cbd29fbe044e90b273a15f7204f6c5ec1694003f6f18ae3b1847fbaf33c146c602153f6304828b72dcf7853af805dbcb57040dc795332cdbc6673b1a7e95dde074acd3331018209f8f83dd766c837f5e6c6cc30be202f08bd5be2f7e55ba33e9680154514a79da4b395b26dca3db7ddb00b85accccd6c5e16cb990f25e5e5b65b92da0eacd9d8b4b8325c87b11f6bf66a8eb8a727545065be726d09685005c99d86b77c15caed0ee6e21a5204361bac07322932e252ec498a7bbeaeec003389d88add10ecce9e7ef00d983004cf37efa2325ea0ecc016bc82a58eb4670b2dea2b78a9c058a097d5db981054abd9e56486d3001ca61425d567403ca34a327b075113a13c30d9a05769880e6b0d638c9005b0a038943686740ad370bfb34c06d587e93fcd26b0b2f04390b741229d21c7d5994ca112dc680067e1cd11aec2ac190559b9fd7129cedc16007797c6de70400bb17c1d808462bb1ef1782e089e07cd666a5b78084f86b59a385e70e3316fff9f28b0d2d5a30b628a3f4b7bdd51a235419d16d5982921ed3c2680f242b1e3c7ef0efaf6a6df8ca4f648dfc446ff76d030000f7d6ba9875098289b9ef812022022f99c8be2ad405bd73538008a43586369628874521d64995ad9d405e5062bd9f20a9c0cdd0960d69e685d2963ba45e602903a5c272625ea0086c267fdf43a62c25c1332fde8a13c40c699a616ba57f8028903a4789dee1cb86beaed0ee90dad1d605d981f5744272874b42bbbb03bc473dce6bb9d60de3fd980e33eab6221f8e10716c1b814f2905aa8923d194d0cca1770ba464f45e79819684b69008d3829967f1dea59cd16add1715bd08c6589380e0c8e723a311e79537b41a623b2576640b880cbdbfefa8d360d05d2806ce0d7fdcb857f8f8ee6b05f425c4e7c3a66cabb1f8f57c57b5a3d7138d6246308a04657bfc8cf8fef8c3e96118a958e0939ac6fd0a840d201738b0fb3fec4e408115a49c80cdba1da4dab238fee97f600cfa53bfddb70d80c564cecdb6ba8af587562b8337cdd1ea06549ee229296addc258a3c0b6163901be570725d363df6aa3ba4d152a998c41d6bd68ad224f73f006b6ddc61a2ec80554191e0ed498abc0db842ed10fa684ba02796abc18bcc7f461a37b8e00a9ccf013edcc4ae642c4ed89ad4d6b4098704a6ba86b85b786fce42120407def1904742516e528ec26425800002000494441549017ac82ee45ecd5cbf1c8a7dc69c2893c41a7843965746b68cb8a9c0a90056d5d90a609755b76f0cf85fa7bf206c607c19e5d852d858583cf88bab47010b4806c382de38e30948be3841d7a85b16950f23b9af3000071ae442e5a720ca36ebfe8e111633ec8e52613bf746ec589f347cd3f0850fcb538f5a3821b6ec4fbe2d7f3ef8d8affd2565c344e7b3f3fe6086f95345a1241d20c69fde4bdaff5f059c397be74ef80c0fbb60100e004c0d6751188b7b621b98bbb216b06327bfd0196b9095a2cf6ba6e54dc2545d6846d5d79621e0f40a8dddc5802f7de311d0f1073b465412905a213501b7bdede51dd31cd07585f29c6c9193d6d7091b3855629e8db46ce414a0c962895a6256542bf5b0138a4776cd67976b8c3b70ded74826c1b73027b871a432dfb5ad1ef169efcad62a4ea32d883a8b5968cee86344f5c602a8c464b02ed04029105d8946d543558afcc3bec8e9c0b893fc03eee72b012d8033ec39118892cc8412b0278f2761f35bced9bcf705b1b12dd1d18bb5cdc6ee1cf805864e781dc3ebe9321ccc16b27ff58419760e0b9f31be53bf64508420ffb6f8f47791d1790fd39efb4651b20a0601feec76ee097e0a0ca59868df1f37c02699aa0e6afbcfbb23c786ef8d2971c5ffef25f6a6dfca46ff77103709fa6ae903b7d70057bf532fa4c66dc7b6f610fe598cac4d36d9ad0d6154925dc9cc2034f04659eb19d169479425d37e4925112b503f5b420e5821c639b7a7b8b699e91a010afc829c7986e834e65071953ce04e6cc80def653a16e15a640c215b505638ecfb85ba819eab6917bbf11cf9056b1dddc20b93000b5776c77dcc8ce150d0d400102723ac0d09469419633fa2e847148b942f38e520aaa75683ec2b040c4802d7c0f3c92952255b86d9525b5eacef4f3de77406e77f48d05315a2ec4264cc43df001979026c7228e1394e3d718c7fa7971fbbe61e0bcc85ebf22c68f9e7fc6871869fcacec77b9038872fef74e790ed071ffddbddc406019f1b4e4ac4be0f70926ea341c9779c73aeed3c1f099d8403527e87c70abdb337d80d32ffce5d7c55fc9ed3e6e00b06debfde58be7dec180058b808bf0ba6b7d412a1968f4ca13775437a0039a15ad6d3b70d4d6055953a0ef76a6bd2e4bc43e359479425f1722bfad91ada709629d019a39a1dfdda15c1d192a6015660b1a7dbb50e609ad56eef850f4db5754d999c0d08806c3b12d2bf500b1d0b577f46d43968ced74871ca74f52da7bd559a177ebae97872ad23c912f90e93e24850622e530a15a479a0f7017cc2ab0ba213fb886d60032ef4ef453ec1b1571db1625fd995a2b4a4b348fcc058a66b0a70a0d818c5f62001e819a418b1e63377605fc590d576309f3947d00e8afd7c49721a367202f01ad937df81a43708885f659e3ce2cdcf70239dfcdf8f7c82fd857efd8e1e45c7d585c273bd00f41797004ae325213b453e3a8cfcf6dc160abee064c25239ddaf75bed77b8b97111b97ca9f7e276af360011717737efddedb43ed5433315d5be2e9036a2aaa2630c920f1a39f44515b53726dc46dfa88946a1669d98dac81530479966c0434fdf99f1de97150d1bcc0565cae801aca10b8543772722e8aa988e4764738275eb8ae4827a73b72714a91bdadd8a5c32bc38b6bb2550f78e6d5de175e566e244efb370531aa5a8b58ae2195ba7b4b899d1cc430ad2718a9872da91974ca5e13c4d3b455755213603eb06c8c6cd6aca483e01e26827466f4bef3b3ec2108f8e31f81aa7ec18e5ed65b90815bf4256a3278ecdac8f593900e83e6d7044e592b0afc84127763f0b7cc6a63d4af1dd62ab5fb807c7897f26619edbea91a2c40b843fafb83004892f931016d7825c28172f87fbe63baa4fd49f26216f7eeeefe0f977be8be7dff91ebfa7386f223a2cdb87023379baddbed9342f78fbed7b070002f76c0318b73744eaf74fcbbfcf6ff44131a333aeb0dfcf29c37b475d169494b02d0bca5c480976c6826fcb1aeab7b6a3dcf37c403d2d28d384badc21a5c2d23966e42a405602756d65b9ef4b851e008f715952a16ee0e6165a325a6b28c703fab6c57c3bc3d78d34df701f6eb77770d0c7af2f0bc791506cf5846460ea7164f1e59c515b1096cc9027f2185c04a94c90a4a8ad22eb845466088cb6e2d301968409c4c14ad5eef0b2c09322c3b1a1c35b8789224d056de346291a530055f46525bd17c03e3417fa2c98714cd86a8bf1193725541f04621a98086046d294c061353c1d3bf679be2338040421b02bfa049192c4f78395f6c01ab02ffebd29b838f52f173eff463f4219a12463a6cf50c5d72b11194504ef70bf97218716c5edd3a7c8df99717afa0c836578699aaa380b99b42494f9e039f5df393efac80dde7fffde9dfec0fddc001ccf9e75bbb9fd9a36c356792198312034078d15ee2889ecbd29926cc59d115cc1bdb7de79fac301136c777798af8ea85b188cf48a693aa0d60a734339cc40a7e7df481e06845e7aee91ba9321bd9eadb7bd03a7152909eabaa2d94a9458a26511208d9366ab90d690dc51d7359266800e6e72d37c406f5b94960876a3844a4f49dc3183e6827c75844f943ccb9421f38c3415e8815e009a0bfac0450284cbd6b0568e46bb5125594f0b4786ebb6f31786e4377c4fc95b8813da8661887598d04790a9383837ddb11a1db461db4f5847988f50d5391af073eb1ead4858b4ed805f2cfe5104e48757a8b70b4f690d8bf328edc70fee7d7a701114e12c84f1d0a3e47ffdfe25da1b2a00639b51017ac7faea061f9cbe05041b5045f7c791c008869a31950259db22e21f6c5ff8e4827ff24feee506703fb5005ffc626fdbf6efda30e6108a5d306cc08317805062f55a41190ed0d70da29cc1aa089226242494a9a0442f99a79932df32f394199b49ad6875e345b75548ebe8b5f2748ff8ed6d39511c03a06ddbf96b5b4332de4f363e475b5648ad406df06d85742e3e1a87240c6bfae9ea889232bf2e1a36625c5ca282692aec3193225d1f98777898e125a13cbc427af8107a7d44babe861e0f48d7d790c3017298911f3c000e331374e62383498e879dc33eacba534e8c432f793fcdf7d45f808b69b819c7c94783553d2ff8b1fe8391eb433919601a1d8e7b8070e7852f22e84980e384edcd07af2d7e5c2ccef1f3edb4eea3bf91d3088fe722e3be7db7111b8f277a4130c2b9ad195d03718178b197242411c6c385a78104a039d88fc37c5620a0b55ac2341fbcafeb3311bf79fcad6f5d24a6dcafdbbddb000228b19ba74fbf9dcd9aa878fee89b9037786158ad003c0c2ccffd9f3ab302f234a16e1b5aadd8b615669dbd5ce787d56a055a65ae60ccb653183d08042965b4658d8bdf209d19f0dd3b536563916ea725588986ac0aaf95a624777768db82b69014544f0b65ba21d76da7136cddd0eeee18c8b1aec01a938108d31c0018598e9d46a610b4de2165861e0fe8a228d757d0eb6ba407d790e311723c00c723f4ea083d1ea05707e834410f87302a4d3c816331bb301dd99c72620b1e8023e8ba005aa401494c0358518d5e5bf6c53fca6f57622c97af233ed8fdef63f1736d7181a587d790270ff0855ffbaf772ce0b5fefce2dfd66c6fbbfbba0110b60d179bd548e891e1d1cfb6fecc121ca33f3f3fc52162dac3500642c99d92f1df08402046af12ed96034056a6388b603ace8eadfd896a7a760bd87d040081fbd9020080a5d3dada69b94b9a66394c72fccc2770fbc3f7cea7e3ba428f332701bb45b68676808b3425da84d5bad111672a48999f98c3d14e276030ba843d7b0dfd7d370390a3e08824a25920a1cc9b522288d51acd3573410daaade60cedc66012136ca78517b20f1d4247391c82ea9bd12a79f9107af7699cce793eeca8b5aa00b90087891390c3017a38c2e70239061e3091a62cc17e342be4b26f34237511689e6020d86895af45b0624fd2096ccc9d7e8ccc0d8cbedd1cc3464c4257e1fde2ba1ed778b4043b21682ce4e176147a080b493101b677f0c6dffd3c9efefed7d86afca9197f3cbbfd6fc12ee6bf2c46a38e7d350f0ebf8dc519a7343108d99fe6796c111b52a81b2d5a1e8f452e4931b20d1115c0a86c467ea226ea415405693eb83c5b7f1b4f0e1f2e1ffff8bd5cfcc03dac00c66db9b96de9c9f5736f0ddbb3e7befcee1fc1cdb16d2b7add0038facd1d4fd530ebac2bc77f39c24125e6e8d334239782ba55880bb66d413b9d9034a34c13a8d96fb04e7351eb9d2d479841a60008dbb21255ae15f58ef7d19705002fc22cdc20d0a941e80bc93c53ce98474e9f11d5976823dc290b6e1b4d29985ec4d645ccd0cd904b811e8f288719d2884be4ab2bc871427e708d74bc82871390462a72577a251a40469a2a4c856ec3c20dd3858c499d46a6608087aa9041d48955d2070b30be66bda3b51ef1dd1229c20e0f13d271e2026120ea407ef20832473c7a4951e693c977fba3f771f3c77f82db1f7fb09fe41e5e02bb3838ee07af817e88cdac5ea0fd67c0702f50341e6bb403083030ea7f9a79c8797350027f03e0db674b3aaa16df1d86040291142630540a26d57e9cf2571f3d78f0f257fed93f3b4715ddb3dbbddc0044c4f39bd369fbf60fbee16e90e777e21fbe82264509c08f00101d575270bf4be242929408c28da08bce79fe7c38c05531cf07e43251eb2ea4054fc7033467d465212764abe8bda19e16aca71325c94a8148af95e69c899e04db69418db6411ca8a713724a48aabb91686f0d59437db79fc6859bdabac5c545cdbe0a89242318a4811b418f0c3e4b2cd9311fa0f34c50f078443a1e2259a8306d2845c4578f2ac510c425a09432dcf12e467f2c9bbb5db8f244332f22bb4e7f27ed00fb260be169bba185284876a7a17170f65777683727f4dad0d7ba8f00dd0cdbcb1778ef6b7f80e5c58b8bd3ff7cfc5f1ea19214e58d073be22ec06e9bb66b03e542c7bfe30742861ffc35cb32ee2817de8697e348703350c70ecec603c6c2077101254e20aa98ae1f787f7ef3d4933c7dfcf33f7ffad297bef497580d7fb5b77bb90100c0d5b7bfddeaab17bf2339bbb78db65f22e19c138b5f5936b7d6d1ea86ba6d21f945d883eb9e609b5451d71516eec0e2cc07dc4e276ceb867a77a2f024c99ee5678d09bc2527927d5a8b684d128c1c208690134a4ea8cb026f64dad56d254eb0ae242fad2bb665410ad24abdbb632641ef98a70900453d48890bd08c257f49504d2801f2c95c50a62ba47982ce33a44c9069225906a3af35f4ce1edc7bdf53925581d61bf501019cee805622a3d05576531189f1df38d10783703cce68c746ae01ae0ff08707e0385dd4eee7f661f727882dc414e74d68302b2fca71e0bc18cf680fdff3faf286ac4301a3c7c0c57f662c62bf9f513500d4235c62113bcdfa7253d3f3c6031f16f0d8db7ffe7590a724b000dd13a4a7c3c16d6bdfb6da7fb4fdf087f6e52f7ff95e7200807bbc01bc7cfcd83ccb6fa4870f5c923884a20d2d053987c67fdd50970dd3f81aa8cc1a27bbbbf3248c28ec690a8beda11c8c108e69e634605b17d280437e3b954cd20884d4dbde29a93543129268b21000accb82a994901d1b1204e28616234477472905ad37204ef9c147efbd43252181e6a4799ad0c2e1889bcd4a804f8551e433c77e3265da8e872d980d60ce9c36665129512527b0ad419a432f4ff161ed6dc69e7c30fd30d28689945964064a0a0e7dacace1fb27023cfad83bf8d43ff8cff1f0a33fc3d5b5db7d63efb5b916655ff97b393eee04177b8710dc6395811ddc1b8bfddcefb3e7df37084449cf3a3f1e3e56f1000807b1696c10100c0f8f818384b88fdcffb89e008aa4e87d6a81fcf3e44f31d6990e074fa7ed5f3cfae4a77ffcf4e31fbfb7e53f708f3780ffedab5fedef7ff56bffb6fcdcc74cca242a2495f47565490b567d4947d67cc7344f8026b80aa6371f213d7e00bd3a60443a59efc8892ababa2eb16833daba622a8573fd00e2ac569a8808509705e204f55a6f41670d0f40a1ea2be71c6ebe86520aac354ca5602e0575e3c93f84a4ad350cab6d5721af41d9978f98ed540ac545b5613a1ee1772bbc9fe7ea241611ebe09f3ccdd5e84780b0286bcb82de1bda7202765b2dd90343cdc7d7b8590ea3130b859c065ea09130ec0e2af310e0e40562be7df00ca73ff91eb6a71f44557d01db0d8a2f80e1b8c3c7bd38ad55e2f43e4f21d03ac184d830d85d8c9f435442d44960540217a7fee8fa2f3183cb91e200fa990d3bc83d3c48b8b1c6f6243ce9c7e7ceaa86c0aec6c60c55e894bdaf6d49f3f4bb76c4cd9f3c79726f4f7fe01e6f005f06ace3763b7ded1b3f468741c4ad7304a5603fda47e457fcc7e8a90e1c32f4136f217feaa3d04341b3b68b685a94ff3973d1d2290758d715d33441c069410f35dc20e0b80bf3f94242db6ac3b62c14d2d415755db14558495d17e479466b0db555a813ab7033868eb8513b9032a614cfc179fac30d6864395a65ca51af15b656f46dd947672929faba92b8d208827af4d566c648af58f07da3fd796f5b8c2b1beab641cca8f26b0dbd192cdc8df7c4dca0e32209370a0d719245d93b424b418bb3f5d52b3cffe6b7b0bdbcc14e191ea0dbd0e88fc5efb85898b13275f8eb8db1ecf9be79f3fd67c782feffd87bd35849b2eb4cec3bf7464466bea55eed55bdb09b1425429468cb2239b2381467a4816cd88001011e73e0f96178c606c632fcd7fe2d11f61fc3b6301220588b2d0fe5b14736673492a5f168e3905a286948362971e966b39bbd5755d7f6d65c22e22ec73fce3937e265bf575d64537057b36fa33a332363c97c1967fbce39df614f32667d20e529f1be58fa117ac0e6988c5c7cbd9c9c3a971d5901472922d3b3664d3f3bd2cc8c83abe47e705e3cbae96cc658b62f56d3e6c6eaf0b0fbe8473ffab602f856d7a469da7cebee530ecccc919c17010424e552550676492a26870030a3724ab7adc2e1b3b2f6e62c965ea708195db6f31ea83d0e5787e859e6090040d34cd0b5ad6a7d566208b1f4cd6c2ae74a49117bd646992c2e7cdbc9b94152f0e38588d48150d562b17208e8da156ac51c5210de03ce19f564023f9ba0b0d17192fcbe6627b8eb855064b944ec3ae4be07a724fd043921ae5aa92158ae90db004a19b98f48a14758f6a82073006288d2dd086098e8332067ec50b80165c62200d8a055a33c33045d7beba1fbe853eb0a3c6685d5368f9082129a31a084a8fa8e1b99e9711ccec27a9c16ab522d5c66136024fcc5f5a7a13598cae6e20e309c721dda310c6717d4590900a4990b764e27a9545f8140986c6c02f3ee53b373db379aeffddef866cdffdb7a532b80f8a52ff5e1e0f08fc52d15c0cf4d26627d5890758090b495d537d295472121bef02ae28bb790e62b585b3098114340e85a257c604589091d22f6c32156a105415d5b00cd74aaeeb25af01084672026041d2c2a7508ac93813262d74bc14c1485e4342e8f513ac862df4b596f8a681a293f6e57ad807fda9012ba1661bed0f1e4421e428b25fa833972db222c1608878740d781561df26281383f022f3bc4f912b96b91962b501f90564be4b695a61aa5598f416625b8aa2a75fb369c443212aefc6de0a8d08115e5a065afc5126300f38cc4034071f75973f0eb31bf4d0eb69c7a59a478839a6dbb2e8d9494b5ebda7c031b8222f1bef653589c6f85488609f0100640f3fdc5c3d03840b698d7a19e000b9b311397ec072920ed65e47a37d9d8fa13f7d863778eae5f7f530b3ff0265700bf05a4d5abd77ecb81d9570ea80465a5cbe79135cd4610c6dbaccd418e344fbf7f84b0bb8fd84a6d3e353244849c4353cbb0d0d0f5e8572b3033362e5fc1e51ffa1036af3e849492341ce50c2461c561961a0457f912cb3ae7d4dd16cf222529ddadab0acd640ad2f2de100248ad3a0949243867d947d36b159176284a6853371338c3b972420e3dd2aa456e5bf48773d06a85743447d83b44d8df43bfbb8f345f221cec232f564267de7652ecd40b0d19c784d8b79205a96a397792fa7f8ecaa8a48358320b286822ebc8c1c25f6b16329c20978a39dddb396cbce30a000c8a400b8c49f3fa06c0953572eda5268141d306aeaa4bf800828c54c740fcc1802a0a3d8df812c339b58ab2e002c0c87a93620d3c9080662ad5825cb07e8c620e5304c36875298f66549b9b9ce7cbe75d432fd68f3cb2fcd19ffee937350008bcc915c0c780ccfbb7af71dfefbaaa66100937deee8114d2102174bd54fa99924eb990868221dd755d0f3a7f16fed1abc508e43e487f80826d74b8c0d62262d2f6a8ea1a7de8c50a2a651688d03413e9406c6aa9ffd7941f80321884531ee8ae586614b2968d5a6e3d0699f367b76a56e43df43d9033aaba41ec5ac428a5c2042723c362465eb6808e28cf8b05e2fe1ed2c121f2fc0869ef007c38477f708074b4405ccc91964ba4b6436e3bf4ab257c26a428380373963c7f3a660e4b6e5f6adf3114f82906e09c3b466e4730175f7f04cdbc343b1bb643e1f733afde187b9d1ffa02040325f88d294084b492325f3b0798076aaf4201209a40ca7751e27cd8efec095cc9cc030c67936724694131fa522731a41f752f22b03105bbc1e32107190062fd11204ca735d3a2fffd6a63fbd5efffe847d39bddfd07debca5c065ddd8db6b77dad5d3f57472513a023dc9e00c456509627d6310620f2d0492222045685d85fcf20db9a962445d574006d2e6147ed14a63518c88d76e08820ee93a8cbd74e68518d134d2835f4f26d20c444292e99c2b4872339b69af02865419144ccab98ce2f63a8e3bf5bd587b2d23ae9b065de8e1bc30f14e9c4317029263349b53f03248aa2907740bed88dc9821cc57c89c940d188073e83b993494972be11d0c516a20422fb3167206d98c43b0a427352a9741a0281c1959f3ff46aa391630cea55c0632020cd21371304758b6b074ec207e0390e76a8fe9950b585cbba9ef327202d08581bd278fc78c4b2bb6c5f1ce3b70254d5c6042b531415cae6001be2382df9821370cd70361d18a07a2ca58758ae6f94933017c2cc5085854a6750a95f5154214b34e24f675058ad4cdb6b6fff8fcf73c7677f4677a53af37bd02984c26292d967fd25c38ffd7aba69682ce4efeb6a98ba82a0fda98c0cdc5f27b4dc7b9116d578c11d564221ec17422cd3e04d49a150084b0a2b6dcb01250102446f636a946e9bc530c00493b28205e092029c9a4ecc59c753c370893d90c29284740923460ce428d5579a1f3f244c228eca874dc853e1c5330695ac12d3bc4dd16d574027861f8cd4e8421852873eef4fa40466c837424c608c75abeabe94a7224a9c568ec363a3fa1f288296a1a52803fd22a4826f172acb601a052b26b829a5342b7b72fd6988b7a28750acc62e9ab73dbf09b5300303b0e38c94a90b2f58822c510878f3c024bd769361ea9ed0bef23a98bbf73f532cebffb5dd87bf605ecbdf0a20abc7c26f31ae14c35e9e00fbbf9b202901940259fdd1499d40808f98730356fe474b4f846aea6af1c7ef8c32b3c200ac0fffffd015e6ffd2f8787e9a5d0bcb0fddd8fff9709e4c1851b06b90f98fd5bef9549371b33e0685e7a00eaef791ce1f66e69af4db516bc68e38d771e69d9168aab663a450c4179e5a56d55da648539d87b5116de7b692caa2a041bad05683edec157b5526bcb6d19ba0ebeaae418ef4b78e0eb46fa0f3473209382b4a5546b115cd3480a3133e262096a7b01d952d2f49f16fb24e11a441f05780c01792525b72e268476050e41c0ab5e69bd5904396569b7e6cc32cb5eadbf08afd63a3842d6f26063e12d01b50ab97806438191b8cab6af620186f06bec9e962de27ca5c54718acae018dfac72dcac17003dbd739a460e4252365e30a0a202159cc58dcba2d9c077663e9e95de9e6d3ce41a2522dc8da1a6c05634496d1f1a0aa869f4ce09b0655edb179ee1cfbfdee9f4cde71e50faabe3f7ae4831f7cd3c7ffc09b1c030054d1b737f7b86d6f3a473a6e5984a86a1ac417afc34f37506f6d881508012904f4376e8100a1dfca0993ab9731fbc1efd3505cdc736b0526001c136a5f49e38d73a8bc70082025d475030250358d5cb732405158749c17869dd08732d33e25b94665ee7e4a08aa189c9625d74d23745e7a73595a0e60e96fe802acaffdeadffff74441192f41273c05a16d65a065db23b5527acc46649a12c27221317acac86d40e684caf922aabef24846f2a1d4e7d6476f2ebf5504a691e09b1b3e20fcf26b8980f3a01888a4679f06a0ce84d82602f9ad29aa8d89bc597999cf500df9ba129703b0123dd6ef646715b47e502ef6bfeee808b79ff906daa323f9ddedbb99fe922f50940869ca310303ae90f50aacd464e61179a903a0aa6184b4a89bfa5f5d7aecb1bd3773f3cffa7ad32b0000882174eee2ced30ec4e449da5e8d8af9f0087c700077e9bcf4bd030018385a8a6581b2bfc688746757c0bceffd2ee4331b5afeca8535286be34edf7565882648e2d0a86e74b174cc6550478a11b1970e45d6c2a1a6a9c59a54958417758daaaaa4f1c7aca85a312924113cc139610e8a31822a8fd875404ab8f52bbf2325be04c4b617fa93ccc2e9197b2130ed25becf7d0f6446b75822274658ad902c1dc98380e4944538bdd3a941d0366841f88985f483b54bce8d528036d8036064e8fdceac883d95c21cd9cca531a708a72a84d405a4558fe6c259f8a9509ee520fc090006c85e8f2fb4ddebcbc276d55125f0c8a6b406b79f01d8680049290ffb7096de02c9c0e837a81dea9d2d549b33f1d26a0f5769da8f1c669b9b9c0f565ff49b9b2ffdc543bb2d0d15456ffaf5402880bd9b37bbc557befeb3e490a96998c849418e367184db77d1ffd917913b9981e789ca4499a6961e81747b0ff1552951ad3ff8fd98fdf887441047293f577990a6179ba69151641a2b97b201125e422299a4c38a2f3892541994fa3b1bc1470862456344af0c42700e755da16f3bb55a54a60bdbaa6aa1f4022be69019d5a441ea237c2593696208826b3869ad8d31c1650b0da44f0149ddfd3e8091159f4848294adb404c32b1d84bdc5fc03ac343589889ac77df587150c041403ae9cc32eb7e182cb691b19afb0f02361ebd0240decb21a1bd7947f819432c61d9c8ff97be7c3df858704d16bbcb4b6b1d2e94dfa54fc22e7eecb4306621c69012740c2135c92c9a2026f40773c4c54a0143bdff14009c6ccc5213f16b4df6373f8aef7f60ac3ff08028801f05d2c15f7ef58914ba2310846bafae415525537d9c874d76adab4aaab338c3390f379b4a85598aa04e5cf0fef34f826fef61faf8c300504201231a95d49d08323987d077b29fa6ea1c39a9afd78120fd6a25bc7a292a916783a0bc772909501993d0e87a639ab50a4405b0bc77a86a695a220d317c5dcb67d1aeb7d4f5c8cc1acb8a82095d275d7651485359cb56bb5e3b283d15065d1bfa1975800a0029ff2d0428d094fc33877c000020004944415496005e29276470013b59e3e23223101835d6a06003d640543afd462938530cf3576e96d72061f9415ac3023002ea98959cc31d8fe347588479094e29c98de4d7aa296da78229007036dc54cf41ceb8030de094ef424626a86cc1bef6f0de63b2b199c3eefc1557375ff69378883779e9effa7a20140001dc1eb6abfae2d997fcd606fb492d4cb8972fc0f2b3a465a22106504ee87b017cb25a0f6903965af9fee96fa0fdfc97916e4ab6c62b3017ba0e7555a16f5be428a3bc8a3fc9d6aeaa809fe6c4cb749d18d14c2632558859867db62daac9543b02339aa6461fe473e42878410a7dc9bbdba82ee31ce094842884b3288194b52f415258ce7b782265df219d5127aebd5725281394181e62d1724e6092e72989654f9c4a7e5fbe278a57206cbde20519b9a8b8f922ca046b118672f2f9413900a3e72a6556f9071c2be6e182cd8c7e750cefcb17e3c2170806aa6923c42212a194927de451f801ad4f504dc3d0f25e050132b8b410db672258fccf40ceea5564e1fbaf1c486732801993ad2da655ff9bd5b9d94bd3871e7ad397feaeaf0742010000f69e5bae5eb9fecbfecc26400e8981bc6a95224b66e6594aaf0f5100c2be07adbad2f092b582cd3121ed1d9651e3318672c3e49cd03435620c082120a81b2ee76654758550b807bc8ed5965c7fea037ce5d177ad3619914c2cf21ef5648210222aaf565e430882f214423f63927665efa509c82b3690a3f0116666e9cc8ba21c5292fafe147a21340d51db5381ead259a0ae8771df2cdd73f5745a04d97ba91d709578514939ffccfd97a7a4188910871c9fe147d07e5cf93b380768b9f631d06f54f927875b4bad72f09909d77d4bcc5f2cfb508463978d6d57485f58adb7942e038534701c46e877214fa08926c0547b9812b14d054cc4788ca8a4689daf31bd70161b572fb24b7cd45493dfdffe911fb9fbe4934f3e50ee3ff00029800f0071ff77fff09fa76fbc74985364aa2b21ec4c1909d2afeebdfca8e4bdb003ab7627756f656c5596f8d87b156e45b9532cfd026061ccb17badae95324bcf53f94af685dc84049261205ee2f2a66924d5d8c83942df237656ffaf5d753917161be79ca4f16029a60a3109b6c0da9168033a73080ada057808af5f359130c8eb20cfd8b7887d8f78fb00dc758849e92e38a15f2c918210a5baca6b56c223868018b41e80a42e42ac6a46d2bcbfbd2721320f6498e0e21db859838d1f780f683605d535fcd6ec5819ee107b8fa40de24b1c0309ed618cf78d14c2f4eaf963db699058bd160d883d8dac3c43780c439646a7f1b5cca341d60e442510516509e7e0ab0655a30d619319f3ddf99fd5b3e90bd73fb717ffce273ef1b602f8ab5a04b09fa479981f7e895264afacb6aeaee03766709b1be8c158524417846cd3d5b5806b5b3360a20336d4c20210eb4a42f794d3d0bcc3e002f48187ec0088d0ada43bb06fdb42efe5b50231e78c4a476cc710d0af5ac90034b5baae3cb8f829c96c001580ba6984b947330a6c0c465988417c5da3aa45b1587f826b6ae8481e4909769d5c0354c67ba594e01d290621fdfd041e1a7c6a2f001fa18c034f511444d654a65188cbdf6270e539e702fa599a2f93a511095411fc6c0a86f6d7638403381a04d57e64b63a8891f01b18596e0419d1ce5585d93bae423f96a486dd9a97c066c947ae0741146fed3139b783c9d96d95823c942adb6599242ba0e94cef3d5ce500efd12f5a701b53ed9afff3fc77bfefd5f9471e1a10dc07683d300a00000e9f7d76b57cf1e5ff8952ca4c0cae6b2430309ba27ad7a3e8366aeca62552e31162943afaa646b5bd25691b2dd44931c228c1592dab2361ab4d3121761daaa62e25bf563ecc9ce1bdc4e996ff778e10562b61020600bd517ca525a2de4933101162900ac0d0b603f0089410c35c6b47920ab4e59c13fa6bd22ebed23b20cc42a10b85fe3a2706395fb8129c529e5bef418c113126a51d8842946a0d4e340877d212dc821b8cca80c59bc885f30fd06a450678b144fbe5af232e56086d407f670f25030094bc3b002123f50ec7ac3ca358eb63cb3447edc18f3d0c7ee4329a8be7b0f1ce47e036a6285d8a0a1058172114b894d25f09533233382484a3a5b6904b1f400103cbf7b46beba0d6aa02d5d29c34dbdacae960f1b5e9f6c6d70ecfbcb27ab3f7fd9fb61e2805f00120eebdf8cc9fa3eb6e731fb8721e701e58b688cfbc808d731770e587fe3a36af3e046405f7ae5c405c2ee196ad54b3e52c15792cc2495a086474d55523f97a43ca2ba5138b417af9a199006be0892194d08149e8c84208807372ac21fa8e069e42e632e52785002b31b5b2e5d0f7a89a46529a5e00273f698094e048320bc40c0e41084b2a0f54be5867d6326310219a57a3bd08c224e4140c73f044c831e85c00211f65ce5a79cb52dfafa6d494958500253568020700394b130f2bf5987a03c60c2cc09f3cf15b335100002cfe3f56e967861bc3368e11eea5ebe8befc751c7cf9192c6fdc9630ce06a8422dbec5f500600c665ac3503e73d431ec4627e6063d43451b8842252f3d1cce791003d3cdad5c1db6ff6bbd7dfe950fbde343fd8306fed97aa01400009ceffba37070f0bb147a4e94d9d5353209779c5b2cb175b8443d5f0a224e043f9d20ddde95f15f491879a08c2eac94d655dd080650d542e71d43a9eb0f5d2b601d191d14a3d2a29e1482b60c0b2017da1644d20e1c753849ea45006d920c20eeb24d1772aa78a22a8eac6dc3599b8382f20dc6ae93637c25c02320e5cc31217b42ec7a544d2d69bfed4dc102b44e20046970ca46e8a1c29bb25527a28422000ae38d083d15c14d290f8cbdda509361adb9ea818c8b6ee4cb0e0d3640a9e22372087b47c821be86c85376958d63b36a82497d0f6a851a8efb80d476204ddc15e8ce320330ec5faf3bba90785c19d9b17a0983ee9121ab19ecc523abb636b071e522c8394cb66639ef1e3dbf71e1dce7d2241de0ab5f7d20851f78007a01c6eb63007ee6f0303f7798bf74e67bdef99370754544e434364dcb25305f202d5792ab0f012e33dce5f34008c2ceb33913eb180242b0dafe248d3a9a866316e61f13504e3640141a532bfea0a06354cb5c694620a584aa69943158d88958ddf0beef653f48a311b4080810e1a9aa4ab085aa42af188177d2781442408ab1d08d8380c9f73c82ea91cb880747401492944c044a59596abd32f970f13cec33da4acac66b462fe920501029f26fc22269336964b2e93f80d5008c1a828bc831498dfd90391835f7141c70cddf1fa1fe6439bf922990f745b08df66b5036a5f75fb73958c441a826b5d61208e7a14606383642dc315c990da0d5994d852bfff60f0060c4658f33172f65ec2d7f76e7d12b9ffce19ffbb923fab11f7b20dd7fe001f400f4b7dfcbabf6594a3d5009332e7949c94545c96314543dddd90562c4f4af7d2f68d6a89b288962a10a6f25ae66b12006eca520ac3e70c39f88bcb8f3392584d50a800067a48f66357d5d0b4f1f41f2c83a97802dfc700e310aa720a7a4c5370204e694646867dfa1aa6b782f8c3d3109d371ddd408b1173a2e10965f7b09dd179f9181215a9b006d7a917900492c1b67fdbbe838705560a465c865d20d2c2d4725bd6965cb52029d87587e14539bf660adc02345e139a3a40135d6c2c0f039e20758fb9d0b9837f22eec06e0b147313e7600293494283187fe3d842539c7a8683f5441a17c1eb0781dcde606a617cfc989aa0acb976e821363329b312fc22b5be7cffda18ff110c0032bfcc003a80000a07fa999f7af5cff1fb9eb9954709975c4b536df488cefc5653d5a80a3b40bc7c339c2e15cc7866b5c0f71f3720822c86a6909c2db17435f8a649ca2e25523ac3ec6bb1ffa6e40ca93b8dfb1977a01cbef5b6ebdcc37b4d7aa74e41c2c6187f3439e3f298e9d874a44a31433ebc7930a317448290b410ab4d0072a437505d4d2db500676b0e6ee15fc4c499483b9fa004a2825fbe65213207f7373bc07f45c0497472ff4d110764bfb3181752c7801fd9481bdf4ff17ef623819338e2be5a20748d38152fc0555126c797f02d846c50f8e84c8bd861be6a31013cebfffbd70d30a686af8aa467fb4407b6b171b67ce64ba7bf82bcd64ebb90ffcf88f770f6aec6feb8154001fc41361f5ecf3bf8314f63806a6a6d2062152974de7e739416ff3e102e10b4f03ab5e4839abba14b518c25ddc5c4dfb5555a523a0a50926a788d8b54859866826e516345e40ce59469631230561152272a89a46f3f802f8c528e87ed54c0ac1a90ddcc4b441f3e815e43cca0a30504d1aa9e6abbc16339156214a011393a6f7b43acd4a7701e86871b1ca71d18120b17ccc09eeec16504967a0cce303ac9d1a24350065e02663a0ea26e3081c84479d7b14e79f869002fa19cbfc417502542f00189492b9f1729099773e761ed96f146a0ce07f71e72d60a8ce6c8e1c03d110d5f6a6341d810b75b955fa3213ea4b67d01d2db07cf5aee03d4ae23addd8cc796ff1fcecccd94f3f7a6163f7412bfb3d693d900a0000f6dac9513e9c7f0a3af81355053f992093b2ba1049130db320d3f32542df2be79df4f73b0754cea1ae2a69e5854cf0110a6f29d3b5c6949022e6b12d370a20205c55d52030eaaa5630514a8163df89d551e590d5edaebc70b0185760d071e43946f89885d77044bd05b030078df2f8ac316c5d3722b831221dce65dc960017dadc548108a5a2d14681c30193cb17110e17c821485444422a12b54ea2281a48a15486964297476db4232dae8209f4100ea060029606142dc00a145a0f01002131c1502b505c7fb2f1e262d925ac2a9efd31fd60cac0f00810231e2c4a3392312e0b457a2a514966edec4cf27c757b1fbb5ff93abc35fc3819b83a3d7326d3c1f2575c1f9efb978bc53753f64bdfc4bfd11df69ae7dff6f5c02a800fdc786275f4d927fe6bd787563036e5929f48410d9408641cbf56ce9532dcd8f76068be3b2754952f373e9cd0625908eabc47570107798996c46370ce23c628fc0349f9f51455f70a1e99a5167e014d276a57e0d07484d2988349239370d4e54e2921c6506afc4dc04c802c268f292970295d6a41c7a2a75e321fde4b95a0af6a511099d1dfd905853874ea3134a418eec39ce3301d4815cb400b36be579599570377964b94efbf6ed0c796df4a8459cbb80b9d881b09348dce8751c8604a44cf096713840679329a6f030c0129d996096da2485537282620190e09f52af98d1c61b6b595f3eed1531be7763e7d545ddafd2f7ee9974e2bfcb997508f5f9fb6d6f7ff2b0d311e58054000132f0ff272f1256a3b8d0d55e075824bca3a962be7329823862065b76aa90ae73d4328c58890952b3f27a91b48316276f1321efed047b071f972b184e05c4288d8f7653a3143e8bc42d0461e2241f03566af942834f6bdb8e43ad29c972dc2cbb7c05ad6ec9d83f795928b40ce0568bf80086fec83d406c428717ce845d099c5cdcd92ee8b291e2fe8c92c5dfc4e2ae892163d8de36d490e687860dfd9d2a1cc6029371c4dcf19d000b21f49538ac5da3b35ec05bcb018e078971e83cbc00eb3f6ebc17b495142c21364f521ecbc264259f72ee710a16fce6ccab5c8c04ecd2d90936ed3a656ca6f87c96cabaf22fd423bab5f7ae2030fb5e3af897b0bfb49427fbf9ec049e7feb6ae07560130409f7bf1c5a3f685e7ff1bb46d448e3220d357922252b286fab187e136671acf8a22a8bcb472866e25ae7e2f5900cbf74bbcdf9571583946d0fe21ea5b7ba8e7dd301f502b020d3f30de0099fa238540d0421b00a2a0b2842476335a3ebe0f7dc940c410256b0071df0950005040ca1803e0e4d1d5ca8b30a2168bbdbccf80bcafe93f304bf19186290004bb501a300b33624a8524a5940c43c0cd943318ce48720a7066990006ca5c00114e915e4bcb15d9f454dc7a3dd5b1fe1ddb585a06008c9a0f30f8fff6cadc7f39a0da9c0de18110f849dbb87a0cb3ab1771feafbd0fa081e64c0a85a0acc6b5647de030d939c3f1cec1bf9e36cd67578f62f7a73ff6b1f14c9375c175382eb0f7520af712ee37e245dcf77a60150001fc5120f3eead2791e2f3d4f6e219d612b7d95cb770ed55c4a3b9a4db88759888b0e14a4cca709520eec8326558043a2b4760905fb4eb105e7c19ddc19ef4d7c708d8686ccd0e589f81d3341f9394eeca36120e7e96c614f130241d59d54da910b471e259af0f66e116d01b3706c902c800542725bf5926149b20bb5ac78925c31fb222fbb9ccf2934949a934f1e43c2e99c9c5229782209691dad103492bf924d6a682b994de79f1b9074e3db5f63469a4fa0f841c5973f9c090c8076ca0871aeea17e8049ce57b4c4b04ca90cb800a33ab3857a7bb3ec40ce61faf025ecbcf7bbc0202c6edcc69d27be0a9ed4c8248c451980dfde849f4de0eb5a40e0a6e6899fce9be47eb1df9abcf2077ff45ca4416ec6026ff9cdf1726bfb9c24d0a35bfabe14c2f8f51b5e0f5421d0fafa18801fbe73393d72a1baeb37377f82eadae59c8114952c5326f5b236e21019993c0d0d41d6ceab8540d01b7a00eb325c2543446c5a90c5c5a4dd77ce57da378062612b9df8938da918568927d1b34d0d060b19a7a26d5268e455982143420563d0325ec53192baf250c012903cb7735e47a24b39b02805b957c44b56ec40635fa842ca59084b3206979fd4fae72c6e3ecf264833c0fb5a2af8321fbb0d1922d4965a5548a03ce71407aaef01f4c731c7df62fa226252934018b9f1ac8aea5801d1f09a1c10e72bc4b61fa509c5f30af325622b5da0bd8e4f2b9e4c2564b1441ebe69e02b8f33172e66dc3afaa781f3affff1c1ee8d9fffdce7ac826a2cdca36f7aa2b09fe6dae384edb88feddfb6f5c07a00b6fe0e9eec57cfbff4fb94e32d8e81bdf7323e4c0b83e085e62b33959efe527997925262456187851402b1826f861da45eaa0893a6e66c328d650c92d60f48fdbf174051a9c040e2c61b6045aa2c92160671ce485d2f1e88a2fe76733bef356e4f05c1671362667014a00f9af1909e7dc13eb212881029df8116ec08dbf190a28b3916d39958b1053dbff53b9032ec9c7df8617cf7877f143b571f2ed47c83851e3262cc125797300380d506a41807e137724f00a081ffdf9a77e4cfa7945e849130634df851bc08eb39c81abe98820303fde112edfe615154361a3c0360e7e1c82383a449c911261b5bec96f19548fc6b37776637776fdcb000655dc8d7bd807b298193dec729db70c26b8c5ebf6165f0c02b000058cdf25e7ffbce3fc472c949197fb3a4068a65060f2016728603507987a12b90916300419a659416a774de49d38d14199972307a2a73ff0db0b2c944b1ef91b3cce2ebfb5e1401b35284eb4cf9a6d6f30828288a46627078029a4a6f6ed6ec859c23a7a4b973460a11cc4a97c532aa8c734648511d1eab1b8825bb0040c285c210ac293ea0b401db3245b0bc791787df7811ab3bbb3a00c4bc0873c18752e031160740ad360d4040d69fc408b8b8eca63840f109d4f28f428191f2190703d95286ea3350d6062dfb2cf6fd0c5b60fbd6ead45715eae9047e2a351c5b67cec4c5adfd5fb83dadbef697cf3fdf7ef2c51709e235bb7bfc5bb7eceb028fb5f7d74382d33c83d33c8237b41ee810c0d6cfdfbe9d6fe5e6d9e93b1efa7b706e83ea9a38278dc9039c5a332a962deaf0cb915b4e80d18a71963afaac2eb9d414587dbc08947332263a6b051d79576a002c155526e25495561202c030870ece01290b98677d018e4ab51a6746f24ea6fae4544a76b3a6fd7292a19e26b08c5c5c7610b420c8403d2504e52ca18b16f96416020cc30a9c864039e763c01e9891fa0ecb3b778489872d7b32a0eaec86ef7dfc76a563f51300301eddad325bbc8163961ed02e3d16e1874cf0d1aaa58219320dd38714763c16828cbf8b2982645103117c2394f0545770e4b17df61ca7ddc51f2e7cfedfff6871f3daef7df599f0eaf0f14da83d4e17e2fb11eed32cf9bd047dfd9837a414de121e0001ecf2d141daddfd2552300fc6f0eb2b24d62a3a08126c56ba5852ce4831e8c45c1e2c2ea49c585e6605fb1c8c28246af11058c28a18c6fcff43a63cae5a01144745369c3362d721c6202eb996f9826df69e58bd3c5fc2e8c3b2d51ba880194847de014e2cf7b8a90924d57cc6ed97d2001c9abb1c63d00125e2e51899078f85d0144266e4c4039dbab9f834b2dca5f5567f19904ed34591681350bb776d3007a00239ce0610b4f087067c402d3bab322d683f0f9fd784df045ef085e1ef367c76d2f1de3550d770cea36e26ec63be7d14c22f3cf9eafe2b5f7bfe76bc6db7da05486a6010feb175bf9737702f20f034d71f788302fe7aeb2de10100c0870f0ef86a474fd58f3dfa9fc1391bbb5bda6eaddc372701f3b296f40a2d96587f719f139cda8f145371cf330b3a5d2c6ce5150b10016340a8c874f0272096176cf606a52b4f0038d9e6d4d390e933928ab3e29d14655c370892efd7de86c250a4fbcbf7d256dd2ce3b98bb5cbc34cbf611fab051030d308398df2bb94f4f2487c54e025821a94a461f9d29a4490b4dac87a13545045f2d8a9e5b751e1a4e183a6504df0c7c71f4b129473d2d0c74fa6b4465a862cbe1f66009a5f90f422d991cc71a82bb8c9a4f02f9ebb7429ee5fbbf33f3c9bc367fed5f597f65f3a3aca1d009c83c3ee6b041b3859b819af5504278508b8cfc7bf12e5f0965100ff37805b97cff5cdd699ab54d73fc4754dc2ff27d9009913281c8200001eb93fa456257369f12d77a2ba88a42e3b1164ec778c4849da8983f20210a0e4113a9fce0bfd974dd5cdd952675aa493b2a412b37c363827713504784b9ed09cd9445216a29c05b4c4c89537a47e9cae3393682dbdc1300b0d738c022ce9fb29c562f18b82b19c7e1e850a25a01ffe42a09190a9e45afd0080e1d10a81ccd1a7e3345f7aaa63e72dbfcdf85d820aaefd3ca39e031af60180fadc3652db95efc20012445f2430e03c7ce3e1aa4666401270e6ca25ee6e1efceeb3ddf2d7fee8c68d1bcf1c1ea6b9dd0ced31015f4ff19d040c626ddb6942bf2edca7bd3e4de0bf6545f0a61f0e7abf8b00e6679fed5fa6cdff7ef6fef7fd2708d50ebc27549530d512015a2e9c63042771b593b2ea9077a55ad08a42649a6f0d40ca6dbd0ef2a48ab4c9462aedbcd6b1670d050a1e9e44389caf9092f4f80b1d990c1771e4907a09175c5d21749d8c124b11a83d36def930a6dff72ee49cb17aea05ac9ebb0e106979b0cc2660ad720333a2790523048ea1a423d92c3817dc03760e526f40813c26f116ecbc360b8454c9c0918ee91e94c290d357b7da1c7de3100417bb382eee3966d9a168ff284818d6b067359b802b80a2343899075034010193872ea1b97016dddec1c8edcf8357e01cdca4c6d62357108e5642f2b9b5c5b40aafbeb45a7cfc4f0e0e6e7e756f8f4904b90610d73ec87895af8fe3edc1a6040a54a1affde898f5f3adff494ebadeb76dbd2530005b043056b3dd7478f41bcee8a249dc3c2627d69664acb7f985ce2c6852d7de6e68cdbda7300c9464123289a883420011bea81e4036b04e4b6bcd4a0bb7bf6006c2c79f8b70a614b5c350883f853fd0019583bbb803dad9843fb70d776e1bec09cc52689474caaf096971d3b34c25e65ae2f96cc87f96d90449c79f17b75fbf5c52ef246978317c67f996f617364fc9fee0f657b0dc7f2a1e88151241dc7d32cf86e177cec06d6f690830f8f7b95ccb3c896131503af7ce5cb88477fc9befc7d6850b83d52f60a5621b8b150e9f7a4e95da901e94cf4d80f3a86633b8aa41bd31837384cdcdedf0f22b377feeb347472f3cb7b71718703c83df00081ba83158798f211b4040c1051c8e6709c638c1eba507eff50ff7787c43eb2d1302d8fa99c357f2f5cde9e766e72ffc0326dfb8a62619aa1185a443e3764e8c52e7aeb4d944ae0cf5041445d7515a8014cbe49c953d57d38076ac7385622c2b5868d6d486915a4421e41cc2c3ef9c4ce2212fde8885082925b8490dbfbd89bceab078ee1afa3bfb00d310bb97c61c94e34a4b73df17b0ced4bc6527325847a04301be54bc99d2ef5fd07d2e9e81597c030a25c76ede061019a8b6378010f55aa206aaab9791e74b58dc9ffb1e6e360177fa185301e8ec4063fa916bda8050f95d383390121677f790c3a08c31ec82d4f602760225c15972ff24433d1da46a32cc97d8b978898faedffd177fb15cfef6138bddbbcbf92a2620b51114662a88b108ff7a1830befabad09e26b066fd4f8aed4ff846a7ae37a410de3221802d02f2574238888747bf5d9d71ff71aca670750d6a1ac4a0649ac92ca0ce810394129a81ad09dc4397105fbd033e6a4598bd870179e4c46d3781358127681bb0620caeaed5daf78237289b1003120aa408e2a152cf919c5b58be038880f6f9eb68afdf1101ec7a212c69ea82c43351c9e967ad4b80961f3bef35ee57ab0e41cca3f2fd8bdb2fe0a64cdad5ac880a3d81914a718f0abbc401ca40ac02c552079198515dd806790f9eafd4883368da80a63506704e3d85832379ed3c686b065e2c354a18b9feacb8821979553addd11cdd722e990b16cf40467b2b24a9ae80aa30fd4fd2a44c42ededea064c1e61bec2e6991d4e7bab67beba3cfac45f2e77f7e2de227700ba092a586b430b603098048513f4751a6db73f5a1ebd363d3dba4d612021af6d1b7dfb936eef6f6f48f096f30000e0e76fdf8efb9bd33f73e72ffce74c7ec28ec818810d082416d4daaafbe09429f8b1aba8fee6fb916fef83f78eb4192615d4de0a80524a62bdd532a528b1bfb3c21366d0e60ceeca79f0528680a614d5a79696e31cb3dcad1a531b6b90142f49bd3fb73de26a25158b3983a362f45a81685583e6cea7140b4a9f8b3b2f6ebb7937c6ee33507f6b19305b4d805876b1f40238c2618d7673741f925446e65587dcf66ad7c4737067b791f70f44d1596f801e6e23db60cd52baadec0051004483388f430b020f9c83907afec11b22c0a942cb32de4cc240af43602b50e5d1cc663cab27074fdddefd992f1cec7ffd95a3fdd59e47ea6b24742024b05afeb12b8f139eaf5be2fb0501317acd6b8febefaf3f7fc361c05b52017c0ce0ff14c893ed73936ad27c84eb064c208e51e6f1c520d90045eec55516a1e3be97998177f69056bda607475371cc6ab2c105da58a3d63729771f18e0c62379070a11a9efe1c82365191a5a6af11d018d70080ea93559290e63cb73669dec9b4570148464032eaf9c071f2d512838320bbd174be92fd810fd210320e18f14f48c917f2b0536c162a08437c7c201f524a0e93849cda9e0124409ac5abdc6902918e30bd6f20b1e883ead6c984799835219a8b05c29f4d1fd0dab2834e490df8721a0a8e4fb853e9daa1aaef2a8260def9cb9d0bdf8f2cd5ffce2e1c1135f5fee1d2c73ee52106675fd9863811ec7fc3861bbedebb4c72100002000494441543fc6d64e13fe754b7e2f617ea361c2a9eb2da90000e07f5e2ce241d87cda3f74eeef12d136bc973e329dc3678d37cc02c0593340ee02b07b88bc92229fac63b1e046eefaf91d6447a010a5bf40c309b3ba64a053cc4048c0aa13145e912d56cb9a3546e510d53acbb634f20486925c43f10936a5c86ef09c331002d295f3ea9c0aebd1509537dc1fa5d00726e8da1158e27efb7c825558db6f2e91b42a186040f38b440f588709273b1a6ef5511c6f426d9220f084be1a1fafb50796622413fd02fe5938079df749dad9a7b50f9ad18153eb5fd7c2e4547b5c7ad7bbf22b5f7fe19f7e6171f8e9af1eddbdb3dfc6802cdf220faefcd8f28f85db04da64680cfc61b4fffd58fefb15e0d75304dff47a4b6501c68b00fe86dfbfdbdddafdefa80b997366780f56161e286b90586101f3cac08d2cdd74e63e43dd6db0f6ce33647e5f50524e66f0b40626329cc3466d7308e0b6d5745d02a2d26c1935952aa118a384133901e40a4390d350632cc4566568e426310471dddb00da3f449ad4c8dbb302de196897b3b1012b98a94cc5569b501e59ac35e7c1e92e8267e1034632cd106ec1da8f3481c5de389e20d327e3ca41f3a4c80d8aa3083f246b30f8fc34021d4519252848a94719251c437089ace95ff20ef052e6eb7c8533e72fe6db4fbdf899af2e0e3ff9d4fe9ddb8b366a5927d8d81b2096defef9d1a309fafaf375f77fbd07605d91ac7712de4b51dccffaa68f79cb7a0000f0f18383f493d373cfd7db931f235f3dc28ec826c8d8a86f7367a16eaacccbab64e8a8d6e4fbcbe7c0e7b6450842409c2f81d15c3f76047ae432f8702923bd880003d772062b330f2930c70072eda559c5da90595ceaa4ae7dd42121b64a879e7605e691b526884bcf5d8f345f80e7120ae41ccba00e82928668ea900be087a13a503300568c54dc7d166f402c2a06849e01bfb3299e8e7ce5928d28d6de04d6ac38a10833cc3a63cd27360fa0587cbd268ff7510551045ebd006289f52b0d6b9c13a0d18bd527e7b0757687f9a87bfe4b7bfbfff8cf776fbeb0dba755928f9fb591fc24a47f2cc4ebef61f4dee85b1c8be54fca188c63fef2539f7e471f3bf67eb6bdee7a4b2b0000f8db776ff43bc47f50ed5cf87b5cd5934c2068796c0e4139e2e5062fb1a85a5500802311f8c385007521823c2145198c9901e41091ee1e4a8f3c6745d66545b5b46578a6a2f61c23d8de57c14e49e372406e43150e71c305952f53764cd040c5c21bd827c26b545dfa19355d5914897c0a407d5efbba25be0717179f89617f1e9361534ddcf6453940318be196a622c826d4251a2114e197421e57148ba510ed961ea464f08432a1587ed6f73269883269a4f311c270ecaa4a1e5d85e9e626cfaac9fe576edcf8e5cf1eee3f7da3efe649e18c4e144085c111f1c73fc96bdcfdb54ffa9ad7b6c6efaf6fbf97c08f15c869fb9d76adfb5a6f7905f07120ffc4f6f66aabd998d775f5e3c9116580b2d5e9677b64e4207c01803c6442993f2f409f027eeabfb25a43139aa41902d22a426048373274e4b616d1e49c151c43115cc31cec7db1b8b69f481083802cb4de806428b271f4c9a71a421070c113ec962e7c02fa3d39937a1592292f0d37302cc0dc7eadcf73c39d28d90288379562b17112b7bbc15d1fd94502c04ad90eab35b00b1671d017b68b8ada80270cb2603549891832a7400aa1720860157ef60e95f7986e6cf0c6c6d6e2eb2fdff8e5cfefed7ee5b9767118c46948732039c08fcaf8c6853e277902c06b5df8b102187df2d7ec73fc4bdc9f07305606b6de48b800e03b400100c03f3a38c8d778f6b4df9abecf57d57bb27332a02a68ca2c672033b2a362fd85169b0bb00487e2524a830d23e9309271ffaa08ad58c19c19a442253308b460c8ee632fae3f911bacb701895e9b93b484179ab2b3062186a5ef507efed2f23a8ad373cee596ca23575e94cd90d128537af4738bc853c9948cdb79adc0a9b80dcef4cb703f5251581acd6b7930fb1a746107984e8195780f03f27fdc6b664d918eb846243da9dad90a7b92f209b0d601e410c1decbd4e3ca0bf5fb74c66776ce75cf7ce3a57ffce787fb5f786e353f08097def90565ad29087bfa6ab2a38d5c126fcf6de49c28db5f781d70afe496bfcde49027e9a62f896057e7dbd6541c0f122207fff2b4fee8597affd57e8da17bcb8e48c5a72c1ec1db031c5f4c33f084c1a00839b9c91c54468975e4e51ca6aeda6d3365e69c51db5eb666935ce5a7b902c7e370212669d19c088c6dda7b138583c8164190888bb5cd2823c4a45e68c7cf502f2bb1f055d3c5b7aff25a4d070438140ceb9ccf6cb69b0bca5508651ae075600115adeabb7fdb15081003855388ae8dbff0c44841f9b3c2ae5bc237a047d940b50d31c13b371eb7356b0124c482401988c4813a590341d9975a23239074fd2de7bf6fcc5f0c20bd7fed91796474f3cbb3cdadf4fe8e728ecef1e408311b017e36bfafdc728bf19ce75f06fac2c4e6a0b1edd92afd976922cae6306ebdbee779f53d75bae12f0b445007fead18b371e7ee5da7fb8f1c8a39faceaea6c4f0eec3cb1f3d2cf7ff3ae54f9b1081c47b1ba9c62999ac3998a72600d11dcc397c06d071cad9042940c43ced294934cb16750d320371262e679ab1d8610604e494c73cc3ac96768e19532dd08bb47d288b60b44e0576e0a009635554736b947b80395b7585892b4fe40c0c80c9050a96782781926900e43ad02c43c0a223ff28ac87809759f63161f00b1707c8efb795346bebbafa63b164fc3128cb9ef25d7af8a242bc8594691d3f1d25e1b509add10b238a53af7dea36e1a9c3b7f31bdf8c2cbffcfe7e6079ff9c2fce0f63c619580e84f37808c217fe15102a852d5373e2eadbd0efa3a61f8d6f6feb19c088e870c79f4fc346b7f2fbce05b5adf3657e24159cf3ffef814971ffaf7fdcef97fdc134dfb145c6a3be4b6937c7ce895ad3797b8bf584673bd19b062930c823b774698800f64dc35391be1e590309ab347ee780068f17655694a4edce12184389eef67966a432323cd666531caefb31400917362b995a6d3320ac627387839848c84e41d1072b1e2e635403fa758e93c8af155e09d2a462e465c6f6b1e650bc6adbf767e3b35951084084845f8b9143901d628a4ac47fa5192530535caf5935afebaf2a867333e7fe952fac6332ffdc61f1fee7dfaa9c3c31b0740974438c75d7bf67cbdbcb7609d18ca7dc7fbf2e89888e365bf79f43aaffdb33f471c9d33af1dcf27bc5eff87139eaf6fbbe7fa8ec000c6eb1f1e1ce4db1bd36b29fbaea9fddf88702e8a492469d55557598b60b2a14c8cc2c42bf79cdc7c0480571df2aa150baaefe794354ae4c195d5c559fafd8b30262b5b518b6f0693066f03502ba82946ab3710eb785c1158ea0fda2b400038a9e81808c90c26190ee2b666c833c05713701f054db7d0033826b0639351be110fae7d71e955886d9acff8d882f203a0da15656238031bebaffa0559738ea6b08614a6562a92784f54793892790cb3d90c672f5f4a2f3e7ffd373fb5b7fb99bf383abc7e24fed849d6d52cb4d4febf76d1da1b2698636b3d3eeff8f958898cf7cd6bfb9f76fcfa75d63186f1b693c2817baeef3805f031803fb2bb1b1f9ed55f8b7ef67033a9df97383b010399a4ca4ea9af46805aca5cb20085f1c680c1ca81631e5c5222b5d20399067907689c6f9d77b67864edc154dc5d29014e25b568dbf4280c609959e801ddb794a1c3c82bb00a4075dd5925f5dce38fe1d10fbc1fdc46ac76f7061c43c13926edc67b4da51ef4f9dabd66c24dcae1376de077b6e0aa4a5df6a1c2d19dd902bc13e00e22f26356a1d2e50829e9cd40e1f0b77fd011e7ce39f8bac6c6d616ef5cbc949e79fedaafffde9d9b7ffae4fce8ce72b0d0e666fbe39ff6981b6eaf59fb7c5d3c7eecf8b8b1a51e6f1b0bfbba1b5ff4f5e8d87550f1b473ac5bf66f59f881ef400500087bd027f7f6da8bd5c69f5153ff405d55ef8ccc2e2113c7a8c3361899930abff0d84b0e9f4aeaab14e34425e924026dcd50bde321701f90fb5e6270326b3f127600d89820f7a1083730e4fc0db01b52703c1208e8e7630d49cca5d73b6a34d5b720f6185b512e965abc9504ee1316376f20acc653af2c3340701b13b8a606f73a8094509a6fc83442530195d3a22af93e4c24c35aa2f44320b3f0152455425d0f9a4d913a69eb2de10e0ddf278d9e2b7251423299005dc17b8faaaab0b5bdcddb5b3bfd975ebafe7ffdde9d3b7ffef5c57caf934ee5f13a4940c64266824e2aa16357def61bc7f8eb827f920b3e3e1ef8e68e1dbfbffed94f5308ebcf4f5cdf910ae063003e01f07f7470a79d4cb73e8ddaff1bdef97745664a2992b8cb18c82f1852285455a033db48ab5641402a157462f919fe1d5731fdd10f22dcda45dc3d046000160d826f5842dbebfb003ba5ea32c11e09b7119226a3fe8258c881d9371710d00a714a438f56cc492fc2b0dd2c7706232e575814b65f5318432a914c09a538a0fbe694aa72214fa81fba047ff60cd2fe919cdf144f8a485a36edcfee88471234dc22e9ddb73023e9953301349b20855894406649dadb204faa2a549aeeabeb1adb3b3b3c9b6d2dfff4faabbffa07776e7de585c5fca01fdc7eb3b2c000ec79c8258da1c7e178dc6deba4b0c062fff5381da3477b2f8d8e3bc99adfcfe3ba307f4b167f7d7d472a005bff08e027f76e2f66d3339f4655bddf3bf77894b65992fef85c88308b2bbfbd893c5faa154e2218e609304b09f1de11fa6b3791dbbebc37007a2a809e24cda7bf2de70c77e53cd2d142f74fa30a40550646f9355212d9483f47161f305c40414598b7200a8d888e55d25906bcdcc55613201f4464dddaa9d5da67006444237addbcea900f17fa772b5e7e093718008780dc0709335409d9e7c82aa266e5a7ef7e14a197a12936ccb4e00795d7ba7ec26432c1ced9f3dcb8eaf08f5ebdf9ab9f7cf5c693d756ab651aacee9899c71481b9df26c4e3cabe932c3d8ff637e13fc962e7b5c7b1f0de4bb9ac0bfd69db80d385ff9b560adf71598093d6a780eaf23bdffb08b6b7ff0f9ef81f5eac5a17634fa94fc2170016949ec5ea1773a0e8b3b9e7eedc59d0e614fed205c039ac9ef8aaec470093928a68c51f3667e0655b4a7b07175ff65f07f66c9b65092c33510447e373cbd9dbfbc7ee3c0308095a60337a8d5187a015e5b02a071b4f6edd858a0d982c89d731b804e56e258cce259f51faf219508e7f098b186ed2809b1af1682eb13e01f5a50be014d0de3980529a88d27152d65b571e93c914e72e5c60eaf39d7f71edda3ff9ecee9d576ef7fd218e5bdf71ac1d749be555a53f5b1e4dc82306c1cdba7f1abd8fd176c66b9504e364847f3d83b09e29c0da7ea670d6dfc7e87a273d3f6ddb6bd677b40760ebe340fee8fe9dc585ad9ddfe30be73f5c35fea1aeed29a544469e918bdbad37bb48d8e8576754572f21ed1e20ee1f81ce6e21af3aa4b6d55455066d6d20b77d691566e7809c06333292956c938c4c11a840a762e1c7bfae281673cdcbe82f1db499312805dbdf2af924a920d73114de2ec840e94c14cf8040b5d4384041c1a2624a267ce4ddeafbd56ca2fd045cacfe704e11f6ac53966208e56f1d164bf48b164923f2d2d3ef3c9aaac6c6e6162e5cbec2e1b07df19fbffaeaaf3fb1bb7bfd4edf2d713c9d7792451d5bfef5c7d3e2fcd30478ec058c3d033a611f8cb69d143a8c430d5a3be6a4c7f13a090c7cddf5b602d0f57120ffc8deedf9c3f5d6bfec43fcde09e8bb02402127926a3ed98f3667c21140da3dc7b95067c5a30518320e3ccd5788fb07833031903b297d05c47d36fc802eec08e5574a4aaac98395c7e80e1909a91193d8adc6c0881e1c83c06b474f1ae10ad65657ce4bc3f8ac32826bf4b7294acfeec9ba866b2ae4905e838b33436af647edbdcdc31781ba465808af5671f94125739253460a3d926d83700166f32ebc17ca75e7306d1aec9c3d8b73e72ea46b37ee7ee1376f5eff7fbf78fbf6dda3143a06d801350f16785c8937f608ac80c7acfda811e498553f2d17bf9e0a5ccf0a9c64e5c7967c7cccfa9ffc548b7dca3e2709fd7d2982b715c0687d02e08fecde5a5cd938ffc9ec30abbdff41267639674a5affcf9306b431415e763ae507432c9bb3a0fa2109aa6db1394bfc3a8eb5ddb401ac7cb8ebc075050ee935825742031ce7e5cf16cb8ff100135432e591012601ce34ff7f7c420f0df1fe28c5372cf37684879fb419875392c9cb7a3e8bf533a8940433015457323aed708eb058156f24439139adddd73e4515feacb97e1c137e71fb3da69306e72f5ee4cde966f7d997ae7ff2f76fdff8fc338bf9e132a7d601d98d82130c717d8fe3d6dbfe0a961a1cbbe1273d1f5be934da8eb5fdc7c543eb8ff6d3af9f6ffc1c6bdbd78f1baf6f4bf8feb602585b9f00f8a307b7dbb317cefeeb1471d454d58733531573a60420b71d52db9570c02c1880018003c3aae686f724ede52f9c014d1a3947cea5dc9618a08da97809e6b2838bb59473d8b9c718c070dde2fec33c06650066930429402a7718a94e1ae10dc57bd0e324ded7f3b991f6b06d34fa67f72465f8ed2df8ed4dfd9e5c5c7d8659777934b39b00e4caa1be781efd6229e952476092eabeda57d8d8dcc4a5cb97997adcf9ad6bd77eeb33776f7fe3dab29df739498240baf91cdce8a7507dab8f16e79be05b6c5ff6f51a5d69e1cf1847187b0f63a11ee303c0710531b6f669f47c5df8d7e3fa7525f17acbf6fba6c380b715c009ebe340fe1b77ef763be71efb4b4addd79d777fcb81263167b2469bc97bde89ea91cb0837ef0005c4a341e0a12e3846ecbac462cd366748f365e1062096429ddc05137518b168b913cc8567201b075671f3f52e5ac325c6bea9ca39acadd7da944b343ee074a5f79f88e0a6136993767a5715ef4115130930674d87e54edcde445c75885d374898a5f0f44389140e1e417d7e07984dd1cfe7525341d2a835ad6b6c9d3983cb972ee75bb7f79ffe8d1baf7ceac9bddddbfb7dec2441cad903150b20c96e48188c8536e0b8fb9f002415f86882cf280d32291fdf7f5d48c76ebebd1e3f9aa7b12ef8a7fd1bc7fca7adfb5508ebeb5485f07616e01e8b01bafed043b3a3e9f9efdfe3f8bf81e8bd877d4f5ddf937bd7c3a82e9c457f7b0fed0bd78a100eb6944a310b402a8486f863d8471e4a72406defd0973fb2ceac5e87ddd900b4894704f8985faa4349608ac4b1587b1277de3e6f21d774547aebed2ccd4397404d85f6e5eb2045f93201f00e7e7b0bf9685e083fb3691532a166b0720248fa115ac1c7838458cdc1a49626acba460e09ecb5b3d057983613ec9c3fc7db9359f8d28d5b9ffbb3bbb7bef6f26a71183256528bc591881c534a1188c88810973f6575fdb3e89a1640f6b22d26b1f6018afa57285ddab9c571c7447e21440c023daeff37a13f0dc55f5700eb78c0690a016bcfd74389f5f771c2b6f5e7af596f2b80fb585ff9beef6b261d5d39a8fc7f8bcdc9df3dbcb55b1d759d0bb5437df512fcce36e67ff9342c5e07cc3d1617fcec473e88b86c31fffc57343e1ed26946b289629dc71e8498d5c2bc6b21050f772b00156c550e64d7d79ddc1086c8262aa63c695a1190f85ec6650ff7c9e491cb486d877eef0046df49d309dcb4c1f6dffc000efee80b08070274d2f606d2610b764385229385206a925501587f4302a47e7f632674e67d4226e142ac7d858ded6dec9c3dc7ddc1fcee1fdfb9fba74f1decde3deafb4502fa08083aeb5cce4048cc0139a70cc408f40e8819881e2e24e456ddf9e885a635689772049068140ac441304db86d3fe0b5567f1c3e8c15856d3b49c8d715c5d8fa8f75f8690a01f778bebeed5e8a02c0db0ae0be1703ee89f7bce7bceff1b756997fb6e57c79def574e6277e8c62e570ebd77e67e4019895cfa0c9145b1f7c1f0e3ef34439d7f4bbde81d4f5e8aedd94bcbe5e408e1859e53cb8eab20b0d569bcd575004dfe8b0c09a7ed3fb8c0797bf2c3375a6187478293b02a92bc2041942d2478c29bbdcc604b9ebe1b6b610e70ba13bdb9a8143924a42f566845dc829a8271755c2b062f94521489c5f9ddd06e5040e19d3d9149b67cea261ee9fbeb3fb952fefefbf7063bed8ef3875d1b94c198981901d72ca396464e644ab289316fa2cd69e6b871032128095262e7baf420fe90a04800ec705ad1f7ef2d70081ebc83ed6f639cdbae3947dd605fc240580fb78c43dde7fdb03f876ae5f7ce8a18d0f6f9c7b78bfef7fce11fd787afc6ab57fe72e1ddedc2dd3768ffda58bf12d2a01977ee247d1be720b475f7c6a00f018255c6058b9ee509c53627436ef400e4b6ae93378e83e8420ffc400f3e0f2973c3f0daf9d2a0ec6b0dd14802c023b1eda7655d91cbb8b158b48e012ce58e18e8503f699e418a94404c9886ee3ebdb7efc11f8658fa6aaf2defefcc5bf38d87ffadafce860dec7b677b96770627681e112c4dc0746ee0353c8c83d72ced1b92e0381904382eb35fdd16b84d441f2178607f4182cfcbac0af23faebd901e0b87bbf0efcbd9ec0dfeb1fd61ebf150fe05ec796f5360878ff8b00d06fcfe7e1d2deedc3472eecfcdea6a33f89778fde378bf922812833485a5407269f63268408d3c7af22c58cc327beba06f2a1a4ee2c9428cfca7b80b60b9c7877a9933ee22174c3b94b79ef80ea97165e3d060a0ae6d1f6c12489028845b8212426fa393301d3c71f467f3497ecc838de27201389b410213b00e4407505d734986c6c6173e72c269979b5686f7ffee6dd2f7c7977ef95dbcbe5419f53cc04387876a0e4402cb398118890c0c40cf4d9719419412e096d0ba54a38d3fa04a41a0851fe741d44e003066f605c0b30eeeb1fc7fbeb80dfbafbcf6bc78d95c1495ec16942ff7a423e7e7edafbaff75e596f7b00dfda2200f4ab57aeccdeb37df95c1f56ff0e27fe2910deb148891621509f232233624611742282db9ca1beb083e58baf8a39cf3414d0a8f5150b2ce26c753d66450508c480018cb30e7a8c55fe89a88cacf92875572e45aa282c83c76b8a412df91036c84e26d8c39d3db4f0662dff1d2b0af33ea8aa40dec35735269b1ba8a753b898d2e17c75e7e9d5eae93bcbc562b10a5d408c09089911139001ea32d08338e58c9865fc490a409f995ba14e751d0331c7dc65e4989c0b39e74ed97fccf2b7fa912d2538ce12606ddbf0839cecde9f66f5f994edc06bcfbbbeedb4c77b59f7f1b6f5e7a70a3ff0b60278a3cbfd03c0ffd0850bd34bb3b3576629fdedcafbbf5f39bcbb67f8798c68fb9eba7c9cb70eb309d2a22ddd72cc5c744191f891951fc844e8d8af5e84535fe582270ebf39abb290c3d53b500135394f4e1ce4a1a047af42e251888e1a003d9022fa3c9602f37808708c4c4ebc6f4f20e7c1dea36a2a54cd04f56c065f7946db77d716ab1bd7dbd58dc32e2ce76ddb25e698390780430f97c1082c6c0c313b4466ee335c97724e092e81521bb358f908f4395320a00f52a9d467aa22520a09a94dc7adbeb9ffe3dcfebd62799cf23eaf1d7b9a755f17fc75e15edf86b5e7f7e3199cb6ffa9eb6d05f06d581f05fc55a07affcee333bfc3e7ce70756192f24fd68efeddda550fc79c5d9b33fa94689533420c72176a814cca8c6418320fb17ae9793721b6f89e01782a1901291136747f6809061bdd160aa5168012c30faa43c145ab2b50afc1140a48ad7806fce61461b954c532a22f2b9e02e9fc3da1fea6aa463369e027535495475ef6e12084bd6fb4cb979721b4abb68d7dce0b8e9cb343c83965b08b0c4e89d08bc343212387cc29662030104346484401c85d868b2953ec107a267439a14fc88932622f2e7fbb16f75bfacf14c049d67aecf29fe405dcef768c5ee3847d4e7affa4c7f1ba5f217f5d25f0b602f836ad9fd27698df06fc7b81e6b18b17cf3cd46c6f4f627ffe92f7ffc10cee8741f89e89af2e92a359cc99da94d0a68c554ae85214e66068c30f0f3134185a7528ee3a80519c8f4141005a7ba06e7f1e045ea6ec8e14025014ceb82e60b0fc12b78f0945ccfdb73a05764e2a0b9d13ba73e7e0ab0abe69e09a1aaeaa00664e6d1fe7211e7cbdef5feabbd0c710fa3ef66dcec8701cc1483123833830246fcf9912113a19ab829089fb9c73cf404acc8965a6704740ee8902a7d467a2d0036da6dca73ef50988c9634509018201f41862f7f55aff75215edf6f5da84ff20c5ecfeae3847dbe55cb7fdaba2fcb6feb6d05f0ed5df453007d1a70b701b700dc7b81667b6b6bf27ddbdb334f34ab516f6c01d3f331fdc486771f9a927f7745eebc7334cd002566f4392132a34f19111921038133023382cdf0838600ac029ecdb25bb5200f1909c2505804c90a30936400c6a5c384a1f517186a06089206840078440478025c055757f05e1ee1bd08fcaa0b5d4af35753beb99be341eafbd0f5a18f31c4c8c804ee1932ae108e6266242d158ae45c1221a73e23a6ccd42520272031534b804c55ccb98b0027a29e81becb14407915802ea5147aa0a794ba08440242381ee79f84fa63edf5696e3e4ed87e2fd7ff3441ff665dfbf5f54d09fa69eb6d05f057b4c61ec10aa01ea006a87bc0cd007f65369b5d6dce4c2ac75baeaeb61aaa66df95f3077790df3d857b77e5febff6ce60478edb08c3df5f64f7cc685712d6866307088cc0c849393a3927809fc1cf23e479fc12ce43c497203a18416c38b6a495b4daed26ab2a879e91c6f2ae56109c68e1cc0f0cba49367ba631ace2cf2a7695de1fa5f70cddaab223414d5345528b608e65779ff7a091f44cdc161fbb67d2b7b9099522ca922853d2cbdd793bc5912f47b00c64f5474b866566d7923b4142a522dbda0fd2239af7969c9d659c7eebfeddf3f067d1bbf7e63d7a6f3de6e669ae251060f685def4004fdb05f9c9691bbc3cc15bc87a0f5a2a2761dea2bb83a7d4b5f8f55b44442b9a9ae3b37461ccd3b9d71ef4797275d1e7b6087f67610bbb0d3afb6ffd5d27f0af13f2cbfcfcfbc7d751f9ab28fc5542fdb308fb65382880ff013edf73b7de83fc12ec1f30382840173034587fb45e8febccb1d4ba39ceacebb2da68b49545dccab44ac43aa45b7fa4fe6153f22491baa97e40f9ad91eb403868549e24b6dabd7c83614b8c53232d844c028549429bb062690b6388c87391844c5b0e3c47302d7b68f3614b9d7dadf83a7b869b67cc1e194e784cbdf59ee96df94ac2d2dc2d832546693648325bd0c9a82923928896190316ddc8aa983cd45d9a3ce8494477ba0ae18ade9d5e1539799903e2a2c69c4e9b5d174e77ef6a8de67dbbe617f874b591ee2a217f9d32b88ece5f767cf5fcb2f25575ff551c14c0bb83f63e7c0a760efa378c33d458de6cab09b65a33d40b0658a90fb159c330661d83368cab520bd5c81c29b0a2a0526a491bac2a3262246d48b042495996115296eb9aa6712c83651d32bd5a6a9ee3f52f0000032a49444154486b92341856711594aed885eff1de22329bfb005d169198ad504481217027028c4e0f0b93ace414e1a9ad53be4594424f438a92a16838ee057047b5ce199a0c8f59d19e3a592171b51cbc4f9d08f059eaa28577b9433b97bacd737bba9de1057efed3753b5cbe4e7f534a7f198587cb05feb2f25575ef0c07057033f0620f1e2f0356eed250d987600d8a43c98535d81a0680159be2eb2c915986cc52a130028c1a98159976cc4832aa92ca8855a1d99a2a4a56326ba10c6362ab92254ab11590692b2b58019456cd5381320a9e91f34851a1932cf97f0a853559cf889e166d86ac9925a5e840eb6930f749d5431e6b2b052fa46276482c26232dfa101dc0e3e2f900ae16d1e415146afeac696e1055f226f9e37379e1b99fedcc162c019c4f79e1e878130abeaf24ae9be5afbad755b85102ff2a0e0ae0666237705fcd370f507eb35d52ac21da625fb0d8b6df5e98834e386126ccefa48e3235451493f21818330dc0224add6cec76a65db88feb6128e74cb21c6d5d6200a0cb8fa30c23231d72568fae9656abc58c060664e75e32353262229fa8f71918324bcfb4a9b5a8524cc099d48f46b40260e4696b7dbd829ce5454acfd4f793c5d1869cead4d667e8896efba8b3f821b35c9c29daddd2cae9699e425496ac60b19830f29b3d93062f95c055b88ebabf89a0df6801bf0e070570f371dd7fb4dfae3fed95ff0cf125d8b36ddd3968b31db09f803ee277fa960b3bffb5cbe6b9cc997a7fdb77eebd02b43cd649860d28dd4a94786ce777eea49d9df9f34cab716455caf1eeb32c8f8f6c90f291d538e514b8cb108fecfb4c3b066e9bf9fa38f5f429f44ccd66f18d941f031fd6daff953fa8e7899e48090fd93cfc201aa160d3e19f34d029f8dded6c7dbc7d96bfbe9e6abfc918ffc50bfa55382880ff2fec6ded0120ef83fd6539eaab6dfdce50f9abeda0ff0eb43bbfb75c97f7207f0ffadb96a97cb52720dbebed01e427100fb6f68dcf407f073e8678047ab0edb3af9860514ebbb6e3bdfadd6ff8624bc93f07fbe2c731f77f8ef1fc8b14f4030e785bbc3054be459f5d7aec17755bf7a8dd7f256df6d653a2fb2fdb7ed2f7ed1fe180030eb8893808f601071c70c0bbc27f000c62b968a55713650000000049454e44ae426082, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiars`
--

CREATE TABLE `familiars` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `datos_id` int(10) UNSIGNED NOT NULL,
  `beca_id` int(10) UNSIGNED NOT NULL,
  `parentesco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apeynom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `imagen_dni_frente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagen_dni_dorso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `ocupacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiene_trabajo` tinyint(1) NOT NULL COMMENT '0 no, 1 si',
  `actividad_laboral` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comprobante_ingresos_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comprobante_ingresos_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comprobante_ingresos_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingresos` int(11) DEFAULT NULL,
  `anses` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `familiars`
--

INSERT INTO `familiars` (`id`, `user_id`, `datos_id`, `beca_id`, `parentesco`, `apeynom`, `dni`, `imagen_dni_frente`, `imagen_dni_dorso`, `edad`, `ocupacion`, `tiene_trabajo`, `actividad_laboral`, `comprobante_ingresos_1`, `comprobante_ingresos_2`, `comprobante_ingresos_3`, `ingresos`, `anses`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 39, 4, 8, 'Hijo', 'ricardito junior', 50123654, '8/33432123/familiar-0/imagen_dni_familiar-frente-0-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/familiar-0/imagen_dni_familiar-dorso-0-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 8, 'plata', 1, 'informalfam0', '8/33432123/familiar-0/comprobante_ingresos_1-0-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', NULL, NULL, 800, '8/33432123/familiar-0/comprobante_anses-0-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.pdf', '2019-03-25 00:50:26', '2019-03-25 00:50:26', NULL),
(2, 39, 4, 8, 'Nuera', 'culebra', 17526321, '8/33432123/familiar-1/imagen_dni_familiar-frente-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/familiar-1/imagen_dni_familiar-dorso-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 50, 'rascar', 1, 'activosfam1', '8/33432123/familiar-1/comprobante_ingresos_1-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/familiar-1/comprobante_ingresos_2-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '8/33432123/familiar-1/comprobante_ingresos_3-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', 15000, '8/33432123/familiar-1/comprobante_anses-1-33432123-DIvKQdJkEX10oe1U5Tw4psdTRa5ndMlASp5D3ikPz8o206IhdHOfqATzu4jPkUJVMPJVu9iQlTo0kNmnIERD35kGNpc8pniQDpKo.jpg', '2019-03-25 00:50:26', '2019-03-25 00:50:26', NULL),
(3, 39, 5, 9, 'Otro', 'otro ricardo', 25963258, '9/33432123/familiar-0/imagen_dni_familiar-frente-0-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.jpg', '9/33432123/familiar-0/imagen_dni_familiar-dorso-0-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.jpg', 23, 'asdddd', 0, NULL, NULL, NULL, NULL, NULL, '9/33432123/familiar-0/comprobante_anses-0-33432123-Zceoonle8QUs9daK9n8CL3TFqFUm7YSYSrE9PrfX8w0dCNeUZ7HkjLDCUDVJ59OVfrlYq0NgGa50bnuBY8Egw7EkTeokJMYQxFQd.pdf', '2019-03-25 02:20:16', '2019-03-25 02:20:16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `datos_id` int(10) UNSIGNED NOT NULL,
  `beca_id` int(10) UNSIGNED NOT NULL,
  `carrera_id` int(10) UNSIGNED NOT NULL,
  `merito` float NOT NULL,
  `pto_procedencia` float DEFAULT '0',
  `pto_ingresos` float DEFAULT '0',
  `pto_enfermedad` float DEFAULT '0',
  `pto_academica` float DEFAULT '0',
  `observacion` text COLLATE utf8_unicode_ci,
  `otorgamiento` tinyint(2) NOT NULL DEFAULT '2' COMMENT '0 no, 1 si,2 pendiente, 3 suspendida',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id`, `user_id`, `datos_id`, `beca_id`, `carrera_id`, `merito`, `pto_procedencia`, `pto_ingresos`, `pto_enfermedad`, `pto_academica`, `observacion`, `otorgamiento`, `created_at`, `updated_at`) VALUES
(1, 38, 1, 8, 3, 0, 0, 0, 0, 0, 'Alta inicial', 2, '2019-03-25 00:26:55', '2019-03-25 00:26:55'),
(2, 39, 4, 8, 3, 0, 0, 0, 0, 0, 'Alta inicial', 2, '2019-03-25 00:50:26', '2019-03-25 00:50:26'),
(3, 39, 5, 9, 3, 0, 0, 0, 0, 0, 'Alta inicial', 2, '2019-03-25 02:20:16', '2019-03-25 02:20:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id` int(11) NOT NULL,
  `id_privincia` int(11) NOT NULL,
  `localidad` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id`, `id_privincia`, `localidad`) VALUES
(1, 1, '25 de Mayo'),
(2, 1, '3 de febrero'),
(3, 1, 'A. Alsina'),
(4, 1, 'A. Gonzáles Cháves'),
(5, 1, 'Aguas Verdes'),
(6, 1, 'Alberti'),
(7, 1, 'Arrecifes'),
(8, 1, 'Ayacucho'),
(9, 1, 'Azul'),
(10, 1, 'Bahía Blanca'),
(11, 1, 'Balcarce'),
(12, 1, 'Baradero'),
(13, 1, 'Benito Juárez'),
(14, 1, 'Berisso'),
(15, 1, 'Bolívar'),
(16, 1, 'Bragado'),
(17, 1, 'Brandsen'),
(18, 1, 'Campana'),
(19, 1, 'Cañuelas'),
(20, 1, 'Capilla del Señor'),
(21, 1, 'Capitán Sarmiento'),
(22, 1, 'Carapachay'),
(23, 1, 'Carhue'),
(24, 1, 'Cariló'),
(25, 1, 'Carlos Casares'),
(26, 1, 'Carlos Tejedor'),
(27, 1, 'Carmen de Areco'),
(28, 1, 'Carmen de Patagones'),
(29, 1, 'Castelli'),
(30, 1, 'Chacabuco'),
(31, 1, 'Chascomús'),
(32, 1, 'Chivilcoy'),
(33, 1, 'Colón'),
(34, 1, 'Coronel Dorrego'),
(35, 1, 'Coronel Pringles'),
(36, 1, 'Coronel Rosales'),
(37, 1, 'Coronel Suarez'),
(38, 1, 'Costa Azul'),
(39, 1, 'Costa Chica'),
(40, 1, 'Costa del Este'),
(41, 1, 'Costa Esmeralda'),
(42, 1, 'Daireaux'),
(43, 1, 'Darregueira'),
(44, 1, 'Del Viso'),
(45, 1, 'Dolores'),
(46, 1, 'Don Torcuato'),
(47, 1, 'Ensenada'),
(48, 1, 'Escobar'),
(49, 1, 'Exaltación de la Cruz'),
(50, 1, 'Florentino Ameghino'),
(51, 1, 'Garín'),
(52, 1, 'Gral. Alvarado'),
(53, 1, 'Gral. Alvear'),
(54, 1, 'Gral. Arenales'),
(55, 1, 'Gral. Belgrano'),
(56, 1, 'Gral. Guido'),
(57, 1, 'Gral. Lamadrid'),
(58, 1, 'Gral. Las Heras'),
(59, 1, 'Gral. Lavalle'),
(60, 1, 'Gral. Madariaga'),
(61, 1, 'Gral. Pacheco'),
(62, 1, 'Gral. Paz'),
(63, 1, 'Gral. Pinto'),
(64, 1, 'Gral. Pueyrredón'),
(65, 1, 'Gral. Rodríguez'),
(66, 1, 'Gral. Viamonte'),
(67, 1, 'Gral. Villegas'),
(68, 1, 'Guaminí'),
(69, 1, 'Guernica'),
(70, 1, 'Hipólito Yrigoyen'),
(71, 1, 'Ing. Maschwitz'),
(72, 1, 'Junín'),
(73, 1, 'La Plata'),
(74, 1, 'Laprida'),
(75, 1, 'Las Flores'),
(76, 1, 'Las Toninas'),
(77, 1, 'Leandro N. Alem'),
(78, 1, 'Lincoln'),
(79, 1, 'Loberia'),
(80, 1, 'Lobos'),
(81, 1, 'Los Cardales'),
(82, 1, 'Los Toldos'),
(83, 1, 'Lucila del Mar'),
(84, 1, 'Luján'),
(85, 1, 'Magdalena'),
(86, 1, 'Maipú'),
(87, 1, 'Mar Chiquita'),
(88, 1, 'Mar de Ajó'),
(89, 1, 'Mar de las Pampas'),
(90, 1, 'Mar del Plata'),
(91, 1, 'Mar del Tuyú'),
(92, 1, 'Marcos Paz'),
(93, 1, 'Mercedes'),
(94, 1, 'Miramar'),
(95, 1, 'Monte'),
(96, 1, 'Monte Hermoso'),
(97, 1, 'Munro'),
(98, 1, 'Navarro'),
(99, 1, 'Necochea'),
(100, 1, 'Olavarría'),
(101, 1, 'Partido de la Costa'),
(102, 1, 'Pehuajó'),
(103, 1, 'Pellegrini'),
(104, 1, 'Pergamino'),
(105, 1, 'Pigüé'),
(106, 1, 'Pila'),
(107, 1, 'Pilar'),
(108, 1, 'Pinamar'),
(109, 1, 'Pinar del Sol'),
(110, 1, 'Polvorines'),
(111, 1, 'Pte. Perón'),
(112, 1, 'Puán'),
(113, 1, 'Punta Indio'),
(114, 1, 'Ramallo'),
(115, 1, 'Rauch'),
(116, 1, 'Rivadavia'),
(117, 1, 'Rojas'),
(118, 1, 'Roque Pérez'),
(119, 1, 'Saavedra'),
(120, 1, 'Saladillo'),
(121, 1, 'Salliqueló'),
(122, 1, 'Salto'),
(123, 1, 'San Andrés de Giles'),
(124, 1, 'San Antonio de Areco'),
(125, 1, 'San Antonio de Padua'),
(126, 1, 'San Bernardo'),
(127, 1, 'San Cayetano'),
(128, 1, 'San Clemente del Tuyú'),
(129, 1, 'San Nicolás'),
(130, 1, 'San Pedro'),
(131, 1, 'San Vicente'),
(132, 1, 'Santa Teresita'),
(133, 1, 'Suipacha'),
(134, 1, 'Tandil'),
(135, 1, 'Tapalqué'),
(136, 1, 'Tordillo'),
(137, 1, 'Tornquist'),
(138, 1, 'Trenque Lauquen'),
(139, 1, 'Tres Lomas'),
(140, 1, 'Villa Gesell'),
(141, 1, 'Villarino'),
(142, 1, 'Zárate'),
(143, 2, '11 de Septiembre'),
(144, 2, '20 de Junio'),
(145, 2, '25 de Mayo'),
(146, 2, 'Acassuso'),
(147, 2, 'Adrogué'),
(148, 2, 'Aldo Bonzi'),
(149, 2, 'Área Reserva Cinturón Ecológico'),
(150, 2, 'Avellaneda'),
(151, 2, 'Banfield'),
(152, 2, 'Barrio Parque'),
(153, 2, 'Barrio Santa Teresita'),
(154, 2, 'Beccar'),
(155, 2, 'Bella Vista'),
(156, 2, 'Berazategui'),
(157, 2, 'Bernal Este'),
(158, 2, 'Bernal Oeste'),
(159, 2, 'Billinghurst'),
(160, 2, 'Boulogne'),
(161, 2, 'Burzaco'),
(162, 2, 'Carapachay'),
(163, 2, 'Caseros'),
(164, 2, 'Castelar'),
(165, 2, 'Churruca'),
(166, 2, 'Ciudad Evita'),
(167, 2, 'Ciudad Madero'),
(168, 2, 'Ciudadela'),
(169, 2, 'Claypole'),
(170, 2, 'Crucecita'),
(171, 2, 'Dock Sud'),
(172, 2, 'Don Bosco'),
(173, 2, 'Don Orione'),
(174, 2, 'El Jagüel'),
(175, 2, 'El Libertador'),
(176, 2, 'El Palomar'),
(177, 2, 'El Tala'),
(178, 2, 'El Trébol'),
(179, 2, 'Ezeiza'),
(180, 2, 'Ezpeleta'),
(181, 2, 'Florencio Varela'),
(182, 2, 'Florida'),
(183, 2, 'Francisco Álvarez'),
(184, 2, 'Gerli'),
(185, 2, 'Glew'),
(186, 2, 'González Catán'),
(187, 2, 'Gral. Lamadrid'),
(188, 2, 'Grand Bourg'),
(189, 2, 'Gregorio de Laferrere'),
(190, 2, 'Guillermo Enrique Hudson'),
(191, 2, 'Haedo'),
(192, 2, 'Hurlingham'),
(193, 2, 'Ing. Sourdeaux'),
(194, 2, 'Isidro Casanova'),
(195, 2, 'Ituzaingó'),
(196, 2, 'José C. Paz'),
(197, 2, 'José Ingenieros'),
(198, 2, 'José Marmol'),
(199, 2, 'La Lucila'),
(200, 2, 'La Reja'),
(201, 2, 'La Tablada'),
(202, 2, 'Lanús'),
(203, 2, 'Llavallol'),
(204, 2, 'Loma Hermosa'),
(205, 2, 'Lomas de Zamora'),
(206, 2, 'Lomas del Millón'),
(207, 2, 'Lomas del Mirador'),
(208, 2, 'Longchamps'),
(209, 2, 'Los Polvorines'),
(210, 2, 'Luis Guillón'),
(211, 2, 'Malvinas Argentinas'),
(212, 2, 'Martín Coronado'),
(213, 2, 'Martínez'),
(214, 2, 'Merlo'),
(215, 2, 'Ministro Rivadavia'),
(216, 2, 'Monte Chingolo'),
(217, 2, 'Monte Grande'),
(218, 2, 'Moreno'),
(219, 2, 'Morón'),
(220, 2, 'Muñiz'),
(221, 2, 'Olivos'),
(222, 2, 'Pablo Nogués'),
(223, 2, 'Pablo Podestá'),
(224, 2, 'Paso del Rey'),
(225, 2, 'Pereyra'),
(226, 2, 'Piñeiro'),
(227, 2, 'Plátanos'),
(228, 2, 'Pontevedra'),
(229, 2, 'Quilmes'),
(230, 2, 'Rafael Calzada'),
(231, 2, 'Rafael Castillo'),
(232, 2, 'Ramos Mejía'),
(233, 2, 'Ranelagh'),
(234, 2, 'Remedios de Escalada'),
(235, 2, 'Sáenz Peña'),
(236, 2, 'San Antonio de Padua'),
(237, 2, 'San Fernando'),
(238, 2, 'San Francisco Solano'),
(239, 2, 'San Isidro'),
(240, 2, 'San José'),
(241, 2, 'San Justo'),
(242, 2, 'San Martín'),
(243, 2, 'San Miguel'),
(244, 2, 'Santos Lugares'),
(245, 2, 'Sarandí'),
(246, 2, 'Sourigues'),
(247, 2, 'Tapiales'),
(248, 2, 'Temperley'),
(249, 2, 'Tigre'),
(250, 2, 'Tortuguitas'),
(251, 2, 'Tristán Suárez'),
(252, 2, 'Trujui'),
(253, 2, 'Turdera'),
(254, 2, 'Valentín Alsina'),
(255, 2, 'Vicente López'),
(256, 2, 'Villa Adelina'),
(257, 2, 'Villa Ballester'),
(258, 2, 'Villa Bosch'),
(259, 2, 'Villa Caraza'),
(260, 2, 'Villa Celina'),
(261, 2, 'Villa Centenario'),
(262, 2, 'Villa de Mayo'),
(263, 2, 'Villa Diamante'),
(264, 2, 'Villa Domínico'),
(265, 2, 'Villa España'),
(266, 2, 'Villa Fiorito'),
(267, 2, 'Villa Guillermina'),
(268, 2, 'Villa Insuperable'),
(269, 2, 'Villa José León Suárez'),
(270, 2, 'Villa La Florida'),
(271, 2, 'Villa Luzuriaga'),
(272, 2, 'Villa Martelli'),
(273, 2, 'Villa Obrera'),
(274, 2, 'Villa Progreso'),
(275, 2, 'Villa Raffo'),
(276, 2, 'Villa Sarmiento'),
(277, 2, 'Villa Tesei'),
(278, 2, 'Villa Udaondo'),
(279, 2, 'Virrey del Pino'),
(280, 2, 'Wilde'),
(281, 2, 'William Morris'),
(282, 3, 'Agronomía'),
(283, 3, 'Almagro'),
(284, 3, 'Balvanera'),
(285, 3, 'Barracas'),
(286, 3, 'Belgrano'),
(287, 3, 'Boca'),
(288, 3, 'Boedo'),
(289, 3, 'Caballito'),
(290, 3, 'Chacarita'),
(291, 3, 'Coghlan'),
(292, 3, 'Colegiales'),
(293, 3, 'Constitución'),
(294, 3, 'Flores'),
(295, 3, 'Floresta'),
(296, 3, 'La Paternal'),
(297, 3, 'Liniers'),
(298, 3, 'Mataderos'),
(299, 3, 'Monserrat'),
(300, 3, 'Monte Castro'),
(301, 3, 'Nueva Pompeya'),
(302, 3, 'Núñez'),
(303, 3, 'Palermo'),
(304, 3, 'Parque Avellaneda'),
(305, 3, 'Parque Chacabuco'),
(306, 3, 'Parque Chas'),
(307, 3, 'Parque Patricios'),
(308, 3, 'Puerto Madero'),
(309, 3, 'Recoleta'),
(310, 3, 'Retiro'),
(311, 3, 'Saavedra'),
(312, 3, 'San Cristóbal'),
(313, 3, 'San Nicolás'),
(314, 3, 'San Telmo'),
(315, 3, 'Vélez Sársfield'),
(316, 3, 'Versalles'),
(317, 3, 'Villa Crespo'),
(318, 3, 'Villa del Parque'),
(319, 3, 'Villa Devoto'),
(320, 3, 'Villa Gral. Mitre'),
(321, 3, 'Villa Lugano'),
(322, 3, 'Villa Luro'),
(323, 3, 'Villa Ortúzar'),
(324, 3, 'Villa Pueyrredón'),
(325, 3, 'Villa Real'),
(326, 3, 'Villa Riachuelo'),
(327, 3, 'Villa Santa Rita'),
(328, 3, 'Villa Soldati'),
(329, 3, 'Villa Urquiza'),
(330, 4, 'Aconquija'),
(331, 4, 'Ancasti'),
(332, 4, 'Andalgalá'),
(333, 4, 'Antofagasta'),
(334, 4, 'Belén'),
(335, 4, 'Capayán'),
(336, 4, 'Capital'),
(337, 4, '4'),
(338, 4, 'Corral Quemado'),
(339, 4, 'El Alto'),
(340, 4, 'El Rodeo'),
(341, 4, 'F.Mamerto Esquiú'),
(342, 4, 'Fiambalá'),
(343, 4, 'Hualfín'),
(344, 4, 'Huillapima'),
(345, 4, 'Icaño'),
(346, 4, 'La Puerta'),
(347, 4, 'Las Juntas'),
(348, 4, 'Londres'),
(349, 4, 'Los Altos'),
(350, 4, 'Los Varela'),
(351, 4, 'Mutquín'),
(352, 4, 'Paclín'),
(353, 4, 'Poman'),
(354, 4, 'Pozo de La Piedra'),
(355, 4, 'Puerta de Corral'),
(356, 4, 'Puerta San José'),
(357, 4, 'Recreo'),
(358, 4, 'S.F.V de 4'),
(359, 4, 'San Fernando'),
(360, 4, 'San Fernando del Valle'),
(361, 4, 'San José'),
(362, 4, 'Santa María'),
(363, 4, 'Santa Rosa'),
(364, 4, 'Saujil'),
(365, 4, 'Tapso'),
(366, 4, 'Tinogasta'),
(367, 4, 'Valle Viejo'),
(368, 4, 'Villa Vil'),
(369, 5, 'Aviá Teraí'),
(370, 5, 'Barranqueras'),
(371, 5, 'Basail'),
(372, 5, 'Campo Largo'),
(373, 5, 'Capital'),
(374, 5, 'Capitán Solari'),
(375, 5, 'Charadai'),
(376, 5, 'Charata'),
(377, 5, 'Chorotis'),
(378, 5, 'Ciervo Petiso'),
(379, 5, 'Cnel. Du Graty'),
(380, 5, 'Col. Benítez'),
(381, 5, 'Col. Elisa'),
(382, 5, 'Col. Popular'),
(383, 5, 'Colonias Unidas'),
(384, 5, 'Concepción'),
(385, 5, 'Corzuela'),
(386, 5, 'Cote Lai'),
(387, 5, 'El Sauzalito'),
(388, 5, 'Enrique Urien'),
(389, 5, 'Fontana'),
(390, 5, 'Fte. Esperanza'),
(391, 5, 'Gancedo'),
(392, 5, 'Gral. Capdevila'),
(393, 5, 'Gral. Pinero'),
(394, 5, 'Gral. San Martín'),
(395, 5, 'Gral. Vedia'),
(396, 5, 'Hermoso Campo'),
(397, 5, 'I. del Cerrito'),
(398, 5, 'J.J. Castelli'),
(399, 5, 'La Clotilde'),
(400, 5, 'La Eduvigis'),
(401, 5, 'La Escondida'),
(402, 5, 'La Leonesa'),
(403, 5, 'La Tigra'),
(404, 5, 'La Verde'),
(405, 5, 'Laguna Blanca'),
(406, 5, 'Laguna Limpia'),
(407, 5, 'Lapachito'),
(408, 5, 'Las Breñas'),
(409, 5, 'Las Garcitas'),
(410, 5, 'Las Palmas'),
(411, 5, 'Los Frentones'),
(412, 5, 'Machagai'),
(413, 5, 'Makallé'),
(414, 5, 'Margarita Belén'),
(415, 5, 'Miraflores'),
(416, 5, 'Misión N. Pompeya'),
(417, 5, 'Napenay'),
(418, 5, 'Pampa Almirón'),
(419, 5, 'Pampa del Indio'),
(420, 5, 'Pampa del Infierno'),
(421, 5, 'Pdcia. de La Plaza'),
(422, 5, 'Pdcia. Roca'),
(423, 5, 'Pdcia. Roque Sáenz Peña'),
(424, 5, 'Pto. Bermejo'),
(425, 5, 'Pto. Eva Perón'),
(426, 5, 'Puero Tirol'),
(427, 5, 'Puerto Vilelas'),
(428, 5, 'Quitilipi'),
(429, 5, 'Resistencia'),
(430, 5, 'Sáenz Peña'),
(431, 5, 'Samuhú'),
(432, 5, 'San Bernardo'),
(433, 5, 'Santa Sylvina'),
(434, 5, 'Taco Pozo'),
(435, 5, 'Tres Isletas'),
(436, 5, 'Villa Ángela'),
(437, 5, 'Villa Berthet'),
(438, 5, 'Villa R. Bermejito'),
(439, 6, 'Aldea Apeleg'),
(440, 6, 'Aldea Beleiro'),
(441, 6, 'Aldea Epulef'),
(442, 6, 'Alto Río Sengerr'),
(443, 6, 'Buen Pasto'),
(444, 6, 'Camarones'),
(445, 6, 'Carrenleufú'),
(446, 6, 'Cholila'),
(447, 6, 'Co. Centinela'),
(448, 6, 'Colan Conhué'),
(449, 6, 'Comodoro Rivadavia'),
(450, 6, 'Corcovado'),
(451, 6, 'Cushamen'),
(452, 6, 'Dique F. Ameghino'),
(453, 6, 'Dolavón'),
(454, 6, 'Dr. R. Rojas'),
(455, 6, 'El Hoyo'),
(456, 6, 'El Maitén'),
(457, 6, 'Epuyén'),
(458, 6, 'Esquel'),
(459, 6, 'Facundo'),
(460, 6, 'Gaimán'),
(461, 6, 'Gan Gan'),
(462, 6, 'Gastre'),
(463, 6, 'Gdor. Costa'),
(464, 6, 'Gualjaina'),
(465, 6, 'J. de San Martín'),
(466, 6, 'Lago Blanco'),
(467, 6, 'Lago Puelo'),
(468, 6, 'Lagunita Salada'),
(469, 6, 'Las Plumas'),
(470, 6, 'Los Altares'),
(471, 6, 'Paso de los Indios'),
(472, 6, 'Paso del Sapo'),
(473, 6, 'Pto. Madryn'),
(474, 6, 'Pto. Pirámides'),
(475, 6, 'Rada Tilly'),
(476, 6, 'Rawson'),
(477, 6, 'Río Mayo'),
(478, 6, 'Río Pico'),
(479, 6, 'Sarmiento'),
(480, 6, 'Tecka'),
(481, 6, 'Telsen'),
(482, 6, 'Trelew'),
(483, 6, 'Trevelin'),
(484, 6, 'Veintiocho de Julio'),
(485, 7, 'Achiras'),
(486, 7, 'Adelia Maria'),
(487, 7, 'Agua de Oro'),
(488, 7, 'Alcira Gigena'),
(489, 7, 'Aldea Santa Maria'),
(490, 7, 'Alejandro Roca'),
(491, 7, 'Alejo Ledesma'),
(492, 7, 'Alicia'),
(493, 7, 'Almafuerte'),
(494, 7, 'Alpa Corral'),
(495, 7, 'Alta Gracia'),
(496, 7, 'Alto Alegre'),
(497, 7, 'Alto de Los Quebrachos'),
(498, 7, 'Altos de Chipion'),
(499, 7, 'Amboy'),
(500, 7, 'Ambul'),
(501, 7, 'Ana Zumaran'),
(502, 7, 'Anisacate'),
(503, 7, 'Arguello'),
(504, 7, 'Arias'),
(505, 7, 'Arroyito'),
(506, 7, 'Arroyo Algodon'),
(507, 7, 'Arroyo Cabral'),
(508, 7, 'Arroyo Los Patos'),
(509, 7, 'Assunta'),
(510, 7, 'Atahona'),
(511, 7, 'Ausonia'),
(512, 7, 'Avellaneda'),
(513, 7, 'Ballesteros'),
(514, 7, 'Ballesteros Sud'),
(515, 7, 'Balnearia'),
(516, 7, 'Bañado de Soto'),
(517, 7, 'Bell Ville'),
(518, 7, 'Bengolea'),
(519, 7, 'Benjamin Gould'),
(520, 7, 'Berrotaran'),
(521, 7, 'Bialet Masse'),
(522, 7, 'Bouwer'),
(523, 7, 'Brinkmann'),
(524, 7, 'Buchardo'),
(525, 7, 'Bulnes'),
(526, 7, 'Cabalango'),
(527, 7, 'Calamuchita'),
(528, 7, 'Calchin'),
(529, 7, 'Calchin Oeste'),
(530, 7, 'Calmayo'),
(531, 7, 'Camilo Aldao'),
(532, 7, 'Caminiaga'),
(533, 7, 'Cañada de Luque'),
(534, 7, 'Cañada de Machado'),
(535, 7, 'Cañada de Rio Pinto'),
(536, 7, 'Cañada del Sauce'),
(537, 7, 'Canals'),
(538, 7, 'Candelaria Sud'),
(539, 7, 'Capilla de Remedios'),
(540, 7, 'Capilla de Siton'),
(541, 7, 'Capilla del Carmen'),
(542, 7, 'Capilla del Monte'),
(543, 7, 'Capital'),
(544, 7, 'Capitan Gral B. OŽHiggins'),
(545, 7, 'Carnerillo'),
(546, 7, 'Carrilobo'),
(547, 7, 'Casa Grande'),
(548, 7, 'Cavanagh'),
(549, 7, 'Cerro Colorado'),
(550, 7, 'Chaján'),
(551, 7, 'Chalacea'),
(552, 7, 'Chañar Viejo'),
(553, 7, 'Chancaní'),
(554, 7, 'Charbonier'),
(555, 7, 'Charras'),
(556, 7, 'Chazón'),
(557, 7, 'Chilibroste'),
(558, 7, 'Chucul'),
(559, 7, 'Chuña'),
(560, 7, 'Chuña Huasi'),
(561, 7, 'Churqui Cañada'),
(562, 7, 'Cienaga Del Coro'),
(563, 7, 'Cintra'),
(564, 7, 'Col. Almada'),
(565, 7, 'Col. Anita'),
(566, 7, 'Col. Barge'),
(567, 7, 'Col. Bismark'),
(568, 7, 'Col. Bremen'),
(569, 7, 'Col. Caroya'),
(570, 7, 'Col. Italiana'),
(571, 7, 'Col. Iturraspe'),
(572, 7, 'Col. Las Cuatro Esquinas'),
(573, 7, 'Col. Las Pichanas'),
(574, 7, 'Col. Marina'),
(575, 7, 'Col. Prosperidad'),
(576, 7, 'Col. San Bartolome'),
(577, 7, 'Col. San Pedro'),
(578, 7, 'Col. Tirolesa'),
(579, 7, 'Col. Vicente Aguero'),
(580, 7, 'Col. Videla'),
(581, 7, 'Col. Vignaud'),
(582, 7, 'Col. Waltelina'),
(583, 7, 'Colazo'),
(584, 7, 'Comechingones'),
(585, 7, 'Conlara'),
(586, 7, 'Copacabana'),
(587, 7, '7'),
(588, 7, 'Coronel Baigorria'),
(589, 7, 'Coronel Moldes'),
(590, 7, 'Corral de Bustos'),
(591, 7, 'Corralito'),
(592, 7, 'Cosquín'),
(593, 7, 'Costa Sacate'),
(594, 7, 'Cruz Alta'),
(595, 7, 'Cruz de Caña'),
(596, 7, 'Cruz del Eje'),
(597, 7, 'Cuesta Blanca'),
(598, 7, 'Dean Funes'),
(599, 7, 'Del Campillo'),
(600, 7, 'Despeñaderos'),
(601, 7, 'Devoto'),
(602, 7, 'Diego de Rojas'),
(603, 7, 'Dique Chico'),
(604, 7, 'El Arañado'),
(605, 7, 'El Brete'),
(606, 7, 'El Chacho'),
(607, 7, 'El Crispín'),
(608, 7, 'El Fortín'),
(609, 7, 'El Manzano'),
(610, 7, 'El Rastreador'),
(611, 7, 'El Rodeo'),
(612, 7, 'El Tío'),
(613, 7, 'Elena'),
(614, 7, 'Embalse'),
(615, 7, 'Esquina'),
(616, 7, 'Estación Gral. Paz'),
(617, 7, 'Estación Juárez Celman'),
(618, 7, 'Estancia de Guadalupe'),
(619, 7, 'Estancia Vieja'),
(620, 7, 'Etruria'),
(621, 7, 'Eufrasio Loza'),
(622, 7, 'Falda del Carmen'),
(623, 7, 'Freyre'),
(624, 7, 'Gral. Baldissera'),
(625, 7, 'Gral. Cabrera'),
(626, 7, 'Gral. Deheza'),
(627, 7, 'Gral. Fotheringham'),
(628, 7, 'Gral. Levalle'),
(629, 7, 'Gral. Roca'),
(630, 7, 'Guanaco Muerto'),
(631, 7, 'Guasapampa'),
(632, 7, 'Guatimozin'),
(633, 7, 'Gutenberg'),
(634, 7, 'Hernando'),
(635, 7, 'Huanchillas'),
(636, 7, 'Huerta Grande'),
(637, 7, 'Huinca Renanco'),
(638, 7, 'Idiazabal'),
(639, 7, 'Impira'),
(640, 7, 'Inriville'),
(641, 7, 'Isla Verde'),
(642, 7, 'Italó'),
(643, 7, 'James Craik'),
(644, 7, 'Jesús María'),
(645, 7, 'Jovita'),
(646, 7, 'Justiniano Posse'),
(647, 7, 'Km 658'),
(648, 7, 'L. V. Mansilla'),
(649, 7, 'La Batea'),
(650, 7, 'La Calera'),
(651, 7, 'La Carlota'),
(652, 7, 'La Carolina'),
(653, 7, 'La Cautiva'),
(654, 7, 'La Cesira'),
(655, 7, 'La Cruz'),
(656, 7, 'La Cumbre'),
(657, 7, 'La Cumbrecita'),
(658, 7, 'La Falda'),
(659, 7, 'La Francia'),
(660, 7, 'La Granja'),
(661, 7, 'La Higuera'),
(662, 7, 'La Laguna'),
(663, 7, 'La Paisanita'),
(664, 7, 'La Palestina'),
(665, 7, '12'),
(666, 7, 'La Paquita'),
(667, 7, 'La Para'),
(668, 7, 'La Paz'),
(669, 7, 'La Playa'),
(670, 7, 'La Playosa'),
(671, 7, 'La Población'),
(672, 7, 'La Posta'),
(673, 7, 'La Puerta'),
(674, 7, 'La Quinta'),
(675, 7, 'La Rancherita'),
(676, 7, 'La Rinconada'),
(677, 7, 'La Serranita'),
(678, 7, 'La Tordilla'),
(679, 7, 'Laborde'),
(680, 7, 'Laboulaye'),
(681, 7, 'Laguna Larga'),
(682, 7, 'Las Acequias'),
(683, 7, 'Las Albahacas'),
(684, 7, 'Las Arrias'),
(685, 7, 'Las Bajadas'),
(686, 7, 'Las Caleras'),
(687, 7, 'Las Calles'),
(688, 7, 'Las Cañadas'),
(689, 7, 'Las Gramillas'),
(690, 7, 'Las Higueras'),
(691, 7, 'Las Isletillas'),
(692, 7, 'Las Junturas'),
(693, 7, 'Las Palmas'),
(694, 7, 'Las Peñas'),
(695, 7, 'Las Peñas Sud'),
(696, 7, 'Las Perdices'),
(697, 7, 'Las Playas'),
(698, 7, 'Las Rabonas'),
(699, 7, 'Las Saladas'),
(700, 7, 'Las Tapias'),
(701, 7, 'Las Varas'),
(702, 7, 'Las Varillas'),
(703, 7, 'Las Vertientes'),
(704, 7, 'Leguizamón'),
(705, 7, 'Leones'),
(706, 7, 'Los Cedros'),
(707, 7, 'Los Cerrillos'),
(708, 7, 'Los Chañaritos (C.E)'),
(709, 7, 'Los Chanaritos (R.S)'),
(710, 7, 'Los Cisnes'),
(711, 7, 'Los Cocos'),
(712, 7, 'Los Cóndores'),
(713, 7, 'Los Hornillos'),
(714, 7, 'Los Hoyos'),
(715, 7, 'Los Mistoles'),
(716, 7, 'Los Molinos'),
(717, 7, 'Los Pozos'),
(718, 7, 'Los Reartes'),
(719, 7, 'Los Surgentes'),
(720, 7, 'Los Talares'),
(721, 7, 'Los Zorros'),
(722, 7, 'Lozada'),
(723, 7, 'Luca'),
(724, 7, 'Luque'),
(725, 7, 'Luyaba'),
(726, 7, 'Malagueño'),
(727, 7, 'Malena'),
(728, 7, 'Malvinas Argentinas'),
(729, 7, 'Manfredi'),
(730, 7, 'Maquinista Gallini'),
(731, 7, 'Marcos Juárez'),
(732, 7, 'Marull'),
(733, 7, 'Matorrales'),
(734, 7, 'Mattaldi'),
(735, 7, 'Mayu Sumaj'),
(736, 7, 'Media Naranja'),
(737, 7, 'Melo'),
(738, 7, 'Mendiolaza'),
(739, 7, 'Mi Granja'),
(740, 7, 'Mina Clavero'),
(741, 7, 'Miramar'),
(742, 7, 'Morrison'),
(743, 7, 'Morteros'),
(744, 7, 'Mte. Buey'),
(745, 7, 'Mte. Cristo'),
(746, 7, 'Mte. De Los Gauchos'),
(747, 7, 'Mte. Leña'),
(748, 7, 'Mte. Maíz'),
(749, 7, 'Mte. Ralo'),
(750, 7, 'Nicolás Bruzone'),
(751, 7, 'Noetinger'),
(752, 7, 'Nono'),
(753, 7, 'Nueva 7'),
(754, 7, 'Obispo Trejo'),
(755, 7, 'Olaeta'),
(756, 7, 'Oliva'),
(757, 7, 'Olivares San Nicolás'),
(758, 7, 'Onagolty'),
(759, 7, 'Oncativo'),
(760, 7, 'Ordoñez'),
(761, 7, 'Pacheco De Melo'),
(762, 7, 'Pampayasta N.'),
(763, 7, 'Pampayasta S.'),
(764, 7, 'Panaholma'),
(765, 7, 'Pascanas'),
(766, 7, 'Pasco'),
(767, 7, 'Paso del Durazno'),
(768, 7, 'Paso Viejo'),
(769, 7, 'Pilar'),
(770, 7, 'Pincén'),
(771, 7, 'Piquillín'),
(772, 7, 'Plaza de Mercedes'),
(773, 7, 'Plaza Luxardo'),
(774, 7, 'Porteña'),
(775, 7, 'Potrero de Garay'),
(776, 7, 'Pozo del Molle'),
(777, 7, 'Pozo Nuevo'),
(778, 7, 'Pueblo Italiano'),
(779, 7, 'Puesto de Castro'),
(780, 7, 'Punta del Agua'),
(781, 7, 'Quebracho Herrado'),
(782, 7, 'Quilino'),
(783, 7, 'Rafael García'),
(784, 7, 'Ranqueles'),
(785, 7, 'Rayo Cortado'),
(786, 7, 'Reducción'),
(787, 7, 'Rincón'),
(788, 7, 'Río Bamba'),
(789, 7, 'Río Ceballos'),
(790, 7, 'Río Cuarto'),
(791, 7, 'Río de Los Sauces'),
(792, 7, 'Río Primero'),
(793, 7, 'Río Segundo'),
(794, 7, 'Río Tercero'),
(795, 7, 'Rosales'),
(796, 7, 'Rosario del Saladillo'),
(797, 7, 'Sacanta'),
(798, 7, 'Sagrada Familia'),
(799, 7, 'Saira'),
(800, 7, 'Saladillo'),
(801, 7, 'Saldán'),
(802, 7, 'Salsacate'),
(803, 7, 'Salsipuedes'),
(804, 7, 'Sampacho'),
(805, 7, 'San Agustín'),
(806, 7, 'San Antonio de Arredondo'),
(807, 7, 'San Antonio de Litín'),
(808, 7, 'San Basilio'),
(809, 7, 'San Carlos Minas'),
(810, 7, 'San Clemente'),
(811, 7, 'San Esteban'),
(812, 7, 'San Francisco'),
(813, 7, 'San Ignacio'),
(814, 7, 'San Javier'),
(815, 7, 'San Jerónimo'),
(816, 7, 'San Joaquín'),
(817, 7, 'San José de La Dormida'),
(818, 7, 'San José de Las Salinas'),
(819, 7, 'San Lorenzo'),
(820, 7, 'San Marcos Sierras'),
(821, 7, 'San Marcos Sud'),
(822, 7, 'San Pedro'),
(823, 7, 'San Pedro N.'),
(824, 7, 'San Roque'),
(825, 7, 'San Vicente'),
(826, 7, 'Santa Catalina'),
(827, 7, 'Santa Elena'),
(828, 7, 'Santa Eufemia'),
(829, 7, 'Santa Maria'),
(830, 7, 'Sarmiento'),
(831, 7, 'Saturnino M.Laspiur'),
(832, 7, 'Sauce Arriba'),
(833, 7, 'Sebastián Elcano'),
(834, 7, 'Seeber'),
(835, 7, 'Segunda Usina'),
(836, 7, 'Serrano'),
(837, 7, 'Serrezuela'),
(838, 7, 'Sgo. Temple'),
(839, 7, 'Silvio Pellico'),
(840, 7, 'Simbolar'),
(841, 7, 'Sinsacate'),
(842, 7, 'Sta. Rosa de Calamuchita'),
(843, 7, 'Sta. Rosa de Río Primero'),
(844, 7, 'Suco'),
(845, 7, 'Tala Cañada'),
(846, 7, 'Tala Huasi'),
(847, 7, 'Talaini'),
(848, 7, 'Tancacha'),
(849, 7, 'Tanti'),
(850, 7, 'Ticino'),
(851, 7, 'Tinoco'),
(852, 7, 'Tío Pujio'),
(853, 7, 'Toledo'),
(854, 7, 'Toro Pujio'),
(855, 7, 'Tosno'),
(856, 7, 'Tosquita'),
(857, 7, 'Tránsito'),
(858, 7, 'Tuclame'),
(859, 7, 'Tutti'),
(860, 7, 'Ucacha'),
(861, 7, 'Unquillo'),
(862, 7, 'Valle de Anisacate'),
(863, 7, 'Valle Hermoso'),
(864, 7, 'Vélez Sarfield'),
(865, 7, 'Viamonte'),
(866, 7, 'Vicuña Mackenna'),
(867, 7, 'Villa Allende'),
(868, 7, 'Villa Amancay'),
(869, 7, 'Villa Ascasubi'),
(870, 7, 'Villa Candelaria N.'),
(871, 7, 'Villa Carlos Paz'),
(872, 7, 'Villa Cerro Azul'),
(873, 7, 'Villa Ciudad de América'),
(874, 7, 'Villa Ciudad Pque Los Reartes'),
(875, 7, 'Villa Concepción del Tío'),
(876, 7, 'Villa Cura Brochero'),
(877, 7, 'Villa de Las Rosas'),
(878, 7, 'Villa de María'),
(879, 7, 'Villa de Pocho'),
(880, 7, 'Villa de Soto'),
(881, 7, 'Villa del Dique'),
(882, 7, 'Villa del Prado'),
(883, 7, 'Villa del Rosario'),
(884, 7, 'Villa del Totoral'),
(885, 7, 'Villa Dolores'),
(886, 7, 'Villa El Chancay'),
(887, 7, 'Villa Elisa'),
(888, 7, 'Villa Flor Serrana'),
(889, 7, 'Villa Fontana'),
(890, 7, 'Villa Giardino'),
(891, 7, 'Villa Gral. Belgrano'),
(892, 7, 'Villa Gutierrez'),
(893, 7, 'Villa Huidobro'),
(894, 7, 'Villa La Bolsa'),
(895, 7, 'Villa Los Aromos'),
(896, 7, 'Villa Los Patos'),
(897, 7, 'Villa María'),
(898, 7, 'Villa Nueva'),
(899, 7, 'Villa Pque. Santa Ana'),
(900, 7, 'Villa Pque. Siquiman'),
(901, 7, 'Villa Quillinzo'),
(902, 7, 'Villa Rossi'),
(903, 7, 'Villa Rumipal'),
(904, 7, 'Villa San Esteban'),
(905, 7, 'Villa San Isidro'),
(906, 7, 'Villa 21'),
(907, 7, 'Villa Sarmiento (G.R)'),
(908, 7, 'Villa Sarmiento (S.A)'),
(909, 7, 'Villa Tulumba'),
(910, 7, 'Villa Valeria'),
(911, 7, 'Villa Yacanto'),
(912, 7, 'Washington'),
(913, 7, 'Wenceslao Escalante'),
(914, 7, 'Ycho Cruz Sierras'),
(915, 8, 'Alvear'),
(916, 8, 'Bella Vista'),
(917, 8, 'Berón de Astrada'),
(918, 8, 'Bonpland'),
(919, 8, 'Caá Cati'),
(920, 8, 'Capital'),
(921, 8, 'Chavarría'),
(922, 8, 'Col. C. Pellegrini'),
(923, 8, 'Col. Libertad'),
(924, 8, 'Col. Liebig'),
(925, 8, 'Col. Sta Rosa'),
(926, 8, 'Concepción'),
(927, 8, 'Cruz de Los Milagros'),
(928, 8, 'Curuzú-Cuatiá'),
(929, 8, 'Empedrado'),
(930, 8, 'Esquina'),
(931, 8, 'Estación Torrent'),
(932, 8, 'Felipe Yofré'),
(933, 8, 'Garruchos'),
(934, 8, 'Gdor. Agrónomo'),
(935, 8, 'Gdor. Martínez'),
(936, 8, 'Goya'),
(937, 8, 'Guaviravi'),
(938, 8, 'Herlitzka'),
(939, 8, 'Ita-Ibate'),
(940, 8, 'Itatí'),
(941, 8, 'Ituzaingó'),
(942, 8, 'José Rafael Gómez'),
(943, 8, 'Juan Pujol'),
(944, 8, 'La Cruz'),
(945, 8, 'Lavalle'),
(946, 8, 'Lomas de Vallejos'),
(947, 8, 'Loreto'),
(948, 8, 'Mariano I. Loza'),
(949, 8, 'Mburucuyá'),
(950, 8, 'Mercedes'),
(951, 8, 'Mocoretá'),
(952, 8, 'Mte. Caseros'),
(953, 8, 'Nueve de Julio'),
(954, 8, 'Palmar Grande'),
(955, 8, 'Parada Pucheta'),
(956, 8, 'Paso de La Patria'),
(957, 8, 'Paso de Los Libres'),
(958, 8, 'Pedro R. Fernandez'),
(959, 8, 'Perugorría'),
(960, 8, 'Pueblo Libertador'),
(961, 8, 'Ramada Paso'),
(962, 8, 'Riachuelo'),
(963, 8, 'Saladas'),
(964, 8, 'San Antonio'),
(965, 8, 'San Carlos'),
(966, 8, 'San Cosme'),
(967, 8, 'San Lorenzo'),
(968, 8, '20 del Palmar'),
(969, 8, 'San Miguel'),
(970, 8, 'San Roque'),
(971, 8, 'Santa Ana'),
(972, 8, 'Santa Lucía'),
(973, 8, 'Santo Tomé'),
(974, 8, 'Sauce'),
(975, 8, 'Tabay'),
(976, 8, 'Tapebicuá'),
(977, 8, 'Tatacua'),
(978, 8, 'Virasoro'),
(979, 8, 'Yapeyú'),
(980, 8, 'Yataití Calle'),
(981, 9, 'Alarcón'),
(982, 9, 'Alcaraz'),
(983, 9, 'Alcaraz N.'),
(984, 9, 'Alcaraz S.'),
(985, 9, 'Aldea Asunción'),
(986, 9, 'Aldea Brasilera'),
(987, 9, 'Aldea Elgenfeld'),
(988, 9, 'Aldea Grapschental'),
(989, 9, 'Aldea Ma. Luisa'),
(990, 9, 'Aldea Protestante'),
(991, 9, 'Aldea Salto'),
(992, 9, 'Aldea San Antonio (G)'),
(993, 9, 'Aldea San Antonio (P)'),
(994, 9, 'Aldea 19'),
(995, 9, 'Aldea San Miguel'),
(996, 9, 'Aldea San Rafael'),
(997, 9, 'Aldea Spatzenkutter'),
(998, 9, 'Aldea Sta. María'),
(999, 9, 'Aldea Sta. Rosa'),
(1000, 9, 'Aldea Valle María'),
(1001, 9, 'Altamirano Sur'),
(1002, 9, 'Antelo'),
(1003, 9, 'Antonio Tomás'),
(1004, 9, 'Aranguren'),
(1005, 9, 'Arroyo Barú'),
(1006, 9, 'Arroyo Burgos'),
(1007, 9, 'Arroyo Clé'),
(1008, 9, 'Arroyo Corralito'),
(1009, 9, 'Arroyo del Medio'),
(1010, 9, 'Arroyo Maturrango'),
(1011, 9, 'Arroyo Palo Seco'),
(1012, 9, 'Banderas'),
(1013, 9, 'Basavilbaso'),
(1014, 9, 'Betbeder'),
(1015, 9, 'Bovril'),
(1016, 9, 'Caseros'),
(1017, 9, 'Ceibas'),
(1018, 9, 'Cerrito'),
(1019, 9, 'Chajarí'),
(1020, 9, 'Chilcas'),
(1021, 9, 'Clodomiro Ledesma'),
(1022, 9, 'Col. Alemana'),
(1023, 9, 'Col. Avellaneda'),
(1024, 9, 'Col. Avigdor'),
(1025, 9, 'Col. Ayuí'),
(1026, 9, 'Col. Baylina'),
(1027, 9, 'Col. Carrasco'),
(1028, 9, 'Col. Celina'),
(1029, 9, 'Col. Cerrito'),
(1030, 9, 'Col. Crespo'),
(1031, 9, 'Col. Elia'),
(1032, 9, 'Col. Ensayo'),
(1033, 9, 'Col. Gral. Roca'),
(1034, 9, 'Col. La Argentina'),
(1035, 9, 'Col. Merou'),
(1036, 9, 'Col. Oficial Nª3'),
(1037, 9, 'Col. Oficial Nº13'),
(1038, 9, 'Col. Oficial Nº14'),
(1039, 9, 'Col. Oficial Nº5'),
(1040, 9, 'Col. Reffino'),
(1041, 9, 'Col. Tunas'),
(1042, 9, 'Col. Viraró'),
(1043, 9, 'Colón'),
(1044, 9, 'Concepción del Uruguay'),
(1045, 9, 'Concordia'),
(1046, 9, 'Conscripto Bernardi'),
(1047, 9, 'Costa Grande'),
(1048, 9, 'Costa San Antonio'),
(1049, 9, 'Costa Uruguay N.'),
(1050, 9, 'Costa Uruguay S.'),
(1051, 9, 'Crespo'),
(1052, 9, 'Crucecitas 3ª'),
(1053, 9, 'Crucecitas 7ª'),
(1054, 9, 'Crucecitas 8ª'),
(1055, 9, 'Cuchilla Redonda'),
(1056, 9, 'Curtiembre'),
(1057, 9, 'Diamante'),
(1058, 9, 'Distrito 6º'),
(1059, 9, 'Distrito Chañar'),
(1060, 9, 'Distrito Chiqueros'),
(1061, 9, 'Distrito Cuarto'),
(1062, 9, 'Distrito Diego López'),
(1063, 9, 'Distrito Pajonal'),
(1064, 9, 'Distrito Sauce'),
(1065, 9, 'Distrito Tala'),
(1066, 9, 'Distrito Talitas'),
(1067, 9, 'Don Cristóbal 1ª Sección'),
(1068, 9, 'Don Cristóbal 2ª Sección'),
(1069, 9, 'Durazno'),
(1070, 9, 'El Cimarrón'),
(1071, 9, 'El Gramillal'),
(1072, 9, 'El Palenque'),
(1073, 9, 'El Pingo'),
(1074, 9, 'El Quebracho'),
(1075, 9, 'El Redomón'),
(1076, 9, 'El Solar'),
(1077, 9, 'Enrique Carbo'),
(1078, 9, '9'),
(1079, 9, 'Espinillo N.'),
(1080, 9, 'Estación Campos'),
(1081, 9, 'Estación Escriña'),
(1082, 9, 'Estación Lazo'),
(1083, 9, 'Estación Raíces'),
(1084, 9, 'Estación Yerúa'),
(1085, 9, 'Estancia Grande'),
(1086, 9, 'Estancia Líbaros'),
(1087, 9, 'Estancia Racedo'),
(1088, 9, 'Estancia Solá'),
(1089, 9, 'Estancia Yuquerí'),
(1090, 9, 'Estaquitas'),
(1091, 9, 'Faustino M. Parera'),
(1092, 9, 'Febre'),
(1093, 9, 'Federación'),
(1094, 9, 'Federal'),
(1095, 9, 'Gdor. Echagüe'),
(1096, 9, 'Gdor. Mansilla'),
(1097, 9, 'Gilbert'),
(1098, 9, 'González Calderón'),
(1099, 9, 'Gral. Almada'),
(1100, 9, 'Gral. Alvear'),
(1101, 9, 'Gral. Campos'),
(1102, 9, 'Gral. Galarza'),
(1103, 9, 'Gral. Ramírez'),
(1104, 9, 'Gualeguay'),
(1105, 9, 'Gualeguaychú'),
(1106, 9, 'Gualeguaycito'),
(1107, 9, 'Guardamonte'),
(1108, 9, 'Hambis'),
(1109, 9, 'Hasenkamp'),
(1110, 9, 'Hernandarias'),
(1111, 9, 'Hernández'),
(1112, 9, 'Herrera'),
(1113, 9, 'Hinojal'),
(1114, 9, 'Hocker'),
(1115, 9, 'Ing. Sajaroff'),
(1116, 9, 'Irazusta'),
(1117, 9, 'Isletas'),
(1118, 9, 'J.J De Urquiza'),
(1119, 9, 'Jubileo'),
(1120, 9, 'La Clarita'),
(1121, 9, 'La Criolla'),
(1122, 9, 'La Esmeralda'),
(1123, 9, 'La Florida'),
(1124, 9, 'La Fraternidad'),
(1125, 9, 'La Hierra'),
(1126, 9, 'La Ollita'),
(1127, 9, 'La Paz'),
(1128, 9, 'La Picada'),
(1129, 9, 'La Providencia'),
(1130, 9, 'La Verbena'),
(1131, 9, 'Laguna Benítez'),
(1132, 9, 'Larroque'),
(1133, 9, 'Las Cuevas'),
(1134, 9, 'Las Garzas'),
(1135, 9, 'Las Guachas'),
(1136, 9, 'Las Mercedes'),
(1137, 9, 'Las Moscas'),
(1138, 9, 'Las Mulitas'),
(1139, 9, 'Las Toscas'),
(1140, 9, 'Laurencena'),
(1141, 9, 'Libertador San Martín'),
(1142, 9, 'Loma Limpia'),
(1143, 9, 'Los Ceibos'),
(1144, 9, 'Los Charruas'),
(1145, 9, 'Los Conquistadores'),
(1146, 9, 'Lucas González'),
(1147, 9, 'Lucas N.'),
(1148, 9, 'Lucas S. 1ª'),
(1149, 9, 'Lucas S. 2ª'),
(1150, 9, 'Maciá'),
(1151, 9, 'María Grande'),
(1152, 9, 'María Grande 2ª'),
(1153, 9, 'Médanos'),
(1154, 9, 'Mojones N.'),
(1155, 9, 'Mojones S.'),
(1156, 9, 'Molino Doll'),
(1157, 9, 'Monte Redondo'),
(1158, 9, 'Montoya'),
(1159, 9, 'Mulas Grandes'),
(1160, 9, 'Ñancay'),
(1161, 9, 'Nogoyá'),
(1162, 9, 'Nueva Escocia'),
(1163, 9, 'Nueva Vizcaya'),
(1164, 9, 'Ombú'),
(1165, 9, 'Oro Verde'),
(1166, 9, 'Paraná'),
(1167, 9, 'Pasaje Guayaquil'),
(1168, 9, 'Pasaje Las Tunas'),
(1169, 9, 'Paso de La Arena'),
(1170, 9, 'Paso de La Laguna'),
(1171, 9, 'Paso de Las Piedras'),
(1172, 9, 'Paso Duarte'),
(1173, 9, 'Pastor Britos'),
(1174, 9, 'Pedernal'),
(1175, 9, 'Perdices'),
(1176, 9, 'Picada Berón'),
(1177, 9, 'Piedras Blancas'),
(1178, 9, 'Primer Distrito Cuchilla'),
(1179, 9, 'Primero de Mayo'),
(1180, 9, 'Pronunciamiento'),
(1181, 9, 'Pto. Algarrobo'),
(1182, 9, 'Pto. Ibicuy'),
(1183, 9, 'Pueblo Brugo'),
(1184, 9, 'Pueblo Cazes'),
(1185, 9, 'Pueblo Gral. Belgrano'),
(1186, 9, 'Pueblo Liebig'),
(1187, 9, 'Puerto Yeruá'),
(1188, 9, 'Punta del Monte'),
(1189, 9, 'Quebracho'),
(1190, 9, 'Quinto Distrito'),
(1191, 9, 'Raices Oeste'),
(1192, 9, 'Rincón de Nogoyá'),
(1193, 9, 'Rincón del Cinto'),
(1194, 9, 'Rincón del Doll'),
(1195, 9, 'Rincón del Gato'),
(1196, 9, 'Rocamora'),
(1197, 9, 'Rosario del Tala'),
(1198, 9, 'San Benito'),
(1199, 9, 'San Cipriano'),
(1200, 9, 'San Ernesto'),
(1201, 9, 'San Gustavo'),
(1202, 9, 'San Jaime'),
(1203, 9, 'San José'),
(1204, 9, 'San José de Feliciano'),
(1205, 9, 'San Justo'),
(1206, 9, 'San Marcial'),
(1207, 9, 'San Pedro'),
(1208, 9, 'San Ramírez'),
(1209, 9, 'San Ramón'),
(1210, 9, 'San Roque'),
(1211, 9, 'San Salvador'),
(1212, 9, 'San Víctor'),
(1213, 9, 'Santa Ana'),
(1214, 9, 'Santa Anita'),
(1215, 9, 'Santa Elena'),
(1216, 9, 'Santa Lucía'),
(1217, 9, 'Santa Luisa'),
(1218, 9, 'Sauce de Luna'),
(1219, 9, 'Sauce Montrull'),
(1220, 9, 'Sauce Pinto'),
(1221, 9, 'Sauce Sur'),
(1222, 9, 'Seguí'),
(1223, 9, 'Sir Leonard'),
(1224, 9, 'Sosa'),
(1225, 9, 'Tabossi'),
(1226, 9, 'Tezanos Pinto'),
(1227, 9, 'Ubajay'),
(1228, 9, 'Urdinarrain'),
(1229, 9, 'Veinte de Septiembre'),
(1230, 9, 'Viale'),
(1231, 9, 'Victoria'),
(1232, 9, 'Villa Clara'),
(1233, 9, 'Villa del Rosario'),
(1234, 9, 'Villa Domínguez'),
(1235, 9, 'Villa Elisa'),
(1236, 9, 'Villa Fontana'),
(1237, 9, 'Villa Gdor. Etchevehere'),
(1238, 9, 'Villa Mantero'),
(1239, 9, 'Villa Paranacito'),
(1240, 9, 'Villa Urquiza'),
(1241, 9, 'Villaguay'),
(1242, 9, 'Walter Moss'),
(1243, 9, 'Yacaré'),
(1244, 9, 'Yeso Oeste'),
(1245, 10, 'Buena Vista'),
(1246, 10, 'Clorinda'),
(1247, 10, 'Col. Pastoril'),
(1248, 10, 'Cte. Fontana'),
(1249, 10, 'El Colorado'),
(1250, 10, 'El Espinillo'),
(1251, 10, 'Estanislao Del Campo'),
(1252, 10, '10'),
(1253, 10, 'Fortín Lugones'),
(1254, 10, 'Gral. Lucio V. Mansilla'),
(1255, 10, 'Gral. Manuel Belgrano'),
(1256, 10, 'Gral. Mosconi'),
(1257, 10, 'Gran Guardia'),
(1258, 10, 'Herradura'),
(1259, 10, 'Ibarreta'),
(1260, 10, 'Ing. Juárez'),
(1261, 10, 'Laguna Blanca'),
(1262, 10, 'Laguna Naick Neck'),
(1263, 10, 'Laguna Yema'),
(1264, 10, 'Las Lomitas'),
(1265, 10, 'Los Chiriguanos'),
(1266, 10, 'Mayor V. Villafañe'),
(1267, 10, 'Misión San Fco.'),
(1268, 10, 'Palo Santo'),
(1269, 10, 'Pirané'),
(1270, 10, 'Pozo del Maza'),
(1271, 10, 'Riacho He-He'),
(1272, 10, 'San Hilario'),
(1273, 10, 'San Martín II'),
(1274, 10, 'Siete Palmas'),
(1275, 10, 'Subteniente Perín'),
(1276, 10, 'Tres Lagunas'),
(1277, 10, 'Villa Dos Trece'),
(1278, 10, 'Villa Escolar'),
(1279, 10, 'Villa Gral. Güemes'),
(1280, 11, 'Abdon Castro Tolay'),
(1281, 11, 'Abra Pampa'),
(1282, 11, 'Abralaite'),
(1283, 11, 'Aguas Calientes'),
(1284, 11, 'Arrayanal'),
(1285, 11, 'Barrios'),
(1286, 11, 'Caimancito'),
(1287, 11, 'Calilegua'),
(1288, 11, 'Cangrejillos'),
(1289, 11, 'Caspala'),
(1290, 11, 'Catuá'),
(1291, 11, 'Cieneguillas'),
(1292, 11, 'Coranzulli'),
(1293, 11, 'Cusi-Cusi'),
(1294, 11, 'El Aguilar'),
(1295, 11, 'El Carmen'),
(1296, 11, 'El Cóndor'),
(1297, 11, 'El Fuerte'),
(1298, 11, 'El Piquete'),
(1299, 11, 'El Talar'),
(1300, 11, 'Fraile Pintado'),
(1301, 11, 'Hipólito Yrigoyen'),
(1302, 11, 'Huacalera'),
(1303, 11, 'Humahuaca'),
(1304, 11, 'La Esperanza'),
(1305, 11, 'La Mendieta'),
(1306, 11, 'La Quiaca'),
(1307, 11, 'Ledesma'),
(1308, 11, 'Libertador Gral. San Martin'),
(1309, 11, 'Maimara'),
(1310, 11, 'Mina Pirquitas'),
(1311, 11, 'Monterrico'),
(1312, 11, 'Palma Sola'),
(1313, 11, 'Palpalá'),
(1314, 11, 'Pampa Blanca'),
(1315, 11, 'Pampichuela'),
(1316, 11, 'Perico'),
(1317, 11, 'Puesto del Marqués'),
(1318, 11, 'Puesto Viejo'),
(1319, 11, 'Pumahuasi'),
(1320, 11, 'Purmamarca'),
(1321, 11, 'Rinconada'),
(1322, 11, 'Rodeitos'),
(1323, 11, 'Rosario de Río Grande'),
(1324, 11, 'San Antonio'),
(1325, 11, 'San Francisco'),
(1326, 11, 'San Pedro'),
(1327, 11, 'San Rafael'),
(1328, 11, 'San Salvador'),
(1329, 11, 'Santa Ana'),
(1330, 11, 'Santa Catalina'),
(1331, 11, 'Santa Clara'),
(1332, 11, 'Susques'),
(1333, 11, 'Tilcara'),
(1334, 11, 'Tres Cruces'),
(1335, 11, 'Tumbaya'),
(1336, 11, 'Valle Grande'),
(1337, 11, 'Vinalito'),
(1338, 11, 'Volcán'),
(1339, 11, 'Yala'),
(1340, 11, 'Yaví'),
(1341, 11, 'Yuto'),
(1342, 12, 'Abramo'),
(1343, 12, 'Adolfo Van Praet'),
(1344, 12, 'Agustoni'),
(1345, 12, 'Algarrobo del Aguila'),
(1346, 12, 'Alpachiri'),
(1347, 12, 'Alta Italia'),
(1348, 12, 'Anguil'),
(1349, 12, 'Arata'),
(1350, 12, 'Ataliva Roca'),
(1351, 12, 'Bernardo Larroude'),
(1352, 12, 'Bernasconi'),
(1353, 12, 'Caleufú'),
(1354, 12, 'Carro Quemado'),
(1355, 12, 'Catriló'),
(1356, 12, 'Ceballos'),
(1357, 12, 'Chacharramendi'),
(1358, 12, 'Col. Barón'),
(1359, 12, 'Col. Santa María'),
(1360, 12, 'Conhelo'),
(1361, 12, 'Coronel Hilario Lagos'),
(1362, 12, 'Cuchillo-Có'),
(1363, 12, 'Doblas'),
(1364, 12, 'Dorila'),
(1365, 12, 'Eduardo Castex'),
(1366, 12, 'Embajador Martini'),
(1367, 12, 'Falucho'),
(1368, 12, 'Gral. Acha'),
(1369, 12, 'Gral. Manuel Campos'),
(1370, 12, 'Gral. Pico'),
(1371, 12, 'Guatraché'),
(1372, 12, 'Ing. Luiggi'),
(1373, 12, 'Intendente Alvear'),
(1374, 12, 'Jacinto Arauz'),
(1375, 12, 'La Adela'),
(1376, 12, 'La Humada'),
(1377, 12, 'La Maruja'),
(1378, 12, '12'),
(1379, 12, 'La Reforma'),
(1380, 12, 'Limay Mahuida'),
(1381, 12, 'Lonquimay'),
(1382, 12, 'Loventuel'),
(1383, 12, 'Luan Toro'),
(1384, 12, 'Macachín'),
(1385, 12, 'Maisonnave'),
(1386, 12, 'Mauricio Mayer'),
(1387, 12, 'Metileo'),
(1388, 12, 'Miguel Cané'),
(1389, 12, 'Miguel Riglos'),
(1390, 12, 'Monte Nievas'),
(1391, 12, 'Parera'),
(1392, 12, 'Perú'),
(1393, 12, 'Pichi-Huinca'),
(1394, 12, 'Puelches'),
(1395, 12, 'Puelén'),
(1396, 12, 'Quehue'),
(1397, 12, 'Quemú Quemú'),
(1398, 12, 'Quetrequén'),
(1399, 12, 'Rancul'),
(1400, 12, 'Realicó'),
(1401, 12, 'Relmo'),
(1402, 12, 'Rolón'),
(1403, 12, 'Rucanelo'),
(1404, 12, 'Sarah'),
(1405, 12, 'Speluzzi'),
(1406, 12, 'Sta. Isabel'),
(1407, 12, 'Sta. Rosa'),
(1408, 12, 'Sta. Teresa'),
(1409, 12, 'Telén'),
(1410, 12, 'Toay'),
(1411, 12, 'Tomas M. de Anchorena'),
(1412, 12, 'Trenel'),
(1413, 12, 'Unanue'),
(1414, 12, 'Uriburu'),
(1415, 12, 'Veinticinco de Mayo'),
(1416, 12, 'Vertiz'),
(1417, 12, 'Victorica'),
(1418, 12, 'Villa Mirasol'),
(1419, 12, 'Winifreda'),
(1420, 13, 'Arauco'),
(1421, 13, 'Capital'),
(1422, 13, 'Castro Barros'),
(1423, 13, 'Chamical'),
(1424, 13, 'Chilecito'),
(1425, 13, 'Coronel F. Varela'),
(1426, 13, 'Famatina'),
(1427, 13, 'Gral. A.V.Peñaloza'),
(1428, 13, 'Gral. Belgrano'),
(1429, 13, 'Gral. J.F. Quiroga'),
(1430, 13, 'Gral. Lamadrid'),
(1431, 13, 'Gral. Ocampo'),
(1432, 13, 'Gral. San Martín'),
(1433, 13, 'Independencia'),
(1434, 13, 'Rosario Penaloza'),
(1435, 13, 'San Blas de Los Sauces'),
(1436, 13, 'Sanagasta'),
(1437, 13, 'Vinchina'),
(1438, 14, 'Capital'),
(1439, 14, 'Chacras de Coria'),
(1440, 14, 'Dorrego'),
(1441, 14, 'Gllen'),
(1442, 14, 'Godoy Cruz'),
(1443, 14, 'Gral. Alvear'),
(1444, 14, 'Guaymallén'),
(1445, 14, 'Junín'),
(1446, 14, 'La Paz'),
(1447, 14, 'Las Heras'),
(1448, 14, 'Lavalle'),
(1449, 14, 'Luján'),
(1450, 14, 'Luján De Cuyo'),
(1451, 14, 'Maipú'),
(1452, 14, 'Malargüe'),
(1453, 14, 'Rivadavia'),
(1454, 14, 'San Carlos'),
(1455, 14, 'San Martín'),
(1456, 14, 'San Rafael'),
(1457, 14, 'Sta. Rosa'),
(1458, 14, 'Tunuyán'),
(1459, 14, 'Tupungato'),
(1460, 14, 'Villa Nueva'),
(1461, 15, 'Alba Posse'),
(1462, 15, 'Almafuerte'),
(1463, 15, 'Apóstoles'),
(1464, 15, 'Aristóbulo Del Valle'),
(1465, 15, 'Arroyo Del Medio'),
(1466, 15, 'Azara'),
(1467, 15, 'Bdo. De Irigoyen'),
(1468, 15, 'Bonpland'),
(1469, 15, 'Caá Yari'),
(1470, 15, 'Campo Grande'),
(1471, 15, 'Campo Ramón'),
(1472, 15, 'Campo Viera'),
(1473, 15, 'Candelaria'),
(1474, 15, 'Capioví'),
(1475, 15, 'Caraguatay'),
(1476, 15, 'Cdte. Guacurarí'),
(1477, 15, 'Cerro Azul'),
(1478, 15, 'Cerro Corá'),
(1479, 15, 'Col. Alberdi'),
(1480, 15, 'Col. Aurora'),
(1481, 15, 'Col. Delicia'),
(1482, 15, 'Col. Polana'),
(1483, 15, 'Col. Victoria'),
(1484, 15, 'Col. Wanda'),
(1485, 15, 'Concepción De La Sierra'),
(1486, 15, 'Corpus'),
(1487, 15, 'Dos Arroyos'),
(1488, 15, 'Dos de Mayo'),
(1489, 15, 'El Alcázar'),
(1490, 15, 'El Dorado'),
(1491, 15, 'El Soberbio'),
(1492, 15, 'Esperanza'),
(1493, 15, 'F. Ameghino'),
(1494, 15, 'Fachinal'),
(1495, 15, 'Garuhapé'),
(1496, 15, 'Garupá'),
(1497, 15, 'Gdor. López'),
(1498, 15, 'Gdor. Roca'),
(1499, 15, 'Gral. Alvear'),
(1500, 15, 'Gral. Urquiza'),
(1501, 15, 'Guaraní'),
(1502, 15, 'H. Yrigoyen'),
(1503, 15, 'Iguazú'),
(1504, 15, 'Itacaruaré'),
(1505, 15, 'Jardín América'),
(1506, 15, 'Leandro N. Alem'),
(1507, 15, 'Libertad'),
(1508, 15, 'Loreto'),
(1509, 15, 'Los Helechos'),
(1510, 15, 'Mártires'),
(1511, 15, '15'),
(1512, 15, 'Mojón Grande'),
(1513, 15, 'Montecarlo'),
(1514, 15, 'Nueve de Julio'),
(1515, 15, 'Oberá'),
(1516, 15, 'Olegario V. Andrade'),
(1517, 15, 'Panambí'),
(1518, 15, 'Posadas'),
(1519, 15, 'Profundidad'),
(1520, 15, 'Pto. Iguazú'),
(1521, 15, 'Pto. Leoni'),
(1522, 15, 'Pto. Piray'),
(1523, 15, 'Pto. Rico'),
(1524, 15, 'Ruiz de Montoya'),
(1525, 15, 'San Antonio'),
(1526, 15, 'San Ignacio'),
(1527, 15, 'San Javier'),
(1528, 15, 'San José'),
(1529, 15, 'San Martín'),
(1530, 15, 'San Pedro'),
(1531, 15, 'San Vicente'),
(1532, 15, 'Santiago De Liniers'),
(1533, 15, 'Santo Pipo'),
(1534, 15, 'Sta. Ana'),
(1535, 15, 'Sta. María'),
(1536, 15, 'Tres Capones'),
(1537, 15, 'Veinticinco de Mayo'),
(1538, 15, 'Wanda'),
(1539, 16, 'Aguada San Roque'),
(1540, 16, 'Aluminé'),
(1541, 16, 'Andacollo'),
(1542, 16, 'Añelo'),
(1543, 16, 'Bajada del Agrio'),
(1544, 16, 'Barrancas'),
(1545, 16, 'Buta Ranquil'),
(1546, 16, 'Capital'),
(1547, 16, 'Caviahué'),
(1548, 16, 'Centenario'),
(1549, 16, 'Chorriaca'),
(1550, 16, 'Chos Malal'),
(1551, 16, 'Cipolletti'),
(1552, 16, 'Covunco Abajo'),
(1553, 16, 'Coyuco Cochico'),
(1554, 16, 'Cutral Có'),
(1555, 16, 'El Cholar'),
(1556, 16, 'El Huecú'),
(1557, 16, 'El Sauce'),
(1558, 16, 'Guañacos'),
(1559, 16, 'Huinganco'),
(1560, 16, 'Las Coloradas'),
(1561, 16, 'Las Lajas'),
(1562, 16, 'Las Ovejas'),
(1563, 16, 'Loncopué'),
(1564, 16, 'Los Catutos'),
(1565, 16, 'Los Chihuidos'),
(1566, 16, 'Los Miches'),
(1567, 16, 'Manzano Amargo'),
(1568, 16, '16'),
(1569, 16, 'Octavio Pico'),
(1570, 16, 'Paso Aguerre'),
(1571, 16, 'Picún Leufú'),
(1572, 16, 'Piedra del Aguila'),
(1573, 16, 'Pilo Lil'),
(1574, 16, 'Plaza Huincul'),
(1575, 16, 'Plottier'),
(1576, 16, 'Quili Malal'),
(1577, 16, 'Ramón Castro'),
(1578, 16, 'Rincón de Los Sauces'),
(1579, 16, 'San Martín de Los Andes'),
(1580, 16, 'San Patricio del Chañar'),
(1581, 16, 'Santo Tomás'),
(1582, 16, 'Sauzal Bonito'),
(1583, 16, 'Senillosa'),
(1584, 16, 'Taquimilán'),
(1585, 16, 'Tricao Malal'),
(1586, 16, 'Varvarco'),
(1587, 16, 'Villa Curí Leuvu'),
(1588, 16, 'Villa del Nahueve'),
(1589, 16, 'Villa del Puente Picún Leuvú'),
(1590, 16, 'Villa El Chocón'),
(1591, 16, 'Villa La Angostura'),
(1592, 16, 'Villa Pehuenia'),
(1593, 16, 'Villa Traful'),
(1594, 16, 'Vista Alegre'),
(1595, 16, 'Zapala'),
(1596, 17, 'Aguada Cecilio'),
(1597, 17, 'Aguada de Guerra'),
(1598, 17, 'Allén'),
(1599, 17, 'Arroyo de La Ventana'),
(1600, 17, 'Arroyo Los Berros'),
(1601, 17, 'Bariloche'),
(1602, 17, 'Calte. Cordero'),
(1603, 17, 'Campo Grande'),
(1604, 17, 'Catriel'),
(1605, 17, 'Cerro Policía'),
(1606, 17, 'Cervantes'),
(1607, 17, 'Chelforo'),
(1608, 17, 'Chimpay'),
(1609, 17, 'Chinchinales'),
(1610, 17, 'Chipauquil'),
(1611, 17, 'Choele Choel'),
(1612, 17, 'Cinco Saltos'),
(1613, 17, 'Cipolletti'),
(1614, 17, 'Clemente Onelli'),
(1615, 17, 'Colán Conhue'),
(1616, 17, 'Comallo'),
(1617, 17, 'Comicó'),
(1618, 17, 'Cona Niyeu'),
(1619, 17, 'Coronel Belisle'),
(1620, 17, 'Cubanea'),
(1621, 17, 'Darwin'),
(1622, 17, 'Dina Huapi'),
(1623, 17, 'El Bolsón'),
(1624, 17, 'El Caín'),
(1625, 17, 'El Manso'),
(1626, 17, 'Gral. Conesa'),
(1627, 17, 'Gral. Enrique Godoy'),
(1628, 17, 'Gral. Fernandez Oro'),
(1629, 17, 'Gral. Roca'),
(1630, 17, 'Guardia Mitre'),
(1631, 17, 'Ing. Huergo'),
(1632, 17, 'Ing. Jacobacci'),
(1633, 17, 'Laguna Blanca'),
(1634, 17, 'Lamarque'),
(1635, 17, 'Las Grutas'),
(1636, 17, 'Los Menucos'),
(1637, 17, 'Luis Beltrán'),
(1638, 17, 'Mainqué'),
(1639, 17, 'Mamuel Choique'),
(1640, 17, 'Maquinchao'),
(1641, 17, 'Mencué'),
(1642, 17, 'Mtro. Ramos Mexia'),
(1643, 17, 'Nahuel Niyeu'),
(1644, 17, 'Naupa Huen'),
(1645, 17, 'Ñorquinco'),
(1646, 17, 'Ojos de Agua'),
(1647, 17, 'Paso de Agua'),
(1648, 17, 'Paso Flores'),
(1649, 17, 'Peñas Blancas'),
(1650, 17, 'Pichi Mahuida'),
(1651, 17, 'Pilcaniyeu'),
(1652, 17, 'Pomona'),
(1653, 17, 'Prahuaniyeu'),
(1654, 17, 'Rincón Treneta'),
(1655, 17, 'Río Chico'),
(1656, 17, 'Río Colorado'),
(1657, 17, 'Roca'),
(1658, 17, 'San Antonio Oeste'),
(1659, 17, 'San Javier'),
(1660, 17, 'Sierra Colorada'),
(1661, 17, 'Sierra Grande'),
(1662, 17, 'Sierra Pailemán'),
(1663, 17, 'Valcheta'),
(1664, 17, 'Valle Azul'),
(1665, 17, 'Viedma'),
(1666, 17, 'Villa Llanquín'),
(1667, 17, 'Villa Mascardi'),
(1668, 17, 'Villa Regina'),
(1669, 17, 'Yaminué'),
(1670, 18, 'A. Saravia'),
(1671, 18, 'Aguaray'),
(1672, 18, 'Angastaco'),
(1673, 18, 'Animaná'),
(1674, 18, 'Cachi'),
(1675, 18, 'Cafayate'),
(1676, 18, 'Campo Quijano'),
(1677, 18, 'Campo Santo'),
(1678, 18, 'Capital'),
(1679, 18, 'Cerrillos'),
(1680, 18, 'Chicoana'),
(1681, 18, 'Col. Sta. Rosa'),
(1682, 18, 'Coronel Moldes'),
(1683, 18, 'El Bordo'),
(1684, 18, 'El Carril'),
(1685, 18, 'El Galpón'),
(1686, 18, 'El Jardín'),
(1687, 18, 'El Potrero'),
(1688, 18, 'El Quebrachal'),
(1689, 18, 'El Tala'),
(1690, 18, 'Embarcación'),
(1691, 18, 'Gral. Ballivian'),
(1692, 18, 'Gral. Güemes'),
(1693, 18, 'Gral. Mosconi'),
(1694, 18, 'Gral. Pizarro'),
(1695, 18, 'Guachipas'),
(1696, 18, 'Hipólito Yrigoyen'),
(1697, 18, 'Iruyá'),
(1698, 18, 'Isla De Cañas'),
(1699, 18, 'J. V. Gonzalez'),
(1700, 18, 'La Caldera'),
(1701, 18, 'La Candelaria'),
(1702, 18, 'La Merced'),
(1703, 18, 'La Poma'),
(1704, 18, 'La Viña'),
(1705, 18, 'Las Lajitas'),
(1706, 18, 'Los Toldos'),
(1707, 18, 'Metán'),
(1708, 18, 'Molinos'),
(1709, 18, 'Nazareno'),
(1710, 18, 'Orán'),
(1711, 18, 'Payogasta'),
(1712, 18, 'Pichanal'),
(1713, 18, 'Prof. S. Mazza'),
(1714, 18, 'Río Piedras'),
(1715, 18, 'Rivadavia Banda Norte'),
(1716, 18, 'Rivadavia Banda Sur'),
(1717, 18, 'Rosario de La Frontera'),
(1718, 18, 'Rosario de Lerma'),
(1719, 18, 'Saclantás'),
(1720, 18, '18'),
(1721, 18, 'San Antonio'),
(1722, 18, 'San Carlos'),
(1723, 18, 'San José De Metán'),
(1724, 18, 'San Ramón'),
(1725, 18, 'Santa Victoria E.'),
(1726, 18, 'Santa Victoria O.'),
(1727, 18, 'Tartagal'),
(1728, 18, 'Tolar Grande'),
(1729, 18, 'Urundel'),
(1730, 18, 'Vaqueros'),
(1731, 18, 'Villa San Lorenzo'),
(1732, 19, 'Albardón'),
(1733, 19, 'Angaco'),
(1734, 19, 'Calingasta'),
(1735, 19, 'Capital'),
(1736, 19, 'Caucete'),
(1737, 19, 'Chimbas'),
(1738, 19, 'Iglesia'),
(1739, 19, 'Jachal'),
(1740, 19, 'Nueve de Julio'),
(1741, 19, 'Pocito'),
(1742, 19, 'Rawson'),
(1743, 19, 'Rivadavia'),
(1744, 19, '19'),
(1745, 19, 'San Martín'),
(1746, 19, 'Santa Lucía'),
(1747, 19, 'Sarmiento'),
(1748, 19, 'Ullum'),
(1749, 19, 'Valle Fértil'),
(1750, 19, 'Veinticinco de Mayo'),
(1751, 19, 'Zonda'),
(1752, 20, 'Alto Pelado'),
(1753, 20, 'Alto Pencoso'),
(1754, 20, 'Anchorena'),
(1755, 20, 'Arizona'),
(1756, 20, 'Bagual'),
(1757, 20, 'Balde'),
(1758, 20, 'Batavia'),
(1759, 20, 'Beazley'),
(1760, 20, 'Buena Esperanza'),
(1761, 20, 'Candelaria'),
(1762, 20, 'Capital'),
(1763, 20, 'Carolina'),
(1764, 20, 'Carpintería'),
(1765, 20, 'Concarán'),
(1766, 20, 'Cortaderas'),
(1767, 20, 'El Morro'),
(1768, 20, 'El Trapiche'),
(1769, 20, 'El Volcán'),
(1770, 20, 'Fortín El Patria'),
(1771, 20, 'Fortuna'),
(1772, 20, 'Fraga'),
(1773, 20, 'Juan Jorba'),
(1774, 20, 'Juan Llerena'),
(1775, 20, 'Juana Koslay'),
(1776, 20, 'Justo Daract'),
(1777, 20, 'La Calera'),
(1778, 20, 'La Florida'),
(1779, 20, 'La Punilla'),
(1780, 20, 'La Toma'),
(1781, 20, 'Lafinur'),
(1782, 20, 'Las Aguadas'),
(1783, 20, 'Las Chacras'),
(1784, 20, 'Las Lagunas'),
(1785, 20, 'Las Vertientes'),
(1786, 20, 'Lavaisse'),
(1787, 20, 'Leandro N. Alem'),
(1788, 20, 'Los Molles'),
(1789, 20, 'Luján'),
(1790, 20, 'Mercedes'),
(1791, 20, 'Merlo'),
(1792, 20, 'Naschel'),
(1793, 20, 'Navia'),
(1794, 20, 'Nogolí'),
(1795, 20, 'Nueva Galia'),
(1796, 20, 'Papagayos'),
(1797, 20, 'Paso Grande'),
(1798, 20, 'Potrero de Los Funes'),
(1799, 20, 'Quines'),
(1800, 20, 'Renca'),
(1801, 20, 'Saladillo'),
(1802, 20, 'San Francisco'),
(1803, 20, 'San Gerónimo'),
(1804, 20, 'San Martín'),
(1805, 20, 'San Pablo'),
(1806, 20, 'Santa Rosa de Conlara'),
(1807, 20, 'Talita'),
(1808, 20, 'Tilisarao'),
(1809, 20, 'Unión'),
(1810, 20, 'Villa de La Quebrada'),
(1811, 20, 'Villa de Praga'),
(1812, 20, 'Villa del Carmen'),
(1813, 20, 'Villa Gral. Roca'),
(1814, 20, 'Villa Larca'),
(1815, 20, 'Villa Mercedes'),
(1816, 20, 'Zanjitas'),
(1817, 21, 'Calafate'),
(1818, 21, 'Caleta Olivia'),
(1819, 21, 'Cañadón Seco'),
(1820, 21, 'Comandante Piedrabuena'),
(1821, 21, 'El Calafate'),
(1822, 21, 'El Chaltén'),
(1823, 21, 'Gdor. Gregores'),
(1824, 21, 'Hipólito Yrigoyen'),
(1825, 21, 'Jaramillo'),
(1826, 21, 'Koluel Kaike'),
(1827, 21, 'Las Heras'),
(1828, 21, 'Los Antiguos'),
(1829, 21, 'Perito Moreno'),
(1830, 21, 'Pico Truncado'),
(1831, 21, 'Pto. Deseado'),
(1832, 21, 'Pto. San Julián'),
(1833, 21, 'Pto. 21'),
(1834, 21, 'Río Cuarto'),
(1835, 21, 'Río Gallegos'),
(1836, 21, 'Río Turbio'),
(1837, 21, 'Tres Lagos'),
(1838, 21, 'Veintiocho De Noviembre'),
(1839, 22, 'Aarón Castellanos'),
(1840, 22, 'Acebal'),
(1841, 22, 'Aguará Grande'),
(1842, 22, 'Albarellos'),
(1843, 22, 'Alcorta'),
(1844, 22, 'Aldao'),
(1845, 22, 'Alejandra'),
(1846, 22, 'Álvarez'),
(1847, 22, 'Ambrosetti'),
(1848, 22, 'Amenábar'),
(1849, 22, 'Angélica'),
(1850, 22, 'Angeloni'),
(1851, 22, 'Arequito'),
(1852, 22, 'Arminda'),
(1853, 22, 'Armstrong'),
(1854, 22, 'Arocena'),
(1855, 22, 'Arroyo Aguiar'),
(1856, 22, 'Arroyo Ceibal'),
(1857, 22, 'Arroyo Leyes'),
(1858, 22, 'Arroyo Seco'),
(1859, 22, 'Arrufó'),
(1860, 22, 'Arteaga'),
(1861, 22, 'Ataliva'),
(1862, 22, 'Aurelia'),
(1863, 22, 'Avellaneda'),
(1864, 22, 'Barrancas'),
(1865, 22, 'Bauer Y Sigel'),
(1866, 22, 'Bella Italia'),
(1867, 22, 'Berabevú'),
(1868, 22, 'Berna'),
(1869, 22, 'Bernardo de Irigoyen'),
(1870, 22, 'Bigand'),
(1871, 22, 'Bombal'),
(1872, 22, 'Bouquet'),
(1873, 22, 'Bustinza'),
(1874, 22, 'Cabal'),
(1875, 22, 'Cacique Ariacaiquin'),
(1876, 22, 'Cafferata'),
(1877, 22, 'Calchaquí'),
(1878, 22, 'Campo Andino'),
(1879, 22, 'Campo Piaggio'),
(1880, 22, 'Cañada de Gómez'),
(1881, 22, 'Cañada del Ucle'),
(1882, 22, 'Cañada Rica'),
(1883, 22, 'Cañada Rosquín'),
(1884, 22, 'Candioti'),
(1885, 22, 'Capital'),
(1886, 22, 'Capitán Bermúdez'),
(1887, 22, 'Capivara'),
(1888, 22, 'Carcarañá'),
(1889, 22, 'Carlos Pellegrini'),
(1890, 22, 'Carmen'),
(1891, 22, 'Carmen Del Sauce'),
(1892, 22, 'Carreras'),
(1893, 22, 'Carrizales'),
(1894, 22, 'Casalegno'),
(1895, 22, 'Casas'),
(1896, 22, 'Casilda'),
(1897, 22, 'Castelar'),
(1898, 22, 'Castellanos'),
(1899, 22, 'Cayastá'),
(1900, 22, 'Cayastacito'),
(1901, 22, 'Centeno'),
(1902, 22, 'Cepeda'),
(1903, 22, 'Ceres'),
(1904, 22, 'Chabás'),
(1905, 22, 'Chañar Ladeado'),
(1906, 22, 'Chapuy'),
(1907, 22, 'Chovet'),
(1908, 22, 'Christophersen'),
(1909, 22, 'Classon'),
(1910, 22, 'Cnel. Arnold'),
(1911, 22, 'Cnel. Bogado'),
(1912, 22, 'Cnel. Dominguez'),
(1913, 22, 'Cnel. Fraga'),
(1914, 22, 'Col. Aldao'),
(1915, 22, 'Col. Ana'),
(1916, 22, 'Col. Belgrano'),
(1917, 22, 'Col. Bicha'),
(1918, 22, 'Col. Bigand'),
(1919, 22, 'Col. Bossi'),
(1920, 22, 'Col. Cavour'),
(1921, 22, 'Col. Cello'),
(1922, 22, 'Col. Dolores'),
(1923, 22, 'Col. Dos Rosas'),
(1924, 22, 'Col. Durán'),
(1925, 22, 'Col. Iturraspe'),
(1926, 22, 'Col. Margarita'),
(1927, 22, 'Col. Mascias'),
(1928, 22, 'Col. Raquel'),
(1929, 22, 'Col. Rosa'),
(1930, 22, 'Col. San José'),
(1931, 22, 'Constanza'),
(1932, 22, 'Coronda'),
(1933, 22, 'Correa'),
(1934, 22, 'Crispi'),
(1935, 22, 'Cululú'),
(1936, 22, 'Curupayti'),
(1937, 22, 'Desvio Arijón'),
(1938, 22, 'Diaz'),
(1939, 22, 'Diego de Alvear'),
(1940, 22, 'Egusquiza'),
(1941, 22, 'El Arazá'),
(1942, 22, 'El Rabón'),
(1943, 22, 'El Sombrerito'),
(1944, 22, 'El Trébol'),
(1945, 22, 'Elisa'),
(1946, 22, 'Elortondo'),
(1947, 22, 'Emilia'),
(1948, 22, 'Empalme San Carlos'),
(1949, 22, 'Empalme Villa Constitucion'),
(1950, 22, 'Esmeralda'),
(1951, 22, 'Esperanza'),
(1952, 22, 'Estación Alvear'),
(1953, 22, 'Estacion Clucellas'),
(1954, 22, 'Esteban Rams'),
(1955, 22, 'Esther'),
(1956, 22, 'Esustolia'),
(1957, 22, 'Eusebia'),
(1958, 22, 'Felicia'),
(1959, 22, 'Fidela'),
(1960, 22, 'Fighiera'),
(1961, 22, 'Firmat'),
(1962, 22, 'Florencia'),
(1963, 22, 'Fortín Olmos'),
(1964, 22, 'Franck'),
(1965, 22, 'Fray Luis Beltrán'),
(1966, 22, 'Frontera'),
(1967, 22, 'Fuentes'),
(1968, 22, 'Funes'),
(1969, 22, 'Gaboto'),
(1970, 22, 'Galisteo'),
(1971, 22, 'Gálvez'),
(1972, 22, 'Garabalto'),
(1973, 22, 'Garibaldi'),
(1974, 22, 'Gato Colorado'),
(1975, 22, 'Gdor. Crespo'),
(1976, 22, 'Gessler'),
(1977, 22, 'Godoy'),
(1978, 22, 'Golondrina'),
(1979, 22, 'Gral. Gelly'),
(1980, 22, 'Gral. Lagos'),
(1981, 22, 'Granadero Baigorria'),
(1982, 22, 'Gregoria Perez De Denis'),
(1983, 22, 'Grutly'),
(1984, 22, 'Guadalupe N.'),
(1985, 22, 'Gödeken'),
(1986, 22, 'Helvecia'),
(1987, 22, 'Hersilia'),
(1988, 22, 'Hipatía'),
(1989, 22, 'Huanqueros'),
(1990, 22, 'Hugentobler'),
(1991, 22, 'Hughes'),
(1992, 22, 'Humberto 1º'),
(1993, 22, 'Humboldt'),
(1994, 22, 'Ibarlucea'),
(1995, 22, 'Ing. Chanourdie'),
(1996, 22, 'Intiyaco'),
(1997, 22, 'Ituzaingó'),
(1998, 22, 'Jacinto L. Aráuz'),
(1999, 22, 'Josefina'),
(2000, 22, 'Juan B. Molina'),
(2001, 22, 'Juan de Garay'),
(2002, 22, 'Juncal'),
(2003, 22, 'La Brava'),
(2004, 22, 'La Cabral'),
(2005, 22, 'La Camila'),
(2006, 22, 'La Chispa'),
(2007, 22, 'La Clara'),
(2008, 22, 'La Criolla'),
(2009, 22, 'La Gallareta'),
(2010, 22, 'La Lucila'),
(2011, 22, 'La Pelada'),
(2012, 22, 'La Penca'),
(2013, 22, 'La Rubia'),
(2014, 22, 'La Sarita'),
(2015, 22, 'La Vanguardia'),
(2016, 22, 'Labordeboy'),
(2017, 22, 'Laguna Paiva'),
(2018, 22, 'Landeta'),
(2019, 22, 'Lanteri'),
(2020, 22, 'Larrechea'),
(2021, 22, 'Las Avispas'),
(2022, 22, 'Las Bandurrias'),
(2023, 22, 'Las Garzas'),
(2024, 22, 'Las Palmeras'),
(2025, 22, 'Las Parejas'),
(2026, 22, 'Las Petacas'),
(2027, 22, 'Las Rosas'),
(2028, 22, 'Las Toscas'),
(2029, 22, 'Las Tunas'),
(2030, 22, 'Lazzarino'),
(2031, 22, 'Lehmann'),
(2032, 22, 'Llambi Campbell'),
(2033, 22, 'Logroño'),
(2034, 22, 'Loma Alta'),
(2035, 22, 'López'),
(2036, 22, 'Los Amores'),
(2037, 22, 'Los Cardos'),
(2038, 22, 'Los Laureles'),
(2039, 22, 'Los Molinos'),
(2040, 22, 'Los Quirquinchos'),
(2041, 22, 'Lucio V. Lopez'),
(2042, 22, 'Luis Palacios'),
(2043, 22, 'Ma. Juana'),
(2044, 22, 'Ma. Luisa'),
(2045, 22, 'Ma. Susana'),
(2046, 22, 'Ma. Teresa'),
(2047, 22, 'Maciel'),
(2048, 22, 'Maggiolo'),
(2049, 22, 'Malabrigo'),
(2050, 22, 'Marcelino Escalada'),
(2051, 22, 'Margarita'),
(2052, 22, 'Matilde'),
(2053, 22, 'Mauá'),
(2054, 22, 'Máximo Paz'),
(2055, 22, 'Melincué'),
(2056, 22, 'Miguel Torres'),
(2057, 22, 'Moisés Ville'),
(2058, 22, 'Monigotes'),
(2059, 22, 'Monje'),
(2060, 22, 'Monte Obscuridad'),
(2061, 22, 'Monte Vera'),
(2062, 22, 'Montefiore'),
(2063, 22, 'Montes de Oca'),
(2064, 22, 'Murphy'),
(2065, 22, 'Ñanducita'),
(2066, 22, 'Naré'),
(2067, 22, 'Nelson'),
(2068, 22, 'Nicanor E. Molinas'),
(2069, 22, 'Nuevo Torino'),
(2070, 22, 'Oliveros'),
(2071, 22, 'Palacios'),
(2072, 22, 'Pavón'),
(2073, 22, 'Pavón Arriba'),
(2074, 22, 'Pedro Gómez Cello'),
(2075, 22, 'Pérez'),
(2076, 22, 'Peyrano'),
(2077, 22, 'Piamonte'),
(2078, 22, 'Pilar'),
(2079, 22, 'Piñero'),
(2080, 22, 'Plaza Clucellas'),
(2081, 22, 'Portugalete'),
(2082, 22, 'Pozo Borrado'),
(2083, 22, 'Progreso'),
(2084, 22, 'Providencia'),
(2085, 22, 'Pte. Roca'),
(2086, 22, 'Pueblo Andino'),
(2087, 22, 'Pueblo Esther'),
(2088, 22, 'Pueblo Gral. San Martín'),
(2089, 22, 'Pueblo Irigoyen'),
(2090, 22, 'Pueblo Marini'),
(2091, 22, 'Pueblo Muñoz'),
(2092, 22, 'Pueblo Uranga'),
(2093, 22, 'Pujato');
INSERT INTO `localidades` (`id`, `id_privincia`, `localidad`) VALUES
(2094, 22, 'Pujato N.'),
(2095, 22, 'Rafaela'),
(2096, 22, 'Ramayón'),
(2097, 22, 'Ramona'),
(2098, 22, 'Reconquista'),
(2099, 22, 'Recreo'),
(2100, 22, 'Ricardone'),
(2101, 22, 'Rivadavia'),
(2102, 22, 'Roldán'),
(2103, 22, 'Romang'),
(2104, 22, 'Rosario'),
(2105, 22, 'Rueda'),
(2106, 22, 'Rufino'),
(2107, 22, 'Sa Pereira'),
(2108, 22, 'Saguier'),
(2109, 22, 'Saladero M. Cabal'),
(2110, 22, 'Salto Grande'),
(2111, 22, 'San Agustín'),
(2112, 22, 'San Antonio de Obligado'),
(2113, 22, 'San Bernardo (N.J.)'),
(2114, 22, 'San Bernardo (S.J.)'),
(2115, 22, 'San Carlos Centro'),
(2116, 22, 'San Carlos N.'),
(2117, 22, 'San Carlos S.'),
(2118, 22, 'San Cristóbal'),
(2119, 22, 'San Eduardo'),
(2120, 22, 'San Eugenio'),
(2121, 22, 'San Fabián'),
(2122, 22, 'San Fco. de Santa Fé'),
(2123, 22, 'San Genaro'),
(2124, 22, 'San Genaro N.'),
(2125, 22, 'San Gregorio'),
(2126, 22, 'San Guillermo'),
(2127, 22, 'San Javier'),
(2128, 22, 'San Jerónimo del Sauce'),
(2129, 22, 'San Jerónimo N.'),
(2130, 22, 'San Jerónimo S.'),
(2131, 22, 'San Jorge'),
(2132, 22, 'San José de La Esquina'),
(2133, 22, 'San José del Rincón'),
(2134, 22, 'San Justo'),
(2135, 22, 'San Lorenzo'),
(2136, 22, 'San Mariano'),
(2137, 22, 'San Martín de Las Escobas'),
(2138, 22, 'San Martín N.'),
(2139, 22, 'San Vicente'),
(2140, 22, 'Sancti Spititu'),
(2141, 22, 'Sanford'),
(2142, 22, 'Santo Domingo'),
(2143, 22, 'Santo Tomé'),
(2144, 22, 'Santurce'),
(2145, 22, 'Sargento Cabral'),
(2146, 22, 'Sarmiento'),
(2147, 22, 'Sastre'),
(2148, 22, 'Sauce Viejo'),
(2149, 22, 'Serodino'),
(2150, 22, 'Silva'),
(2151, 22, 'Soldini'),
(2152, 22, 'Soledad'),
(2153, 22, 'Soutomayor'),
(2154, 22, 'Sta. Clara de Buena Vista'),
(2155, 22, 'Sta. Clara de Saguier'),
(2156, 22, 'Sta. Isabel'),
(2157, 22, 'Sta. Margarita'),
(2158, 22, 'Sta. Maria Centro'),
(2159, 22, 'Sta. María N.'),
(2160, 22, 'Sta. Rosa'),
(2161, 22, 'Sta. Teresa'),
(2162, 22, 'Suardi'),
(2163, 22, 'Sunchales'),
(2164, 22, 'Susana'),
(2165, 22, 'Tacuarendí'),
(2166, 22, 'Tacural'),
(2167, 22, 'Tartagal'),
(2168, 22, 'Teodelina'),
(2169, 22, 'Theobald'),
(2170, 22, 'Timbúes'),
(2171, 22, 'Toba'),
(2172, 22, 'Tortugas'),
(2173, 22, 'Tostado'),
(2174, 22, 'Totoras'),
(2175, 22, 'Traill'),
(2176, 22, 'Venado Tuerto'),
(2177, 22, 'Vera'),
(2178, 22, 'Vera y Pintado'),
(2179, 22, 'Videla'),
(2180, 22, 'Vila'),
(2181, 22, 'Villa Amelia'),
(2182, 22, 'Villa Ana'),
(2183, 22, 'Villa Cañas'),
(2184, 22, 'Villa Constitución'),
(2185, 22, 'Villa Eloísa'),
(2186, 22, 'Villa Gdor. Gálvez'),
(2187, 22, 'Villa Guillermina'),
(2188, 22, 'Villa Minetti'),
(2189, 22, 'Villa Mugueta'),
(2190, 22, 'Villa Ocampo'),
(2191, 22, 'Villa San José'),
(2192, 22, 'Villa Saralegui'),
(2193, 22, 'Villa Trinidad'),
(2194, 22, 'Villada'),
(2195, 22, 'Virginia'),
(2196, 22, 'Wheelwright'),
(2197, 22, 'Zavalla'),
(2198, 22, 'Zenón Pereira'),
(2199, 23, 'Añatuya'),
(2200, 23, 'Árraga'),
(2201, 23, 'Bandera'),
(2202, 23, 'Bandera Bajada'),
(2203, 23, 'Beltrán'),
(2204, 23, 'Brea Pozo'),
(2205, 23, 'Campo Gallo'),
(2206, 23, 'Capital'),
(2207, 23, 'Chilca Juliana'),
(2208, 23, 'Choya'),
(2209, 23, 'Clodomira'),
(2210, 23, 'Col. Alpina'),
(2211, 23, 'Col. Dora'),
(2212, 23, 'Col. El Simbolar Robles'),
(2213, 23, 'El Bobadal'),
(2214, 23, 'El Charco'),
(2215, 23, 'El Mojón'),
(2216, 23, 'Estación Atamisqui'),
(2217, 23, 'Estación Simbolar'),
(2218, 23, 'Fernández'),
(2219, 23, 'Fortín Inca'),
(2220, 23, 'Frías'),
(2221, 23, 'Garza'),
(2222, 23, 'Gramilla'),
(2223, 23, 'Guardia Escolta'),
(2224, 23, 'Herrera'),
(2225, 23, 'Icaño'),
(2226, 23, 'Ing. Forres'),
(2227, 23, 'La Banda'),
(2228, 23, 'La Cañada'),
(2229, 23, 'Laprida'),
(2230, 23, 'Lavalle'),
(2231, 23, 'Loreto'),
(2232, 23, 'Los Juríes'),
(2233, 23, 'Los Núñez'),
(2234, 23, 'Los Pirpintos'),
(2235, 23, 'Los Quiroga'),
(2236, 23, 'Los Telares'),
(2237, 23, 'Lugones'),
(2238, 23, 'Malbrán'),
(2239, 23, 'Matara'),
(2240, 23, 'Medellín'),
(2241, 23, 'Monte Quemado'),
(2242, 23, 'Nueva Esperanza'),
(2243, 23, 'Nueva Francia'),
(2244, 23, 'Palo Negro'),
(2245, 23, 'Pampa de Los Guanacos'),
(2246, 23, 'Pinto'),
(2247, 23, 'Pozo Hondo'),
(2248, 23, 'Quimilí'),
(2249, 23, 'Real Sayana'),
(2250, 23, 'Sachayoj'),
(2251, 23, 'San Pedro de Guasayán'),
(2252, 23, 'Selva'),
(2253, 23, 'Sol de Julio'),
(2254, 23, 'Sumampa'),
(2255, 23, 'Suncho Corral'),
(2256, 23, 'Taboada'),
(2257, 23, 'Tapso'),
(2258, 23, 'Termas de Rio Hondo'),
(2259, 23, 'Tintina'),
(2260, 23, 'Tomas Young'),
(2261, 23, 'Vilelas'),
(2262, 23, 'Villa Atamisqui'),
(2263, 23, 'Villa La Punta'),
(2264, 23, 'Villa Ojo de Agua'),
(2265, 23, 'Villa Río Hondo'),
(2266, 23, 'Villa Salavina'),
(2267, 23, 'Villa Unión'),
(2268, 23, 'Vilmer'),
(2269, 23, 'Weisburd'),
(2270, 24, 'Río Grande'),
(2271, 24, 'Tolhuin'),
(2272, 24, 'Ushuaia'),
(2273, 25, 'Acheral'),
(2274, 25, 'Agua Dulce'),
(2275, 25, 'Aguilares'),
(2276, 25, 'Alderetes'),
(2277, 25, 'Alpachiri'),
(2278, 25, 'Alto Verde'),
(2279, 25, 'Amaicha del Valle'),
(2280, 25, 'Amberes'),
(2281, 25, 'Ancajuli'),
(2282, 25, 'Arcadia'),
(2283, 25, 'Atahona'),
(2284, 25, 'Banda del Río Sali'),
(2285, 25, 'Bella Vista'),
(2286, 25, 'Buena Vista'),
(2287, 25, 'Burruyacú'),
(2288, 25, 'Capitán Cáceres'),
(2289, 25, 'Cevil Redondo'),
(2290, 25, 'Choromoro'),
(2291, 25, 'Ciudacita'),
(2292, 25, 'Colalao del Valle'),
(2293, 25, 'Colombres'),
(2294, 25, 'Concepción'),
(2295, 25, 'Delfín Gallo'),
(2296, 25, 'El Bracho'),
(2297, 25, 'El Cadillal'),
(2298, 25, 'El Cercado'),
(2299, 25, 'El Chañar'),
(2300, 25, 'El Manantial'),
(2301, 25, 'El Mojón'),
(2302, 25, 'El Mollar'),
(2303, 25, 'El Naranjito'),
(2304, 25, 'El Naranjo'),
(2305, 25, 'El Polear'),
(2306, 25, 'El Puestito'),
(2307, 25, 'El Sacrificio'),
(2308, 25, 'El Timbó'),
(2309, 25, 'Escaba'),
(2310, 25, 'Esquina'),
(2311, 25, 'Estación Aráoz'),
(2312, 25, 'Famaillá'),
(2313, 25, 'Gastone'),
(2314, 25, 'Gdor. Garmendia'),
(2315, 25, 'Gdor. Piedrabuena'),
(2316, 25, 'Graneros'),
(2317, 25, 'Huasa Pampa'),
(2318, 25, 'J. B. Alberdi'),
(2319, 25, 'La Cocha'),
(2320, 25, 'La Esperanza'),
(2321, 25, 'La Florida'),
(2322, 25, 'La Ramada'),
(2323, 25, 'La Trinidad'),
(2324, 25, 'Lamadrid'),
(2325, 25, 'Las Cejas'),
(2326, 25, 'Las Talas'),
(2327, 25, 'Las Talitas'),
(2328, 25, 'Los Bulacio'),
(2329, 25, 'Los Gómez'),
(2330, 25, 'Los Nogales'),
(2331, 25, 'Los Pereyra'),
(2332, 25, 'Los Pérez'),
(2333, 25, 'Los Puestos'),
(2334, 25, 'Los Ralos'),
(2335, 25, 'Los Sarmientos'),
(2336, 25, 'Los Sosa'),
(2337, 25, 'Lules'),
(2338, 25, 'M. García Fernández'),
(2339, 25, 'Manuela Pedraza'),
(2340, 25, 'Medinas'),
(2341, 25, 'Monte Bello'),
(2342, 25, 'Monteagudo'),
(2343, 25, 'Monteros'),
(2344, 25, 'Padre Monti'),
(2345, 25, 'Pampa Mayo'),
(2346, 25, 'Quilmes'),
(2347, 25, 'Raco'),
(2348, 25, 'Ranchillos'),
(2349, 25, 'Río Chico'),
(2350, 25, 'Río Colorado'),
(2351, 25, 'Río Seco'),
(2352, 25, 'Rumi Punco'),
(2353, 25, 'San Andrés'),
(2354, 25, 'San Felipe'),
(2355, 25, 'San Ignacio'),
(2356, 25, 'San Javier'),
(2357, 25, 'San José'),
(2358, 25, 'San Miguel de 25'),
(2359, 25, 'San Pedro'),
(2360, 25, 'San Pedro de Colalao'),
(2361, 25, 'Santa Rosa de Leales'),
(2362, 25, 'Sgto. Moya'),
(2363, 25, 'Siete de Abril'),
(2364, 25, 'Simoca'),
(2365, 25, 'Soldado Maldonado'),
(2366, 25, 'Sta. Ana'),
(2367, 25, 'Sta. Cruz'),
(2368, 25, 'Sta. Lucía'),
(2369, 25, 'Taco Ralo'),
(2370, 25, 'Tafí del Valle'),
(2371, 25, 'Tafí Viejo'),
(2372, 25, 'Tapia'),
(2373, 25, 'Teniente Berdina'),
(2374, 25, 'Trancas'),
(2375, 25, 'Villa Belgrano'),
(2376, 25, 'Villa Benjamín Araoz'),
(2377, 25, 'Villa Chiligasta'),
(2378, 25, 'Villa de Leales'),
(2379, 25, 'Villa Quinteros'),
(2380, 25, 'Yánima'),
(2381, 25, 'Yerba Buena'),
(2382, 25, 'Yerba Buena (S)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-12-28 22:26:01', '2017-12-30 00:31:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', '#a33e3e', NULL, 1, '2017-12-28 22:26:01', '2018-09-10 21:54:15', 'voyager.dashboard', 'null'),
(4, 1, 'Usuarios', '', '_self', 'voyager-person', '#807272', NULL, 2, '2017-12-28 22:26:02', '2018-09-11 02:40:52', 'voyager.users.index', 'null'),
(7, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 9, '2017-12-28 22:26:02', '2018-12-19 02:32:53', 'voyager.roles.index', NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 10, '2017-12-28 22:26:02', '2018-10-02 20:04:27', NULL, NULL),
(9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 1, '2017-12-28 22:26:02', '2018-12-19 02:32:53', 'voyager.menus.index', NULL),
(10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 2, '2017-12-28 22:26:02', '2018-12-19 02:32:53', 'voyager.database.index', NULL),
(11, 1, 'Compass', '/administracion/compass', '_self', 'voyager-compass', NULL, 8, 3, '2017-12-28 22:26:03', '2018-12-19 02:32:53', NULL, NULL),
(13, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 8, 4, '2017-12-28 22:26:03', '2018-12-19 02:32:53', 'voyager.settings.index', NULL),
(15, 1, 'Inscripciones', '/administracion/inscripciones', '_self', 'voyager-study', '#39ff00', NULL, 5, '2018-04-05 22:41:47', '2018-09-19 19:35:43', NULL, ''),
(16, 1, 'Convocatorias a Becas', '/administracion/becas', '_self', 'voyager-trophy', '#ff2900', NULL, 4, '2018-07-17 03:23:50', '2018-09-19 19:35:43', NULL, ''),
(18, 1, 'Cronogramas de pagos', '/administracion/cronogramas', '_self', 'voyager-credit-cards', '#0ad6e6', NULL, 6, '2018-07-19 19:52:26', '2018-09-19 19:35:43', NULL, ''),
(20, 1, 'Copias de seguridad', '/administracion/backup', '_self', 'voyager-harddrive', '#06ba61', NULL, 8, '2018-09-17 00:49:22', '2018-12-19 02:32:53', NULL, ''),
(21, 1, 'Carreras', '', '_self', 'voyager-book', '#a0c35c', NULL, 3, '2018-09-19 19:33:02', '2018-09-20 02:09:59', 'voyager.carreras.index', 'null'),
(23, 1, 'Cálculos Auxiliares', '', '_self', 'voyager-magnet', '#a64343', NULL, 7, '2018-10-01 20:57:12', '2018-12-07 02:35:25', 'voyager.calculos-aux.index', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(46, '2014_10_12_100000_create_password_resets_table', 2),
(47, '2016_01_01_000000_add_voyager_user_fields', 2),
(48, '2016_01_01_000000_create_data_types_table', 2),
(49, '2016_01_01_000000_create_pages_table', 2),
(50, '2016_01_01_000000_create_posts_table', 2),
(51, '2016_02_15_204651_create_categories_table', 2),
(52, '2016_05_19_173453_create_menu_table', 2),
(53, '2016_10_21_190000_create_roles_table', 2),
(54, '2016_10_21_190000_create_settings_table', 2),
(55, '2016_11_30_135954_create_permission_table', 2),
(56, '2016_11_30_141208_create_permission_role_table', 2),
(57, '2016_12_26_201236_data_types__add__server_side', 2),
(58, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(59, '2017_01_14_005015_create_translations_table', 2),
(60, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 2),
(61, '2017_01_15_000000_create_permission_groups_table', 2),
(62, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(63, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(64, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(65, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(66, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(67, '2017_08_05_000000_add_group_to_settings_table', 2),
(68, '2017_11_02_004251_create_datos_personas_table', 3),
(69, '2017_11_26_013050_add_user_role_relationship', 4),
(70, '2017_11_26_015000_create_user_roles_table', 4),
(71, '2018_03_11_000000_add_user_settings', 4),
(72, '2018_03_14_000000_add_details_to_data_types_table', 4),
(73, '2018_03_16_000000_make_settings_value_nullable', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('prueba@prueba.com', '$2y$10$lN8X4dmW/O0fnnAFFgSrrerrtwcW3RBflWVb.rrtjNQB4cds5jxIe', '2018-01-02 03:47:34'),
('admin@admin.com', '$2y$10$dJvFy4PhXfYckf39nwk7.OvVCmniC4WmTGHm17o1chwsiUDrLPtBq', '2018-07-23 01:49:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(2, 'browse_database', NULL, '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(3, 'browse_media', NULL, '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(4, 'browse_compass', NULL, '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(5, 'browse_menus', 'menus', '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(6, 'read_menus', 'menus', '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(7, 'edit_menus', 'menus', '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(8, 'add_menus', 'menus', '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(9, 'delete_menus', 'menus', '2017-12-28 22:26:03', '2017-12-28 22:26:03', NULL),
(15, 'browse_roles', 'roles', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(16, 'read_roles', 'roles', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(17, 'edit_roles', 'roles', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(18, 'add_roles', 'roles', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(19, 'delete_roles', 'roles', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(20, 'browse_users', 'users', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(21, 'read_users', 'users', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(22, 'edit_users', 'users', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(23, 'add_users', 'users', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(24, 'delete_users', 'users', '2017-12-28 22:26:04', '2017-12-28 22:26:04', NULL),
(35, 'browse_settings', 'settings', '2017-12-28 22:26:05', '2017-12-28 22:26:05', NULL),
(36, 'read_settings', 'settings', '2017-12-28 22:26:05', '2017-12-28 22:26:05', NULL),
(37, 'edit_settings', 'settings', '2017-12-28 22:26:05', '2017-12-28 22:26:05', NULL),
(38, 'add_settings', 'settings', '2017-12-28 22:26:05', '2017-12-28 22:26:05', NULL),
(39, 'delete_settings', 'settings', '2017-12-28 22:26:05', '2017-12-28 22:26:05', NULL),
(40, 'browse_inscripciones', 'inscripciones', '2018-04-05 22:41:47', '2018-04-05 22:41:47', NULL),
(41, 'read_inscripciones', 'inscripciones', '2018-04-05 22:41:47', '2018-04-05 22:41:47', NULL),
(42, 'edit_inscripciones', 'inscripciones', '2018-04-05 22:41:47', '2018-04-05 22:41:47', NULL),
(43, 'add_inscripciones', 'inscripciones', '2018-04-05 22:41:47', '2018-04-05 22:41:47', NULL),
(44, 'delete_inscripciones', 'inscripciones', '2018-04-05 22:41:47', '2018-04-05 22:41:47', NULL),
(45, 'browse_becas', 'becas', '2018-07-17 03:23:49', '2018-07-17 03:23:49', NULL),
(46, 'read_becas', 'becas', '2018-07-17 03:23:49', '2018-07-17 03:23:49', NULL),
(47, 'edit_becas', 'becas', '2018-07-17 03:23:49', '2018-07-17 03:23:49', NULL),
(48, 'add_becas', 'becas', '2018-07-17 03:23:49', '2018-07-17 03:23:49', NULL),
(49, 'delete_becas', 'becas', '2018-07-17 03:23:49', '2018-07-17 03:23:49', NULL),
(50, 'browse_fecha_cobro', 'fecha_cobro', '2018-07-19 19:45:27', '2018-07-19 19:45:27', NULL),
(51, 'read_fecha_cobro', 'fecha_cobro', '2018-07-19 19:45:27', '2018-07-19 19:45:27', NULL),
(52, 'edit_fecha_cobro', 'fecha_cobro', '2018-07-19 19:45:27', '2018-07-19 19:45:27', NULL),
(53, 'add_fecha_cobro', 'fecha_cobro', '2018-07-19 19:45:27', '2018-07-19 19:45:27', NULL),
(54, 'delete_fecha_cobro', 'fecha_cobro', '2018-07-19 19:45:27', '2018-07-19 19:45:27', NULL),
(55, 'browse_cronogramas', 'cronogramas', '2018-07-19 19:52:26', '2018-07-19 19:52:26', NULL),
(56, 'read_cronogramas', 'cronogramas', '2018-07-19 19:52:26', '2018-07-19 19:52:26', NULL),
(57, 'edit_cronogramas', 'cronogramas', '2018-07-19 19:52:26', '2018-07-19 19:52:26', NULL),
(58, 'add_cronogramas', 'cronogramas', '2018-07-19 19:52:26', '2018-07-19 19:52:26', NULL),
(59, 'delete_cronogramas', 'cronogramas', '2018-07-19 19:52:26', '2018-07-19 19:52:26', NULL),
(60, 'browse_bread', NULL, NULL, NULL, NULL),
(82, 'browse_carreras', 'carreras', '2018-09-19 21:03:17', '2018-09-19 21:03:17', NULL),
(83, 'read_carreras', 'carreras', '2018-09-19 21:03:17', '2018-09-19 21:03:17', NULL),
(84, 'edit_carreras', 'carreras', '2018-09-19 21:03:17', '2018-09-19 21:03:17', NULL),
(85, 'add_carreras', 'carreras', '2018-09-19 21:03:17', '2018-09-19 21:03:17', NULL),
(86, 'delete_carreras', 'carreras', '2018-09-19 21:03:17', '2018-09-19 21:03:17', NULL),
(92, 'browse_backup', NULL, '2018-09-25 03:00:00', '2018-09-25 03:00:00', NULL),
(99, 'browse_calculos_aux', 'calculos_aux', '2018-10-02 19:38:58', '2018-10-02 19:38:58', NULL),
(100, 'read_calculos_aux', 'calculos_aux', '2018-10-02 19:38:58', '2018-10-02 19:38:58', NULL),
(101, 'edit_calculos_aux', 'calculos_aux', '2018-10-02 19:38:58', '2018-10-02 19:38:58', NULL),
(102, 'add_calculos_aux', 'calculos_aux', '2018-10-02 19:38:58', '2018-10-02 19:38:58', NULL),
(103, 'delete_calculos_aux', 'calculos_aux', '2018-10-02 19:38:58', '2018-10-02 19:38:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(22, 2),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(24, 3),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 2),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(84, 3),
(85, 1),
(85, 3),
(86, 1),
(86, 3),
(92, 1),
(92, 3),
(99, 1),
(99, 3),
(100, 1),
(100, 3),
(101, 1),
(101, 3),
(102, 1),
(102, 3),
(103, 1),
(103, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(10) NOT NULL,
  `provincia` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `provincia`) VALUES
(1, 'Buenos Aires'),
(2, 'Buenos Aires-GBA'),
(3, 'Capital Federal'),
(4, 'Catamarca'),
(5, 'Chaco'),
(6, 'Chubut'),
(7, 'Córdoba'),
(8, 'Corrientes'),
(9, 'Entre Ríos'),
(10, 'Formosa'),
(11, 'Jujuy'),
(12, 'La Pampa'),
(13, 'La Rioja'),
(14, 'Mendoza'),
(15, 'Misiones'),
(16, 'Neuquén'),
(17, 'Río Negro'),
(18, 'Salta'),
(19, 'San Juan'),
(20, 'San Luis'),
(21, 'Santa Cruz'),
(22, 'Santa Fe'),
(23, 'Santiago del Estero'),
(24, 'Tierra del Fuego'),
(25, 'Tucumán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrador', '2017-12-28 22:26:03', '2018-08-12 22:21:05'),
(2, 'user', 'Usuario Normal', '2017-12-28 22:26:03', '2017-12-29 21:59:57'),
(3, 'administrativo', 'Administrativo', '2017-12-29 21:58:38', '2018-08-12 22:23:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `nombre`, `direccion`, `telefono`, `created_at`, `updated_at`) VALUES
(1, 'Oro Verde', 'Ruta 11 km 11', 343411111, NULL, NULL),
(2, 'Escuela Santa Fe', 'Cura Alvarez 555', 34345552, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'SIGAB', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Sistema integral de gestion de becas de FCyT - Uader', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/October2017/debian-rayo-grises-sapphiregd.jpg', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'SIGAB', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bienvenidos al panel de Administracion para la beca FCyT', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/August2018/DetEiGZZQc9kU40T1ukJ.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/August2018/dQIWgKU7BDF8ZsbEWYBt.png', '', 'image', 4, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 1, 'pt', 'Post', '2017-09-20 02:39:25', '2017-09-20 02:39:25'),
(2, 'data_types', 'display_name_singular', 2, 'pt', 'Página', '2017-09-20 02:39:25', '2017-09-20 02:39:25'),
(3, 'data_types', 'display_name_singular', 3, 'pt', 'Utilizador', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(5, 'data_types', 'display_name_singular', 5, 'pt', 'Menu', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(6, 'data_types', 'display_name_singular', 6, 'pt', 'Função', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(7, 'data_types', 'display_name_plural', 1, 'pt', 'Posts', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(8, 'data_types', 'display_name_plural', 2, 'pt', 'Páginas', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(9, 'data_types', 'display_name_plural', 3, 'pt', 'Utilizadores', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(11, 'data_types', 'display_name_plural', 5, 'pt', 'Menus', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(12, 'data_types', 'display_name_plural', 6, 'pt', 'Funções', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(22, 'menu_items', 'title', 3, 'pt', 'Publicações', '2017-09-20 02:39:26', '2017-09-20 02:39:26'),
(23, 'menu_items', 'title', 4, 'pt', 'Utilizadores', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(24, 'menu_items', 'title', 5, 'pt', 'Categorias', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(25, 'menu_items', 'title', 6, 'pt', 'Páginas', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(26, 'menu_items', 'title', 7, 'pt', 'Funções', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(27, 'menu_items', 'title', 8, 'pt', 'Ferramentas', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(28, 'menu_items', 'title', 9, 'pt', 'Menus', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(29, 'menu_items', 'title', 10, 'pt', 'Base de dados', '2017-09-20 02:39:27', '2017-09-20 02:39:27'),
(30, 'menu_items', 'title', 13, 'pt', 'Configurações', '2017-09-20 02:39:27', '2017-09-20 02:39:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades`
--

CREATE TABLE `universidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acronimo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `logo` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `universidades`
--

INSERT INTO `universidades` (`id`, `nombre`, `acronimo`, `direccion`, `telefono`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'UADER - Universidad autonoma de Entre Rios', 'U.A.D.E.R', 'Ramirez 1300', 343213123, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'id 2: rol normal',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dni` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/user-default.png',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `apellido`, `dni`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador', 'admins', 1234567, 'admin@admin.com', 'users\\March2019\\Ozc8lmdzD2357OXdXAil.jpeg', '$2y$10$6nsTxYjWZgY7fhrBfFz/kucxfnZLewAHC126Te88cz6MmwkhIdnae', '8rXJEaZ08Du2dZ9XlmZcovQ1C2wq2ajynY2s1VrBatjwxvJ6Ybd3Gq3BcdAU', NULL, '2017-10-16 08:55:45', '2019-03-19 23:23:21'),
(36, 3, 'damian', 'sacks', 1231321231, 'damian@damian.com', 'users/user-default.png', '$2y$10$tRUVvS2WMc40.UmB7I0uGekuhI0G98lmzJ2pOpAbx9tfTSmg6JBsi', 'JmmkE0vnmcEOt8dMz1khU17yx0hY6HBzzieVxmcjrm2LKnuNDaXdXrFBwQI2', NULL, '2018-12-15 14:11:52', '2018-12-19 21:30:16'),
(37, 2, 'Andre', 'Gimenez', 324568522, 'andres@andres.com', 'users/user-default.png', '$2y$10$wsIaxB8VZuiZ9tcAv7UCO.g93I0FLmFtitHZyhytlLLeWy9O18/6W', 'DCIYMHgimIBZqTw21PqTlSyHSoSlnlXRRdXxmYQ0bmwNbYnCDsCmInDIcLNB', NULL, '2019-02-11 23:12:21', '2019-03-22 23:20:14'),
(38, 2, 'pepe', 'pepito', 33222333, 'pepe@homail.com', 'users/user-default.png', '$2y$10$c1mLJBKT5nJ.VdfIuKKeB.4XG0LT8g2YASbrHGDRWROdBHd1hoNWC', 'AxzJmQCkSISxx5qdKh0GJ6UjL5Sp79nmqzLcTwtNixnHJgcWUjopFo2CnqJS', NULL, '2019-03-24 23:27:55', '2019-03-24 23:27:55'),
(39, 2, 'ricardo', 'rodriguez', 33432123, 'ricardo@ricardo.com', 'users/user-default.png', '$2y$10$u9SqE8M4RGPKCc.JN06eOO8UhQNOmTQdNdmfiMLH9Uo6NITqeNESW', NULL, NULL, '2019-03-25 00:39:26', '2019-03-25 00:39:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `becas`
--
ALTER TABLE `becas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`),
  ADD KEY `fk_calculos_auxiliares` (`id_calculos_auxiliares`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `calculos_aux`
--
ALTER TABLE `calculos_aux`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carreras_facultad_id` (`facultad_id`),
  ADD KEY `carreras_sede_id` (`sede_id`),
  ADD KEY `universidad_id` (`universidad_id`);

--
-- Indices de la tabla `condicion`
--
ALTER TABLE `condicion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consideraciones`
--
ALTER TABLE `consideraciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consideraciones_user_id` (`user_id`),
  ADD KEY `consideraciones_datos_id` (`datos_id`),
  ADD KEY `consideraciones_beca_id` (`beca_id`);

--
-- Indices de la tabla `cronogramas`
--
ALTER TABLE `cronogramas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beca_id` (`beca_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `datos_personas`
--
ALTER TABLE `datos_personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beca_id` (`beca_id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `id` (`id`),
  ADD KEY `datos_personas_user_id` (`user_id`),
  ADD KEY `provincia_id` (`provincia_id`),
  ADD KEY `localidad_id` (`localidad_id`);

--
-- Indices de la tabla `facultades`
--
ALTER TABLE `facultades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `familiars`
--
ALTER TABLE `familiars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `datos_id` (`datos_id`),
  ADD KEY `beca_id` (`beca_id`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `datos_id` (`datos_id`),
  ADD KEY `beca_id` (`beca_id`),
  ADD KEY `carrera_id` (`carrera_id`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_privincia` (`id_privincia`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `name` (`name`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `becas`
--
ALTER TABLE `becas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `calculos_aux`
--
ALTER TABLE `calculos_aux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `condicion`
--
ALTER TABLE `condicion`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `consideraciones`
--
ALTER TABLE `consideraciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cronogramas`
--
ALTER TABLE `cronogramas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `datos_personas`
--
ALTER TABLE `datos_personas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `facultades`
--
ALTER TABLE `facultades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `familiars`
--
ALTER TABLE `familiars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2383;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `universidades`
--
ALTER TABLE `universidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `becas`
--
ALTER TABLE `becas`
  ADD CONSTRAINT `fk_calculos_auxiliares` FOREIGN KEY (`id_calculos_auxiliares`) REFERENCES `calculos_aux` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_facultad_id` FOREIGN KEY (`facultad_id`) REFERENCES `facultades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carreras_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carreras_universidad_id` FOREIGN KEY (`universidad_id`) REFERENCES `universidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `consideraciones`
--
ALTER TABLE `consideraciones`
  ADD CONSTRAINT `consideraciones_beca_id` FOREIGN KEY (`beca_id`) REFERENCES `becas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consideraciones_datos_id` FOREIGN KEY (`datos_id`) REFERENCES `datos_personas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consideraciones_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cronogramas`
--
ALTER TABLE `cronogramas`
  ADD CONSTRAINT `cronogramas_beca_id` FOREIGN KEY (`beca_id`) REFERENCES `becas` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_personas`
--
ALTER TABLE `datos_personas`
  ADD CONSTRAINT `datos_personas_beca_id` FOREIGN KEY (`beca_id`) REFERENCES `becas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datos_personas_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datos_personas_localidad_id` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datos_personas_provincia_id` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datos_personas_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `familiars`
--
ALTER TABLE `familiars`
  ADD CONSTRAINT `familiars_becas_id` FOREIGN KEY (`beca_id`) REFERENCES `becas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `familiars_datos_id` FOREIGN KEY (`datos_id`) REFERENCES `datos_personas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `familiars_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_becas_id` FOREIGN KEY (`beca_id`) REFERENCES `becas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripciones_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripciones_datos_id` FOREIGN KEY (`datos_id`) REFERENCES `datos_personas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripciones_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_provincia_id` FOREIGN KEY (`id_privincia`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
