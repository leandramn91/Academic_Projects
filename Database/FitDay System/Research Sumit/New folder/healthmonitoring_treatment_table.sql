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
-- Table structure for table `treatment_table`
--

DROP TABLE IF EXISTS `treatment_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment_table` (
  `TreatmentID` int(11) NOT NULL,
  `TreatmentDuration` int(11) DEFAULT NULL,
  `TreatmentDescription` varchar(200) DEFAULT NULL,
  `DoctorID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  PRIMARY KEY (`TreatmentID`,`DoctorID`,`PatientID`,`UserID`,`DeviceID`,`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_table`
--

LOCK TABLES `treatment_table` WRITE;
/*!40000 ALTER TABLE `treatment_table` DISABLE KEYS */;
INSERT INTO `treatment_table` VALUES (2001,3,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',1,1,19,2,101),(2002,5,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',2,2,13,2,102),(2003,8,'Low Sugar levels. Pramlintide (Symlin) is continued',3,3,14,2,103),(2004,1,'Cholesterol lowering drugs are prescribed by Doctor danziman. Case of HyperGlycemia',4,4,4,2,104),(2005,3,'Hypoglycemia. Physical activity is suggested.',5,5,8,2,105),(2006,2,'Continuous monitoring has shown good signs and same medications are continued.',6,6,12,2,106),(2007,1,'Hypoglycemia. Physical activity is suggested.',7,7,5,2,107),(2008,4,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',8,8,6,2,108),(2009,6,'Low Sugar levels. Pramlintide (Symlin) is continued',9,9,17,2,109),(2010,6,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',10,10,9,2,110);
/*!40000 ALTER TABLE `treatment_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 17:00:33
