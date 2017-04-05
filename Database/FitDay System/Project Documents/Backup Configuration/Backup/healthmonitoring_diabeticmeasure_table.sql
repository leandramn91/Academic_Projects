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
-- Table structure for table `diabeticmeasure_table`
--

DROP TABLE IF EXISTS `diabeticmeasure_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diabeticmeasure_table` (
  `DiabeticMeasureFSGLevel` double DEFAULT NULL,
  `DiabeticMeasureFPGLevel` double DEFAULT NULL,
  `DiabeticMeasuresDate` date DEFAULT NULL,
  `PatientID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diabeticmeasure_table`
--

LOCK TABLES `diabeticmeasure_table` WRITE;
/*!40000 ALTER TABLE `diabeticmeasure_table` DISABLE KEYS */;
INSERT INTO `diabeticmeasure_table` VALUES (10.55,160.3,'0000-00-00',1,19,2,1,101),(10.9,174.38,'0000-00-00',2,13,2,2,102),(6.8,101.33,'0000-00-00',3,14,2,3,103),(9.81,190.22,'0000-00-00',4,4,2,4,104),(10.34,140.1,'0000-00-00',5,8,2,5,105),(10.64,173.44,'0000-00-00',6,12,2,6,106),(10.49,160.84,'0000-00-00',7,5,2,7,107),(5.01,85.15,'0000-00-00',8,6,2,8,108),(10.55,170.32,'0000-00-00',9,17,2,9,109),(10.5,200.01,'0000-00-00',10,9,2,10,110);
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

-- Dump completed on 2015-12-07 20:03:42
