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
-- Table structure for table `remedy_table`
--

DROP TABLE IF EXISTS `remedy_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remedy_table` (
  `AthleteID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ActivityID` smallint(6) NOT NULL,
  `RemedyID` smallint(6) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`,`RemedyID`,`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remedy_table`
--

LOCK TABLES `remedy_table` WRITE;
/*!40000 ALTER TABLE `remedy_table` DISABLE KEYS */;
INSERT INTO `remedy_table` VALUES (1,12,3,1,1),(1,12,5,2,1),(2,7,1,2,1),(2,7,2,1,1),(2,7,4,3,1),(3,8,2,3,1),(4,4,4,1,1),(5,15,3,2,1),(6,11,1,3,1),(6,11,2,1,1),(6,11,3,2,1),(7,18,2,1,1),(7,18,4,3,1),(8,2,4,3,1),(8,2,5,2,1),(9,16,3,1,1),(10,3,1,1,1),(10,3,2,2,1),(10,3,4,3,1),(11,13,5,2,1);
/*!40000 ALTER TABLE `remedy_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-05  1:25:09
