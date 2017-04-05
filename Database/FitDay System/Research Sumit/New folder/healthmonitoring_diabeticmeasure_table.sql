-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: healthmonitoring
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `diabeticmeasure_table`
--

DROP TABLE IF EXISTS `diabeticmeasure_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diabeticmeasure_table` (
  `DiabeticMeasureFSGLevel` double DEFAULT NULL,
  `DiabeticMeasureFPGLevel` double DEFAULT NULL,
  `DiabeticMeasuresDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `PatientID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diabeticmeasure_table`
--

LOCK TABLES `diabeticmeasure_table` WRITE;
/*!40000 ALTER TABLE `diabeticmeasure_table` DISABLE KEYS */;
INSERT INTO `diabeticmeasure_table` VALUES (0,0,'2015-03-12 00:00:00',1,19,2),(0,0,'2015-01-12 00:00:00',2,13,2),(0,0,'2015-08-11 00:00:00',3,14,2),(0,0,'2015-10-16 00:00:00',4,4,2),(0,0,'2015-04-20 00:00:00',5,8,2),(0,0,'2015-01-12 00:00:00',6,12,2),(0,0,'2015-10-28 00:00:00',7,5,2),(0,0,'2015-11-28 00:00:00',8,6,2),(0,0,'2015-11-20 00:00:00',9,17,2),(0,0,'2015-11-30 00:00:00',10,9,2),(0,0,'2015-11-29 00:00:00',11,10,2);
/*!40000 ALTER TABLE `diabeticmeasure_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 17:00:36
