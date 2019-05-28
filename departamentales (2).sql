-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2019 a las 16:24:52
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
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `idasignacion` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `hora_inicio` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`idasignacion`, `idexamen`, `idgrupo`, `estado`, `hora_inicio`) VALUES
(1, 5, 1, 0, '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `idexamen` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idmateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`idexamen`, `nombre`, `idmateria`) VALUES
(5, 'Unidad 1', 2),
(6, 'Unidad 2', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idgrupo`, `idmateria`, `idprofesor`, `nombre`) VALUES
(1, 2, 9, 'Grafi 10-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `idinscripcion` int(11) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`idinscripcion`, `idgrupo`, `idusuario`) VALUES
(1, 1, 1);

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
(2, 'Graficacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `opc1` text NOT NULL,
  `opc2` text NOT NULL,
  `opc3` text NOT NULL,
  `opc4` text NOT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idpregunta`, `idexamen`, `descripcion`, `opc1`, `opc2`, `opc3`, `opc4`, `respuesta`) VALUES
(1, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(2, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(3, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(4, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(5, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(6, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(7, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(8, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(9, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(10, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(12, 5, 'Â¿Cual es la capital de japon?', 'tokio', 'nagasaki', 'hiroshima', 'osaka', 'tokio'),
(14, 5, 'Â¿cual es la capital de turquia?', 'Mardin', 'Santa sofia', 'Estambul', 'Ankara', 'Ankara'),
(15, 5, 'Â¿cual es la capital de rusia?', 'Moscu', 'st petersuburgo', 'Novosibirsk', 'Sochi', 'Moscu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `idprofesor` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` text NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `e_mail` varchar(99) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idprofesor`, `user`, `pass`, `nombre`, `status`, `e_mail`, `token`) VALUES
(1, 'alex.herrera', '123', 'Alexis Herrera', 1, 'alex.tremo@gmail.com', ''),
(2, 'Jos_e', '123', 'Jose Jose Arreola', 1, 'josecito.moxito006@gmail.com', ''),
(3, 'ajelandro_a', '123', 'Alejandro Amaro', 0, 'amarito_bebe_548@gmail.com', ''),
(4, 'carri_on', '123', 'Eduardo Carrion', 1, 'carrion.cito60@gmail.com', ''),
(5, 'alfa', '123', 'miguel', 0, 'angel@outlook.com', ''),
(6, 'alfa', '123', 'miguel', 1, 'angel@outlook.com', ''),
(7, 'alfa', '1234', 'miguel', 0, 'angel@outlook.com', ''),
(8, 'alfa', 'a', 'miguel', 0, 'angel@outlook.com', ''),
(9, 'Alejandro', '1234', 'Alejandro Mireles', 1, 'alejandro.m@hotmail.com', ''),
(10, 'pedro12', '123', ' Pedro Sanchez', 0, 'pedro.s@email.com', ''),
(11, 'profesor', '123', 'luis', 0, 'luis@email.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--

CREATE TABLE `resultado` (
  `idresultado` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
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
(1, '15121219', '1234', 'Miguel', 'angel@correo.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadmin`),
  ADD UNIQUE KEY `administrador_idadmin_uindex` (`idadmin`),
  ADD UNIQUE KEY `administrador_user_uindex` (`user`);

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`idasignacion`),
  ADD UNIQUE KEY `asignacion_idasignacion_uindex` (`idasignacion`),
  ADD KEY `asignacion_examen_idexamen_fk` (`idexamen`),
  ADD KEY `asignacion_grupo_idgrupo_fk` (`idgrupo`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`idexamen`),
  ADD UNIQUE KEY `examen_idexamen_uindex` (`idexamen`),
  ADD KEY `examen_materia_idmateria_fk` (`idmateria`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idgrupo`),
  ADD UNIQUE KEY `grupo_idgrupo_uindex` (`idgrupo`),
  ADD KEY `grupo_materia_idmateria_fk` (`idmateria`),
  ADD KEY `grupo_profesor_idprofesor_fk` (`idprofesor`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`idinscripcion`),
  ADD UNIQUE KEY `inscripcion_idinscripcion_uindex` (`idinscripcion`),
  ADD KEY `inscripcion_grupo_idgrupo_fk` (`idgrupo`),
  ADD KEY `inscripcion_usuario_idusuario_fk` (`idusuario`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`),
  ADD UNIQUE KEY `materia_idmateria_uindex` (`idmateria`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`idpregunta`),
  ADD UNIQUE KEY `pregunta_idpregunta_uindex` (`idpregunta`),
  ADD KEY `pregunta_examen_idexamen_fk` (`idexamen`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`idprofesor`),
  ADD UNIQUE KEY `profesor_idprofesor_uindex` (`idprofesor`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`idrespuesta`),
  ADD KEY `usuario` (`idusuario`),
  ADD KEY `examen` (`idexamen`),
  ADD KEY `pregunta` (`idpregunta`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`idresultado`),
  ADD UNIQUE KEY `reesultado_idresultado_uindex` (`idresultado`),
  ADD KEY `resultado_examen_idexamen_fk` (`idexamen`),
  ADD KEY `resultado_usuario_idusuario_fk` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD UNIQUE KEY `usuario_email_uindex` (`email`),
  ADD UNIQUE KEY `usuario_idusuario_uindex` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `idasignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `idinscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `idprofesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `idrespuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultado`
--
ALTER TABLE `resultado`
  MODIFY `idresultado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_examen_idexamen_fk` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignacion_grupo_idgrupo_fk` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_materia_idmateria_fk` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_materia_idmateria_fk` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_profesor_idprofesor_fk` FOREIGN KEY (`idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_grupo_idgrupo_fk` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripcion_usuario_idusuario_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_examen_idexamen_fk` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `examen` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`),
  ADD CONSTRAINT `usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_examen_idexamen_fk` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resultado_usuario_idusuario_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
