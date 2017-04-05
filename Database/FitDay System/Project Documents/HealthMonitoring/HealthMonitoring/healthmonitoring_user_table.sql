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
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `UserID` int(11) NOT NULL,
  `UserName` char(30) NOT NULL,
  `UserAddress` varchar(80) DEFAULT NULL,
  `UserCity` char(20) DEFAULT NULL,
  `UserZipCode` char(20) DEFAULT NULL,
  `UserPhoneNumber` char(15) NOT NULL,
  `UserDOB` date NOT NULL,
  `UserAge` smallint(6) DEFAULT NULL,
  `UserGender` char(6) DEFAULT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`UserID`,`DeviceID`),
  UNIQUE KEY `UserPhoneNumber` (`UserPhoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1,'Roy','41 Smith St','Boston','2120','(123) 456-7896','1990-01-09',25,'male',1),(2,'Paul','56 Smith St','Boston','2120','(201) 165-5986','1991-08-12',24,'male',1),(3,'Jessica','203 Chestnut St','Seattle','4689','(318) 497-6597','1998-05-04',0,'female',1),(4,'Rahi','118 Briston St','Chicago','3578','(677) 564-6233','1989-05-25',0,'female',1),(5,'Reshma','40 Gordon St Apt 47','New york City','3001','(125) 469-5685','1994-12-07',0,'female',1),(6,'Reena','154 Kyoto St','Statenham','1122','(236) 232-6595','1969-07-24',0,'female',2),(7,'Ajay','118 selinar St','Phoenix','9867','(712) 141-2846','1994-04-11',0,'male',1),(8,'Nix','118 Cranberry St','Rodeo','7410','(154) 232-6462','1981-11-10',0,'male',2),(9,'Dabby','118 Blifton St','Austin','7785','(238) 414-8424','1974-02-02',0,'female',2),(10,'veer','118 Ramsay St','Boston','2115','(985) 732-6559','1980-10-10',0,'male',2),(11,'Rohit','118 Boylston St','Los Angeles','1569','(112) 152-6452','0000-00-00',0,'male',2),(12,'Ashish','118 Pedar St','Leistershire','2548','(222) 369-4548','1993-02-08',0,'male',1),(13,'Jacob','118 Agasis St','Manchester','2633','(478) 359-4127','1979-03-03',0,'male',1),(13,'Jacob','118 Agasis St','Manchester','2633','(478) 359-4128','1979-05-13',0,'male',2),(14,'Kevin','118 Zichar St','Hobart','5216','(224) 965-4844','1965-06-07',0,'male',2),(15,'Ruksat','118 Auburn St','Statenham','1101','(121) 425-4568','1986-10-30',0,'female',1),(16,'Jin','118 colone St','Chicago','3498','(232) 892-3248','1990-07-09',0,'Male',1),(17,'Rechel','118 Urban St','Washington','3640','(123) 395-2384','1970-12-10',0,'female',2),(18,'Tom','118 Washington St','Boston','2015','(665) 695-2154','1980-09-11',0,'male',2),(19,'Sindy','118 Worcester St','Baltimore','1199','(398) 336-9314','1972-01-05',0,'female',2);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-05 19:10:05
