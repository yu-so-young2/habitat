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
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `friend_key` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `friend_id_user_key` varchar(255) DEFAULT NULL,
  `my_id_user_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`friend_key`),
  KEY `FK4fwhevf8x756mxlls23arflkx` (`friend_id_user_key`),
  KEY `FK1q4h7mix8cdtck7ea8729csl` (`my_id_user_key`),
  CONSTRAINT `FK1q4h7mix8cdtck7ea8729csl` FOREIGN KEY (`my_id_user_key`) REFERENCES `user` (`user_key`),
  CONSTRAINT `FK4fwhevf8x756mxlls23arflkx` FOREIGN KEY (`friend_id_user_key`) REFERENCES `user` (`user_key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,'2023-05-17 10:41:54.772027','2023-05-17 10:41:54.772027','PNVS2Z17RyxQqlY','s7YwNbxos0vHETq'),(2,'2023-05-17 10:41:54.828289','2023-05-17 10:41:54.828289','s7YwNbxos0vHETq','PNVS2Z17RyxQqlY'),(7,'2023-05-18 11:12:37.891100','2023-05-18 11:12:37.891100','PNVS2Z17RyxQqlY','8h7WKwavB2NfnaM'),(8,'2023-05-18 11:12:37.916006','2023-05-18 11:12:37.916006','8h7WKwavB2NfnaM','PNVS2Z17RyxQqlY');
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 11:34:29
