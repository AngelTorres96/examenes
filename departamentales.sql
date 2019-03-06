-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2019 a las 06:06:28
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `departamentales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadmin` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idadmin`, `user`, `pass`) VALUES
(1, 'admin', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `idexamen` int(11) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL,
  `nombre` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idmateria`, `nombre`) VALUES
(2, 'Graficacion'),
(3, 'TPA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `resp1` text NOT NULL,
  `resp2` text NOT NULL,
  `resp3` text NOT NULL,
  `resp4` text NOT NULL,
  `respcorrecta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `idprofesor` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` text NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--

CREATE TABLE `resultado` (
  `idexamen` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `login` tinytext NOT NULL,
  `pass` text NOT NULL,
  `nombre` tinytext NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `login`, `pass`, `nombre`, `email`) VALUES
(1, 'alumno', '1111', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`idexamen`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idgrupo`),
  ADD KEY `idmateria` (`idmateria`),
  ADD KEY `idexamen` (`idexamen`),
  ADD KEY `idprofesor` (`idprofesor`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`idpregunta`),
  ADD KEY `idexamen` (`idexamen`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`idprofesor`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`idrespuesta`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idexamen` (`idexamen`),
  ADD KEY `idgrupo` (`idgrupo`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD KEY `idexamen` (`idexamen`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idgrupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `idprofesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `idrespuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`),
  ADD CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`),
  ADD CONSTRAINT `grupo_ibfk_3` FOREIGN KEY (`idprofesor`) REFERENCES `profesor` (`idprofesor`),
  ADD CONSTRAINT `grupo_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`),
  ADD CONSTRAINT `respuesta_ibfk_3` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`);

--
-- Filtros para la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`),
  ADD CONSTRAINT `resultado_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
