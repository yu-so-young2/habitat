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
-- Table structure for table `user_coaster`
--

DROP TABLE IF EXISTS `user_coaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coaster` (
  `user_coaster_key` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `coaster_coaster_key` varchar(255) DEFAULT NULL,
  `user_user_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_coaster_key`),
  KEY `FKt4q7otodbbaftp22earic1jtu` (`coaster_coaster_key`),
  KEY `FKiaqpioal8gij5pc04h5crv3ua` (`user_user_key`),
  CONSTRAINT `FKiaqpioal8gij5pc04h5crv3ua` FOREIGN KEY (`user_user_key`) REFERENCES `user` (`user_key`),
  CONSTRAINT `FKt4q7otodbbaftp22earic1jtu` FOREIGN KEY (`coaster_coaster_key`) REFERENCES `coaster` (`coaster_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coaster`
--

LOCK TABLES `user_coaster` WRITE;
/*!40000 ALTER TABLE `user_coaster` DISABLE KEYS */;
INSERT INTO `user_coaster` VALUES (1,'2023-05-18 08:27:32.000000','2023-05-18 08:27:32.000000','coaster','dewd63oFfd4r5UN');
/*!40000 ALTER TABLE `user_coaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 11:34:35
