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
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `friend_request_key` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `from_user_key` varchar(255) DEFAULT NULL,
  `to_user_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`friend_request_key`),
  KEY `FKtr1whdsdutghpgrqyj341wbsx` (`from_user_key`),
  KEY `FK58n961nweo13qtfryu4cy9e6c` (`to_user_key`),
  KEY `idx_friend_request_status` (`status`),
  CONSTRAINT `FK58n961nweo13qtfryu4cy9e6c` FOREIGN KEY (`to_user_key`) REFERENCES `user` (`user_key`),
  CONSTRAINT `FKtr1whdsdutghpgrqyj341wbsx` FOREIGN KEY (`from_user_key`) REFERENCES `user` (`user_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES (1,'2023-05-17 10:11:01.067180','2023-05-17 10:11:01.067180',0,'kFjy9WBXcxQMFpf','c47NUclnbt17enI'),(2,'2023-05-17 10:17:12.369007','2023-05-17 10:17:12.369007',0,'s7YwNbxos0vHETq','WBU8i7WjxjERNle'),(3,'2023-05-17 10:30:58.882614','2023-05-17 10:41:54.611236',1,'s7YwNbxos0vHETq','PNVS2Z17RyxQqlY'),(4,'2023-05-17 20:11:37.747004','2023-05-17 20:11:37.747004',0,'WBU8i7WjxjERNle','PNVS2Z17RyxQqlY'),(5,'2023-05-17 22:14:19.439620','2023-05-17 22:14:19.439620',0,'sfRW6XdBSbpVPzQ','PNVS2Z17RyxQqlY'),(6,'2023-05-17 22:14:38.682695','2023-05-18 21:47:42.624118',2,'kFjy9WBXcxQMFpf','PNVS2Z17RyxQqlY'),(7,'2023-05-17 22:14:52.564087','2023-05-18 11:12:37.849218',1,'8h7WKwavB2NfnaM','PNVS2Z17RyxQqlY'),(9,'2023-05-18 08:07:52.000000','2023-05-18 08:07:52.000000',0,'dewd63oFfd4r5UN','8h7WKwavB2NfnaM'),(10,'2023-05-19 09:23:34.775958','2023-05-19 09:23:34.775958',0,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(11,'2023-05-19 09:23:48.025167','2023-05-19 09:26:14.336960',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(12,'2023-05-19 09:23:48.511112','2023-05-19 09:26:15.089328',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(13,'2023-05-19 09:23:48.860658','2023-05-19 09:26:15.654272',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(14,'2023-05-19 09:23:49.164194','2023-05-19 09:26:16.099554',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(15,'2023-05-19 09:24:05.942791','2023-05-19 09:26:16.519453',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(16,'2023-05-19 09:24:06.390421','2023-05-19 09:26:16.959708',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(17,'2023-05-19 09:24:18.097527','2023-05-19 09:26:17.379117',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(18,'2023-05-19 09:24:19.035033','2023-05-19 09:26:17.838929',2,'XqCDEWC69vJQ5Md','dewd63oFfd4r5UN'),(19,'2023-05-19 09:39:44.772786','2023-05-19 09:39:44.772786',0,'XqCDEWC69vJQ5Md','PNVS2Z17RyxQqlY');
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
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
