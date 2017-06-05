-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: pweb2017core
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesorio`
--

DROP TABLE IF EXISTS `accesorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22222224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorio`
--

LOCK TABLES `accesorio` WRITE;
/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` VALUES (1,'0',NULL),(22222222,'juan',NULL),(22222223,'0',NULL);
/*!40000 ALTER TABLE `accesorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `admin_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `vehiculo_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL,
  `fecha_alquiler` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `contrato_id` (`contrato_id`),
  CONSTRAINT `alquiler_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `alquiler_contrato` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  CONSTRAINT `alquiler_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alquiler_sucursal` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alquiler_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES (12,19,2,1,1,1,'2017-06-07','2017-06-08'),(13,20,2,1,7,1,'2017-06-09','2017-06-11');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler_descuento`
--

DROP TABLE IF EXISTS `alquiler_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquiler_descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alquiler_id` int(11) DEFAULT NULL,
  `descuento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alquiler_id` (`alquiler_id`),
  KEY `descuento_id` (`descuento_id`),
  CONSTRAINT `alquiler_descuento` FOREIGN KEY (`alquiler_id`) REFERENCES `alquiler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `descuento_alquiler` FOREIGN KEY (`descuento_id`) REFERENCES `descuento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler_descuento`
--

LOCK TABLES `alquiler_descuento` WRITE;
/*!40000 ALTER TABLE `alquiler_descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquiler_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arriendo_proveedor`
--

DROP TABLE IF EXISTS `arriendo_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arriendo_proveedor` (
  `id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL DEFAULT '0',
  `vehiculo_id` int(11) NOT NULL DEFAULT '0',
  `contrato_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) NOT NULL DEFAULT '0',
  `valor_dia` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKcontrato_id` (`contrato_id`),
  KEY `FKempleado_id` (`empleado_id`),
  KEY `FKvehiculo_id` (`vehiculo_id`),
  KEY `FKproveedor_id` (`proveedor_id`),
  KEY `FKsucursal_id` (`sucursal_id`),
  CONSTRAINT `FKcontrato_id` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FKempleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  CONSTRAINT `FKsucursal_id` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKvehiculo_id` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arriendo_proveedor`
--

LOCK TABLES `arriendo_proveedor` WRITE;
/*!40000 ALTER TABLE `arriendo_proveedor` DISABLE KEYS */;
INSERT INTO `arriendo_proveedor` VALUES (1,4,1,1,1,1,30000),(2,5,4,1,1,1,28000),(3,8,30,NULL,2,1,254214);
/*!40000 ALTER TABLE `arriendo_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `sueldo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sueldo_id` (`sueldo_id`),
  CONSTRAINT `cargo_sueldo` FOREIGN KEY (`sueldo_id`) REFERENCES `sueldo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `tipo_cliente` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_cliente` (`tipo_cliente`),
  CONSTRAINT `FK_cliente_tipo_usuario` FOREIGN KEY (`tipo_cliente`) REFERENCES `tipo_usuario` (`tipo_usuario_id`),
  CONSTRAINT `cliente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (19,2,1),(20,5,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto_mantenimiento`
--

DROP TABLE IF EXISTS `concepto_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto_mantenimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto_mantenimiento`
--

LOCK TABLES `concepto_mantenimiento` WRITE;
/*!40000 ALTER TABLE `concepto_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `concepto_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_contrato` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_contrato` (`tipo_contrato`),
  KEY `cargo_id` (`cargo_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `empleado_id` (`registrado_por`),
  KEY `sucursal_id` (`sucursal_id`),
  CONSTRAINT `contrato_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_empleado` FOREIGN KEY (`registrado_por`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_sucursal` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_tipo` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipo_contrato` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,NULL,NULL,8,NULL,1);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Caqueta');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `descuento_tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_descuento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `empleado_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,2),(2,10),(3,11);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL COMMENT '0 = inactivo, 1 = activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Road',1);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_poliza`
--

DROP TABLE IF EXISTS `empresa_poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_poliza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_poliza`
--

LOCK TABLES `empresa_poliza` WRITE;
/*!40000 ALTER TABLE `empresa_poliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `favorito_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorito_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria`
--

DROP TABLE IF EXISTS `galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria`
--

LOCK TABLES `galeria` WRITE;
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
INSERT INTO `galeria` VALUES (1,'http://complotmagazine.com/wp-content/uploads/2016/03/BugattiChiron-1200x8011-1200x700.jpg'),(2,'../images/vehiculos/toyotahilux.jpg'),(3,'../images/vehiculos/camaro.jpg'),(4,'../images/vehiculos/colorado.jpg'),(5,'../images/vehiculos/creta.jpg'),(6,'../images/vehiculos/cruze.jpg'),(7,'../images/vehiculos/tucyson.jpg'),(8,'../images/vehiculos/mazda2.jpg'),(9,'../images/vehiculos/mazda1.jpg'),(10,'../images/vehiculos/sportage.jpg'),(11,'../images/vehiculos/mazda6.jpg'),(12,'../images/vehiculos/toyotapradoblin.jpg'),(13,'../images/vehiculos/vanshyndai.jpg'),(14,'../images/vehiculos/vanshyndai.jpg'),(21,'../images/vehiculos/sandero.jpg'),(22,'../images/vehiculos/sandero.jpg'),(23,'../images/vehiculos/sandero.jpg'),(24,'../images/vehiculos/sandero.jpg');
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Femenino'),(5,'Otro');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantenimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int(11) DEFAULT NULL,
  `concepto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `concepto_id` (`concepto_id`),
  CONSTRAINT `mantenimiento_concepto` FOREIGN KEY (`concepto_id`) REFERENCES `concepto_mantenimiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mantenimiento_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca_vehiculo`
--

DROP TABLE IF EXISTS `marca_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca_vehiculo`
--

LOCK TABLES `marca_vehiculo` WRITE;
/*!40000 ALTER TABLE `marca_vehiculo` DISABLE KEYS */;
INSERT INTO `marca_vehiculo` VALUES (1,'Chevrolet'),(2,'Renault'),(3,'Toyota'),(4,'Kia'),(5,'Mazda'),(6,'Hyndai');
/*!40000 ALTER TABLE `marca_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_menu` varchar(255) DEFAULT NULL,
  `url_menu` varchar(200) DEFAULT NULL,
  `icon_nombre` varchar(255) DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Crear Usuario','../Crear_user','person_add',NULL),(2,'Crear Rol','../Crear_rol','domain',NULL),(3,'Registrar cliente','~/Cliente/create','portrait',NULL),(4,'Registrar proveedor','~/Proveedor/create','directions_walk',NULL),(5,'Registrar alquiler','~/Alquiler/create','account_balance_wallet',NULL),(6,'Registrar auto','~/RegisterCar/create','directions_car',NULL),(7,'Reporte de autos','../RegisterCar/reporte','directions_car',NULL),(8,'Reporte de Alquileres','../Alquiler/reporte','account_balance_wallet',NULL),(9,'Reporte de clientes','../Cliente/reporte','portrait',NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_submenu`
--

DROP TABLE IF EXISTS `menu_submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permiso_id` int(11) NOT NULL,
  `submenu_id` int(11) NOT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permiso_id` (`permiso_id`),
  KEY `submenu_id` (`submenu_id`),
  CONSTRAINT `menu_submenu` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `submenu_menu` FOREIGN KEY (`submenu_id`) REFERENCES `submenu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_submenu`
--

LOCK TABLES `menu_submenu` WRITE;
/*!40000 ALTER TABLE `menu_submenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `municipio_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Florencia',1);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `permisos` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_permiso_usuario` (`user_id`),
  CONSTRAINT `FK_permiso_usuario` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,2,'1,2,3,4,5,6\r\n');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliza`
--

DROP TABLE IF EXISTS `poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poliza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `vehiculo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `poliza_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa_poliza` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `poliza_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliza`
--

LOCK TABLES `poliza` WRITE;
/*!40000 ALTER TABLE `poliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `propietario_tipo_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `propietario_tipo_id` (`propietario_tipo_id`),
  CONSTRAINT `propietario_tipo_id` FOREIGN KEY (`propietario_tipo_id`) REFERENCES `tipo_usuario` (`tipo_usuario_id`),
  CONSTRAINT `proveedor_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (4,3,1),(5,4,1),(6,1,1),(7,6,1),(8,7,1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Rol_nombre` varchar(255) NOT NULL,
  `permisos_id` varchar(200) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla para guardar los roles que conceden distintos tipos de permisos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (0,'default','0'),(1,'admin','1,2,3,4,5,6,7,8,9,10'),(2,'empleado','4,5,10'),(3,'vendedor','4,6,10');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `dispositivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `sesion_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submenu`
--

DROP TABLE IF EXISTS `submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `urlnombre` varchar(255) DEFAULT NULL,
  `menu_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmenu_id` (`menu_padre`),
  CONSTRAINT `FKmenu_id` FOREIGN KEY (`menu_padre`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submenu`
--

LOCK TABLES `submenu` WRITE;
/*!40000 ALTER TABLE `submenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `municipio_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `municipio_id` (`municipio_id`),
  CONSTRAINT `sucursal_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sucursal_municipio` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,1,1,'Florencia');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_admin`
--

DROP TABLE IF EXISTS `sucursal_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_sucursal` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sucursal_admin` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_admin`
--

LOCK TABLES `sucursal_admin` WRITE;
/*!40000 ALTER TABLE `sucursal_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo`
--

DROP TABLE IF EXISTS `sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sueldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sueldo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo`
--

LOCK TABLES `sueldo` WRITE;
/*!40000 ALTER TABLE `sueldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sueldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_combustible`
--

DROP TABLE IF EXISTS `tipo_combustible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_combustible` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_combustible`
--

LOCK TABLES `tipo_combustible` WRITE;
/*!40000 ALTER TABLE `tipo_combustible` DISABLE KEYS */;
INSERT INTO `tipo_combustible` VALUES (1,'Gasolina\n'),(2,'Gas');
/*!40000 ALTER TABLE `tipo_combustible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_descuento`
--

DROP TABLE IF EXISTS `tipo_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_descuento`
--

LOCK TABLES `tipo_descuento` WRITE;
/*!40000 ALTER TABLE `tipo_descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_direccion`
--

DROP TABLE IF EXISTS `tipo_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_dir_nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_direccion`
--

LOCK TABLES `tipo_direccion` WRITE;
/*!40000 ALTER TABLE `tipo_direccion` DISABLE KEYS */;
INSERT INTO `tipo_direccion` VALUES (1,'Hidraulica'),(2,'Asistida');
/*!40000 ALTER TABLE `tipo_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_transmicion`
--

DROP TABLE IF EXISTS `tipo_transmicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_transmicion` (
  `id_trans` int(11) NOT NULL,
  `tp_transmicion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_trans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caracteristicas de la caja solo dos tipo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_transmicion`
--

LOCK TABLES `tipo_transmicion` WRITE;
/*!40000 ALTER TABLE `tipo_transmicion` DISABLE KEYS */;
INSERT INTO `tipo_transmicion` VALUES (1,'Automatica'),(2,'Manual');
/*!40000 ALTER TABLE `tipo_transmicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `tipo_usuario_id` int(8) NOT NULL,
  `tipo_usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`tipo_usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='persona natural o persona juridica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Persona Natural'),(2,'Persona Juridica');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_nombre` varchar(255) DEFAULT NULL,
  `precio_dia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo` VALUES (1,'camioneta',35000),(2,'compacto',30000),(3,'campero',40000),(4,'pick up',50000),(5,'vans',80000),(6,'blindado',100000),(7,'auto de lujo',250000);
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `celular` bigint(20) unsigned DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '0 = inactivo, 1 = activo',
  `num_tipo_identificacion` bigint(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `rol_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `email` (`email`),
  KEY `empresa_id` (`empresa_id`),
  KEY `genero_id` (`genero_id`),
  KEY `roles_id` (`rol_id`),
  CONSTRAINT `roles_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `usuario_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'luis andres ','vela tovar',1,'vela@gmail.com','*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D',3204522685,'2017-05-22 21:59:34',1,123456789,NULL,3),(2,1,'Oliverio ','Caviedes',1,'camilo@udla.edu','*A4B6157319038724E3560894F7F932C8886EBFCF',3122865784,'2017-05-20 20:33:56',1,11547845,'1993-05-12',1),(3,1,'jorge','arredondo marin',2,'jorge@gmail.com','*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D',3255872589,'2017-05-20 21:31:23',1,123456789,NULL,0),(4,1,'juan david','restrepo',1,'restrepo@udla.edu','*BD1F2A1BDE8641B80A3953F026490E3B84A4914E',3215488789,'2017-05-20 21:32:15',1,11547845685,NULL,0),(5,1,'mitch','aguilar',1,'mitch@mail.com','*A4B6157319038724E3560894F7F932C8886EBFCF',3215488789,'2017-05-20 21:43:34',1,1115456854,'1999-03-18',0),(6,1,'alexander','ramos',1,'ramos@hotmail.com','*AF3C5B1EE3C98D5BD6F37E166056B3FBABFF07AC',3202541546,'2017-05-22 22:17:15',1,111548574589,NULL,0),(7,1,'julio','vasquez',1,'halo2@udla.edu','*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D',3214565878,'2017-05-25 02:08:38',1,123456789,NULL,0),(8,1,'vendedor','a',NULL,'vendedor@udla.com','*A4B6157319038724E3560894F7F932C8886EBFCF',NULL,'2017-05-29 21:45:10',1,555,NULL,3),(9,1,'jun','cc',NULL,'em@udla.com','*A4B6157319038724E3560894F7F932C8886EBFCF',NULL,'2017-05-31 13:30:05',1,666,NULL,1),(10,1,'admin','a',NULL,'admin@root.com','*A4B6157319038724E3560894F7F932C8886EBFCF',NULL,'2017-06-03 00:07:09',1,777,NULL,1),(11,1,'prueba',NULL,NULL,'pr_cretauser','*A4B6157319038724E3560894F7F932C8886EBFCF',NULL,'2017-06-03 00:22:14',1,888,NULL,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permisos`
--

DROP TABLE IF EXISTS `usuario_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `permiso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `permiso_id` (`permiso_id`),
  CONSTRAINT `permiso_usuario` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_permiso` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permisos`
--

LOCK TABLES `usuario_permisos` WRITE;
/*!40000 ALTER TABLE `usuario_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) NOT NULL,
  `tipo_vehiculo_id` int(11) DEFAULT NULL,
  `tipo_direccion_id` int(11) DEFAULT NULL,
  `tipo_transmicion_id` int(11) NOT NULL DEFAULT '0',
  `marca_id` int(11) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL COMMENT 'Nombre del carro',
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_combustible_id` int(255) NOT NULL,
  `color` varchar(100) DEFAULT NULL,
  `cilindraje` int(200) DEFAULT NULL,
  `placa` varchar(200) NOT NULL,
  `disponible` int(5) DEFAULT NULL COMMENT '1=disponible, 0 = no disponible',
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `km` int(200) DEFAULT '99999',
  `precio_dia` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`placa`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `tipo_vehiculo` (`tipo_vehiculo_id`),
  KEY `tipo_combustible` (`tipo_direccion_id`),
  KEY `marca_id` (`marca_id`),
  KEY `FK_transmicion_tipo` (`tipo_transmicion_id`),
  KEY `FKtipo_combustible` (`tipo_combustible_id`),
  CONSTRAINT `FK_transmicion_tipo` FOREIGN KEY (`tipo_transmicion_id`) REFERENCES `tipo_transmicion` (`id_trans`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKtipo_combustible` FOREIGN KEY (`tipo_combustible_id`) REFERENCES `tipo_combustible` (`id`),
  CONSTRAINT `fk_direccion` FOREIGN KEY (`tipo_direccion_id`) REFERENCES `tipo_direccion` (`id`),
  CONSTRAINT `vehiculo_marca` FOREIGN KEY (`marca_id`) REFERENCES `marca_vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_sucursal` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_tipo` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,1,4,7,2,1,1,'camaro 2017','perfecto estado, modificaciones de suspencion',1,'rojo',1200,'ghj456',0,'2017-05-20 21:38:11',0,80000),(2,1,5,4,1,2,1,'colorado 2017','nueva',1,'rojo',600,'cru254',1,'2017-05-22 21:43:46',0,65000),(3,1,4,7,1,1,1,'cruze 2016','r',1,'Otro',600,'xcv123',1,'2017-05-22 21:50:24',600,54000),(4,1,4,7,1,1,5,'mx5','super auto de  lujo',1,'azul',568,'weq258',1,'2017-05-22 22:13:21',4000,60000),(5,1,7,1,1,2,4,'sportage 2016','color blanco',1,'Otro',1300,'vel456',1,'2017-05-22 22:18:34',120,90000),(6,1,7,7,2,1,5,'mazda 6','waouu',1,'azul',789,'rfv154',1,'2017-05-22 22:19:50',0,20000),(7,1,7,6,1,2,3,'prado 2017','blindaje nivel 5',1,'Otro',860,'mit000',0,'2017-05-22 22:24:50',0,130000),(17,1,8,5,1,2,4,'v','ddd',1,'rojo',565,'xxx111',1,'2017-05-25 02:18:44',NULL,54000),(30,1,8,2,1,1,2,'sandero','hoy 4/062017',1,'Otro',1500,'wds123',1,'2017-06-03 00:36:46',156,368610);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_accesorio`
--

DROP TABLE IF EXISTS `vehiculo_accesorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo_accesorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int(11) DEFAULT NULL,
  `accesorio_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `accesorio_id` (`accesorio_id`),
  CONSTRAINT `accesorio_vehiculo` FOREIGN KEY (`accesorio_id`) REFERENCES `accesorio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_accesorio` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_accesorio`
--

LOCK TABLES `vehiculo_accesorio` WRITE;
/*!40000 ALTER TABLE `vehiculo_accesorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo_accesorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_galeria`
--

DROP TABLE IF EXISTS `vehiculo_galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo_galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto_id` int(11) DEFAULT NULL,
  `vehiculo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `foto_id` (`foto_id`),
  CONSTRAINT `galeria_vehiculo` FOREIGN KEY (`foto_id`) REFERENCES `galeria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_galeria` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_galeria`
--

LOCK TABLES `vehiculo_galeria` WRITE;
/*!40000 ALTER TABLE `vehiculo_galeria` DISABLE KEYS */;
INSERT INTO `vehiculo_galeria` VALUES (2,3,1),(3,4,2),(5,6,3),(7,8,4),(9,10,5),(10,11,6),(11,12,7),(13,14,17),(23,24,30);
/*!40000 ALTER TABLE `vehiculo_galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pweb2017core'
--

--
-- Dumping routines for database 'pweb2017core'
--
/*!50003 DROP PROCEDURE IF EXISTS `consultargenero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `consultargenero`()
BEGIN
  select * from genero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `consultarPago`()
BEGIN

select * from pago;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarusuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `consultarusuario`()
BEGIN
  select * from usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULTAR_PROPIETARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `CONSULTAR_PROPIETARIO`()
    COMMENT 'CONSULTA DE LOS PROPIETARIOS'
BEGIN
  select num_tipo_identificacion ,nombres, apellidos, email, celular from pweb2017.usuario inner join pweb2017.proveedor on(proveedor.usuario_id = usuario.id)
  inner join pweb2017.tipo_usuario on(proveedor.propietario_tipo_id = tipo_usuario.tipo_usuario_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULTAR_VEHICULOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CONSULTAR_VEHICULOS`(  )
BEGIN
    Select 
    v.*,
    tc.nombre as combustible_nombre,
    tv.auto_nombre as tipo_vehiculo_nombre,
    tv.precio_dia,
    s.name as sucursal_nombre,
    mv.marca_nombre as marca_nombre,
    g.foto
    from vehiculo v
    inner join tipo_combustible tc on v.tipo_combustible = tc.id
    inner join tipo_vehiculo tv on v.tipo_vehiculo_id = tv.id
    inner join sucursal s on v.sucursal_id = s.id
    inner join marca_vehiculo mv on v.marca_id = mv.id
    inner join vehiculo_galeria vg on vg.vehiculo_id = v.id
    inner join galeria g on g.id = vg.foto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `INSERTAR`(PACCE_ID VARCHAR(45),PACCE_NOMBRE VARCHAR(45))
BEGIN
INSERT INTO accesorio (id, nombre) VALUES (PACCE_ID,PACCE_NOMBRE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTARGENERO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `INSERTARGENERO`(PGENE_ID VARCHAR(45),PGENE_NOMBRE VARCHAR(45))
BEGIN
INSERT INTO genero (id, nombre) VALUES  (PGENE_ID,PGENE_NOMBRE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_USUARIO`(IN `u_id` int(11), IN `u_num_tipo_identificacion` int(145), IN `u_empresa_id` int(11), IN `u_nombres` VARCHAR(225), IN `u_apellidos` varchar(225), IN `u_genero` int(11), IN `u_email` varchar(225), IN `u_contrasenia` varchar(225), IN `u_celular` int(15), IN `u_fecha_nacimiento` date)
BEGIN
INSERT INTO usuario(id,empresa_id,num_tipo_identificacion,nombres,apellidos,genero_id,email,contrasenia,celular,fecha_registro,estado,fecha_nacimiento) 
VALUES  (u_id,u_empresa_id,u_num_tipo_identificacion,u_nombres,u_apellidos,u_genero,u_email,u_contrasenia,u_celular,now(),1,u_fecha_nacimiento);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTIPODOC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pweb2017`@`%` PROCEDURE `INSERTIPODOC`(TIPD_ID1 varchar(45),TIPD_NOMBRE1 varchar(45))
BEGIN
INSERT INTO TIPODOCUMENTO(TIPD_ID,TIPD_NOMBRE) VALUES (TIPD_ID1,TIPD_NOMBRE1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_ALQUILER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_ALQUILER`(
	IN `_start_date` DATE,
	IN `_final_date` DATE,
	IN `_car_id` INT(100),
	IN `_cliente_id` INT









,
	IN `_registrado_por` INT



)
BEGIN
  
  insert into alquiler  (cliente_id, empleado_id, sucursal_id, vehiculo_id, contrato_id, fecha_alquiler, fehca_devolucion) 
   values(_cliente_id, _registrado_por, 1, _car_id, 1, _start_date, _final_date);
  UPDATE vehiculo SET disponible = 0 WHERE id = _car_id;

   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_CREATEUSER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_CREATEUSER`(
	IN `_email` varchar(200),
	IN `_password` varchar(200),
	IN `_permissions` varchar(200),
	IN `_rol` int(11)
,
	IN `_nombre` VARCHAR(200),
	IN `_apellido` VARCHAR(200)





)
BEGIN

   insert into pweb2017core.usuario (id, nombres, apellidos, empresa_id, email, contrasenia,fecha_registro, estado, rol_id) 

   values ((select max(id) +1 FROM usuario m), _nombre, _apellido, 1, _email, password(_password), now(), 1, _rol);
   
   insert into empleado (usuario_id) values((select max(id) FROM usuario m));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_INSERTROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_INSERTROL`(

	IN `_name_rol` VARCHAR(200),

	IN `_rol_Permissions` VARCHAR(200)





)
BEGIN

    INSERT INTO rol (idRol, Rol_nombre, permisos_id) values( (select max(idRol) +1 FROM rol r),_name_rol, _rol_Permissions);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_INSRCLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_INSRCLIENTE`(

	IN `_nombres` VARCHAR(255),

	IN `_apellidos` VARCHAR(255),

	IN `_genero` INT(11),

	IN `_email` VARCHAR(255),

	IN `_password` VARCHAR(255),

	IN `_tipo_cliente` INT(8),

	IN `_num_identificacion` INT(145),

	IN `_phone` BIGINT,

	IN `_fe_nacimiento` DATE

)
    COMMENT 'insertar clientes'
BEGIN



   insert into usuario(id,empresa_id,nombres,apellidos,genero_id,email,contrasenia,celular,fecha_registro,estado,num_tipo_identificacion,fecha_nacimiento)



   values((select max(id) +1 FROM usuario m),1,_nombres,_apellidos,_genero,_email,password(_password),_phone,now(),1,_num_identificacion,_fe_nacimiento);



   insert into cliente(id,usuario_id,tipo_cliente) values((select max(id)+1 FROM cliente a),(SELECT max(id) FROM usuario s),_tipo_cliente);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_INSRPROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_INSRPROVEEDOR`(

	
    IN `_nombres` VARCHAR(225),

	IN `_apellidos` varchar(225),

	IN `_genero` int(11),

	IN `_email` varchar(225),

	IN `_tipo_proveedor` int(8),

	IN `_num_identificacion` bigint(20),

	IN `_phone` bigint(20)





)
    COMMENT '/*_contrasenia varchar(225),*/ dato por definir en la vista'
