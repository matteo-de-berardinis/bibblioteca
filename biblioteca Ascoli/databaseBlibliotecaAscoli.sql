-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca_ascoli
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bibblioteca`
--

DROP TABLE IF EXISTS `bibblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibblioteca` (
  `idbibblioteca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `idLibro` int DEFAULT NULL,
  PRIMARY KEY (`idbibblioteca`),
  KEY `idLibro_idx` (`idLibro`),
  CONSTRAINT `idLibro` FOREIGN KEY (`idLibro`) REFERENCES `libro` (`idlibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibblioteca`
--

LOCK TABLES `bibblioteca` WRITE;
/*!40000 ALTER TABLE `bibblioteca` DISABLE KEYS */;
/*!40000 ALTER TABLE `bibblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bliblotecario`
--

DROP TABLE IF EXISTS `bliblotecario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bliblotecario` (
  `idbliblotecario` int NOT NULL AUTO_INCREMENT,
  `idUtente` int DEFAULT NULL,
  PRIMARY KEY (`idbliblotecario`),
  KEY `idUtente_idx` (`idUtente`),
  CONSTRAINT `idUtente` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idutente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bliblotecario`
--

LOCK TABLES `bliblotecario` WRITE;
/*!40000 ALTER TABLE `bliblotecario` DISABLE KEYS */;
/*!40000 ALTER TABLE `bliblotecario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `idlibro` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `genere` varchar(45) DEFAULT NULL,
  `nCopie` int DEFAULT NULL,
  PRIMARY KEY (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'divina commeddia','classico',12),(2,'prova ','fantasy',0),(3,'signore degli anelli','fantasy',19),(4,'avengers','avventura',5),(5,'matteo','fantasy',2),(6,'thor','avvenurta',5);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestito`
--

DROP TABLE IF EXISTS `prestito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestito` (
  `idprestito` int NOT NULL AUTO_INCREMENT,
  `idLibro` int DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `restituito` tinyint DEFAULT NULL,
  `data` date DEFAULT NULL,
  `dataRestituzione` date DEFAULT NULL,
  PRIMARY KEY (`idprestito`),
  KEY `idLibroP_idx` (`idLibro`),
  KEY `idUtenteP_idx` (`idUtente`),
  CONSTRAINT `idLibroP` FOREIGN KEY (`idLibro`) REFERENCES `libro` (`idlibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUtenteP` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idutente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestito`
--

LOCK TABLES `prestito` WRITE;
/*!40000 ALTER TABLE `prestito` DISABLE KEYS */;
INSERT INTO `prestito` VALUES (2,1,1,0,'2023-07-03','2023-07-04'),(3,1,1,0,'2023-07-04','2023-07-05'),(4,1,1,0,'2023-07-04','2023-07-04'),(5,1,1,0,'2023-07-04','2023-07-05'),(6,1,1,0,'2023-07-04','2023-07-04'),(7,4,2,0,'2023-07-04','2023-07-04'),(8,4,1,0,'2023-07-04','2023-07-04'),(9,3,2,0,'2023-07-04','2023-07-04'),(10,3,2,1,'2023-07-04',NULL),(11,3,1,0,'2023-07-04','2023-07-04'),(12,4,1,0,'2023-07-05','2023-07-05'),(14,1,1,0,'2023-07-05','2023-07-05'),(16,3,1,0,'2023-07-05','2023-07-05'),(18,6,1,0,'2023-07-05','2023-07-05'),(22,6,1,0,'2023-07-05','2023-07-05'),(23,6,1,1,'2023-07-05',NULL);
/*!40000 ALTER TABLE `prestito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `idutente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idutente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'matteo','deberardinismatteo9@gmail.com','Matteo','utente'),(2,'bibliotecario','bibliotecaAscoli@gmail.com','Ascoli','admin');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-05 17:28:58
