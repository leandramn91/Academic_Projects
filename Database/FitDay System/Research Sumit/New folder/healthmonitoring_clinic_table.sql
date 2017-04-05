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
-- Table structure for table `clinic_table`
--

DROP TABLE IF EXISTS `clinic_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_table` (
  `ClinicID` int(11) NOT NULL,
  `ClinicName` char(30) DEFAULT NULL,
  `ClinicAddress` varchar(50) DEFAULT NULL,
  `ClinicCity` char(20) DEFAULT NULL,
  `ClinicZipCode` char(20) DEFAULT NULL,
  PRIMARY KEY (`ClinicID`),
  UNIQUE KEY `ClinicID` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_table`
--

LOCK TABLES `clinic_table` WRITE;
/*!40000 ALTER TABLE `clinic_table` DISABLE KEYS */;
INSERT INTO `clinic_table` VALUES (101,'Joslin Diabetes Center','1 Joslin Place','Boston','2215'),(102,'Mass General Hospital','50 Staniford Street #340','Boston','2114'),(103,'Boston Medical Center',' 840 Harrison Avenue','Boston','2118'),(104,'Women\'s Health Services','111 Harvard Street','Brookline','2446'),(105,'The Doc Is In','581 Boylston Street #800','Boston','2116'),(106,'Mount Auburn Hospital','330 Mount Auburn Street','Cambridge','2138'),(107,'Dr. Boris I. Orkin','1180 Beacon Street #5B','Brookline','2446'),(108,'Whittier Street Health Center','1290 Tremont Street','Boston','2120'),(109,'Total Wellness Clinic','697 Cambridge Street','Brighton','2135'),(110,'Sharewood Project','184 Pleasant Street','Malden','2148');
/*!40000 ALTER TABLE `clinic_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 17:00:35
