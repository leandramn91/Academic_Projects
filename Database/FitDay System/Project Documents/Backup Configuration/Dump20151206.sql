CREATE DATABASE  IF NOT EXISTS `healthmonitoring` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `healthmonitoring`;
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
-- Table structure for table `activity_table`
--

DROP TABLE IF EXISTS `activity_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_table` (
  `ActivityDistance` double DEFAULT NULL COMMENT 'Distance in miles',
  `ActivityTimeInterval` smallint(6) DEFAULT NULL,
  `ActivityCaloriesBurnt` int(11) DEFAULT NULL,
  `ActivityDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ActivityMaxHeartRate` smallint(6) DEFAULT NULL,
  `AthleteID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ActivityID` smallint(6) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  `ActivitySpeed` float DEFAULT NULL,
  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`,`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_table`
--

LOCK TABLES `activity_table` WRITE;
/*!40000 ALTER TABLE `activity_table` DISABLE KEYS */;
INSERT INTO `activity_table` VALUES (2,5,NULL,'2015-12-03 00:00:00',220,1,12,3,1,15),(1.8,7,650,'2015-12-01 00:00:00',130,1,12,5,1,15),(0.5,12,NULL,'2015-04-20 00:00:00',120,2,7,1,1,2),(10,10,NULL,'2015-10-16 00:00:00',140,2,7,2,1,15),(NULL,9,NULL,'2015-11-08 00:00:00',165,2,7,4,1,NULL),(5,15,NULL,'2015-12-01 00:00:00',146,3,8,2,1,15),(NULL,18,NULL,'2015-10-28 00:00:00',125,4,4,4,1,NULL),(2.4,20,NULL,'2015-11-28 00:00:00',147,5,15,3,1,15),(0.2,18,NULL,'2015-11-20 00:00:00',123,6,11,1,1,3),(11,31,NULL,'2015-11-30 00:00:00',147,6,11,2,1,15),(1.4,36,NULL,'2015-11-29 00:00:00',178,6,11,3,1,15),(21,10,NULL,'2015-11-30 00:00:00',166,7,18,2,1,15),(NULL,42,NULL,'2015-11-11 00:00:00',180,7,18,4,1,NULL),(NULL,14,NULL,'2015-11-30 00:00:00',155,8,2,4,1,NULL),(1.3,12,NULL,'2015-11-30 00:00:00',148,8,2,5,1,15),(1.1,19,NULL,'2015-12-01 00:00:00',123,9,16,3,1,15),(0.8,30,NULL,'2015-12-02 00:00:00',120,10,3,1,1,2),(6,24,NULL,'2015-12-02 00:00:00',168,10,3,2,1,15),(NULL,26,NULL,'2015-12-02 00:00:00',181,10,3,4,1,15),(4,34,NULL,'2015-11-30 00:00:00',145,11,13,5,1,15);
/*!40000 ALTER TABLE `activity_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Alert_After_HeartRate_Insert AFTER INSERT ON activity_table

FOR EACH ROW
BEGIN		
    Declare age int;
      
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    call GetMaxHR(age, @MaxHR);
    
    
	IF NEW.ActivityMaxHeartRate > @MaxHR THEN
        
		Insert into remedy_table (remedy_table.AthleteID, 
									remedy_table.UserID, 
									remedy_table.DeviceID, 
									remedy_table.ActivityID, 
									remedy_table.RemedyID) 
								values (NEW.AthleteID, 
										NEW.UserID , 
										NEW.DeviceID, 
										NEW.ActivityID, 2);
            
	ELSE
			Insert into remedy_table (remedy_table.AthleteID, 
									remedy_table.UserID, 
									remedy_table.DeviceID, 
									remedy_table.ActivityID, 
									remedy_table.RemedyID) 
							values (NEW.AthleteID, 
									NEW.UserID , 
									NEW.DeviceID, 
									NEW.ActivityID, 1);
            
		END IF;		
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Alert_After_HeartRate_Update AFTER UPDATE ON activity_table

FOR EACH ROW
BEGIN		
    Declare age int;
      
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    call GetMaxHR(age, @MaxHR);
    
    
		IF NEW.ActivityMaxHeartRate > @MaxHR THEN
            update remedy_table SET remedy_table.RemedyID = 2 where remedy_table.AthleteID = NEW.AthleteID AND
																	remedy_table.UserID = NEW.UserID AND
																	remedy_table.DeviceID = NEW.DeviceID AND
                                                                    remedy_table.ActivityID = NEW.ActivityID;
		ELSE
			update remedy_table SET remedy_table.RemedyID = 1 where remedy_table.AthleteID = NEW.AthleteID AND
																	remedy_table.UserID = NEW.UserID AND
																	remedy_table.DeviceID = NEW.DeviceID AND
                                                                    remedy_table.ActivityID = NEW.ActivityID;
		END IF;		
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Alert_After_HeartRate_Delete AFTER DELETE ON activity_table

FOR EACH ROW
BEGIN	

	Delete FROM remedy_table where remedy_table.AthleteID = OLD.AthleteID AND
									remedy_table.UserID = OLD.UserID AND
									remedy_table.DeviceID = OLD.DeviceID AND
									remedy_table.ActivityID = OLD.ActivityID;
                                    
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `allactivity_table`
--

DROP TABLE IF EXISTS `allactivity_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allactivity_table` (
  `ActivityID` smallint(6) NOT NULL,
  `ActivityName` char(20) NOT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allactivity_table`
--

LOCK TABLES `allactivity_table` WRITE;
/*!40000 ALTER TABLE `allactivity_table` DISABLE KEYS */;
INSERT INTO `allactivity_table` VALUES (1,'Swimming'),(2,'Cycling'),(3,'Running'),(4,'Heavy Lifting'),(5,'Walking');
/*!40000 ALTER TABLE `allactivity_table` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `allremedy_table`
--

DROP TABLE IF EXISTS `allremedy_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allremedy_table` (
  `RemedyID` smallint(6) NOT NULL,
  `RemedyDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RemedyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allremedy_table`
--

LOCK TABLES `allremedy_table` WRITE;
/*!40000 ALTER TABLE `allremedy_table` DISABLE KEYS */;
INSERT INTO `allremedy_table` VALUES (0,'Remedy Description'),(1,'Calm down and go steady.'),(2,'You are pushing to the limits, Take it easy.'),(3,'Stop Now.  Emergency may occur.');
/*!40000 ALTER TABLE `allremedy_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete_table`
--

DROP TABLE IF EXISTS `athlete_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete_table` (
  `AthleteID` int(11) NOT NULL,
  `AthleteHeight` smallint(6) NOT NULL COMMENT 'In centimeters',
  `athleteweight` double DEFAULT NULL,
  `AthleteBMI` double(3,2) DEFAULT NULL,
  `AtheleteSignCaptureDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`AthleteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete_table`
--

LOCK TABLES `athlete_table` WRITE;
/*!40000 ALTER TABLE `athlete_table` DISABLE KEYS */;
INSERT INTO `athlete_table` VALUES (1,181,136,18.68,'2015-12-01 00:00:00',12,1),(2,189,188,23.68,'2015-12-01 00:00:00',7,1),(3,194,165,19.73,'2015-12-01 00:00:00',8,1),(4,178,124,17.61,'2015-12-01 00:00:00',4,1),(5,174,120,17.84,'2015-11-28 00:00:00',15,1),(6,186,150,19.51,'2015-12-01 00:00:00',11,1),(7,182,164,22.28,'2015-11-09 00:00:00',18,1),(8,188,176,22.41,'2015-10-10 00:00:00',2,1),(9,185,166,21.83,'2015-12-02 00:00:00',16,1),(10,176,130,18.89,'2015-12-02 00:00:00',3,1),(11,180,140,19.44,'2015-12-02 00:00:00',13,1);
/*!40000 ALTER TABLE `athlete_table` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `diabeticreferencemeasures_table`
--

DROP TABLE IF EXISTS `diabeticreferencemeasures_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diabeticreferencemeasures_table` (
  `DiabeticRefAgeMin` smallint(6) DEFAULT NULL,
  `DiabeticRefGender` char(10) DEFAULT NULL,
  `DiabeticRefFSGHigh` double DEFAULT NULL,
  `DiabeticRefFPGHigh` double DEFAULT NULL,
  `DiabeticRefFSGLow` double DEFAULT NULL,
  `DiabeticRefFPGLow` double DEFAULT NULL,
  `DiabeticRefAgeMax` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diabeticreferencemeasures_table`
--

LOCK TABLES `diabeticreferencemeasures_table` WRITE;
/*!40000 ALTER TABLE `diabeticreferencemeasures_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `diabeticreferencemeasures_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_table`
--

DROP TABLE IF EXISTS `doctor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_table` (
  `DoctorID` int(11) NOT NULL,
  `DoctorName` char(20) DEFAULT NULL,
  `DoctorPhoneNumber` char(20) DEFAULT NULL,
  `PatientID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  PRIMARY KEY (`DoctorID`,`PatientID`,`UserID`,`DeviceID`,`ClinicID`),
  UNIQUE KEY `DoctorID` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_table`
--

LOCK TABLES `doctor_table` WRITE;
/*!40000 ALTER TABLE `doctor_table` DISABLE KEYS */;
INSERT INTO `doctor_table` VALUES (1,'Joseph Avruch','6138928989',1,19,2,101),(2,'Lloyd Axelrod','6170023020',2,13,2,102),(3,'Enrico Cagliero','8170035689',3,14,2,103),(4,'John Elliott Godine','9782562323',4,4,2,104),(5,'Mara Lorenzi','6178988989',5,8,2,105),(6,'David Nathan','9876541235',6,12,2,106),(7,'Steven Jon Russell','6178923636',7,5,2,107),(8,'Enrico Cagliero','6178989999',8,6,2,108),(9,'James Benjamin Meigs','6176176178',9,17,2,109),(10,'David Nathan','6178729292',10,9,2,110);
/*!40000 ALTER TABLE `doctor_table` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `nondiabeticreferencemeasures_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_table`
--

DROP TABLE IF EXISTS `patient_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_table` (
  `PatientID` int(11) NOT NULL,
  `PatientAge` int(11) DEFAULT NULL,
  `PatientDoctorName` char(20) DEFAULT NULL,
  `PatientBMI` double(3,2) DEFAULT NULL,
  `PatientIsDiabetic` tinyint(1) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`),
  UNIQUE KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_table`
--

LOCK TABLES `patient_table` WRITE;
/*!40000 ALTER TABLE `patient_table` DISABLE KEYS */;
INSERT INTO `patient_table` VALUES (1,0,'Dikinson',0.00,1,19,2),(2,0,'Samuel',0.00,1,13,2),(3,0,'Albert',0.00,0,14,2),(4,0,'Gonsalis',0.00,1,4,2),(5,0,'Albert',0.00,1,8,2),(6,0,'Mischele',0.00,1,12,2),(7,0,'Mischele',0.00,1,5,2),(8,0,'Albert',0.00,0,6,2),(9,0,'Albert',0.00,1,17,2),(10,0,'Samuel',0.00,1,9,2),(11,0,'Dikinson',0.00,1,10,2);
/*!40000 ALTER TABLE `patient_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patienthistory_table`
--

DROP TABLE IF EXISTS `patienthistory_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patienthistory_table` (
  `PatientHistoryID` int(11) NOT NULL,
  `PatientAge` int(11) DEFAULT NULL COMMENT 'InYears',
  `PatientDoctorName` char(20) DEFAULT NULL,
  `PatientBMI` double(3,2) DEFAULT NULL,
  `PatientIsDiabetic` tinyint(1) DEFAULT NULL,
  `PatientUpdatedBy` char(20) DEFAULT NULL,
  `patientupdatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`PatientHistoryID`,`PatientID`,`UserID`,`DeviceID`),
  UNIQUE KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patienthistory_table`
--

LOCK TABLES `patienthistory_table` WRITE;
/*!40000 ALTER TABLE `patienthistory_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `patienthistory_table` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `remedy_table` VALUES (1,12,3,2,1),(1,12,5,2,1),(2,7,1,2,1),(2,7,2,1,1),(2,7,4,3,1),(3,8,2,3,1),(4,4,4,1,1),(5,15,3,2,1),(6,11,1,3,1),(6,11,2,1,1),(6,11,3,2,1),(7,18,2,1,1),(7,18,4,3,1),(8,2,4,3,1),(8,2,5,2,1),(9,16,3,1,1),(10,3,1,1,1),(10,3,2,2,1),(10,3,4,3,1),(11,13,5,2,1);
/*!40000 ALTER TABLE `remedy_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safeheartrate_table`
--

DROP TABLE IF EXISTS `safeheartrate_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safeheartrate_table` (
  `ShrAgeMin` smallint(6) DEFAULT NULL,
  `ShrAgeMax` smallint(6) DEFAULT NULL,
  `ShrMinHR` smallint(6) DEFAULT NULL,
  `ShrMaxHR` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safeheartrate_table`
--

LOCK TABLES `safeheartrate_table` WRITE;
/*!40000 ALTER TABLE `safeheartrate_table` DISABLE KEYS */;
INSERT INTO `safeheartrate_table` VALUES (6,12,70,120),(12,19,70,150),(20,29,100,200),(30,34,95,190),(35,39,93,185),(40,44,90,180),(45,49,88,175),(50,54,85,170),(55,59,83,165),(60,64,80,160),(65,69,78,155),(70,74,75,150),(75,79,70,140),(80,84,65,130);
/*!40000 ALTER TABLE `safeheartrate_table` ENABLE KEYS */;
UNLOCK TABLES;

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
  `DeviceID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1,'Roy','41 Smith St','Boston','2120','(123) 456-7896','1990-01-09',25,'male',1),(2,'Paul','56 Smith St','Boston','2120','(201) 165-5986','1991-08-12',24,'male',1),(3,'Jessica','203 Chestnut St','Seattle','4689','(318) 497-6597','1998-05-04',17,'female',1),(4,'Rahi','118 Briston St','Chicago','3578','(677) 564-6233','1989-05-25',26,'female',1),(5,'Reshma','40 Gordon St Apt 47','New york City','3001','(125) 469-5685','1994-12-07',20,'female',1),(6,'Reena','154 Kyoto St','Statenham','1122','(236) 232-6595','1969-07-24',46,'female',2),(7,'Ajay','118 selinar St','Phoenix','9867','(712) 141-2846','1994-04-11',21,'male',1),(8,'Nix','118 Cranberry St','Rodeo','7410','(154) 232-6462','1981-11-10',34,'male',2),(9,'Dabby','118 Blifton St','Austin','7785','(238) 414-8424','1974-02-02',41,'female',2),(10,'veer','118 Ramsay St','Boston','2115','(985) 732-6559','1980-10-10',35,'male',2),(11,'Rohit','118 Boylston St','Los Angeles','1569','(112) 152-6452','1984-12-15',30,'male',2),(12,'Ashish','118 Pedar St','Leistershire','2548','(222) 369-4548','1993-02-08',22,'male',1),(13,'Jacob','118 Agasis St','Manchester','2633','(478) 359-4127','1979-03-03',36,'male',1),(14,'Kevin','118 Zichar St','Hobart','5216','(224) 965-4844','1965-06-07',50,'male',2),(15,'Ruksat','118 Auburn St','Statenham','1101','(121) 425-4568','1986-10-30',29,'female',1),(16,'Jin','118 colone St','Chicago','3498','(232) 892-3248','1990-07-09',25,'Male',1),(17,'Rechel','118 Urban St','Washington','3640','(123) 395-2384','1970-12-10',44,'female',2),(18,'Tom','118 Washington St','Boston','2015','(665) 695-2154','1980-09-11',35,'male',2),(19,'Sindy','118 Worcester St','Baltimore','1199','(398) 336-9314','1972-01-05',43,'female',2);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userhistory_table`
--

DROP TABLE IF EXISTS `userhistory_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userhistory_table` (
  `UserHistoryID` char(20) NOT NULL,
  `UserName` char(30) NOT NULL,
  `UserAddress` varchar(80) DEFAULT NULL,
  `UserCity` char(20) DEFAULT NULL,
  `UserZipCode` char(20) DEFAULT NULL,
  `UserPhoneNumber` char(15) NOT NULL,
  `UserDOB` date NOT NULL,
  `UserAge` smallint(6) DEFAULT NULL,
  `UserGender` char(6) DEFAULT NULL,
  `UserUpdatedBy` char(20) DEFAULT NULL,
  `Userupdatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserID` int(11) NOT NULL,
  `DeviceID` smallint(6) NOT NULL,
  PRIMARY KEY (`UserHistoryID`,`UserID`,`DeviceID`),
  UNIQUE KEY `UserPhoneNumber` (`UserPhoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userhistory_table`
--

LOCK TABLES `userhistory_table` WRITE;
/*!40000 ALTER TABLE `userhistory_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `userhistory_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'healthmonitoring'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateCube` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateCube`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num * num;
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CalculateSquare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateSquare`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num;
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateAge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateAge`(in ID int)
BEGIN
Declare age int;
SET age = (SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),(select UserDOB from user_table where UserID = ID))), '%Y'));
update user_table set UserAge = age where UserID = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateBMI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateBMI`(in ID int)
Begin
declare BMI double;
declare height int;
declare weight double;
select AthleteHeight, AthleteWeight from athlete_table where AthleteID = ID into height,weight;
set BMI = (weight * 4500)/(height * height);
select BMI;
update athlete_table set AthleteBMI = BMI where AthleteID = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateCaloriesBurnt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateCaloriesBurnt`(in athID int, in useID int, in activID int, in devID int)
Begin
declare calories int;
declare speed float;
declare weight double;
declare minutes double;

SELECT activity_table.ActivityTimeInterval, activity_table.ActivitySpeed 
FROM activity_table 
WHERE activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID AND activity_table.DeviceID = devID into minutes, speed;

select athlete_table.athleteweight 
from athlete_table 
where athlete_table.AthleteID = athID into weight;


IF activID = 5 THEN 												-- Activity Walking
SET calories = (weight * 0.45) * (minutes / 60) * ((0.0215 * CalculateCube(speed))
 + (0.01765 * CalculateSquare(speed)) + (0.8710 * speed) + 1.4577);
 
ELSEIF activID = 2 THEN 											-- Activity Cycling
SET calories = ((3.509* speed) + 0.2581 * CalculateCube(speed)) * minutes/69.78;

ELSEIF activID = 3 THEN 											-- Activity running
SET calories = 12;

ELSEIF activID = 4 THEN 											-- Heavy Lifting
SET calories = 0;

ELSEIF activID = 1 THEN 											-- Activity Swimming
SET calories = 14;
END IF;


update activity_table 
set activity_table.ActivityCaloriesBurnt = calories 
where activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID AND activity_table.DeviceID = devID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxHR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxHR`(in age int, out returnMaxHR int)
BEGIN
DECLARE done INT DEFAULT FALSE;
Declare MaxHR int;
Declare MinAge int;
Declare MaxAge int;

Declare  c_iterator CURSOR for
      SELECT ShrMaxHR, ShrAgeMin, ShrAgeMax from safeheartrate_table;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO MaxHR, MinAge, MaxAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= MinAge AND age <= MaxAge THEN
	SET returnMaxHR = MaxHR;      
  END IF;
END LOOP;
CLOSE c_iterator;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 17:09:47
