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
  `cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_administrativos`),
  KEY `FK_administrativos_administrativos` (`id_usuario`),
  CONSTRAINT `FK_administrativos_administrativos` FOREIGN KEY (`id_usuario`) REFERENCES `administrativos` (`id_administrativos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.administrativos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrativos` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.colegio
CREATE TABLE IF NOT EXISTS `colegio` (
  `id_colegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `rector` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `modalidad` varchar(50) DEFAULT NULL,
  `foro` longblob DEFAULT NULL,
  PRIMARY KEY (`id_colegio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.colegio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `colegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `colegio` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.cronograma
CREATE TABLE IF NOT EXISTS `cronograma` (
  `id_cronograma` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  PRIMARY KEY (`id_cronograma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.cronograma: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cronograma` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronograma` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.docente
CREATE TABLE IF NOT EXISTS `docente` (
  `id_docente` int(10) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `grado` varchar(10) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `id_materia` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `FK_docente_usuario` (`id_usuario`),
  KEY `FK_docente_materia` (`id_materia`),
  CONSTRAINT `FK_docente_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `FK_docente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.docente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.estudiante
CREATE TABLE IF NOT EXISTS `estudiante` (
  `id_estudiante` int(10) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) DEFAULT NULL,
  `telefono_acudiente` int(10) DEFAULT NULL,
  `id_grado` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `FK_estudiante_usuario` (`id_usuario`),
  KEY `FK_estudiante_grado` (`id_grado`),
  CONSTRAINT `FK_estudiante_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `FK_estudiante_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.estudiante: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.formulario
CREATE TABLE IF NOT EXISTS `formulario` (
  `id_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `documento` varchar(100) DEFAULT NULL,
  `formato` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.formulario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.grado
CREATE TABLE IF NOT EXISTS `grado` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.grado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.hora
CREATE TABLE IF NOT EXISTS `hora` (
  `id_hora` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`id_hora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.hora: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `hora` DISABLE KEYS */;
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
  KEY `FK_horario_docente` (`id_docente`),
  KEY `FK_horario_grado` (`id_grado`),
  KEY `FK_horario_materia` (`id_materia`),
  KEY `FK_horario_jornada` (`id_jornada`),
  KEY `FK_horario_hora` (`id_hora`),
  CONSTRAINT `FK_horario_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `FK_horario_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `FK_horario_hora` FOREIGN KEY (`id_hora`) REFERENCES `hora` (`id_hora`),
  CONSTRAINT `FK_horario_jornada` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id_jornada`),
  CONSTRAINT `FK_horario_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.horario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.jornada
CREATE TABLE IF NOT EXISTS `jornada` (
  `id_jornada` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.jornada: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.materia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `id_matricula` int(10) NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(10) DEFAULT NULL,
  `id_grado` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `FK_matricula_grado` (`id_grado`),
  CONSTRAINT `FK_matricula_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.matricula: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `id_notas` int(11) NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_docente` int(10) DEFAULT NULL,
  `id_estudiante` int(10) DEFAULT NULL,
  `nota` decimal(10,2) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id_notas`),
  KEY `FK_notas_grado` (`id_grado`),
  KEY `FK_notas_materia` (`id_materia`),
  KEY `FK_notas_docente` (`id_docente`),
  KEY `FK_notas_estudiante` (`id_estudiante`),
  CONSTRAINT `FK_notas_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `FK_notas_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `FK_notas_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `FK_notas_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.notas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_notas.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` int(10) DEFAULT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_notas.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
