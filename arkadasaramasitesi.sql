-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: arkadasaramasitesidb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `groupmember`
--

DROP TABLE IF EXISTS `groupmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupmember` (
  `groupID` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `joinDate` datetime NOT NULL,
  `leftDate` datetime DEFAULT NULL,
  PRIMARY KEY (`groupID`),
  KEY `groupmember_userId` (`userId`),
  CONSTRAINT `groupmember_userId` FOREIGN KEY (`userId`) REFERENCES `member` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupmember`
--

LOCK TABLES `groupmember` WRITE;
/*!40000 ALTER TABLE `groupmember` DISABLE KEYS */;
INSERT INTO `groupmember` VALUES (1,1,'2022-05-15 14:38:50',NULL);
/*!40000 ALTER TABLE `groupmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registerDate` datetime NOT NULL,
  `password_` varchar(8) NOT NULL,
  `birthDate` date NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `privelege` char(1) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Engin','kisinengin@gmail.com','2022-05-15 14:21:08','123456','2000-06-12','E','2'),(2,'Hengover','hengover31@gmail.com','2022-05-15 15:02:40','Hengover','2007-07-19',NULL,'0'),(3,'Nur&#351;enAcet','nursenacet@gmail.com','2022-05-15 16:44:55','mysql123','2000-06-15',NULL,'0'),(4,'Esma','esma89@gmail.com','2022-05-16 02:27:51','Esma1234','1999-03-10',NULL,'0'),(5,'Kadir','kadir31@gmail.com','2022-05-16 15:16:43','Kadir','1999-09-08',NULL,'0'),(6,'DenizK1','deniz@gmail.com','2022-05-17 00:03:12','123456','2001-09-09',NULL,'0');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `userId` int NOT NULL,
  `sender` varchar(20) NOT NULL,
  `groupId` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  KEY `message_groupId` (`groupId`),
  KEY `message_userId` (`userId`),
  CONSTRAINT `message_groupId` FOREIGN KEY (`groupId`) REFERENCES `groupmember` (`groupID`),
  CONSTRAINT `message_userId` FOREIGN KEY (`userId`) REFERENCES `member` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationslist`
--

DROP TABLE IF EXISTS `relationslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationslist` (
  `userId` int NOT NULL,
  `userIdRelation` int DEFAULT NULL,
  `relationType` enum('Friend','dear','flirt') DEFAULT NULL,
  KEY `relationslist_userId` (`userId`),
  KEY `relationslist_userIdRelation` (`userIdRelation`),
  CONSTRAINT `relationslist_userId` FOREIGN KEY (`userId`) REFERENCES `member` (`userID`),
  CONSTRAINT `relationslist_userIdRelation` FOREIGN KEY (`userIdRelation`) REFERENCES `member` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationslist`
--

LOCK TABLES `relationslist` WRITE;
/*!40000 ALTER TABLE `relationslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationslist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 14:58:19