BEGIN

    INSERT INTO usuario(id,empresa_id,num_tipo_identificacion,nombres,apellidos,genero_id,email,contrasenia,celular,fecha_registro,estado) 

       VALUES  ((SELECT max(id)+1 FROM usuario m),1,_num_identificacion,_nombres,_apellidos,_genero,_email,password(_num_identificacion),_phone,now(),1);

	insert into proveedor(id,usuario_id,propietario_tipo_id)

       values((SELECT max(id)+1 FROM proveedor a),(SELECT max(id) FROM usuario s),_tipo_proveedor);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_OAuth_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_OAuth_LOGIN`(
	IN `_email` VARCHAR(200),
	IN `_password` VARCHAR(200)

)
BEGIN
    DECLARE Id INT(40);
    DECLARE Nombres VARCHAR(100);
    DECLARE Apellidos VARCHAR(100);
    DECLARE Contrasenia VARCHAR(150);
    DECLARE Empresa_id INT(60);
    DECLARE Estado int(1);
    DECLARE Celular bigint(20);
    DECLARE Genero_ INT(10);
    DECLARE Identificacion VARCHAR(60);
    DECLARE Rol_name VARCHAR(60);
    DECLARE Permisos varchar(100);
    select 
    em.id,
    us.nombres,
    us.apellidos,
    us.contrasenia,
    us.empresa_id,
    us.estado,
    us.celular,
    us.genero_id,
    us.num_tipo_identificacion,
    usrol.Rol_nombre,
    usrol.permisos_id
    into
    Id, Nombres, Apellidos, Contrasenia, Empresa_id, Estado, Celular, Genero_, Identificacion, Rol_name, Permisos    
	 from usuario us inner join rol usrol on(us.rol_id = usrol.idRol) 
	 inner join empleado em on(em.usuario_id = us.id)  where us.email = _email;
    if Estado = 1 and Contrasenia = PASSWORD(_password) then
        select 'OK' as status, Id , Nombres, Apellidos, Empresa_id, Estado, Celular, Genero_, Identificacion,rol_name, permisos;
    else 
		if(Contrasenia is NULL) then
				select 'ERROR' as status, 'error_user' as type, 'El usuario no es correcto.' as description;
		else 
			if Estado = 0 then
				select 'ERROR' as status, 'error_inactive' as type, 'El usuario fue suspendido.' as description;
			else
				select 'ERROR' as status, 'error_password' as type, 'Contraseña incorrecta.' as description;
			end if;
		end if;
	end if;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QERYTIPOSAUTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QERYTIPOSAUTOS`()
