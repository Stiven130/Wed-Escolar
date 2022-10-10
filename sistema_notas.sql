-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.9.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla sistema_notas.administrativos
CREATE TABLE IF NOT EXISTS `administrativos` (
  `id_administrativos` int(10) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_administrativos`),
  KEY `FK_administrativos_usuario` (`id_usuario`),
  CONSTRAINT `FK_administrativos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.administrativos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `administrativos` DISABLE KEYS */;
INSERT INTO `administrativos` (`id_administrativos`, `id_usuario`) VALUES
	(1, 3);
/*!40000 ALTER TABLE `administrativos` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.colegio
CREATE TABLE IF NOT EXISTS `colegio` (
  `id_colegio` int(11) NOT NULL AUTO_INCREMENT,
  `nomColegio` varchar(100) DEFAULT NULL,
  `rector` varchar(50) DEFAULT NULL,
  `dirColegio` varchar(50) DEFAULT NULL,
  `modalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_colegio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.colegio: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `colegio` DISABLE KEYS */;
INSERT INTO `colegio` (`id_colegio`, `nomColegio`, `rector`, `dirColegio`, `modalidad`) VALUES
	(1, 'Institucion Educativa Tecnico Agroecologico el Motilon', 'Jesus Javier Pantoja Martinez', 'Barrio Shumaker', 'Agroecologica');
/*!40000 ALTER TABLE `colegio` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.cronograma
CREATE TABLE IF NOT EXISTS `cronograma` (
  `id_cronograma` int(11) NOT NULL AUTO_INCREMENT,
  `fechaCronograma` date DEFAULT NULL,
  `horaCronograma` time DEFAULT NULL,
  `tipoCronograma` varchar(50) DEFAULT NULL,
  `nomCronograma` varchar(50) DEFAULT NULL,
  `desCronograma` varchar(400) DEFAULT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  PRIMARY KEY (`id_cronograma`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.cronograma: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cronograma` DISABLE KEYS */;
INSERT INTO `cronograma` (`id_cronograma`, `fechaCronograma`, `horaCronograma`, `tipoCronograma`, `nomCronograma`, `desCronograma`, `responsable`, `foto`) VALUES
	(1, '2022-10-23', '08:27:40', 'Celebracion', 'Dia de la Familia', 'Se realiza una serie de numerales por cada uno de los estudiantes ', 'Comite de convivencia', NULL);
/*!40000 ALTER TABLE `cronograma` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.docente
CREATE TABLE IF NOT EXISTS `docente` (
  `id_docente` int(10) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `gradoDocente` varchar(10) DEFAULT NULL,
  `id_materia` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `FK_docente_usuario` (`id_usuario`),
  KEY `FK_docente_materia` (`id_materia`),
  CONSTRAINT `FK_docente_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `FK_docente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.docente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` (`id_docente`, `id_usuario`, `gradoDocente`, `id_materia`) VALUES
	(1, 1, '2a', 4);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.estudiante
CREATE TABLE IF NOT EXISTS `estudiante` (
  `id_estudiante` int(10) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) DEFAULT NULL,
  `telefono_acudiente` varchar(50) DEFAULT NULL,
  `id_grado` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `FK_estudiante_usuario` (`id_usuario`),
  KEY `FK_estudiante_grado` (`id_grado`),
  CONSTRAINT `FK_estudiante_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `FK_estudiante_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.estudiante: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` (`id_estudiante`, `id_usuario`, `telefono_acudiente`, `id_grado`) VALUES
	(1, 2, '3103673822', 4);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.formulario
CREATE TABLE IF NOT EXISTS `formulario` (
  `id_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `nomFormulario` varchar(50) DEFAULT NULL,
  `categoFormulario` varchar(100) DEFAULT NULL,
  `descFormulario` varchar(400) DEFAULT NULL,
  `docuFormulario` varchar(100) DEFAULT NULL,
  `formatFormulario` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_formulario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.formulario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
INSERT INTO `formulario` (`id_formulario`, `nomFormulario`, `categoFormulario`, `descFormulario`, `docuFormulario`, `formatFormulario`) VALUES
	(1, 'Permiso', 'Inasistencia', 'Formato solicitud para justificar inasistencia a clases', NULL, NULL);
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.grado
CREATE TABLE IF NOT EXISTS `grado` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `nomGrado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.grado: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` (`id_grado`, `nomGrado`) VALUES
	(1, 'Preecolar'),
	(2, 'Primero'),
	(3, 'Segundo'),
	(4, 'Tercero'),
	(5, 'Cuarto'),
	(6, 'Quinto'),
	(7, 'Sexto'),
	(8, 'Septimo'),
	(9, 'Octavo'),
	(10, 'Noveno'),
	(11, 'Decimo'),
	(12, 'Once');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.hora
CREATE TABLE IF NOT EXISTS `hora` (
  `id_hora` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`id_hora`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.hora: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `hora` DISABLE KEYS */;
INSERT INTO `hora` (`id_hora`, `hora_inicio`, `hora_fin`) VALUES
	(1, '07:30:00', '08:25:00');
/*!40000 ALTER TABLE `hora` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) DEFAULT NULL,
  `id_grado` int(10) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_jornada` int(11) DEFAULT NULL,
  `id_hora` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `FK_horario_materia` (`id_materia`),
  KEY `FK_horario_jornada` (`id_jornada`),
  KEY `FK_horario_grado` (`id_grado`),
  KEY `FK_horario_docente` (`id_docente`),
  KEY `FK_horario_hora` (`id_hora`),
  CONSTRAINT `FK_horario_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `FK_horario_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `FK_horario_hora` FOREIGN KEY (`id_hora`) REFERENCES `hora` (`id_hora`),
  CONSTRAINT `FK_horario_jornada` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id_jornada`),
  CONSTRAINT `FK_horario_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.horario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` (`id_horario`, `id_docente`, `id_grado`, `id_materia`, `id_jornada`, `id_hora`) VALUES
	(1, 1, 4, 1, 1, 1);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.jornada
CREATE TABLE IF NOT EXISTS `jornada` (
  `id_jornada` int(11) NOT NULL AUTO_INCREMENT,
  `nomJornada` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_jornada`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.jornada: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
INSERT INTO `jornada` (`id_jornada`, `nomJornada`) VALUES
	(1, 'uno'),
	(2, 'dos'),
	(3, 'tres'),
	(4, 'cuatro'),
	(5, 'cinco');
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nomMateria` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.materia: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` (`id_materia`, `nomMateria`) VALUES
	(1, 'Procesos Biologicos'),
	(2, 'Matematicas'),
	(3, 'Historia'),
	(4, 'Informatica'),
	(5, 'Ingles'),
	(6, 'Castellano'),
	(7, 'Educacion Fisica'),
	(8, 'Etica y Valores'),
	(9, 'Procesos Quimicos'),
	(10, 'Religion'),
	(11, 'Artistica'),
	(12, 'Agroecologia'),
	(13, 'Geografia');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `id_matricula` int(10) NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(10) DEFAULT NULL,
  `id_grado` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `FK_matricula_grado` (`id_grado`),
  KEY `FK_matricula_estudiante` (`id_estudiante`),
  CONSTRAINT `FK_matricula_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_matricula_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.matricula: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` (`id_matricula`, `id_estudiante`, `id_grado`) VALUES
	(1, 1, 4);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `id_notas` int(11) NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_docente` int(10) DEFAULT NULL,
  `id_estudiante` int(10) DEFAULT NULL,
  `nota` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_notas`),
  KEY `FK_notas_grado` (`id_grado`),
  KEY `FK_notas_materia` (`id_materia`),
  KEY `FK_notas_docente` (`id_docente`),
  KEY `FK_notas_estudiante` (`id_estudiante`),
  CONSTRAINT `FK_notas_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `FK_notas_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `FK_notas_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `FK_notas_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.notas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` (`id_notas`, `id_grado`, `id_materia`, `id_docente`, `id_estudiante`, `nota`, `observacion`) VALUES
	(1, 4, 9, 1, 1, 7.70, 'Debe Mejorar');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `idenUsuario` varchar(50) DEFAULT NULL,
  `nomUsuario` varchar(30) DEFAULT NULL,
  `apeUsuario` varchar(30) DEFAULT NULL,
  `telUsuario` varchar(50) DEFAULT NULL,
  `emailUsuario` varchar(50) DEFAULT NULL,
  `loginUsuario` varchar(50) DEFAULT NULL,
  `passwordUsuario` varchar(50) DEFAULT NULL,
  `perfilUsuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `idenUsuario`, `nomUsuario`, `apeUsuario`, `telUsuario`, `emailUsuario`, `loginUsuario`, `passwordUsuario`, `perfilUsuario`) VALUES
	(1, '1088734444', 'Paola Andrea', 'Melo Andrade', '3218956472', 'andrea_meloo@hotmail.com', 'paola123', '1088734444', 'docente'),
	(2, '1030022337', 'Hanna Valentina', 'Rodriguez Vacca', NULL, NULL, 'hanna123', '1030022337', 'estudiante'),
	(3, '59795787', 'Julieta ', 'Montenegro', '3187649994', 'julieta@gmail.com', 'julieta123', '59795787', 'secretaria');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
