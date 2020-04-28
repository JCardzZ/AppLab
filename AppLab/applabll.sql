-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2020 a las 00:19:24
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `applabll`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `description`, `name`) VALUES
(1, 'ROLE_ADMIN', 'ADMIN'),
(2, 'ROLE_USER', 'USER'),
(3, 'ROLE_SUPERVISOR', 'SUPERVISOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `dui` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `password`, `username`, `dui`) VALUES
(1, 'cardoza@gmail.com', 'Manuel', 'Cardoza editado x2 x3 x4', '$2a$04$KCU5moYDB4H6p7o9Mvb8rO7qfYajwmjfGh.vP8JWome3U4yOeydci', 'admin', NULL),
(6, 'usuario@gmail.com', 'Usuario', 'Usuario', '$2a$04$v.SvmmKfqbNGxtHzOqzRiuOYA/rxHLd9V6NXPY3vHNh2TtoMcMSBq', 'usuario', NULL),
(17, 'serrano@gmail.com', 'Luna', 'Serrano', '$2a$04$8FgZUgqDbmc093wdTLo/O.EMtu5V5kJjyYT.Xew/puluQCbR7fFye', 'luna', '11111111-1'),
(9, 'mejia@gmail.com', 'RODRIGO', 'MEJIA', '$2a$04$zfnnuPVcIS4SwTrR6SqH.OgkJgAd/1x7kd5/gP6vlB2PgzoNM95iq', 'mejia', NULL),
(10, 'linares@gmail.com', 'Douglas', 'Linares', '$2a$04$SIfyyZ5UVe7QFHShnmtuoeJrI6f/7GO9WRj9OFqVGfawVri7ovpS6', 'douglas', NULL),
(11, 'mariana@gmail.com', 'Mariana', 'Mejia', '$2a$04$2wsJ7bvYHjcz3DBg2FTMFuIk2atLEPVWvjiKxOmKO7RlYF1LmF2k2', 'maria', NULL),
(14, 'prprprp@gmail.com', 'PRUEBA editada', 'PREUBA', '$2a$04$2sZ3Pd9TYSpuQIoG.bS13OL4.aKFIAByNmbIkB89.63s93cR6rew.', 'user', '99999999-9'),
(16, 'cardozamanuel96@gmail.com', 'Manuel de Jesus', 'Cardoza Cardoza', '$2a$04$fG95xe33qv32aWUN0tWCO.N1CEQ4W2vNymvIAxdeFYDx77I9LqhLK', 'man', '05762870-2'),
(18, 'moreno@gmail.com', 'Moreno', 'Rivera', '$2a$04$XGTsTxaXojwQWMld7JDfqOe7gdmzZP1YMvSDx11Wyn08M/Mk80VHi', 'moreno', '00000000-0'),
(19, 'moreno@gmail.com', 'Moreno', 'Rivera', '$2a$04$/haYT1Yb4IK5O3/33gf1x.vT3DLJQhFc.PNXciK.07x/zOD05hLIG', 'mor', '22222222-2'),
(20, 'mauricio@gmai.com', 'Mauricio ', 'Tejada', '$2a$04$getudS3RqZDTz0SdIFO8gu7X53N90tvQVwrnGHx/I782JDAo8LWXW', 'mauricio', '77777777-7'),
(21, 'juanamena@gmail.com', 'juana', 'mejia', '$2a$04$71dmTA0SC6z2GtH0lv8o8OMbE5cwKVdpZ8JHn94Xzfoqz/7nvUHhm', 'juana', '11111111'),
(22, 'juanito@gmail.com', 'juanito', 'perez', '$2a$04$akYAc4WFPK5fPFrr36Uc6uXqlmvf3lsyI74ppWvLXxl1F.wudex5K', 'juanito', '789009872'),
(23, 'mena@gmail.com', 'Joan', 'Mena', '$2a$04$NL1XysIm5CVVMhOl2IrUQuNxmPVvHZqWP1Lm1o1KDyMoY5RPaBEZ2', 'juan', '33333333-3'),
(24, 'cardoza@anagmail.com', 'Ana', 'Cardoza', '$2a$04$gSrv/8eOpk6ukLTJeTs3euCH4JBtsiOKAz5g0SrZfNjyzHwSKGhaG', 'ana', '25687980-0'),
(25, 'antony@gmail.com', 'Antony Enmanuel', 'Fuentes Villacorta', '$2a$04$4/VyGaUryddJFtCy1K7cjuG2KfWtt3IUbQo2CXvtQz8UJ98J1eQmy', 'antony', '12345678-9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(6, 1),
(9, 2),
(10, 2),
(11, 2),
(14, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(24, 2),
(25, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6vodq2mj2sjhusib1abh695t8` (`dui`) USING HASH;

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
