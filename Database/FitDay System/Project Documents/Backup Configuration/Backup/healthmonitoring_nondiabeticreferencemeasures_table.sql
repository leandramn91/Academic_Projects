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
-- Table structure for table `nondiabeticreferencemeasures_table`
--

DROP TABLE IF EXISTS `nondiabeticreferencemeasures_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nondiabeticreferencemeasures_table` (
  `NonDiabeticRefFSGHigh` double DEFAULT NULL,
  `NonDiabeticRefFPGHigh` double DEFAULT NULL,
  `NonDiabeticRefAgeMin` smallint(6) DEFAULT NULL,
  `NonDiabeticRefGender` char(10) DEFAULT NULL,
  `NonDiabeticRefFPGLow` double DEFAULT NULL,
  `NonDiabeticRefFSGLow` double DEFAULT NULL,
  `NonDiabeticRefAgeMax` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nondiabeticreferencemeasures_table`
--

LOCK TABLES `nondiabeticreferencemeasures_table` WRITE;
/*!40000 ALTER TABLE `nondiabeticreferencemeasures_table` DISABLE KEYS */;
INSERT INTO `nondiabeticreferencemeasures_table` VALUES (5.09,86.58,16,'Male',84.24,4.91,30),(6.38,94.67,31,'Female',89.07,5.6,40),(6.25,93.58,41,'Male',88.4,5.63,50),(6.25,93.58,41,'Male',88.4,5.63,50),(7.35,103.61,51,'Female',92.47,6.65,60),(6.48,95.11,65,'Male',89.29,5.72,150);
/*!40000 ALTER TABLE `nondiabeticreferencemeasures_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-07 20:03:25
