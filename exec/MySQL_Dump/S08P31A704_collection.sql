-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: k8a704.p.ssafy.io    Database: S08P31A704
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `collection_key` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `flower_flower_key` int DEFAULT NULL,
  `user_user_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`collection_key`),
  KEY `FKpo03ulfcopo45bntknoxi6gq5` (`flower_flower_key`),
  KEY `FK9fhf166gkyytelrjfq7qijqmg` (`user_user_key`),
  CONSTRAINT `FK9fhf166gkyytelrjfq7qijqmg` FOREIGN KEY (`user_user_key`) REFERENCES `user` (`user_key`),
  CONSTRAINT `FKpo03ulfcopo45bntknoxi6gq5` FOREIGN KEY (`flower_flower_key`) REFERENCES `flower` (`flower_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'2023-05-16 18:13:09.484239','2023-05-16 18:13:09.484239',1,'mpsT6vtwWtsJgzn'),(5,'2023-05-17 14:34:08.884722','2023-05-17 14:34:08.884722',1,'kFjy9WBXcxQMFpf'),(6,'2023-05-18 15:21:13.423321','2023-05-18 15:21:13.423321',1,'kFjy9WBXcxQMFpf'),(7,'2023-05-18 16:08:06.268904','2023-05-18 16:08:06.268904',1,'kFjy9WBXcxQMFpf'),(8,'2023-05-18 16:08:59.666068','2023-05-18 16:08:59.666068',1,'kFjy9WBXcxQMFpf'),(9,'2023-05-18 16:09:27.665204','2023-05-18 16:09:27.665204',1,'kFjy9WBXcxQMFpf'),(10,'2023-05-18 16:32:17.680911','2023-05-18 16:32:17.680911',1,'kFjy9WBXcxQMFpf'),(11,'2023-05-18 08:39:06.000000','2023-05-18 08:39:06.000000',1,'dewd63oFfd4r5UN'),(12,'2023-05-18 08:39:06.000000','2023-05-18 08:39:06.000000',4,'dewd63oFfd4r5UN'),(13,'2023-05-18 08:39:06.000000','2023-05-18 08:39:06.000000',7,'dewd63oFfd4r5UN');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 11:34:32
