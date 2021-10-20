-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2021 a las 16:10:36
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `exparcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` tinyint(4) NOT NULL,
  `tipo_zombie` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `tipo_zombie`) VALUES
(1, 'infección'),
(2, 'desorientación'),
(3, 'violencia'),
(4, 'desmayo'),
(5, 'transformación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_zombie`
--

CREATE TABLE `estado_zombie` (
  `id` tinyint(4) NOT NULL,
  `id_zombie` tinyint(4) NOT NULL,
  `id_estado` tinyint(4) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie`
--

CREATE TABLE `zombie` (
  `id_zombie` tinyint(4) NOT NULL,
  `nombre_completo` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_zombie`
--
ALTER TABLE `estado_zombie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zombie` (`id_zombie`,`id_estado`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `zombie`
--
ALTER TABLE `zombie`
  ADD PRIMARY KEY (`id_zombie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado_zombie`
--
ALTER TABLE `estado_zombie`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `zombie`
--
ALTER TABLE `zombie`
  MODIFY `id_zombie` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estado_zombie`
--
ALTER TABLE `estado_zombie`
  ADD CONSTRAINT `estado_zombie_ibfk_1` FOREIGN KEY (`id_zombie`) REFERENCES `zombie` (`id_zombie`),
  ADD CONSTRAINT `estado_zombie_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
