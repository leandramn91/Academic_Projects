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
-- Table structure for table `alldevices_table`
--

DROP TABLE IF EXISTS `alldevices_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alldevices_table` (
  `DeviceID` smallint(6) NOT NULL,
  `DeviceName` char(20) DEFAULT NULL,
  `DeviceDescription` varchar(200) DEFAULT NULL,
  `DevicePrice` double DEFAULT NULL,
  `DeviceRechargeCycles` int(11) DEFAULT NULL,
  `DeviceChargeTime` int(11) DEFAULT NULL,
  `DeviceRadioConn` char(20) DEFAULT NULL,
  `DeviceOpTempLow` float DEFAULT NULL,
  `DeviceOpTempHigh` float DEFAULT NULL,
  `DeviceAltitudeMax` int(11) DEFAULT NULL,
  PRIMARY KEY (`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alldevices_table`
--

LOCK TABLES `alldevices_table` WRITE;
/*!40000 ALTER TABLE `alldevices_table` DISABLE KEYS */;
INSERT INTO `alldevices_table` VALUES (1,'FitFit','A must have device for athletes to stay within limits of breakdown. ',199.99,2500,30,'Bluetooth connection',0,110,3200),(2,'SalGlucoMeter','A non-invasive device to stay ahead of your diabaties problem.',149.99,300,15,'Bluetooth connection',40,90,2400);
/*!40000 ALTER TABLE `alldevices_table` ENABLE KEYS */;
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
