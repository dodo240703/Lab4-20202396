-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: lab4gtics
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL AUTO_INCREMENT,
  `idFlor` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `ocasion` varchar(45) DEFAULT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCarrito`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (32,15,'Tulipán Amarillo',11.5,1,NULL,NULL,NULL,NULL,NULL),(33,14,'Girasol Amarillo Grande',10.75,1,NULL,NULL,NULL,NULL,NULL),(34,12,'Clavel Amarillo',12,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `idColor` int NOT NULL AUTO_INCREMENT,
  `nombreColor` varchar(45) NOT NULL,
  PRIMARY KEY (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'rojo'),(2,'verde'),(3,'azul'),(4,'blanco'),(5,'amarillo');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flor`
--

DROP TABLE IF EXISTS `flor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flor` (
  `idFlor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  `descripcion` text,
  `Tipo_idtipo` int NOT NULL,
  `Color_idColor` int NOT NULL,
  `Ocasion_idOcasion` int NOT NULL,
  PRIMARY KEY (`idFlor`),
  KEY `fk_Flor_Color1_idx` (`Color_idColor`),
  KEY `fk_Flor_Tipo1_idx` (`Tipo_idtipo`),
  KEY `fk_Flor_Ocasion1_idx` (`Ocasion_idOcasion`),
  CONSTRAINT `fk_Flor_Color1` FOREIGN KEY (`Color_idColor`) REFERENCES `color` (`idColor`),
  CONSTRAINT `fk_Flor_Ocasion1` FOREIGN KEY (`Ocasion_idOcasion`) REFERENCES `ocasion` (`idOcasion`),
  CONSTRAINT `fk_Flor_Tipo1` FOREIGN KEY (`Tipo_idtipo`) REFERENCES `tipo` (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flor`
--

LOCK TABLES `flor` WRITE;
/*!40000 ALTER TABLE `flor` DISABLE KEYS */;
INSERT INTO `flor` VALUES (1,'Rosa Roja','rosa_roja.jpg',15.99,'Hermosa rosa roja ideal para ocasiones románticas.',1,1,2),(2,'Clavel Verde','clavel_verde.jpg',12.5,'Clavel verde que simboliza esperanza y energía.',2,2,1),(3,'Tulipán Azul','tulipan_azul.jpg',10.75,'Tulipán azul perfecto para regalar en momentos especiales.',5,3,4),(4,'Hortencia Blanca','hortencia_blanca.jpg',20,'Hortencia blanca que simboliza pureza y elegancia.',3,4,3),(5,'Girasol Amarillo','girasol_amarillo.jpg',8.99,'Girasol amarillo que trae felicidad y energía.',4,5,1),(6,'Rosa Azul','rosa_azul.jpg',9.5,'Rosa azul ideal para ocasiones únicas y especiales.',1,3,6),(7,'Clavel Rojo','clavel_rojo.jpg',7.99,'Clavel rojo que representa admiración y amor.',2,1,2),(8,'Tulipán Blanco','tulipan_blanco.jpg',11.2,'Tulipán blanco para regalar en momentos de condolencias.',5,4,7),(9,'Girasol Verde','girasol_verde.jpg',13.45,'Un girasol verde único para celebraciones de la naturaleza.',4,2,1),(10,'Hortencia Roja','hortencia_roja.jpg',6.75,'Hortencia roja para alegrar cualquier celebración especial.',3,1,5),(11,'Rosa Amarilla','rosa_amarilla.jpg',14.99,'Rosa amarilla perfecta para expresar amistad y alegría.',1,5,4),(12,'Clavel Amarillo','clavel_amarillo.jpg',12,'Clavel amarillo ideal para ocasiones festivas.',2,5,1),(13,'Hortencia Amarilla','hortencia_amarilla.jpg',18.5,'Hortencia amarilla vibrante para alegrar cualquier evento.',3,5,3),(14,'Girasol Amarillo Grande','girasol_amarillo_grande.jpg',10.75,'Girasol amarillo grande, símbolo de felicidad y energía.',4,5,6),(15,'Tulipán Amarillo','tulipan_amarillo.jpg',11.5,'Tulipán amarillo brillante para regalar en momentos de alegría.',5,5,5);
/*!40000 ALTER TABLE `flor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocasion`
--

DROP TABLE IF EXISTS `ocasion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocasion` (
  `idOcasion` int NOT NULL AUTO_INCREMENT,
  `ocasion` varchar(45) NOT NULL,
  PRIMARY KEY (`idOcasion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocasion`
--

LOCK TABLES `ocasion` WRITE;
/*!40000 ALTER TABLE `ocasion` DISABLE KEYS */;
INSERT INTO `ocasion` VALUES (1,'Primavera'),(2,'San Valentin'),(3,'Aniversario'),(4,'Día de Amistad'),(5,'Día del Padre'),(6,'Día de la Madre'),(7,'Condolencias');
/*!40000 ALTER TABLE `ocasion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `idtipo` int NOT NULL AUTO_INCREMENT,
  `nombreTipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'rosas'),(2,'claveles'),(3,'hortencias'),(4,'girasoles'),(5,'tulipanes');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) NOT NULL,
  `puntuacion` double DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Dodo',24),(2,'Dode',25),(3,'ProPlayer24',29);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-22 22:45:31
