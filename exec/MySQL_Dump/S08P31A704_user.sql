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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_key` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `friend_code` varchar(255) DEFAULT NULL,
  `goal` int NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `refresh_key` varchar(255) DEFAULT NULL,
  `social_key` varchar(255) DEFAULT NULL,
  `social_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('8h7WKwavB2NfnaM','2023-05-17 16:06:56.196431','2023-05-17 16:06:56.390044','bBNxZC8JKB',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','강아지한테 쫓기는 한국다람쥐','$2a$10$FA3kWrmbGNBO4MMIjt4bpuMGa5JFyBBqWwJwWPli9GaGhFH/y7KU6','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4aDdXS3dhdkIyTmZuYU0iLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTUxNjgxNn0.K0vG-wjCcqvH5_VQa_WrP_QDp-GqB84_oF7HeEQGRS_XtJju0284As97TbXz4LKR_QIV8QDd0YhObgSLe_T1PQ','11111',1),('c47NUclnbt17enI','2023-05-14 19:30:24.728604','2023-05-14 19:30:27.442624','DGoiNsjidu',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','배부른 귀신','$2a$10$NNzMe7kv965HLoqLYQ72xuiYe9gG5HddtrGnkNwFof9O7LH.m3uWO','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjNDdOVWNsbmJ0MTdlbkkiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTI2OTgyN30.xYLLkld8r_O_20RRb7kMCSOx3O4g0qD1pCS694YqJeJn55j7G4wcTTBDY8V-Iq1SwzK6iBTVza_5lgx3E7LNJg','test',1),('cFdOUGT8GQLgVre','2023-05-16 14:24:35.539497','2023-05-17 10:15:59.951602','FtATF02NJs',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','줄넘기하는 혁명가','$2a$10$apN6Pej3YXryFm0JNx3yFeuP3umVrykQlGXgjO1aNb8xpjYYekwwW','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjRmRPVUdUOEdRTGdWcmUiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTQ5NTc1OX0.qLG9YuyZhP3e-QByW6sZklIwzm_66qnJUDqkYMcZyPbvSqshi0ZpyTzEET8mM5UzfzD7o3d7Nadz4fdUnvzUwg','110873620074345688162',1),('dewd63oFfd4r5UN','2023-05-17 15:55:51.078361','2023-05-19 11:24:54.867775','DBYk8PgVBQ',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','벌과 마스크팩','$2a$10$54VwT6ZooSLeeLoroU6bbuEX1SX8Uawh7qVf2dxQKRbffo7MtRy9K','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkZXdkNjNvRmZkNHI1VU4iLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTYyMDg1OX0.NGrtaqry4cIuWr9py9M8z5kC8HSTAImX5npiZP7VwdHEzOhMqtsPlmk3fyJT_ywcWRvC73ROuf5rYfjRgREWzQ','113302759893354642587',1),('erMEpur5ahnMnSy','2023-05-17 14:27:55.995227','2023-05-17 14:29:05.574311','yw6ij7vkkz',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','마스크 찾고 있는 티모','$2a$10$nuj4oqviRF6.Htj/x/.oruEzSCt3FbM60jknrmgK7h317SlbRqn42','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlck1FcHVyNWFobk1uU3kiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTUxMDk0NX0.5pCh6ru3YNQils17g1EyA7oEKmdRF9rUSAH-T584BAmFt38L1yBvuwUClB6bc-Aze3Duk9VejQsg-2O-oUC8Sw','112837917968842468490',1),('grz9QJwBwUrrsBN','2023-05-18 21:55:21.332024','2023-05-18 21:55:22.289017','E1pt9zLGzu',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','대통령을 꿈꾸는 옷장','$2a$10$UqyHrcz6/q92NqAdDFLQVenTHbFc1Mj6WNRTToNhYxEC0TUgVsOfS','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJncno5UUp3QndVcnJzQk4iLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTYyNDEyMn0.-R0pdFf32Q3ctlOboC5N9tv1xw8gufsdLV4NUhfAXMSI8e8PWzM6M75JRwHkO1-QFO6J-UPnsoPDg3OQfJCCDg','1111111111111111',1),('kFjy9WBXcxQMFpf','2023-05-12 20:47:47.090877','2023-05-18 17:35:14.907307','8iar8bNdoK',3000,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','주먹이 무서운 영국사람',NULL,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJrRmp5OVdCWGN4UU1GcGYiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTYwNzcwNn0.HCh_eay9QBBr2dH9-Zu212Rz0hl3H5vVzzm2nqrwVACDgKvnLg-dOl_r1MI0yBOb_KcxFlZ83TCAwujVj-N8dg','106142240193707696859',1),('mpsT6vtwWtsJgzn','2023-05-16 15:01:37.202336','2023-05-19 09:50:24.849073','cX939y5FcQ',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','UFO를 타고 있는 충전기','$2a$10$iqyLuoWsDxMQMWFIZP.yte72bPm7tD6wErECI94ZybiOZR5BC3YdC','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtcHNUNnZ0d1d0c0pnem4iLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTY2NzAyNH0._NMGBjfS8Fkg1XsPz7CAi5d4vaLgbo1nMk5yhmqGLYrQy2jjNv0HvbUDFtP4HSYUN2_2J-hrAoW6MGrDS7gP2Q','115442385199677577306',1),('PNVS2Z17RyxQqlY','2023-05-15 10:47:07.740362','2023-05-18 22:05:38.692362','Qsxlar9vOg',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','한겨울의 노란 해바라기',NULL,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJQTlZTMloxN1J5eFFxbFkiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTYyMzU1Nn0.QvAXK4v8lJOTfK0aOl-fQvhEbgcDoZE1mxZBzvNzbotYPDCOxjnxYci3zc88yoAW8PNaLlrTid0SokqHihGLBw','118228268643022307361',1),('s7YwNbxos0vHETq','2023-05-12 15:44:00.724124','2023-05-12 15:44:00.954892','0BXFxp6dKW',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','길에 서있는 말썽꾸러기','$2a$10$OpjOhgWTUDN9qYZoJbC.iehZ9Jj5E96cdWYxxa.cg.jnXXEylTIp6','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzN1l3TmJ4b3MwdkhFVHEiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTA4MzQ0MH0.B7HFCOKKMpdys8o-BcQ0hpB3N8tBfxne4IsnFprMzHEVr-qkqRCXJQTEys2ANdZ5DpeZXT2X80FvfBh6JPBDOw','dongmin',1),('sba9BgVxUcexX5N','2023-05-19 10:25:25.733663','2023-05-19 10:25:25.931336','IebreuJ7ZK',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','혼란스러운 이모티콘','$2a$10$QF7H01hR7wW5fnUdrHinZeQlttlq3mK1Q/CyEUmHcm0vacq3Ixc.S','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYmE5QmdWeFVjZXhYNU4iLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTY2OTEyNX0.o5JYEgpOEdFdHq7D9Qxj4h9wn296ykV2CjbKneUv-09-BHqjglhacbwUHJRbE-2c52V48HGZ7p8S6uGEKNcdzg','111111111111111',1),('sfRW6XdBSbpVPzQ','2023-05-12 15:45:06.584526','2023-05-12 15:45:06.808024','4spFd42Kor',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','달콤한 종이컵','$2a$10$.7TG/gszCqBi0KWfybf1iOQVtdqoMPBWTnBjTQPrVw4ajfe75Q.tW','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzZlJXNlhkQlNicFZQelEiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTA4MzUwNn0.QGA1ljnKrrorq2397jLQPFm0LvmdYDZW0pyiVHFWOkWgTc826Y6viRr_5BBNNFnelVLIP6uP2Bl33ZC1eM5_4Q','jeongyoon',1),('tn5LNTQPAkDaqi4','2023-05-17 15:37:06.154534','2023-05-17 15:37:06.342383','hhdKBT1DF4',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','지건 마려운 단체약속','$2a$10$Ov4ZIugs1KIZO3GeMN3Xt.59rNUqoBnGvV4njcSdG5g91kunfzT6.','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0bjVMTlRRUEFrRGFxaTQiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTUxNTAyNn0.xcHiUQREdJMmcZ8O3dYCFJbt6S9GYjtPl75P4xtktTupdJhNHGopyVs_p62pvKgvEjR_X9cBnwbJp1eIR86Keg','104974369429058917261',1),('WBU8i7WjxjERNle','2023-05-12 15:42:45.647227','2023-05-12 15:42:46.616197','WPt1qkpFvx',1500,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','밤샘하는 아기상어','$2a$10$1UNz4ukyWO62vN.qagIHt.ZpO9DdL7msk148ZDmNMCMsQ58BDmhIS','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJXQlU4aTdXanhqRVJObGUiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTA4MzM2Nn0.S4GI07A-91g1SQ2eNan4aqYteNi2tnnaR5DEbNeCBZGLTeKu39DTztB132CSg_6z5C8DpA5hWBBdQH2qq1J8pA','soyoung',1),('XqCDEWC69vJQ5Md','2023-05-18 22:19:11.364904','2023-05-19 09:54:27.267449','XeA6oFM1Vy',5000,'https://your-habitat.s3.ap-northeast-2.amazonaws.com/static/default.png','아이스크림 베개',NULL,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJYcUNERVdDNjl2SlE1TWQiLCJoYWJpdGF0IjoiVVNFUiIsImV4cCI6MTY4NTYyNjI2NX0.y2BnLpnFY6FFzfFDgaezrTfwPX3Q-5JVhA_PBX8-5seq5Wck048MVAv0QhN-_1j0_n5Mxd-r7Be3x9MCphiGhQ','105690919750908873768',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 11:34:34
