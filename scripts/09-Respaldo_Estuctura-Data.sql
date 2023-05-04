/********************************************************************
Listado de las 13 tablas y el backup de sus respectivos datos:
donadores			pc_donadas			selectores		tecnicos
entregas			pc_reparadas		solicitantes	
evaluaciones		personas			solicitudes
movimientos_pc		personas_log		talleres		
********************************************************************/
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: administracion_computadoras
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `donadores`
--

DROP TABLE IF EXISTS `donadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donadores` (
  `id_donador` int NOT NULL AUTO_INCREMENT,
  `dni_persona` int NOT NULL,
  PRIMARY KEY (`id_donador`),
  KEY `FK_donador_persona` (`dni_persona`),
  CONSTRAINT `FK_donador_persona` FOREIGN KEY (`dni_persona`) REFERENCES `personas` (`dni_persona`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_evaluacion` int NOT NULL,
  `id_pc_reparada` int NOT NULL,
  `fecha_entrega` date NOT NULL,
  `recepcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `FK_entrega_evaluacion` (`id_evaluacion`),
  KEY `FK_entrega_computadora` (`id_pc_reparada`),
  CONSTRAINT `FK_entrega_computadora` FOREIGN KEY (`id_pc_reparada`) REFERENCES `pc_reparadas` (`id_pc_reparada`),
  CONSTRAINT `FK_entrega_evaluacion` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluaciones` (`id_evaluacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluaciones` (
  `id_evaluacion` int NOT NULL AUTO_INCREMENT,
  `id_selector` int NOT NULL,
  `id_solicitud` int NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `resultado` enum('aprobado','rechazado') NOT NULL,
  `comentario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_evaluacion`),
  KEY `FK_evaluacion_selector` (`id_selector`),
  KEY `FK_evaluacion_solicitud` (`id_solicitud`),
  CONSTRAINT `FK_evaluacion_selector` FOREIGN KEY (`id_selector`) REFERENCES `selectores` (`id_selector`),
  CONSTRAINT `FK_evaluacion_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos_pc`
--

DROP TABLE IF EXISTS `movimientos_pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_pc` (
  `id_mov_pc` int NOT NULL AUTO_INCREMENT,
  `pc_disponible` int NOT NULL,
  `entregada` int NOT NULL,
  `tabla` varchar(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_mov_pc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pc_donadas`
--

DROP TABLE IF EXISTS `pc_donadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc_donadas` (
  `id_pc_donada` int NOT NULL AUTO_INCREMENT,
  `id_donador` int NOT NULL,
  `fecha_donacion` date NOT NULL,
  `condicion` enum('nuevo','usado') NOT NULL,
  `tipo` enum('escritorio','notebook') NOT NULL,
  `uso` enum('hogar','trabajo') NOT NULL,
  `micro` varchar(50) NOT NULL,
  `mother` varchar(50) NOT NULL,
  `ram` varchar(50) NOT NULL,
  `rom` varchar(50) NOT NULL,
  `pantalla` varchar(50) NOT NULL,
  `falla` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pc_donada`),
  KEY `FK_donacion_donador` (`id_donador`),
  CONSTRAINT `FK_donacion_donador` FOREIGN KEY (`id_donador`) REFERENCES `donadores` (`id_donador`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pc_reparadas`
--

DROP TABLE IF EXISTS `pc_reparadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc_reparadas` (
  `id_pc_reparada` int NOT NULL AUTO_INCREMENT,
  `id_pc_donada` int NOT NULL,
  `id_tecnico` int NOT NULL,
  `fecha_reparacion` date NOT NULL,
  `estado` enum('alta','baja') NOT NULL,
  `comentario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pc_reparada`),
  KEY `FK_reparacion_donacion` (`id_pc_donada`),
  KEY `FK_reparacion_tecnico` (`id_tecnico`),
  CONSTRAINT `FK_reparacion_donacion` FOREIGN KEY (`id_pc_donada`) REFERENCES `pc_donadas` (`id_pc_donada`),
  CONSTRAINT `FK_reparacion_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `dni_persona` int NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `fecha_naci` date NOT NULL,
  `fecha_alta` date NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`dni_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personas_log`
--

DROP TABLE IF EXISTS `personas_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas_log` (
  `id_peronas_log` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(10) NOT NULL,
  `tabla` varchar(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_peronas_log`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `selectores`
--

DROP TABLE IF EXISTS `selectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selectores` (
  `id_selector` int NOT NULL AUTO_INCREMENT,
  `dni_persona` int NOT NULL,
  PRIMARY KEY (`id_selector`),
  KEY `FK_selector_persona` (`dni_persona`),
  CONSTRAINT `FK_selector_persona` FOREIGN KEY (`dni_persona`) REFERENCES `personas` (`dni_persona`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitantes`
--

DROP TABLE IF EXISTS `solicitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitantes` (
  `id_solicitante` int NOT NULL AUTO_INCREMENT,
  `dni_persona` int NOT NULL,
  PRIMARY KEY (`id_solicitante`),
  KEY `FK_solicitante_persona` (`dni_persona`),
  CONSTRAINT `FK_solicitante_persona` FOREIGN KEY (`dni_persona`) REFERENCES `personas` (`dni_persona`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_solicitante` int NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `proposito` varchar(255) NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `FK_solicitudes_solicitante` (`id_solicitante`),
  CONSTRAINT `FK_solicitudes_solicitante` FOREIGN KEY (`id_solicitante`) REFERENCES `solicitantes` (`id_solicitante`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `talleres`
--

DROP TABLE IF EXISTS `talleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talleres` (
  `id_taller` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_taller`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `id_tecnico` int NOT NULL AUTO_INCREMENT,
  `dni_persona` int NOT NULL,
  `id_taller` int DEFAULT NULL,
  PRIMARY KEY (`id_tecnico`),
  KEY `FK_tecnico_persona` (`dni_persona`),
  KEY `FK_tecnico_taller` (`id_taller`),
  CONSTRAINT `FK_tecnico_persona` FOREIGN KEY (`dni_persona`) REFERENCES `personas` (`dni_persona`) ON DELETE CASCADE,
  CONSTRAINT `FK_tecnico_taller` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_donadores_año2021_con_corei5`
--

DROP TABLE IF EXISTS `vw_donadores_año2021_con_corei5`;
/*!50001 DROP VIEW IF EXISTS `vw_donadores_año2021_con_corei5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_donadores_año2021_con_corei5` AS SELECT 
 1 AS `id_donador`,
 1 AS `nombre_completo`,
 1 AS `fecha_donacion`,
 1 AS `condicion`,
 1 AS `tipo`,
 1 AS `micro`,
 1 AS `mother`,
 1 AS `ram`,
 1 AS `rom`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_donadores_año2021_con_corei5`
--

/*!50001 DROP VIEW IF EXISTS `vw_donadores_año2021_con_corei5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_donadores_año2021_con_corei5` AS select `donadores`.`id_donador` AS `id_donador`,concat(`personas`.`nombre`,' ',`personas`.`apellido`) AS `nombre_completo`,`pc_donadas`.`fecha_donacion` AS `fecha_donacion`,`pc_donadas`.`condicion` AS `condicion`,`pc_donadas`.`tipo` AS `tipo`,`pc_donadas`.`micro` AS `micro`,`pc_donadas`.`mother` AS `mother`,`pc_donadas`.`ram` AS `ram`,`pc_donadas`.`rom` AS `rom` from ((`donadores` join `personas` on((`donadores`.`dni_persona` = `personas`.`dni_persona`))) join `pc_donadas` on((`donadores`.`id_donador` = `pc_donadas`.`id_donador`))) where ((year(`pc_donadas`.`fecha_donacion`) = '2021') and (`pc_donadas`.`micro` like '%core i5%')) order by `donadores`.`id_donador` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 21:26:48
