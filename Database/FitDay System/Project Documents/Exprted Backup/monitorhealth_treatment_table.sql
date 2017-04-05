-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: monitorhealth
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
-- Dumping data for table `treatment_table`
--

LOCK TABLES `treatment_table` WRITE;
/*!40000 ALTER TABLE `treatment_table` DISABLE KEYS */;
INSERT INTO `treatment_table` VALUES (2001,3,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',1),(2002,5,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',2),(2003,8,'Low Sugar levels. Pramlintide (Symlin) is continued',3),(2004,1,'Cholesterol lowering drugs are prescribed by Doctor danziman. Case of HyperGlycemia',4),(2005,3,'Hypoglycemia. Physical activity is suggested.',5),(2006,2,'Continuous monitoring has shown good signs and same medications are continued.',6),(2007,1,'Hypoglycemia. Physical activity is suggested.',7),(2008,4,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',8),(2009,6,'Low Sugar levels. Pramlintide (Symlin) is continued',9),(2010,6,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',10);
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

-- Dump completed on 2015-12-09 14:01:35
