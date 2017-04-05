-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: healthmonitoring
-- ------------------------------------------------------
-- Server version	5.5.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_table`
--

DROP TABLE IF EXISTS `activity_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_table` (
  `ActivityDistance` double DEFAULT NULL COMMENT 'Distance in miles',
  `ActivityTimeInterval` smallint(6) DEFAULT NULL,
  `ActivityCaloriesBurnt` int(11) DEFAULT NULL,
  `ActivityDate` date DEFAULT NULL,
  `ActivityMaxHeartRate` smallint(6) DEFAULT NULL,
  `AthleteID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ActivityID` smallint(6) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`,`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_table`
--

LOCK TABLES `activity_table` WRITE;
/*!40000 ALTER TABLE `activity_table` DISABLE KEYS */;
INSERT INTO `activity_table` VALUES (2,5,0,'2015-12-03',140,1,12,3,1),(1.8,7,0,'2015-12-01',130,1,12,5,1),(0.5,12,0,'2015-04-20',120,2,7,1,1),(10,10,0,'2015-10-16',140,2,7,2,1),(0,9,0,'2015-11-08',165,2,7,4,1),(5,15,0,'2015-12-01',146,3,8,2,1),(0,18,0,'2015-10-28',125,4,4,4,1),(2.4,20,0,'2015-11-28',147,5,15,3,1),(0.2,18,0,'2015-11-20',123,6,11,1,1),(11,31,0,'2015-11-30',147,6,11,2,1),(1.4,36,0,'2015-11-29',178,6,11,3,1),(21,10,0,'2015-11-30',166,7,18,2,1),(0,42,0,'2015-11-11',180,7,18,4,1),(0,14,0,'2015-11-30',155,8,2,4,1),(1.3,12,0,'2015-11-30',148,8,2,5,1),(1.1,19,0,'2015-12-01',123,9,16,3,1),(0.8,30,0,'2015-12-02',120,10,3,1,1),(6,24,0,'2015-12-02',168,10,3,2,1),(0,26,0,'2015-12-02',181,10,3,4,1),(4,34,0,'2015-11-30',145,11,13,5,1);
/*!40000 ALTER TABLE `activity_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-05  1:25:14