BEGIN
  select id, auto_nombre as nombre from pweb2017core.tipo_vehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QERYUSUARIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QERYUSUARIOS`()
    COMMENT 'consuta de todos los clientes'
BEGIN

 select nombres, apellidos, email, celular, tipo_usuario as tipocliente from pweb2017core.usuario 
 inner join pweb2017core.cliente on(cliente.usuario_id = usuario.id)
 inner join pweb2017core.tipo_usuario on(cliente.tipo_cliente = tipo_usuario.tipo_usuario_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QERYVEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QERYVEHICULO`(
	IN `_tipo_vehiculo` int(11),
	IN `_tipo_direccion` int(11),
	IN `_tipo_transmicion` int(11)
)
BEGIN
 select auto_nombre as Tipo_auto, tp_dir_nombre as Direccion, tp_transmicion as Transmicion, modelo, marca_nombre from pweb2017.vehiculo 
 inner join pweb2017.tipo_vehiculo on(tipo_vehiculo.id = vehiculo.tipo_vehiculo) 
 inner join pweb2017.tipo_direccion on(vehiculo.tipo_direccion = tipo_direccion.id)
 inner join pweb2017.tipo_transmicion on (vehiculo.tipo_transmicion = tipo_transmicion.id_trans) 
 inner join pweb2017.marca_vehiculo on (vehiculo.marca_id = marca_vehiculo.id)
 where tipo_vehiculo.id = _tipo_vehiculo 
 and 
 pweb2017.tipo_direccion.id = _tipo_direccion and pweb2017.tipo_transmicion.id_trans = _tipo_transmicion and vehiculo.disponible=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYCARAlQUILER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYCARAlQUILER`(
	IN `_placa` varchar(200)


)
BEGIN
   select concat(us.nombres,' ',us.apellidos) as nombre, us.num_tipo_identificacion as identificacion,  a.fecha_alquiler, a.fecha_devolucion, v.modelo, tipo_vehiculo.auto_nombre as tipo,  
    marca_vehiculo.marca_nombre as marca, foto
	 from alquiler a inner join vehiculo v on(v.id = a.vehiculo_id)
	 
	 inner join cliente c on c.id = a.cliente_id
	 
	 inner join usuario us on c.usuario_id = us.id
	 
    inner join tipo_vehiculo on v.tipo_vehiculo_id = tipo_vehiculo.id

    inner join marca_vehiculo on v.marca_id = marca_vehiculo.id

    INNER JOIN vehiculo_galeria vg on vg.vehiculo_id = v.id 

    INNER JOIN galeria g on g.id= vg.foto_id where v.placa = _placa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYCARCURRENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYCARCURRENT`()
    COMMENT 'procedure for get all cars'
