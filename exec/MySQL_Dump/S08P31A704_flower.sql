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
-- Table structure for table `flower`
--

DROP TABLE IF EXISTS `flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flower` (
  `flower_key` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `connect` bit(1) NOT NULL,
  `drink` bit(1) NOT NULL,
  `drink_value` int NOT NULL,
  `friend` bit(1) NOT NULL,
  `friend_value` int NOT NULL,
  `get_condition` varchar(255) DEFAULT NULL,
  `max_exp` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `story` varchar(255) DEFAULT NULL,
  `streak` bit(1) NOT NULL,
  `streak_value` int NOT NULL,
  PRIMARY KEY (`flower_key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flower`
--

LOCK TABLES `flower` WRITE;
/*!40000 ALTER TABLE `flower` DISABLE KEYS */;
INSERT INTO `flower` VALUES (1,'2023-05-02 10:41:29.558859','2023-05-02 10:41:29.558859',_binary '\0',_binary '\0',0,_binary '\0',0,'기본획득',700,'행운의 레몬트리','생각이 많을 땐 레몬사탕이지!',_binary '\0',0),(2,'2023-05-02 10:42:16.316722','2023-05-02 10:42:16.316722',_binary '\0',_binary '\0',0,_binary '\0',0,'목표달성 연속 1일',700,'들쭉날쭉 블루베리','무봤나 블루베↗리↘ 스↘무↗디↘\\n북한에서는 블루베리를 들쭉이라고 부른대요.',_binary '',1),(3,'2023-05-02 10:46:03.037488','2023-05-02 10:46:03.037488',_binary '\0',_binary '\0',0,_binary '\0',0,'목표달성 연속 3일',700,'조금 낯선 서양 배','배 째.',_binary '',3),(4,'2023-05-02 10:46:57.924385','2023-05-02 10:46:57.924385',_binary '',_binary '\0',0,_binary '\0',0,'컵받침 연동',700,'아삭한 사과나무','원숭이 엉덩이는 빠~알개\\n빨가면 사과 사과는 맛있어!!',_binary '\0',0),(5,'2023-05-02 10:47:41.039065','2023-05-02 10:47:41.039065',_binary '\0',_binary '',3000,_binary '',3,'누적음수량 3리터',700,'정신 못 채린 체리','힘든 오후지만 정신 체리!',_binary '\0',0),(6,'2023-05-02 10:48:17.099862','2023-05-02 10:48:17.099862',_binary '\0',_binary '',8000,_binary '\0',0,'누적음수량 8리터',700,'나의 상큼 오렌지나무','오렌지를 먹은 지 얼마나 오랜지...',_binary '\0',0),(7,'2023-05-02 10:49:08.432834','2023-05-02 10:49:08.432834',_binary '\0',_binary '\0',0,_binary '',1,'친구 등록 1명',700,'복셩복셩 복숭아','물복도 딱복도 모두모두 맛있어~',_binary '\0',0),(8,'2023-05-02 10:49:34.953446','2023-05-02 10:49:34.953446',_binary '\0',_binary '\0',0,_binary '',10,'친구 등록 10명',700,'행복한 해바라기','햇빛은 따뜻해~',_binary '\0',0);
/*!40000 ALTER TABLE `flower` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 11:34:31
