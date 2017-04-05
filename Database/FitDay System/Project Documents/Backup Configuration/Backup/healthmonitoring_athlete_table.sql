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
-- Table structure for table `athlete_table`
--

DROP TABLE IF EXISTS `athlete_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete_table` (
  `AthleteID` int(11) NOT NULL,
  `AthleteHeight` smallint(6) NOT NULL COMMENT 'In centimeters',
  `AthleteWeight` double(3,2) NOT NULL COMMENT 'InPounds',
  `AthleteBMI` double(3,2) DEFAULT NULL,
  `AthleteSignCaptureDate` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`AthleteID`,`UserID`,`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete_table`
--

LOCK TABLES `athlete_table` WRITE;
/*!40000 ALTER TABLE `athlete_table` DISABLE KEYS */;
INSERT INTO `athlete_table` VALUES (1,181,9.99,1.37,'2015-12-01',12,1),(2,189,9.99,1.26,'2015-12-01',7,1),(3,194,9.99,1.19,'2015-12-01',8,1),(4,178,9.99,1.42,'2015-12-01',4,1),(5,174,9.99,1.48,'2015-11-28',15,1),(6,186,9.99,1.30,'2015-12-01',11,1),(7,182,9.99,1.36,'2015-11-09',18,1),(8,188,9.99,1.27,'2015-10-10',2,1),(9,185,9.99,1.31,'2015-12-02',16,1),(10,176,9.99,1.45,'2015-12-02',3,1),(11,180,9.99,1.39,'2015-12-02',13,1);
/*!40000 ALTER TABLE `athlete_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-07 20:03:30
