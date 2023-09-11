-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proiect_policlinica
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `asistent`
--

DROP TABLE IF EXISTS `asistent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistent` (
  `id_asistent` int NOT NULL AUTO_INCREMENT,
  `tipul` varchar(45) DEFAULT NULL,
  `gradul` varchar(45) DEFAULT NULL,
  `id_utilizator` int DEFAULT NULL,
  PRIMARY KEY (`id_asistent`),
  UNIQUE KEY `utilizator_UNIQUE` (`id_utilizator`),
  KEY `utilizator_fk_idx` (`id_utilizator`),
  CONSTRAINT `utilizator_fk` FOREIGN KEY (`id_utilizator`) REFERENCES `utilizator` (`id_utilizator`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistent`
--

LOCK TABLES `asistent` WRITE;
/*!40000 ALTER TABLE `asistent` DISABLE KEYS */;
INSERT INTO `asistent` VALUES (15,'Generalist','Principal',19),(18,'Laborator','Principal',21),(28,'Laborator','Secundar',22),(29,'Laborator','Principal',32),(30,'Radiologie','Principal',33),(31,'Radiologie','Secundar',34);
/*!40000 ALTER TABLE `asistent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bon_fiscal`
--

DROP TABLE IF EXISTS `bon_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bon_fiscal` (
  `id_bon` int NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `id_programare` int DEFAULT NULL,
  PRIMARY KEY (`id_bon`),
  KEY `bon_programare_fk_idx` (`id_programare`),
  CONSTRAINT `bon_programare_fk` FOREIGN KEY (`id_programare`) REFERENCES `programare` (`id_programare`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bon_fiscal`
--

LOCK TABLES `bon_fiscal` WRITE;
/*!40000 ALTER TABLE `bon_fiscal` DISABLE KEYS */;
INSERT INTO `bon_fiscal` VALUES (16,100,33),(17,300,40),(18,300,41),(19,300,42),(20,125,43),(21,250,44),(22,175,45),(23,150,46),(24,350,47),(25,350,48),(26,200,49),(27,100,50),(28,100,51),(29,260,53),(30,190,57),(31,260,58),(32,260,65),(33,190,66),(34,260,69),(35,190,67);
/*!40000 ALTER TABLE `bon_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet_echipament`
--

DROP TABLE IF EXISTS `cabinet_echipament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabinet_echipament` (
  `id_cabinet` int NOT NULL,
  `id_echipament` int NOT NULL,
  PRIMARY KEY (`id_cabinet`,`id_echipament`),
  KEY `cabinet_echipament_fk_idx` (`id_echipament`),
  CONSTRAINT `cabinet_echipament_fk` FOREIGN KEY (`id_echipament`) REFERENCES `echipament` (`id_echipament`),
  CONSTRAINT `cabinet_echipament_fk2` FOREIGN KEY (`id_cabinet`) REFERENCES `cabinet_medical` (`id_cabinet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_echipament`
--

LOCK TABLES `cabinet_echipament` WRITE;
/*!40000 ALTER TABLE `cabinet_echipament` DISABLE KEYS */;
INSERT INTO `cabinet_echipament` VALUES (1,1),(7,2),(2,3),(6,4),(3,5),(4,6),(9,6),(5,7),(8,8);
/*!40000 ALTER TABLE `cabinet_echipament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet_medical`
--

DROP TABLE IF EXISTS `cabinet_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabinet_medical` (
  `id_cabinet` int NOT NULL AUTO_INCREMENT,
  `id_unitate` int DEFAULT NULL,
  PRIMARY KEY (`id_cabinet`),
  KEY `cabinet_unitate_fk_idx` (`id_unitate`),
  CONSTRAINT `cabinet_unitate_fk` FOREIGN KEY (`id_unitate`) REFERENCES `unitate_medicala` (`id_unitate_medicala`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_medical`
--

LOCK TABLES `cabinet_medical` WRITE;
/*!40000 ALTER TABLE `cabinet_medical` DISABLE KEYS */;
INSERT INTO `cabinet_medical` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(9,1),(6,2),(7,3),(8,3);
/*!40000 ALTER TABLE `cabinet_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competenta`
--

DROP TABLE IF EXISTS `competenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competenta` (
  `id_competenta` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_competenta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competenta`
--

LOCK TABLES `competenta` WRITE;
/*!40000 ALTER TABLE `competenta` DISABLE KEYS */;
INSERT INTO `competenta` VALUES (1,'Cardiologie'),(2,'Computer tomograf'),(3,'Litotritie extracorporeala'),(4,'Chirurgie '),(5,'Endoscopie'),(6,'Ecografie'),(7,'Bronhoscopie'),(8,'EEG EMG');
/*!40000 ALTER TABLE `competenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concediu`
--

DROP TABLE IF EXISTS `concediu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concediu` (
  `id_concediu` int NOT NULL AUTO_INCREMENT,
  `data_incepere` date DEFAULT NULL,
  `data_incheiere` date DEFAULT NULL,
  `id_utilizator` int DEFAULT NULL,
  PRIMARY KEY (`id_concediu`),
  KEY `concediu_utilizator_fk_idx` (`id_utilizator`),
  CONSTRAINT `concediu_utilizator_fk` FOREIGN KEY (`id_utilizator`) REFERENCES `utilizator` (`id_utilizator`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concediu`
--

LOCK TABLES `concediu` WRITE;
/*!40000 ALTER TABLE `concediu` DISABLE KEYS */;
INSERT INTO `concediu` VALUES (1,'2015-05-05','2015-05-14',30),(2,'2004-01-12','2004-01-22',17),(3,'2008-12-03','2008-12-11',19),(4,'2016-03-27','2016-04-07',21),(5,'2018-06-17','2018-06-29',22),(6,'2012-05-02','2012-05-22',23),(7,'2010-08-12','2010-08-17',24),(8,'2013-06-12','2013-07-03',25),(9,'2020-12-01','2020-12-26',26),(10,'2012-02-03','2012-02-20',27),(11,'2019-09-11','2019-09-28',28),(12,'2021-10-21','2021-10-30',29),(13,'2022-10-21','2022-10-30',31),(14,'2011-09-07','2011-09-11',32),(15,'2020-11-06','2022-11-19',33),(16,'2009-12-03','2009-12-17',34),(17,'2003-03-23','2003-04-03',35),(18,'2005-05-07','2004-05-21',36),(19,'2006-01-06','2006-01-19',37),(20,'2002-09-11','2009-09-25',38),(21,'2014-10-28','2014-11-14',39),(22,'2017-05-09','2017-05-29',40),(23,'2009-10-11','2009-10-24',42),(24,'2023-05-05','2023-05-23',36),(27,'2023-10-10','2023-10-14',40),(28,'2023-12-10','2023-12-15',27),(29,'2022-12-02','2022-12-18',11),(30,'2023-11-01','2023-11-12',11),(31,'2022-10-12','2022-10-19',13),(32,'2023-07-06','2023-07-12',13),(33,'2022-12-15','2022-12-12',17),(34,'2023-12-09','2023-12-01',17),(35,'2022-01-10','2022-01-20',19),(36,'2023-06-12','2023-06-15',19),(37,'2022-05-01','2022-05-06',20),(38,'2023-07-09','2023-07-12',20),(39,'2022-06-12','2022-06-15',21),(40,'2023-08-15','2023-08-10',21),(41,'2022-01-06','2022-01-09',22),(42,'2023-10-01','2023-10-06',22),(43,'2022-10-01','2022-10-06',23),(44,'2023-11-28','2023-12-04',23),(45,'2021-12-28','2022-01-05',24),(46,'2023-11-24','2023-11-28',24),(47,'2022-10-12','2022-10-16',25),(48,'2023-04-26','2023-05-01',25),(49,'2022-04-12','2022-04-17',26),(50,'2023-06-01','2023-06-08',26),(51,'2022-03-11','2022-03-17',27),(52,'2023-05-08','2023-05-12',27),(53,'2022-11-10','2022-11-18',28),(54,'2023-07-14','2023-07-17',28),(55,'2022-03-25','2022-04-01',29),(56,'2023-04-12','2023-04-17',29),(57,'2022-12-12','2022-12-16',30),(58,'2023-02-26','2023-03-02',30),(59,'2022-02-22','2022-02-25',31),(60,'2023-03-01','2023-03-04',31),(61,'2022-09-12','2022-09-18',32),(62,'2023-03-01','2023-03-03',32),(63,'2022-02-02','2022-02-10',33),(64,'2023-03-28','2023-04-10',33),(65,'2022-06-12','2022-06-17',34),(66,'2023-10-05','2023-10-09',34),(67,'2022-01-01','2022-01-20',35),(68,'2023-05-28','2023-06-05',35),(69,'2022-05-07','2022-05-19',36),(70,'2023-10-11','2023-10-18',36),(71,'2022-12-26','2023-01-03',37),(72,'2023-12-25','2023-12-30',37),(73,'2022-01-18','2022-01-25',38),(74,'2023-07-20','2023-07-24',38),(75,'2022-08-12','2022-08-19',39),(76,'2023-12-07','2023-12-12',39),(77,'2022-05-06','2022-05-11',40),(78,'2023-11-25','2023-12-02',40),(79,'2022-01-25','2022-02-02',42),(80,'2023-01-08','2023-01-02',42),(81,'2023-10-23','2023-10-27',25);
/*!40000 ALTER TABLE `concediu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `indisponibil_perioada_concediu` AFTER INSERT ON `concediu` FOR EACH ROW BEGIN
	UPDATE utilizator SET disponibil=0 WHERE id_utilizator=NEW.id_utilizator;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `echipament`
--

DROP TABLE IF EXISTS `echipament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echipament` (
  `id_echipament` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_echipament`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echipament`
--

LOCK TABLES `echipament` WRITE;
/*!40000 ALTER TABLE `echipament` DISABLE KEYS */;
INSERT INTO `echipament` VALUES (1,'EKG'),(2,'CT'),(3,'ESW'),(4,'Laser'),(5,'Endoscop'),(6,'Ecograf'),(7,'Fibrobronhoscop'),(8,'Electroencefalograf');
/*!40000 ALTER TABLE `echipament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istoric_medical`
--

DROP TABLE IF EXISTS `istoric_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `istoric_medical` (
  `id_istoric_medical` int NOT NULL AUTO_INCREMENT,
  `data_consultarii` date DEFAULT NULL,
  `id_raport` int DEFAULT NULL,
  `nume_pacient` varchar(45) DEFAULT NULL,
  `prenume_pacient` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_istoric_medical`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istoric_medical`
--

LOCK TABLES `istoric_medical` WRITE;
/*!40000 ALTER TABLE `istoric_medical` DISABLE KEYS */;
INSERT INTO `istoric_medical` VALUES (1,'2022-12-10',5,'Nechita','Marioara'),(2,'2022-12-11',6,'Olenici','Anastasia'),(3,'2008-06-06',7,'Vasilica','Mihai'),(4,'2016-11-16',8,'Slazlo','Valentina'),(5,'2011-02-08',9,'Mic','Marcel'),(6,'2017-07-20',10,'Mare','Mihaielescu'),(7,'2021-03-06',11,'Cornescu','Ionel'),(8,'2014-08-03',12,'Toderici','Annalisia'),(9,'2019-10-01',13,'Curtean','Razvan'),(10,'2013-12-17',14,'Chis ','Dalia'),(11,'2018-06-22',15,'Vlascu','Minodora'),(12,'2022-05-22',16,'Ecaterina','Andronic'),(13,'2023-01-07',19,'Vasilica','Mihai'),(14,'2023-01-07',20,'Anie','Maria'),(15,'2023-01-12',24,'Mic','Bogdan'),(16,'2023-01-12',24,'Mic','Bogdan'),(17,'2023-01-12',25,'Ilies','Oana'),(18,'2023-01-12',25,'Ilies','Oana'),(19,'2023-01-13',28,'Anasi','Minodora'),(20,'2023-01-13',29,'Anasi','Minodora'),(21,'2023-01-13',27,'Vic','Minea'),(22,'2023-01-13',31,'ffvf','fdvd'),(23,'2023-01-13',31,'ffvf','fdvd');
/*!40000 ALTER TABLE `istoric_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medic`
--

DROP TABLE IF EXISTS `medic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medic` (
  `id_medic` int NOT NULL AUTO_INCREMENT,
  `grad` varchar(15) DEFAULT NULL,
  `cod_parafa` varchar(20) DEFAULT NULL,
  `titlu_stiintific` varchar(20) DEFAULT NULL,
  `post_didactic` varchar(45) DEFAULT NULL,
  `procent_negociat` int DEFAULT '0',
  `disponibil` tinyint DEFAULT '1',
  `id_utilizator` int DEFAULT NULL,
  PRIMARY KEY (`id_medic`),
  KEY `medic_utilizator_fk_idx` (`id_utilizator`),
  CONSTRAINT `medic_utilizator_fk` FOREIGN KEY (`id_utilizator`) REFERENCES `utilizator` (`id_utilizator`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medic`
--

LOCK TABLES `medic` WRITE;
/*!40000 ALTER TABLE `medic` DISABLE KEYS */;
INSERT INTO `medic` VALUES (1,'Specialist','1','Doctorand','Profesor',4,1,17),(2,'Specialist','1','Doctorand','Asistent',3,1,23),(3,'Specialist','1',NULL,'Preparator',2,1,24),(4,'Specialist','1','Doctorand',NULL,1,1,25),(5,'Primar','1','Doct stin medical','Lector',3,1,26),(6,'Primar','1','Doct stin medical','Conferentiar',4,1,27),(7,'Primar','1','Doct stin medical',NULL,1,1,28),(8,'Primar','1',NULL,NULL,1,1,29),(9,'Primar','1',NULL,'Conferentiar',4,1,30),(10,'Specialist','1',NULL,NULL,1,1,31),(11,'Primar','1',NULL,'Conferentiar',4,1,23);
/*!40000 ALTER TABLE `medic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medic_competenta`
--

DROP TABLE IF EXISTS `medic_competenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medic_competenta` (
  `id_medic` int NOT NULL,
  `id_competenta` int NOT NULL,
  PRIMARY KEY (`id_medic`,`id_competenta`),
  KEY `competanta_fk_idx` (`id_competenta`),
  CONSTRAINT `competanta_fk` FOREIGN KEY (`id_competenta`) REFERENCES `competenta` (`id_competenta`) ON DELETE CASCADE,
  CONSTRAINT `medic_fk` FOREIGN KEY (`id_medic`) REFERENCES `medic` (`id_medic`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medic_competenta`
--

LOCK TABLES `medic_competenta` WRITE;
/*!40000 ALTER TABLE `medic_competenta` DISABLE KEYS */;
INSERT INTO `medic_competenta` VALUES (1,1),(2,1),(3,2),(4,3),(5,4),(6,5),(7,6),(8,6),(11,6),(9,7),(10,8);
/*!40000 ALTER TABLE `medic_competenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orar_generic`
--

DROP TABLE IF EXISTS `orar_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orar_generic` (
  `id_orar_generic` int NOT NULL AUTO_INCREMENT,
  `ziua` varchar(45) DEFAULT NULL,
  `ora_incepere` time DEFAULT NULL,
  `ora_incheiere` time DEFAULT NULL,
  `id_angajat` int DEFAULT NULL,
  `id_unitate` int DEFAULT NULL,
  PRIMARY KEY (`id_orar_generic`),
  KEY `angajat_fk_idx` (`id_angajat`),
  KEY `unitate_fk_idx` (`id_unitate`),
  CONSTRAINT `angajat_fk` FOREIGN KEY (`id_angajat`) REFERENCES `utilizator` (`id_utilizator`),
  CONSTRAINT `unitate_fk` FOREIGN KEY (`id_unitate`) REFERENCES `unitate_medicala` (`id_unitate_medicala`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orar_generic`
--

LOCK TABLES `orar_generic` WRITE;
/*!40000 ALTER TABLE `orar_generic` DISABLE KEYS */;
INSERT INTO `orar_generic` VALUES (1,'Luni','08:00:00','16:00:00',17,1),(2,'Luni','08:00:00','16:00:00',23,1),(3,'Luni','08:00:00','16:00:00',24,1),(4,'Luni','08:00:00','16:00:00',25,1),(5,'Luni','08:00:00','16:00:00',26,1),(6,'Luni','06:00:00','14:00:00',27,2),(7,'Luni','06:00:00','14:00:00',28,2),(8,'Luni','07:00:00','21:00:00',29,3),(9,'Luni','07:00:00','21:00:00',30,3),(10,'Luni','07:00:00','21:00:00',31,3),(11,'Marti','08:00:00','16:00:00',17,1),(12,'Marti','08:00:00','16:00:00',23,1),(13,'Marti','08:00:00','16:00:00',24,1),(14,'Marti','08:00:00','16:00:00',25,1),(15,'Marti','08:00:00','16:00:00',26,1),(16,'Marti','06:00:00','14:00:00',27,2),(17,'Marti','06:00:00','14:00:00',28,2),(18,'Marti','07:00:00','21:00:00',29,3),(19,'Marti','07:00:00','21:00:00',30,3),(20,'Marti','07:00:00','21:00:00',31,3),(21,'Miercuri','08:00:00','16:00:00',17,1),(22,'Miercuri','08:00:00','16:00:00',23,1),(23,'Miercuri','08:00:00','16:00:00',24,1),(24,'Miercuri','08:00:00','16:00:00',25,1),(25,'Miercuri','08:00:00','16:00:00',26,1),(26,'Miercuri','06:00:00','14:00:00',27,2),(27,'Miercuri','06:00:00','14:00:00',28,2),(28,'Miercuri','07:00:00','21:00:00',29,3),(29,'Miercuri','07:00:00','21:00:00',30,3),(30,'Miercuri','07:00:00','21:00:00',31,3),(31,'Joi','08:00:00','16:00:00',17,1),(32,'Joi','08:00:00','16:00:00',23,1),(33,'Joi','08:00:00','16:00:00',24,1),(34,'Joi','08:00:00','16:00:00',25,1),(35,'Joi','08:00:00','16:00:00',26,1),(36,'Joi','06:00:00','14:00:00',27,2),(37,'Joi','06:00:00','14:00:00',28,2),(38,'Joi','07:00:00','21:00:00',29,3),(39,'Joi','07:00:00','21:00:00',30,3),(40,'Joi','07:00:00','21:00:00',31,3),(41,'Vineri','06:00:00','16:00:00',17,1),(42,'Vineri','06:00:00','16:00:00',23,1),(43,'Vineri','06:00:00','16:00:00',24,1),(44,'Vineri','06:00:00','16:00:00',25,1),(45,'Vineri','06:00:00','16:00:00',26,1),(46,'Vineri','06:00:00','14:00:00',27,2),(47,'Vineri','06:00:00','14:00:00',28,2),(48,'Vineri','06:00:00','21:00:00',29,3),(49,'Vineri','06:00:00','21:00:00',30,3),(50,'Vineri','06:00:00','21:00:00',31,3),(51,'Sambata','10:00:00','18:00:00',17,1),(52,'Sambata','10:00:00','18:00:00',23,1),(53,'Sambata','10:00:00','18:00:00',24,1),(54,'Sambata','10:00:00','18:00:00',25,1),(55,'Sambata','10:00:00','18:00:00',26,1),(56,'Sambata','08:00:00','12:00:00',27,2),(57,'Sambata','08:00:00','12:00:00',28,2),(58,'Sambata','10:00:00','18:00:00',29,3),(59,'Sambata','10:00:00','18:00:00',30,3),(60,'Sambata','10:00:00','18:00:00',31,3),(61,'Duminica','10:00:00','12:00:00',17,1),(62,'Duminica','10:00:00','12:00:00',23,1),(63,'Duminica','10:00:00','12:00:00',24,1),(64,'Duminica','10:00:00','12:00:00',25,1),(65,'Duminica','10:00:00','12:00:00',26,1),(66,'Duminica','10:00:00','12:00:00',27,2),(67,'Duminica','10:00:00','12:00:00',28,2),(68,'Duminica','10:00:00','14:00:00',29,3),(69,'Duminica','10:00:00','14:00:00',30,3),(70,'Duminica','10:00:00','14:00:00',31,3),(71,'Luni','08:00:00','20:00:00',19,1),(72,'Luni','08:00:00','20:00:00',21,1),(73,'Luni','06:00:00','18:00:00',22,2),(74,'Luni','06:00:00','18:00:00',32,2),(75,'Luni','07:00:00','21:00:00',33,3),(76,'Luni','07:00:00','21:00:00',34,3),(77,'Marti','08:00:00','20:00:00',19,1),(78,'Marti','08:00:00','20:00:00',21,1),(79,'Marti','06:00:00','18:00:00',22,2),(80,'Marti','06:00:00','18:00:00',32,2),(81,'Marti','07:00:00','21:00:00',33,3),(82,'Marti','07:00:00','21:00:00',34,3),(83,'Miercuri','08:00:00','20:00:00',19,1),(84,'Miercuri','08:00:00','20:00:00',21,1),(85,'Miercuri','06:00:00','18:00:00',22,2),(86,'Miercuri','06:00:00','18:00:00',32,2),(87,'Miercuri','07:00:00','21:00:00',33,3),(88,'Miercuri','07:00:00','21:00:00',34,3),(89,'Joi','08:00:00','20:00:00',19,1),(90,'Joi','08:00:00','20:00:00',21,1),(91,'Joi','06:00:00','18:00:00',22,2),(92,'Joi','06:00:00','18:00:00',32,2),(93,'Joi','07:00:00','21:00:00',33,3),(94,'Joi','07:00:00','21:00:00',34,3),(95,'Vineri','06:00:00','20:00:00',19,1),(96,'Vineri','06:00:00','20:00:00',21,1),(97,'Vineri','06:00:00','18:00:00',22,2),(98,'Vineri','06:00:00','18:00:00',32,2),(99,'Vineri','06:00:00','21:00:00',33,3),(100,'Vineri','06:00:00','21:00:00',34,3),(101,'Sambata','10:00:00','18:00:00',19,1),(102,'Sambata','10:00:00','18:00:00',21,1),(103,'Sambata','08:00:00','12:00:00',22,2),(104,'Sambata','08:00:00','12:00:00',32,2),(105,'Sambata','10:00:00','18:00:00',33,3),(106,'Sambata','10:00:00','18:00:00',34,3),(107,'Duminica','10:00:00','12:00:00',19,1),(108,'Duminica','10:00:00','12:00:00',21,1),(109,'Duminica','10:00:00','12:00:00',22,2),(110,'Duminica','10:00:00','12:00:00',32,2),(111,'Duminica','10:00:00','14:00:00',33,3),(112,'Duminica','10:00:00','14:00:00',34,3),(113,'Luni','08:00:00','20:00:00',38,1),(114,'Luni','06:00:00','18:00:00',39,2),(115,'Luni','07:00:00','21:00:00',40,3),(116,'Marti','08:00:00','20:00:00',38,1),(117,'Marti','06:00:00','18:00:00',39,2),(118,'Marti','07:00:00','21:00:00',40,3),(119,'Miercuri','08:00:00','20:00:00',38,1),(120,'Miercuri','06:00:00','18:00:00',39,2),(121,'Miercuri','07:00:00','21:00:00',40,3),(122,'Joi','08:00:00','20:00:00',38,1),(123,'Joi','06:00:00','18:00:00',39,2),(124,'Joi','07:00:00','21:00:00',40,3),(125,'Vineri','06:00:00','20:00:00',38,1),(126,'Vineri','06:00:00','18:00:00',39,2),(127,'Vineri','06:00:00','21:00:00',40,3),(128,'Sambata','10:00:00','18:00:00',38,1),(129,'Sambata','08:00:00','12:00:00',39,2),(130,'Sambata','10:00:00','18:00:00',40,3),(131,'Duminica','10:00:00','12:00:00',38,1),(132,'Duminica','10:00:00','12:00:00',39,2),(133,'Duminica','10:00:00','14:00:00',40,3),(134,'Luni','08:00:00','12:00:00',37,1),(135,'Luni','12:00:00','16:00:00',37,2),(136,'Luni','16:00:00','20:00:00',37,3),(137,'Marti','08:00:00','12:00:00',37,1),(138,'Marti','12:00:00','16:00:00',37,2),(139,'Marti','16:00:00','20:00:00',37,3),(140,'Miercuri','08:00:00','12:00:00',37,1),(141,'Miercuri','12:00:00','16:00:00',37,2),(142,'Miercuri','16:00:00','20:00:00',37,3),(143,'Joi','08:00:00','12:00:00',37,1),(144,'Joi','12:00:00','16:00:00',37,2),(145,'Joi','16:00:00','20:00:00',37,3),(146,'Vineri','06:00:00','12:00:00',37,1),(147,'Vineri','06:00:00','16:00:00',37,2),(148,'Vineri','07:00:00','20:00:00',37,3),(149,'Sambata','10:00:00','10:30:00',37,1),(150,'Sambata','10:30:00','11:00:00',37,2),(151,'Sambata','11:00:00','11:30:00',37,3),(152,'Duminica','11:00:00','11:30:00',37,1),(153,'Duminica','11:30:00','12:00:00',37,2),(154,'Duminica','12:00:00','12:30:00',37,3),(155,'Luni','10:00:00','14:00:00',35,1),(156,'Luni','10:00:00','14:00:00',36,2),(157,'Luni','15:00:00','19:00:00',36,3),(158,'Marti','10:00:00','14:00:00',35,1),(159,'Marti','10:00:00','14:00:00',36,2),(160,'Marti','15:00:00','19:00:00',36,3),(161,'Miercuri','10:00:00','14:00:00',35,1),(162,'Miercuri','10:00:00','14:00:00',36,2),(163,'Miercuri','15:00:00','19:00:00',36,3),(164,'Joi','10:00:00','14:00:00',35,1),(165,'Joi','10:00:00','14:00:00',36,2),(166,'Joi','15:00:00','19:00:00',36,3),(167,'Vineri','06:30:00','14:00:00',35,1),(168,'Vineri','07:00:00','14:00:00',36,2),(169,'Vineri','06:00:00','19:00:00',26,3),(170,'Sambata','12:00:00','14:00:00',35,1),(171,'Sambata','10:00:00','12:00:00',36,2),(172,'Sambata','12:30:00','14:30:00',36,3),(173,'Duminica','11:00:00','11:30:00',35,1),(174,'Duminica','11:00:00','11:30:00',36,2),(175,'Duminica','12:00:00','12:30:00',36,3);
/*!40000 ALTER TABLE `orar_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orar_specific`
--

DROP TABLE IF EXISTS `orar_specific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orar_specific` (
  `id_orar_specific` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `ora_incepere` time DEFAULT NULL,
  `ora_incheiere` time DEFAULT NULL,
  `id_unitate` int DEFAULT NULL,
  `id_angajat` int DEFAULT NULL,
  PRIMARY KEY (`id_orar_specific`),
  KEY `angajat_fk_idx` (`id_angajat`),
  KEY `unitate_fk_idx` (`id_unitate`),
  CONSTRAINT `angajat_orar_specific_fk` FOREIGN KEY (`id_angajat`) REFERENCES `utilizator` (`id_utilizator`) ON DELETE CASCADE,
  CONSTRAINT `unitate_orar_specific_fk` FOREIGN KEY (`id_unitate`) REFERENCES `unitate_medicala` (`id_unitate_medicala`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orar_specific`
--

LOCK TABLES `orar_specific` WRITE;
/*!40000 ALTER TABLE `orar_specific` DISABLE KEYS */;
INSERT INTO `orar_specific` VALUES (1,'2023-04-16','11:00:00','12:00:00',1,17),(2,'2023-04-16','11:00:00','12:00:00',1,23),(3,'2023-04-16','11:00:00','12:00:00',1,24),(4,'2023-04-16','11:00:00','12:00:00',1,25),(5,'2023-04-16','11:00:00','12:00:00',1,26),(6,'2023-04-16','10:00:00','11:00:00',2,27),(7,'2023-04-16','10:00:00','11:00:00',2,28),(8,'2023-04-16','13:00:00','14:00:00',3,29),(9,'2023-04-16','13:00:00','14:00:00',3,30),(10,'2023-04-16','13:00:00','14:00:00',3,31),(11,'2023-04-16','11:00:00','12:00:00',1,19),(12,'2023-04-16','11:00:00','12:00:00',1,21),(13,'2023-04-16','10:00:00','11:00:00',2,22),(14,'2023-04-16','10:00:00','11:00:00',2,32),(15,'2023-04-16','13:00:00','14:00:00',3,33),(16,'2023-04-16','13:00:00','14:00:00',3,34),(26,'2023-01-01','11:00:00','12:00:00',1,17),(27,'2023-01-01','11:00:00','12:00:00',1,23),(28,'2023-01-01','11:00:00','12:00:00',1,24),(29,'2023-01-01','11:00:00','12:00:00',1,25),(30,'2023-01-01','11:00:00','12:00:00',1,26),(31,'2023-01-01','10:00:00','11:00:00',2,27),(32,'2023-01-01','10:00:00','11:00:00',2,28),(33,'2023-01-01','13:00:00','14:00:00',3,29),(34,'2023-01-01','13:00:00','14:00:00',3,30),(35,'2023-01-01','13:00:00','14:00:00',3,31),(36,'2023-01-01','11:00:00','12:00:00',1,19),(37,'2023-01-01','11:00:00','12:00:00',1,21),(38,'2023-01-01','10:00:00','11:00:00',2,22),(39,'2023-01-01','10:00:00','11:00:00',2,32),(40,'2023-01-01','13:00:00','14:00:00',3,33),(41,'2023-01-01','13:00:00','14:00:00',3,34),(42,'2023-04-16','11:00:00','12:00:00',1,38),(43,'2023-04-16','10:00:00','11:00:00',2,39),(44,'2023-04-16','13:00:00','14:00:00',3,40),(45,'2023-01-01','11:00:00','12:00:00',1,38),(46,'2023-01-01','10:00:00','11:00:00',2,39),(47,'2023-01-01','13:00:00','14:00:00',3,40);
/*!40000 ALTER TABLE `orar_specific` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacient`
--

DROP TABLE IF EXISTS `pacient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacient` (
  `id_pacient` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(50) DEFAULT NULL,
  `prenume` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pacient`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacient`
--

LOCK TABLES `pacient` WRITE;
/*!40000 ALTER TABLE `pacient` DISABLE KEYS */;
INSERT INTO `pacient` VALUES (32,'Ionescu','Valentin'),(33,'Nechita','Marioara'),(40,'Olenici','Anastasia'),(41,'Vasilica','Mihai'),(42,'Slazlo','Valentina'),(43,'Mic','Marcel'),(44,'Mare','Mihaielescu'),(45,'Cornescu','Ionel'),(46,'Toderici','Annalisia'),(47,'Curtean','Razvan'),(48,'Chis','Dalia'),(49,'Vlascu','Minodora'),(50,'Ecaterina','Andronic'),(51,'Isaila','Voichita'),(52,'Ecaterina','Andronic'),(53,'Petean','Marginar'),(54,'Ain','Mihcha'),(55,'Ghib','Anca'),(56,'Olenici','Anastasia'),(57,'Vasilica','Mihai'),(58,'Anie','Maria'),(59,'Ana','Ansuca'),(60,'A','A'),(61,'Schiau','Alex'),(62,'Miau','Maria'),(63,'Ham','Laurentiu'),(64,'Anastas','Maria'),(65,'Mic','Bogdan'),(66,'Ilies','Oana'),(67,'Vic','Minea'),(69,'Anasi','Minodora'),(70,'Anasi','Minodora'),(71,'A','B'),(72,'ffvf','fdvd');
/*!40000 ALTER TABLE `pacient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_functionare`
--

DROP TABLE IF EXISTS `program_functionare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_functionare` (
  `id_program` int NOT NULL AUTO_INCREMENT,
  `luni_deschidere` time DEFAULT NULL,
  `luni_inchidere` time DEFAULT NULL,
  `marti_deschidere` time DEFAULT NULL,
  `marti_inchidere` time DEFAULT NULL,
  `miercuri_deschidere` time DEFAULT NULL,
  `miercuri_inchidere` time DEFAULT NULL,
  `joi_deschidere` time DEFAULT NULL,
  `joi_inchidere` time DEFAULT NULL,
  `vineri_deschidere` time DEFAULT NULL,
  `vineri_inchidere` time DEFAULT NULL,
  `sambata_deschidere` time DEFAULT NULL,
  `sambata_inchidere` time DEFAULT NULL,
  `duminica_deschidere` time DEFAULT NULL,
  `duminica_inchidere` time DEFAULT NULL,
  PRIMARY KEY (`id_program`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_functionare`
--

LOCK TABLES `program_functionare` WRITE;
/*!40000 ALTER TABLE `program_functionare` DISABLE KEYS */;
INSERT INTO `program_functionare` VALUES (1,'08:00:00','20:00:00','08:00:00','20:00:00','08:00:00','20:00:00','08:00:00','20:00:00','06:00:00','20:00:00','10:00:00','18:00:00','10:00:00','12:00:00'),(2,'06:00:00','18:00:00','06:00:00','18:00:00','06:00:00','18:00:00','06:00:00','18:00:00','06:00:00','18:00:00','08:00:00','12:00:00','10:00:00','12:00:00'),(3,'07:00:00','21:00:00','07:00:00','21:00:00','07:00:00','21:00:00','07:00:00','21:00:00','06:00:00','21:00:00','10:00:00','18:00:00','10:00:00','14:00:00');
/*!40000 ALTER TABLE `program_functionare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programare`
--

DROP TABLE IF EXISTS `programare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programare` (
  `id_programare` int NOT NULL AUTO_INCREMENT,
  `ora` time DEFAULT NULL,
  `zi` date DEFAULT NULL,
  `nume_pacient` varchar(45) DEFAULT NULL,
  `prenume_pacient` varchar(45) DEFAULT NULL,
  `incheiata` tinyint DEFAULT '0',
  `id_unitate` int DEFAULT NULL,
  `id_medic` int DEFAULT NULL,
  `id_pacient` int DEFAULT NULL,
  `id_cabinet` int DEFAULT NULL,
  PRIMARY KEY (`id_programare`),
  KEY `programare_medic_fk_idx` (`id_medic`),
  KEY `programare_pacient_fk_idx` (`id_pacient`),
  KEY `programare_unitate_fk_idx` (`id_unitate`),
  KEY `programare_cabinet_fk_idx` (`id_cabinet`),
  CONSTRAINT `programare_cabinet_fk` FOREIGN KEY (`id_cabinet`) REFERENCES `cabinet_medical` (`id_cabinet`),
  CONSTRAINT `programare_medic_fk` FOREIGN KEY (`id_medic`) REFERENCES `medic` (`id_medic`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `programare_pacient_fk` FOREIGN KEY (`id_pacient`) REFERENCES `pacient` (`id_pacient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `programare_unitate_fk` FOREIGN KEY (`id_unitate`) REFERENCES `unitate_medicala` (`id_unitate_medicala`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programare`
--

LOCK TABLES `programare` WRITE;
/*!40000 ALTER TABLE `programare` DISABLE KEYS */;
INSERT INTO `programare` VALUES (32,'18:00:00','2022-12-15','Ionescu','Valentin',0,1,1,32,1),(33,'18:30:00','2022-12-10','Nechita','Marioara',1,3,8,33,4),(40,'11:30:00','2022-12-11','Olenici','Anastasia',1,1,1,40,1),(41,'12:00:00','2008-06-06','Vasilica','Mihai',1,1,1,41,1),(42,'11:30:00','2016-11-16','Slazlo','Valentina',1,1,2,42,1),(43,'14:30:00','2011-02-08','Mic','Marcel',1,3,3,43,7),(44,'10:00:00','2017-07-20','Mare','Mihaielescu',1,1,4,44,2),(45,'12:00:00','2021-03-06','Cornescu','Ionel',1,2,5,45,6),(46,'07:00:00','2014-08-03','Toderici','Annalisia',1,1,6,46,3),(47,'13:00:00','2019-10-01','Curtean','Razvan',1,1,7,47,4),(48,'18:00:00','2013-12-17','Chis','Dalia',1,1,8,48,4),(49,'10:00:00','2018-06-22','Vlascu','Minodora',1,1,9,49,5),(50,'11:00:00','2022-05-22','Ecaterina','Andronic',1,3,10,50,8),(51,'15:00:00','2023-01-03','Isaila','Voichita',1,3,8,51,8),(52,'18:00:00','2023-01-03','Ecaterina','Andronic',0,NULL,9,52,NULL),(53,'18:00:00','2023-01-03','Petean','Marginar',1,1,2,53,4),(54,'10:00:00','2020-11-11','Ain','Mihcha',0,NULL,5,54,NULL),(55,'14:00:00','2023-01-07','Ghib','Anca',0,3,2,55,7),(56,'14:00:00','2023-01-08','Olenici','Anastasia',0,3,2,56,7),(57,'18:00:00','2023-01-07','Vasilica','Mihai',1,3,2,57,7),(58,'16:00:00','2023-01-07','Anie','Maria',1,1,2,58,4),(60,'10:00:00','2023-01-08','A','A',0,1,5,60,3),(61,'08:30:00','2023-01-23','Schiau','Alex',0,NULL,5,61,NULL),(62,'13:30:00','2023-02-14','Miau','Maria',0,NULL,7,62,NULL),(63,'15:00:00','2023-01-11','Ham','Laurentiu',0,1,1,63,1),(64,'08:00:00','2023-01-12','Anastas','Maria',0,3,2,64,7),(65,'12:00:00','2023-01-12','Mic','Bogdan',1,1,2,65,4),(66,'13:30:00','2023-01-12','Ilies','Oana',1,3,2,66,7),(67,'14:00:00','2023-01-13','Vic','Minea',1,3,2,67,7),(69,'06:00:00','2023-01-13','Anasi','Minodora',1,1,2,69,4),(70,'14:00:00','2023-01-04','Anasi','Minodora',1,1,2,69,4),(71,'07:00:00','2023-01-13','A','B',0,1,2,71,4),(72,'10:00:00','2023-01-13','ffvf','fdvd',1,1,2,72,4);
/*!40000 ALTER TABLE `programare` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_creare_pacient` BEFORE INSERT ON `programare` FOR EACH ROW BEGIN
   INSERT INTO pacient(nume,prenume) VALUES (NEW.nume_pacient,NEW.prenume_pacient);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `programare_servicii_medicale`
--

DROP TABLE IF EXISTS `programare_servicii_medicale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programare_servicii_medicale` (
  `id_programare` int NOT NULL,
  `id_servicii` int NOT NULL,
  PRIMARY KEY (`id_programare`,`id_servicii`),
  KEY `programare_serviciu_fk_idx` (`id_servicii`),
  CONSTRAINT `programare_p_fk` FOREIGN KEY (`id_programare`) REFERENCES `programare` (`id_programare`),
  CONSTRAINT `programare_serviciu_fk` FOREIGN KEY (`id_servicii`) REFERENCES `serviciu_medical` (`id_serviciu_medical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programare_servicii_medicale`
--

LOCK TABLES `programare_servicii_medicale` WRITE;
/*!40000 ALTER TABLE `programare_servicii_medicale` DISABLE KEYS */;
INSERT INTO `programare_servicii_medicale` VALUES (32,1),(40,1),(41,1),(63,1),(42,2),(55,2),(56,2),(57,2),(64,2),(66,2),(67,2),(43,3),(44,4),(45,5),(54,5),(60,5),(61,5),(46,6),(47,7),(62,7),(33,8),(48,8),(51,8),(49,9),(52,9),(50,10),(53,11),(58,11),(65,11),(69,11),(71,11),(72,11);
/*!40000 ALTER TABLE `programare_servicii_medicale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raport_medical`
--

DROP TABLE IF EXISTS `raport_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raport_medical` (
  `id_raport` int NOT NULL AUTO_INCREMENT,
  `nume_pacient` varchar(45) DEFAULT NULL,
  `prenume_pacient` varchar(45) DEFAULT NULL,
  `nume_medic_realizator` varchar(45) DEFAULT NULL,
  `prenume_medic_realizator` varchar(45) DEFAULT NULL,
  `data_consultatiei` date DEFAULT NULL,
  `istoric` mediumtext,
  `simptome` mediumtext,
  `diagnostic` mediumtext,
  `recomandari` mediumtext,
  `investigatii` mediumtext,
  `parafat` tinyint DEFAULT '0',
  `id_medic` int DEFAULT NULL,
  `id_asistent` int DEFAULT NULL,
  PRIMARY KEY (`id_raport`),
  KEY `raport_medic_fk_idx` (`id_medic`),
  KEY `raport_asistent_fk_idx` (`id_asistent`),
  CONSTRAINT `raport_asistent_fk` FOREIGN KEY (`id_asistent`) REFERENCES `asistent` (`id_asistent`) ON DELETE SET NULL,
  CONSTRAINT `raport_medic_fk` FOREIGN KEY (`id_medic`) REFERENCES `medic` (`id_medic`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raport_medical`
--

LOCK TABLES `raport_medical` WRITE;
/*!40000 ALTER TABLE `raport_medical` DISABLE KEYS */;
INSERT INTO `raport_medical` VALUES (5,'Nechita','Marioara','Laurentiu','Goerge','2022-12-10','Nu are','Durere abdpminala','Ficat gras','Regim alimentar','Nu',1,8,15),(6,'Olenici','Anastasia','Gheorghita','Vasile','2022-12-11','Nu are','Palpitatii','Oscilatii necontrolabile','Efort moderat','Monitorizare periodica',1,1,18),(7,'Vasilica','Mihai','Gheorghita','Vasile','2008-06-06','Nu are','Control','Limite normale','Efort moderat','Nu',1,1,15),(8,'Slazlo','Valentina','Popescu','Grigore','2016-11-16','Nu are','Ingreunarea suflului','Suflu sistolic','Regim si efort mic constant','Slabire',1,2,18),(9,'Mic','Marcel','Ispas','Ioana','2011-02-08','Nu are','Durerea membrelor','Artroza','Miscare usoara si CartilajoExpres','Nu',1,3,30),(10,'Mare','Mihaielescu','Zaharia','Radu','2017-07-20','Nu are','Durere rinichi','Pietre la rinichi','Baut minim 3L apa','Operatie',1,4,15),(11,'Cornescu','Ionel','Ionescu','Emil','2021-03-06','Nu are','Pozitie incorecta a osului','Fractura deplasata','Nemiscarea membrului','Operatie',1,5,29),(12,'Toderici','Annalisia','Iovan','Oana','2014-08-03','Nu are','Durere stomac','Ulcer','Regim alimentar','Nu',1,6,18),(13,'Curtean','Razvan','Hulea','Tudor','2019-10-01','Nu are','Ingrosarea vocii','Chist inactiv','Crema sanzaiene','Nu',1,7,15),(14,'Chis ','Dalia','Laurentiu','Goerge','2013-12-17','Nu are','Durere inghinala','Apenticita','Repaus','Operatie',1,8,15),(15,'Vlascu','Minodora','Mihaiescu','Elena','2018-06-22','Nu are','Tuse groasa','Bronsita','Eurespal','Nu necesita',1,9,18),(16,'Ecaterina','Andronic','Georgescu','Ioan','2022-05-22','Nu are','Tremurici','Leziuni sist nervos periferic','Relaxiren','Nu',1,10,31),(17,'Isaila','Voichita','Laurentiu','Goerge','2023-01-03','Nu are','Durere de cap','Curent Acut','Antiinflamator','Nu  necesita.',1,8,30),(18,'Petean','Marginar','Popescu','Grigore','2023-01-03','Nu are','Dureri abdominale','Apendicita','Regim','Consult periodic',1,2,18),(19,'Vasilica','Mihai','Popescu','Grigore','2023-01-07','Nu are','Durere de cap','Encefalita','Medicamentos','Consut periodic',1,2,18),(20,'Anie','Maria','Popescu','Grigore','2023-01-07','Nu are','Durere masea','Carie','Extragerea maselei','Nu necesita!',1,2,15),(21,'Ham','Laurentiu','Gheorghita','Vasile','2023-01-11','Nu are',NULL,NULL,NULL,NULL,0,1,NULL),(22,'Anastas','Maria','Popescu','Grigore','2023-01-12','Nu are',NULL,NULL,NULL,NULL,0,2,NULL),(24,'Mic','Bogdan','Popescu','Grigore','2023-01-12','Nu are','Durere costala','Intindere musculara','Odihna si regim','Nu necesita',1,2,18),(25,'Ilies','Oana','Popescu','Grigore','2023-01-12','Nu are','Invinetirea fruntii','Infarct partial','Nu stresului','Periodic,din 2 in 2 luni',1,2,15),(27,'Vic','Minea','Popescu','Grigore','2023-01-13','Nu are','Durere','fwfer','ref','nu',1,2,18),(28,'Anasi','Minodora','Popescu','Grigore','2023-01-13','Nu are','Durere','Nimic','Nu are','Nu necesita',1,2,18),(29,'Anasi','Minodora','Popescu','Grigore','2023-01-04','Da','Durere','Ficat marit','Regim','Consult,peste 1 luna',1,2,18),(30,'A','B','Popescu','Grigore','2023-01-13','Nu are',NULL,NULL,NULL,NULL,0,2,NULL),(31,'ffvf','fdvd','Popescu','Grigore','2023-01-13','Nu are','erge','fref','fref','fref',1,2,18);
/*!40000 ALTER TABLE `raport_medical` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_setare_medic_disponibil` BEFORE UPDATE ON `raport_medical` FOR EACH ROW BEGIN
   DECLARE parafatN int;
   SELECT parafat from raport_medical WHERE id_raport=NEW.id_raport into parafatN;
   if(parafatN = 1) THEN 
   UPDATE medic SET disponibil=1 WHERE id_medic = NEW.id_medic ;
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_setare_programare_incheiata` AFTER UPDATE ON `raport_medical` FOR EACH ROW BEGIN
   DECLARE parafatN int;
   SELECT parafat from raport_medical WHERE id_raport=NEW.id_raport into parafatN;
   if(parafatN = 1) THEN 
   UPDATE programare SET incheiata=1 WHERE id_medic = NEW.id_medic AND nume_pacient=NEW.nume_pacient AND prenume_pacient=NEW.prenume_pacient AND zi=NEW.data_consultatiei; 
   insert into istoric_medical(data_consultarii,id_raport,nume_pacient,prenume_pacient) values (curdate(),NEW.id_raport,NEW.nume_pacient,NEW.prenume_pacient);
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `salariu`
--

DROP TABLE IF EXISTS `salariu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salariu` (
  `id_salariu` int NOT NULL AUTO_INCREMENT,
  `suma` decimal(9,2) DEFAULT NULL,
  `nr_ore` int DEFAULT '0',
  `luna` int DEFAULT NULL,
  `an` int DEFAULT NULL,
  `id_utilizator` int DEFAULT NULL,
  PRIMARY KEY (`id_salariu`),
  KEY `salariu_utilizator_fk_idx` (`id_utilizator`),
  CONSTRAINT `salariu_utilizator_fk` FOREIGN KEY (`id_utilizator`) REFERENCES `utilizator` (`id_utilizator`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salariu`
--

LOCK TABLES `salariu` WRITE;
/*!40000 ALTER TABLE `salariu` DISABLE KEYS */;
INSERT INTO `salariu` VALUES (14,4800.00,160,11,2022,11),(15,4200.00,140,12,2022,11),(16,4443.75,158,11,2022,13),(17,3571.87,127,12,2022,13),(18,4900.00,208,11,2022,17),(19,4947.11,210,12,2022,17),(20,2526.88,188,11,2022,19),(21,2392.47,178,12,2022,19),(22,4500.00,160,11,2022,20),(23,3937.50,140,12,2022,20),(24,2500.00,186,11,2022,21),(25,2500.00,186,12,2022,21),(26,2284.94,170,11,2022,22),(27,2096.77,156,12,2022,22),(28,6189.47,196,11,2022,23),(29,6000.00,190,12,2022,23),(30,4900.00,208,11,2022,24),(31,4994.23,212,12,2022,24),(32,4900.00,208,11,2022,25),(33,4900.00,208,12,2022,25),(34,4200.00,208,11,2022,26),(35,3957.69,196,12,2022,26),(36,3634.61,180,11,2022,27),(37,3917.30,194,12,2022,27),(38,4159.61,206,11,2022,28),(39,4038.46,200,12,2022,28),(40,4078.84,202,11,2022,29),(41,3715.38,184,12,2022,29),(42,5447.11,206,11,2022,30),(43,4706.73,178,12,2022,30),(44,6000.00,190,11,2022,31),(45,5873.68,186,12,2022,31),(46,2500.00,186,11,2022,32),(47,2365.59,176,12,2022,32),(48,2500.00,186,11,2022,33),(49,2500.00,186,12,2022,33),(50,2419.35,180,11,2022,34),(51,2473.11,184,12,2022,34),(52,3000.00,160,11,2022,35),(53,2737.50,146,12,2022,35),(54,2814.38,158,11,2022,36),(55,2529.38,142,12,2022,36),(56,3157.33,148,11,2022,37),(57,2944.00,138,12,2022,37),(58,2750.00,178,11,2022,38),(59,2626.40,170,12,2022,38),(60,1862.35,170,11,2022,39),(61,1884.26,172,12,2022,39),(62,2556.17,182,11,2022,40),(63,2443.82,174,12,2022,40),(64,3266.66,140,11,2022,42),(65,3406.66,146,12,2022,42),(93,600.00,20,1,2023,11),(94,506.25,18,1,2023,13),(95,1413.46,60,1,2023,17),(96,470.43,35,1,2023,19),(97,393.75,14,1,2023,20),(98,403.22,30,1,2023,21),(99,376.34,28,1,2023,22),(100,1995.42,56,1,2023,23),(101,1319.23,56,1,2023,24),(102,1272.11,54,1,2023,25),(103,969.23,48,1,2023,26),(104,1453.84,72,1,2023,27),(105,888.46,44,1,2023,28),(106,1110.57,55,1,2023,29),(107,1639.42,62,1,2023,30),(108,1010.52,32,1,2023,31),(109,376.34,28,1,2023,32),(110,430.10,32,1,2023,33),(111,483.87,36,1,2023,34),(112,187.50,10,1,2023,35),(113,142.50,8,1,2023,36),(114,128.00,6,1,2023,37),(115,617.97,40,1,2023,38),(116,525.84,48,1,2023,39),(117,730.33,52,1,2023,40),(118,233.33,10,1,2023,42);
/*!40000 ALTER TABLE `salariu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_salariu` BEFORE INSERT ON `salariu` FOR EACH ROW BEGIN

   DECLARE nr_ore_contract int;
   DECLARE salariu_contract double;
   
   SELECT nr_ore FROM utilizator WHERE id_utilizator = NEW.id_utilizator INTO nr_ore_contract;
   SELECT salariu_negociat FROM utilizator WHERE id_utilizator = NEW.id_utilizator INTO salariu_contract;
   
   SET NEW.suma = (NEW.nr_ore * salariu_contract) / nr_ore_contract;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `serviciu_competenta`
--

DROP TABLE IF EXISTS `serviciu_competenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviciu_competenta` (
  `id_serviciu` int NOT NULL,
  `id_competenta` int NOT NULL,
  PRIMARY KEY (`id_serviciu`,`id_competenta`),
  KEY `fk_competenta_idx` (`id_competenta`),
  CONSTRAINT `fk_competenta` FOREIGN KEY (`id_competenta`) REFERENCES `competenta` (`id_competenta`) ON DELETE CASCADE,
  CONSTRAINT `fk_serviciu` FOREIGN KEY (`id_serviciu`) REFERENCES `serviciu_medical` (`id_serviciu_medical`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciu_competenta`
--

LOCK TABLES `serviciu_competenta` WRITE;
/*!40000 ALTER TABLE `serviciu_competenta` DISABLE KEYS */;
INSERT INTO `serviciu_competenta` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(11,6),(7,7),(8,8);
/*!40000 ALTER TABLE `serviciu_competenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviciu_echipament`
--

DROP TABLE IF EXISTS `serviciu_echipament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviciu_echipament` (
  `id_serviciu` int NOT NULL,
  `id_echipament` int NOT NULL,
  PRIMARY KEY (`id_serviciu`,`id_echipament`),
  KEY `serviciu_echipament_fk2_idx` (`id_echipament`),
  CONSTRAINT `serviciu_echipament_fk` FOREIGN KEY (`id_serviciu`) REFERENCES `serviciu_medical` (`id_serviciu_medical`),
  CONSTRAINT `serviciu_echipament_fk2` FOREIGN KEY (`id_echipament`) REFERENCES `echipament` (`id_echipament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciu_echipament`
--

LOCK TABLES `serviciu_echipament` WRITE;
/*!40000 ALTER TABLE `serviciu_echipament` DISABLE KEYS */;
INSERT INTO `serviciu_echipament` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(11,6),(7,7),(8,8);
/*!40000 ALTER TABLE `serviciu_echipament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviciu_medical`
--

DROP TABLE IF EXISTS `serviciu_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviciu_medical` (
  `id_serviciu_medical` int NOT NULL AUTO_INCREMENT,
  `denumire` varchar(45) DEFAULT NULL,
  `specializarea` varchar(45) DEFAULT NULL,
  `pret` double DEFAULT NULL,
  `durata` int DEFAULT NULL,
  `id_medic` int DEFAULT NULL,
  PRIMARY KEY (`id_serviciu_medical`),
  KEY `serviciu_medic_fk_idx` (`id_medic`),
  CONSTRAINT `serviciu_medic_fk` FOREIGN KEY (`id_medic`) REFERENCES `medic` (`id_medic`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciu_medical`
--

LOCK TABLES `serviciu_medical` WRITE;
/*!40000 ALTER TABLE `serviciu_medical` DISABLE KEYS */;
INSERT INTO `serviciu_medical` VALUES (1,'Consultatie','Cardiologie',315,60,1),(2,'Consultatie','Computer tomograf',190,180,2),(3,'Consultatie','Litotritie extracorporeala',150,30,3),(4,'Consultatie','Chirurgie',350,120,4),(5,'Consultatie','Endoscopie',220,90,5),(6,'Consultatie','Ecografie',375,90,6),(7,'Consultatie','Bronhoscopie',125,60,7),(8,'Consultatie','EEG EMG',100,60,8),(9,'Consultatie','Bronhoscopie',280,90,9),(10,'Consultatie','EEG EMG',250,120,10),(11,'Consultatie','Ecografie',260,60,2);
/*!40000 ALTER TABLE `serviciu_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialitate_medic`
--

DROP TABLE IF EXISTS `specialitate_medic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialitate_medic` (
  `id_specialitate` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) DEFAULT NULL,
  `grad` varchar(45) DEFAULT NULL,
  `id_medic` int DEFAULT NULL,
  PRIMARY KEY (`id_specialitate`),
  KEY `medic_specialitate_fk_idx` (`id_medic`),
  CONSTRAINT `medic_specialitate_fk` FOREIGN KEY (`id_medic`) REFERENCES `medic` (`id_medic`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialitate_medic`
--

LOCK TABLES `specialitate_medic` WRITE;
/*!40000 ALTER TABLE `specialitate_medic` DISABLE KEYS */;
INSERT INTO `specialitate_medic` VALUES (1,'Cardiologie','Specialist',1),(2,'Computer tomograf','Specialist',2),(3,'Litotritie extracorporeala','Specialist',3),(4,'Chirurgie','Specialist',4),(5,'Endoscopie','Primar',5),(6,'Ecografie','Primar',6),(7,'Bronhoscopie','Primar',7),(8,'EEG EMG','Primar',8),(9,'Bronhoscopie','Profesor',9),(10,'EEG EMG','Conferentiar',10),(11,'Ecografie','Conferentiar',2);
/*!40000 ALTER TABLE `specialitate_medic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitate_medicala`
--

DROP TABLE IF EXISTS `unitate_medicala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitate_medicala` (
  `id_unitate_medicala` int NOT NULL AUTO_INCREMENT,
  `denumire` varchar(255) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `descriere_servicii` mediumtext,
  `id_program` int DEFAULT NULL,
  PRIMARY KEY (`id_unitate_medicala`),
  KEY `program_fk_idx` (`id_program`),
  CONSTRAINT `program_fk` FOREIGN KEY (`id_program`) REFERENCES `program_functionare` (`id_program`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitate_medicala`
--

LOCK TABLES `unitate_medicala` WRITE;
/*!40000 ALTER TABLE `unitate_medicala` DISABLE KEYS */;
INSERT INTO `unitate_medicala` VALUES (1,'Interservisan','Str.Barbu Lautaru;Nr.02','Interne',1),(2,'Salvosan','Str.Victor Babes;Nr.25','Chirurgie',2),(3,'Medstar','Str.Marasti;Nr.30','Sistem nervos',3);
/*!40000 ALTER TABLE `unitate_medicala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizator`
--

DROP TABLE IF EXISTS `utilizator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizator` (
  `id_utilizator` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `CNP` varchar(13) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `nr_telefon` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `IBAN` varchar(45) DEFAULT NULL,
  `nr_contract` int DEFAULT NULL,
  `data_angajarii` date DEFAULT NULL,
  `functie` varchar(45) DEFAULT NULL,
  `salariu_negociat` double DEFAULT '0',
  `nr_ore` int DEFAULT '0',
  `user` varchar(45) DEFAULT NULL,
  `parola` varchar(45) DEFAULT NULL,
  `disponibil` tinyint DEFAULT '1',
  PRIMARY KEY (`id_utilizator`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizator`
--

LOCK TABLES `utilizator` WRITE;
/*!40000 ALTER TABLE `utilizator` DISABLE KEYS */;
INSERT INTO `utilizator` VALUES (11,'Cioban','Fabian-Remus','5026284911231','Str.Mogosoaia;Nr.2;Ap.59','0748595665','fabian_fcucj1103@yahoo.com','RO49AAAA1B3100759384',1,'2002-03-11','Super Admin',4800,160,'Fabisor11','fabian11',0),(13,'Pojar','Andrei-Gabriel','5071087365012','Str.Tulcea;Nr.23;Ap.3','0755548099','andrei.pojar@yahoo.com','RO93RZBR060123124214',2,'2002-07-10','Admin',4500,160,'poji','pojare1',0),(17,'Gheorghita','Vasile','5830712067600','Str.Lalelelor;Nr54','0759230081','vasile.gheorghita@yahoo.com','RO78BCER3244589762351',3,'2003-12-07','Medic',4900,208,'vasi','basi123',0),(19,'Pop','Maria','2980524264066','Str.Mehedinti;Nr7;Ap.36','0740213099','maria.maria@yahoo.com','RO31PORL7447629749155749',4,'2006-11-03','Asistent medical',2500,186,'maria','maria1',0),(20,'Crisan','Ion-Mihai','1880905375367','Str.Mihai;Nr.40','0750281393','ionmihai_crisan@yahoo.com','RO81PORL9958982282596677',5,'2010-10-21','Admin',4500,160,'ion','ion1',0),(21,'Turc','Ionut','1901109420361','Str.Campului;Nr.20;Ap.49','0740323457','turc_ion@gmail.com','RO95RZBR6551442368276381',6,'2012-08-04','Asistent medical',2500,186,'ionut','ionisor',0),(22,'Suciu','Corina','2940509065042','Str.Kogalniceanu;Nr.12','0750121340','corina.corina@yahoo.com','RO54PORL9593961432726828',7,'2017-01-06','Asistent medical',2500,186,'corina','corinuta1',0),(23,'Popescu','Grigore','1940917518573','Str.Muresului;Nr.10','0723456789','popescu.grigore@yahoo.com','RO98PORL4267491263921311',8,'2010-03-03','Medic',6000,190,'grigore','grigore1',0),(24,'Ispas','Ioana','2901222305295','Str.Oltului;Nr.40','0745671020','ioana.ispas@yahoo.com','RO51PORL3781588269436657',9,'2009-10-12','Medic',4900,208,'ioana','ioana3',0),(25,'Zaharia','Radu','1980201073730','Str.Manastur;Nr.50','0756890123','zahariaa.radu@yahoo.com','RO26RZBR4624796319362678',10,'2011-10-08','Medic',4900,208,'radu','radu1234',0),(26,'Ionescu','Emil','5020309454636','Str.Racovita','0750409123','ionescu_emil@yahoo.com','RO75RZBR2635331767664392',11,'2019-09-09','Medic',4200,208,'emil','emil1',0),(27,'Iovan','Oana','2870116227274','Str.Vuia;Nr.45;Ap.3','0745402091','iovan.oanaa@yahoo.com','RO48PORL4838446195611944',12,'2010-10-01','Medic',4200,208,'oanaa1','oana1',0),(28,'Hulea','Tudor','1880809139742','Str.Oasului;Nr.50','0756890345','tudor.hulea@yahoo.com','RO09PORL4618228724247981',13,'2015-01-23','Medic',4200,208,'tudor','tudorel123',0),(29,'Laurentiu','Goerge','1930529457891','Str.Harghita;Nr.20','0740502897','georgee_laurentiu@gmail.com','RO73RZBR8966996133831945',14,'2012-09-10','Medic',4200,208,'george','georgica1',0),(30,'Mihaiescu','Elena','6040811251391','Str.Zorilor;Nr.13;Ap.01','0743508907','mihaiescu.elena@yahoo.com','RO73PORL3711261878494964',15,'2013-05-10','Medic',5500,208,'elenaa','elena1234',0),(31,'Georgescu','Ioan','1990107144250','Str.Meteor;Nr.56','0740590876','georgescu.ioan@gmail.com','RO92RZBR2899386985715395',16,'2020-06-23','Medic',6000,190,'ioan','ionica11',0),(32,'Pavel','Emilia','2970311213923','Str.Zimbrilor;Nr.40','0724567890','emilia.pavel10@yahoo.com','RO43PORL2755152375513255',17,'2010-09-24','Asistent medical',2500,186,'emilia','emiliuta1',0),(33,'Petrea','Petru','1990929025224','Str.Izlazului;Nr.02;Ap.11','0752908765','petru.petru20@gmail.com','RO93PORL6914682556318649',18,'2019-08-24','Asistent medical',2500,186,'petru','petruu1',0),(34,'Maris','Florin','5040330466205','Str.Clabucet;Nr.13;Ap.03','0745678109','maris.florinel@yahoo.com','RO46PORL6432864696647616',19,'2009-10-20','Asistent medical',2500,186,'florin','florin1',0),(35,'Danciulescu','Razvan','1911012102614','Str.Memorandumului;Nr.50','0745789102','danciulescu.razvan25@gmail.com','RO62RZBR9553611436827684',20,'2002-05-14','Inspector resurse umane',3000,160,'razvan','razvan1234',0),(36,'Gelu','David','1910325354131','Str.Bucium;Nr.27;Ap.22','0740908123','davidd.gelu@gmail.com','RO79PORL5745577637667212',21,'2004-10-02','Inspector resurse umane',2850,160,'david','david90',0),(37,'Flaviu','Sorin','1950326335070','Str.Dunarii;Nr.10.Ap.09','0734567890','flaviu.sorin20@gmail.com','RO05RZBR3258958553371612',22,'2002-04-29','Expert financiar contabil',3200,150,'sorin','sorin123',0),(38,'Andreescu','Daniel','1931216446993','Str.Iuliu Maniu;Nr.20;Ap.04','0734090876','daniel.danielutz10@gmail.com','RO67RZBR5266833844512869',23,'2002-04-28','Receptioner',2750,178,'daniell','dani12',0),(39,'Mateescu','Ionel','5011105056492','Str.Intre Lacuri;Nr.40','0756780125','mateescu.ionel20@yahoo.com','RO29PORL9844426153862768',24,'2010-09-26','Receptioner',1950,178,'ionel','ionica',0),(40,'Denis','Claudiu','1920205330598','Str.Plopilor;Nr.11;Ap.10','0740876590','clauu.denis@gmail.com','RO90RZBR5616752223243458',25,'2014-09-10','Receptioner',2500,178,'clau','clau11',0),(42,'Toader','Mihai','5221209065178','Str.Fanate;Nr.29','0750130999','mmiha.toad@yahoo.com','RO27PORL2315173193181619',26,'2007-04-01','Expert financiar contabil',3500,150,'mihaita','mih1',0);
/*!40000 ALTER TABLE `utilizator` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_creare_asistent` AFTER INSERT ON `utilizator` FOR EACH ROW BEGIN
   IF(NEW.functie='Asistent medical') THEN
    INSERT INTO asistent(id_asistent,id_utilizator) VALUES (0,NEW.id_utilizator);
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `utilizatori_fara_rol_admin`
--

DROP TABLE IF EXISTS `utilizatori_fara_rol_admin`;
/*!50001 DROP VIEW IF EXISTS `utilizatori_fara_rol_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `utilizatori_fara_rol_admin` AS SELECT 
 1 AS `nume`,
 1 AS `prenume`,
 1 AS `CNP`,
 1 AS `adresa`,
 1 AS `nr_telefon`,
 1 AS `email`,
 1 AS `IBAN`,
 1 AS `nr_contract`,
 1 AS `data_angajarii`,
 1 AS `functie`,
 1 AS `salariu_negociat`,
 1 AS `nr_ore`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `utilizatori_inclus_rol_admin`
--

DROP TABLE IF EXISTS `utilizatori_inclus_rol_admin`;
/*!50001 DROP VIEW IF EXISTS `utilizatori_inclus_rol_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `utilizatori_inclus_rol_admin` AS SELECT 
 1 AS `id_utilizator`,
 1 AS `nume`,
 1 AS `prenume`,
 1 AS `CNP`,
 1 AS `adresa`,
 1 AS `nr_telefon`,
 1 AS `email`,
 1 AS `IBAN`,
 1 AS `nr_contract`,
 1 AS `data_angajarii`,
 1 AS `functie`,
 1 AS `salariu_negociat`,
 1 AS `nr_ore`,
 1 AS `user`,
 1 AS `parola`,
 1 AS `disponibil`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_concedii_luna_curenta`
--

DROP TABLE IF EXISTS `view_concedii_luna_curenta`;
/*!50001 DROP VIEW IF EXISTS `view_concedii_luna_curenta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_concedii_luna_curenta` AS SELECT 
 1 AS `id_concediu`,
 1 AS `data_incepere`,
 1 AS `data_incheiere`,
 1 AS `id_utilizator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_date_asistent`
--

DROP TABLE IF EXISTS `view_date_asistent`;
/*!50001 DROP VIEW IF EXISTS `view_date_asistent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_date_asistent` AS SELECT 
 1 AS `id_utilizator`,
 1 AS `nume`,
 1 AS `prenume`,
 1 AS `CNP`,
 1 AS `adresa`,
 1 AS `nr_telefon`,
 1 AS `email`,
 1 AS `IBAN`,
 1 AS `nr_contract`,
 1 AS `data_angajarii`,
 1 AS `functie`,
 1 AS `salariu_negociat`,
 1 AS `nr_ore`,
 1 AS `user`,
 1 AS `parola`,
 1 AS `disponibil`,
 1 AS `id_asistent`,
 1 AS `tipul`,
 1 AS `gradul`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_date_medic`
--

DROP TABLE IF EXISTS `view_date_medic`;
/*!50001 DROP VIEW IF EXISTS `view_date_medic`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_date_medic` AS SELECT 
 1 AS `id_utilizator`,
 1 AS `nume`,
 1 AS `prenume`,
 1 AS `CNP`,
 1 AS `adresa`,
 1 AS `nr_telefon`,
 1 AS `email`,
 1 AS `IBAN`,
 1 AS `nr_contract`,
 1 AS `data_angajarii`,
 1 AS `functie`,
 1 AS `salariu_negociat`,
 1 AS `nr_ore`,
 1 AS `user`,
 1 AS `parola`,
 1 AS `disponibil`,
 1 AS `id_medic`,
 1 AS `grad`,
 1 AS `cod_parafa`,
 1 AS `titlu_stiintific`,
 1 AS `post_didactic`,
 1 AS `procent_negociat`,
 1 AS `Medic disponibil`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_programari_ziua_curenta`
--

DROP TABLE IF EXISTS `view_programari_ziua_curenta`;
/*!50001 DROP VIEW IF EXISTS `view_programari_ziua_curenta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_programari_ziua_curenta` AS SELECT 
 1 AS `id_programare`,
 1 AS `ora`,
 1 AS `zi`,
 1 AS `nume_pacient`,
 1 AS `prenume_pacient`,
 1 AS `incheiata`,
 1 AS `id_unitate`,
 1 AS `id_medic`,
 1 AS `id_pacient`,
 1 AS `id_cabinet`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'proiect_policlinica'
--
/*!50003 DROP PROCEDURE IF EXISTS `adauga_concediu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adauga_concediu`(data_incepere date, data_incheiere date, id_utilizator int)
BEGIN
	INSERT INTO concediu VALUES (0,data_incepere, data_incheiere,id_utilizator);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adauga_programare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adauga_programare`(dataProgramarii Date, ora Time, nume_pacient varchar(45), prenume_pacient varchar(45),id_medic int)
BEGIN
	-- DECLARE id_pacient int;
    -- SELECT id_pacient FROM pacient WHERE nume=nume_pacient AND prenume=prenume_pacient INTO id_pacient;
    -- if(id_pacient IS NULL) THEN 
    INSERT INTO programare(id_programare,ora,zi,id_medic,nume_pacient,prenume_pacient) VALUES (0,ora,dataProgramarii,id_medic,nume_pacient,prenume_pacient);
    -- else
	-- INSERT INTO programare(id_programare,ora,zi,id_medic,id_pacient,nume_pacient,prenume_pacient) VALUES (0,ora,dataProgramarii,id_medic,id_pacient,nume_pacient,prenume_pacient);
    -- END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adauga_raport_medical` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adauga_raport_medical`(nume_pacient varchar(50), prenume_pacient varchar(50), nume_medic_realizator varchar(50), prenume_medic_realizator varchar(50),
data_consultatiei Date, simptome mediumtext, diagnostic mediumtext, recomandari mediumtext, investigatii mediumtext, id_medic int, id_asistent int)
BEGIN
	INSERT INTO raport_medical(id_raport, nume_pacient, prenume_pacient, nume_medic_realizator, prenume_medic_realizator, 
							   data_consultatiei, istoric, simptome, diagnostic, recomandari, investigatii, parafat, id_medic, id_asistent)
    VALUES (0,nume_pacient, prenume_pacient, nume_medic_realizator, prenume_medic_realizator, 
			data_consultatiei, 'Nu are', simptome, diagnostic, recomandari, investigatii, parafat, id_medic, id_asistent);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adauga_salariu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adauga_salariu`(nr_ore int, luna int, an int, id_utilizator int)
BEGIN
	INSERT INTO salariu(nr_ore,luna,an,id_utilizator) VALUES (nr_ore,luna,an,id_utilizator);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adauga_utilizator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adauga_utilizator`(nume varchar(45), prenume varchar(45), CNP varchar(13), adresa varchar(255), 
									  nr_telefon varchar(10), email varchar(255), IBAN varchar(45), nr_contract int, data_angajarii date, functie varchar(45),
									  salariu_negociat double, nr_ore int, user varchar(45), parola varchar(45))
BEGIN
	INSERT INTO utilizator VALUES(0, nume, prenume, CNP, adresa, nr_telefon, email, IBAN, nr_contract, data_angajarii, functie, salariu_negociat, nr_ore,user,parola,1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifica_raport_medical` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_raport_medical`(id_raport int,nume_pacient varchar(50), prenume_pacient varchar(50),simptome mediumtext, diagnostic mediumtext, recomandari mediumtext, investigatii mediumtext, id_asistent int)
BEGIN
	UPDATE raport_medical SET nume_pacient=nume_pacient, prenume_pacient=prenume_pacient,simptome=simptome,diagnostic=diagnostic,recomandari=recomandari,investigatii=investigatii,id_asistent=id_asistent WHERE id_raport=id_raport;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifica_utilizator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_utilizator`(id int, nume varchar(45), prenume varchar(45), CNP varchar(13), adresa varchar(255), 
									  nr_telefon varchar(10), email varchar(255), IBAN varchar(45), nr_contract int, data_angajarii date, functie varchar(45),
									  salariu_negociat double, nr_ore int)
BEGIN
	UPDATE utilizator SET nume=nume, prenume=prenume, CNP=CNP, adresa=adresa, nr_telefon=nr_telefon, 
						  email=email, IBAN=IBAN, nr_contract=nr_contract, data_angajarii=data_angajarii,
						  functie=functie, salariu_negociat=salariu_negociat, nr_ore=nr_ore
    WHERE id_utilizator=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `utilizatori_fara_rol_admin`
--

/*!50001 DROP VIEW IF EXISTS `utilizatori_fara_rol_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `utilizatori_fara_rol_admin` AS select `utilizator`.`nume` AS `nume`,`utilizator`.`prenume` AS `prenume`,`utilizator`.`CNP` AS `CNP`,`utilizator`.`adresa` AS `adresa`,`utilizator`.`nr_telefon` AS `nr_telefon`,`utilizator`.`email` AS `email`,`utilizator`.`IBAN` AS `IBAN`,`utilizator`.`nr_contract` AS `nr_contract`,`utilizator`.`data_angajarii` AS `data_angajarii`,`utilizator`.`functie` AS `functie`,`utilizator`.`salariu_negociat` AS `salariu_negociat`,`utilizator`.`nr_ore` AS `nr_ore` from `utilizator` where ((`utilizator`.`functie` <> 'Admin') and (`utilizator`.`functie` <> 'Super Admin')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `utilizatori_inclus_rol_admin`
--

/*!50001 DROP VIEW IF EXISTS `utilizatori_inclus_rol_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `utilizatori_inclus_rol_admin` AS select `utilizator`.`id_utilizator` AS `id_utilizator`,`utilizator`.`nume` AS `nume`,`utilizator`.`prenume` AS `prenume`,`utilizator`.`CNP` AS `CNP`,`utilizator`.`adresa` AS `adresa`,`utilizator`.`nr_telefon` AS `nr_telefon`,`utilizator`.`email` AS `email`,`utilizator`.`IBAN` AS `IBAN`,`utilizator`.`nr_contract` AS `nr_contract`,`utilizator`.`data_angajarii` AS `data_angajarii`,`utilizator`.`functie` AS `functie`,`utilizator`.`salariu_negociat` AS `salariu_negociat`,`utilizator`.`nr_ore` AS `nr_ore`,`utilizator`.`user` AS `user`,`utilizator`.`parola` AS `parola`,`utilizator`.`disponibil` AS `disponibil` from `utilizator` where (`utilizator`.`functie` <> 'Super Admin') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_concedii_luna_curenta`
--

/*!50001 DROP VIEW IF EXISTS `view_concedii_luna_curenta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_concedii_luna_curenta` AS select `concediu`.`id_concediu` AS `id_concediu`,`concediu`.`data_incepere` AS `data_incepere`,`concediu`.`data_incheiere` AS `data_incheiere`,`concediu`.`id_utilizator` AS `id_utilizator` from `concediu` where (month(`concediu`.`data_incheiere`) = month(curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_date_asistent`
--

/*!50001 DROP VIEW IF EXISTS `view_date_asistent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_date_asistent` AS select `u`.`id_utilizator` AS `id_utilizator`,`u`.`nume` AS `nume`,`u`.`prenume` AS `prenume`,`u`.`CNP` AS `CNP`,`u`.`adresa` AS `adresa`,`u`.`nr_telefon` AS `nr_telefon`,`u`.`email` AS `email`,`u`.`IBAN` AS `IBAN`,`u`.`nr_contract` AS `nr_contract`,`u`.`data_angajarii` AS `data_angajarii`,`u`.`functie` AS `functie`,`u`.`salariu_negociat` AS `salariu_negociat`,`u`.`nr_ore` AS `nr_ore`,`u`.`user` AS `user`,`u`.`parola` AS `parola`,`u`.`disponibil` AS `disponibil`,`a`.`id_asistent` AS `id_asistent`,`a`.`tipul` AS `tipul`,`a`.`gradul` AS `gradul` from (`utilizator` `u` join `asistent` `a` on((`a`.`id_utilizator` = `u`.`id_utilizator`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_date_medic`
--

/*!50001 DROP VIEW IF EXISTS `view_date_medic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_date_medic` AS select `u`.`id_utilizator` AS `id_utilizator`,`u`.`nume` AS `nume`,`u`.`prenume` AS `prenume`,`u`.`CNP` AS `CNP`,`u`.`adresa` AS `adresa`,`u`.`nr_telefon` AS `nr_telefon`,`u`.`email` AS `email`,`u`.`IBAN` AS `IBAN`,`u`.`nr_contract` AS `nr_contract`,`u`.`data_angajarii` AS `data_angajarii`,`u`.`functie` AS `functie`,`u`.`salariu_negociat` AS `salariu_negociat`,`u`.`nr_ore` AS `nr_ore`,`u`.`user` AS `user`,`u`.`parola` AS `parola`,`u`.`disponibil` AS `disponibil`,`m`.`id_medic` AS `id_medic`,`m`.`grad` AS `grad`,`m`.`cod_parafa` AS `cod_parafa`,`m`.`titlu_stiintific` AS `titlu_stiintific`,`m`.`post_didactic` AS `post_didactic`,`m`.`procent_negociat` AS `procent_negociat`,`m`.`disponibil` AS `Medic disponibil` from (`utilizator` `u` join `medic` `m` on((`u`.`id_utilizator` = `m`.`id_utilizator`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_programari_ziua_curenta`
--

/*!50001 DROP VIEW IF EXISTS `view_programari_ziua_curenta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_programari_ziua_curenta` AS select `programare`.`id_programare` AS `id_programare`,`programare`.`ora` AS `ora`,`programare`.`zi` AS `zi`,`programare`.`nume_pacient` AS `nume_pacient`,`programare`.`prenume_pacient` AS `prenume_pacient`,`programare`.`incheiata` AS `incheiata`,`programare`.`id_unitate` AS `id_unitate`,`programare`.`id_medic` AS `id_medic`,`programare`.`id_pacient` AS `id_pacient`,`programare`.`id_cabinet` AS `id_cabinet` from `programare` where (`programare`.`zi` = curdate()) */;
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

-- Dump completed on 2023-01-13  9:29:43