BEGIN

 select  t.auto_nombre as tipo, m.marca_nombre as marca, v.modelo, v.placa, v.km, v.fecha_registro



    from vehiculo v 



    inner join tipo_vehiculo t on v.tipo_vehiculo_id = t.id   



    inner join marca_vehiculo m on v.marca_id = m.id;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYCARS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYCARS`()
BEGIN



    select v.id, v.modelo, tipo_vehiculo.auto_nombre as tipo, tipo_direccion.tp_dir_nombre as direccion, 



    tipo_transmicion.tp_transmicion as transmicion, marca_vehiculo.marca_nombre as marca, foto, v.precio_dia



    from vehiculo v 



    inner join tipo_vehiculo on v.tipo_vehiculo_id = tipo_vehiculo.id



    



    inner join tipo_direccion on v.tipo_direccion_id = tipo_direccion.id



    



    inner join tipo_transmicion on v.tipo_transmicion_id = tipo_transmicion.id_trans



    



    inner join marca_vehiculo on v.marca_id = marca_vehiculo.id



    



    INNER JOIN vehiculo_galeria vg on vg.vehiculo_id = v.id 



    



    INNER JOIN galeria g on g.id= vg.foto_id where v.disponible = 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYCLIENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYCLIENTES`()
BEGIN
   select cliente.id as id, concat(nombres, ' ',apellidos) as nombre from pweb2017core.usuario inner join pweb2017core.cliente on(cliente.usuario_id = usuario.id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYMENU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYMENU`(

	IN `_permisos` varchar(200)

)
BEGIN

   

	declare menu_nombre varchar (200);

   declare menu_url varchar (200);

   declare menu_icon varchar (200);

   

   declare contador integer default 0;

   declare cantcodigos integer default 0;

   declare IdArticulo integer default 0;





   SELECT LENGTH(_permisos) - LENGTH(REPLACE(_permisos, ',', '')) into cantcodigos;







   WHILE contador  <= cantcodigos DO

                

        

        if contador=0 then

           set IdArticulo=CAST(SUBSTRING_INDEX(_permisos,',',1) as unsigned);            	

        else 

         

          set _permisos=REPLACE(_permisos,CONCAT(SUBSTRING_INDEX(_permisos,',',1),','),"");

          set IdArticulo=CAST(SUBSTRING_INDEX(_permisos,',',1) as unsigned);

        end if;

               

        set contador=contador+1;

        select m.nombre_menu as nombre, m.url_menu as url, m.icon_nombre as icon from menu  m where m.id = IdArticulo; 

       

    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYPERMISSIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYPERMISSIONS`()
BEGIN
 select id, nombre_menu as nombre from pweb2017core.menu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYPROPIETARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYPROPIETARIO`()
BEGIN
   select proveedor.id as id, concat(nombres, ' ',apellidos) as nombre from pweb2017core.usuario inner join pweb2017core.proveedor on(proveedor.usuario_id = usuario.id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYROLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYROLES`()
BEGIN

    select r.idRol as id, r.Rol_nombre as nombre, r.permisos_id as permisos from rol r;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERYTRANSMITION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERYTRANSMITION`()
BEGIN
 select id_trans as id, tp_transmicion as nombre from tipo_transmicion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERY_GENERO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERY_GENERO`()
BEGIN
  select * from genero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERY_MARCAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERY_MARCAS`()
BEGIN
  select id, marca_nombre as nombre from marca_vehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERY_TIPOPER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERY_TIPOPER`()
BEGIN
 select tipo_usuario_id as id, tipo_usuario as nombre from tipo_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_QUERY_TIPO_DIR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_QUERY_TIPO_DIR`()
BEGIN
 select id , tp_dir_nombre as nombre from tipo_direccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_REGISTER_CAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_REGISTER_CAR`(
	IN `_proveedorid` int(11),
	IN `_tipo_vehiculo` int(11),
	IN `_tipo_direccion` int(11),
	IN `_tipo_transmicion` int (11),
	IN `_marca_id` int(11),
	IN `_modelo` varchar (200),
	IN `_descripcion` varchar(255),
	IN `_color` varchar(100),
	IN `_cilindraje` int(200),
	IN `_placa` varchar(200),
	IN `_ruta_img` varchar(200)
,
	IN `_km` INT(100)




,
	IN `_precio_pago` INT(255)
,
	IN `_registradopor` INT




)
BEGIN
     insert into pweb2017core.vehiculo(sucursal_id, proveedor_id, tipo_vehiculo_id, tipo_direccion_id,tipo_transmicion_id,

	 marca_id, modelo, descripcion, tipo_combustible_id, color, cilindraje, placa, disponible, fecha_registro,km,precio_dia) 

     values(1,_proveedorid, _tipo_vehiculo, _tipo_direccion, _tipo_transmicion, _marca_id, _modelo,

     _descripcion,1,_color, _cilindraje, _placa, 1, now(),_km, _precio_pago+(_precio_pago*0.45));

     insert into pweb2017core.galeria(foto) value(_ruta_img);

     insert into pweb2017core.vehiculo_galeria(foto_id, vehiculo_id) values ((select max(id) from galeria),(select max(id) from vehiculo));
     
     insert into arriendo_proveedor  (id, proveedor_id, vehiculo_id, empleado_id, sucursal_id, valor_dia) 
     
     values((SELECT max(id)+1 FROM arriendo_proveedor a),_proveedorid, (SELECT max(id) FROM vehiculo v),(select id FROM empleado  where usuario_id = _registradopor),1,_precio_pago);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_ROL_MENU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_ROL_MENU`(rol_code int(11))
BEGIN
 select rol.Rol_nombre, menu.nombre_menu,menu.url_menu,menu.icon_nombe from rol 
 inner join permiso on (rol.idRol = permiso.roles_idrol) 
inner join menu on(menu.id =permiso.menu_id) where rol_code = permiso.roles_idrol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-05 15:12:12
