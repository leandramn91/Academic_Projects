CREATE DATABASE  IF NOT EXISTS `monitorhealth` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `monitorhealth`;
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
-- Dumping data for table `activity_table`
--

LOCK TABLES `activity_table` WRITE;
/*!40000 ALTER TABLE `activity_table` DISABLE KEYS */;
INSERT INTO `activity_table` VALUES (2,5,59,'2015-12-03 00:00:00',220,1,12,3),(1.8,7,650,'2015-12-01 00:00:00',130,1,12,5),(0.5,12,160,'2015-04-20 00:00:00',120,2,7,1),(1,10,132,'2015-10-16 00:00:00',140,2,7,2),(NULL,9,71,'2015-11-08 00:00:00',165,2,7,4),(2,15,NULL,'2015-12-01 00:00:00',146,3,8,2),(NULL,18,NULL,'2015-10-28 00:00:00',125,4,4,4),(2.4,20,NULL,'2015-11-28 00:00:00',147,5,15,3),(0.2,18,NULL,'2015-11-20 00:00:00',123,6,11,1),(8,31,NULL,'2015-11-30 00:00:00',147,6,11,2),(1.4,36,NULL,'2015-11-29 00:00:00',178,6,11,3),(2,10,NULL,'2015-11-30 00:00:00',166,7,18,2),(NULL,42,NULL,'2015-11-11 00:00:00',180,7,18,4),(NULL,14,NULL,'2015-11-30 00:00:00',155,8,2,4),(1.3,12,NULL,'2015-11-30 00:00:00',148,8,2,5),(1.1,19,NULL,'2015-12-01 00:00:00',123,9,16,3),(0.8,30,NULL,'2015-12-02 00:00:00',120,10,3,1),(6,24,NULL,'2015-12-02 00:00:00',168,10,3,2),(NULL,26,NULL,'2015-12-02 00:00:00',181,10,3,4),(4,34,NULL,'2015-11-30 00:00:00',145,11,13,5);
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
									remedy_table.ActivityID, 
									remedy_table.RemedyID) 
								values (NEW.AthleteID, 
										NEW.UserID , 
										NEW.ActivityID, 2);
            
	ELSE
			Insert into remedy_table (remedy_table.AthleteID, 
									remedy_table.UserID, 
									remedy_table.ActivityID, 
									remedy_table.RemedyID) 
							values (NEW.AthleteID, 
									NEW.UserID , 
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
                                                                    remedy_table.ActivityID = NEW.ActivityID;
		ELSE
			update remedy_table SET remedy_table.RemedyID = 1 where remedy_table.AthleteID = NEW.AthleteID AND
																	remedy_table.UserID = NEW.UserID AND
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
									remedy_table.ActivityID = OLD.ActivityID;
                                    
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `allactivity_table`
--

LOCK TABLES `allactivity_table` WRITE;
/*!40000 ALTER TABLE `allactivity_table` DISABLE KEYS */;
INSERT INTO `allactivity_table` VALUES (1,'Swimming'),(2,'Cycling'),(3,'Running'),(4,'Heavy Lifting'),(5,'Walking');
/*!40000 ALTER TABLE `allactivity_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `alldevices_table`
--

LOCK TABLES `alldevices_table` WRITE;
/*!40000 ALTER TABLE `alldevices_table` DISABLE KEYS */;
INSERT INTO `alldevices_table` VALUES (1,'FitFit','A must have device for athletes to stay within limits of breakdown. ',199.99,2500,30,'Bluetooth connection',0,110,3200),(2,'SalGlucoMeter','A non-invasive device to stay ahead of your diabaties problem.',149.99,300,15,'Bluetooth connection',40,90,2400);
/*!40000 ALTER TABLE `alldevices_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `allremedy_table`
--

LOCK TABLES `allremedy_table` WRITE;
/*!40000 ALTER TABLE `allremedy_table` DISABLE KEYS */;
INSERT INTO `allremedy_table` VALUES (1,'You are going good.'),(2,'You are pushing to the limits, Take it easy.');
/*!40000 ALTER TABLE `allremedy_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `athlete_table`
--

LOCK TABLES `athlete_table` WRITE;
/*!40000 ALTER TABLE `athlete_table` DISABLE KEYS */;
INSERT INTO `athlete_table` VALUES (1,181,136,18.68,'2015-12-01 00:00:00',12),(2,189,188,23.68,'2015-12-01 00:00:00',7),(3,194,165,19.73,'2015-12-01 00:00:00',8),(4,178,124,17.61,'2015-12-01 00:00:00',4),(5,174,120,17.84,'2015-11-28 00:00:00',15),(6,186,150,19.51,'2015-12-01 00:00:00',11),(7,182,164,22.28,'2015-11-09 00:00:00',18),(8,188,176,22.41,'2015-10-10 00:00:00',2),(9,185,166,21.83,'2015-12-02 00:00:00',16),(10,176,130,18.89,'2015-12-02 00:00:00',3),(11,180,140,19.44,'2015-12-02 00:00:00',13);
/*!40000 ALTER TABLE `athlete_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clinic_table`
--

LOCK TABLES `clinic_table` WRITE;
/*!40000 ALTER TABLE `clinic_table` DISABLE KEYS */;
INSERT INTO `clinic_table` VALUES (101,'Joslin Diabetes Center','1 Joslin Place','Boston','2215',1),(102,'Mass General Hospital','50 Staniford Street #340','Boston','2114',2),(103,'Boston Medical Center',' 840 Harrison Avenue','Boston','2118',3),(104,'Women\'s Health Services','111 Harvard Street','Brookline','2446',4),(105,'The Doc Is In','581 Boylston Street #800','Boston','2116',5),(106,'Mount Auburn Hospital','330 Mount Auburn Street','Cambridge','2138',6),(107,'Dr. Boris I. Orkin','1180 Beacon Street #5B','Brookline','2446',7),(108,'Whittier Street Health Center','1290 Tremont Street','Boston','2120',8),(109,'Total Wellness Clinic','697 Cambridge Street','Brighton','2135',9),(110,'Sharewood Project','184 Pleasant Street','Malden','2148',10);
/*!40000 ALTER TABLE `clinic_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `diabeticmeasure_table`
--

LOCK TABLES `diabeticmeasure_table` WRITE;
/*!40000 ALTER TABLE `diabeticmeasure_table` DISABLE KEYS */;
INSERT INTO `diabeticmeasure_table` VALUES (10.55,160.4,'2015-12-07 00:00:00',1,19,1),(10.9,174.38,'2015-12-07 00:00:00',2,13,2),(6.8,104.94,'2015-12-07 00:00:00',3,14,3),(9.81,190.22,'2015-12-07 00:00:00',4,4,4),(10.34,140.1,'2015-12-07 00:00:00',5,8,5),(10.64,173.44,'2015-12-07 00:00:00',6,12,6),(10.49,160.84,'2015-12-07 00:00:00',7,5,7),(5.01,190.22,'2015-12-07 00:00:00',8,6,8),(10.55,170.32,'2015-12-07 00:00:00',9,17,9),(10.5,200.1,'2015-12-07 00:00:00',10,9,10);
/*!40000 ALTER TABLE `diabeticmeasure_table` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Check_Diabetic_Value_Insert AFTER INSERT ON diabeticmeasure_table

FOR EACH ROW
BEGIN	
	Declare age int;
	Declare FSG double;
    Declare FPG double;
    Declare isDiabetic boolean;
    Declare adviceFSG varchar(100);
    Declare adviceFPG varchar(100);
    Declare SingleStr varchar(200);
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    Select PatientIsDiabetic from patient_table 
    where patient_table.UserID = NEW.UserID AND 
    patient_table.PatientID = NEW.PatientID AND
    patient_table.DoctorID = NEW.DoctorID
    into isDiabetic;
    
    IF isdiabetic <> NULL AND age <> NULL THEN
        
		IF isDiabetic THEN
			call GetDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);	
			
		ELSE
			call GetNonDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);
			
		END IF;
		
		IF NEW.DiabeticMeasureFSGLevel > @MinFSG AND NEW.DiabeticMeasureFSGLevel < @MaxFSG THEN
				SET adviceFSG = 'FSG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel <= @MinFSG THEN
				SET adviceFSG = 'FSG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel >= @MaxFSG THEN
				SET adviceFSG = 'FSG is overshooting or closer to Higher limits.' ;
			END IF;
			
		IF NEW.DiabeticMeasureFPGLevel > @MinFPG AND NEW.DiabeticMeasureFPGLevel < @MaxFPG THEN
				SET adviceFPG = 'FPG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel <= @MinFPG THEN
				SET adviceFPG = 'FPG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel >= @MaxFPG THEN
				SET adviceFPG = 'FPG is overshooting or closer to Higher limits.' ;
		END IF;
		
		IF isDiabetic THEN
			SET SingleStr = concat_ws(' ','Diabetic:', adviceFSG, adviceFPG);    
		ELSE
			SET SingleStr = concat_ws(' ','Non-Diabetic:', adviceFSG, adviceFPG);
			
		END IF;
		
		update patient_table Set PatientSystemSuggestion = SingleStr
				where patient_table.DoctorID = NEW.DoctorID AND
				patient_table.UserID = NEW.UserID AND
				patient_table.PatientID = NEW.PatientID ;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Check_Diabetic_Value_Update AFTER UPDATE ON diabeticmeasure_table

FOR EACH ROW
BEGIN	
	Declare age int;
	Declare FSG double;
    Declare FPG double;
    Declare isDiabetic boolean;
    Declare adviceFSG varchar(100);
    Declare adviceFPG varchar(100);
    Declare SingleStr varchar(200);
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    Select PatientIsDiabetic from patient_table 
    where patient_table.UserID = NEW.UserID AND 
    patient_table.PatientID = NEW.PatientID AND
    patient_table.DoctorID = NEW.DoctorID
    into isDiabetic;
        
	IF isdiabetic <> NULL AND age <> NULL THEN
		IF isDiabetic THEN
			call GetDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);	
			
		ELSE
			call GetNonDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);
			
		END IF;
		
		IF NEW.DiabeticMeasureFSGLevel > @MinFSG AND NEW.DiabeticMeasureFSGLevel < @MaxFSG THEN
				SET adviceFSG = 'FSG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel <= @MinFSG THEN
				SET adviceFSG = 'FSG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel >= @MaxFSG THEN
				SET adviceFSG = 'FSG is overshooting or closer to Higher limits.' ;
			END IF;
			
		IF NEW.DiabeticMeasureFPGLevel > @MinFPG AND NEW.DiabeticMeasureFPGLevel < @MaxFPG THEN
				SET adviceFPG = 'FPG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel <= @MinFPG THEN
				SET adviceFPG = 'FPG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel >= @MaxFPG THEN
				SET adviceFPG = 'FPG is overshooting or closer to Higher limits.' ;
		END IF;
		
		IF isDiabetic THEN
			SET SingleStr = concat_ws(' ','Diabetic:', adviceFSG, adviceFPG);    
		ELSE
			SET SingleStr = concat_ws(' ','Non-Diabetic:', adviceFSG, adviceFPG);
			
		END IF;
		
		update patient_table Set PatientSystemSuggestion = SingleStr
				where patient_table.DoctorID = NEW.DoctorID AND
				patient_table.UserID = NEW.UserID AND
				patient_table.PatientID = NEW.PatientID ;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `diabeticreferencemeasures_table`
--

LOCK TABLES `diabeticreferencemeasures_table` WRITE;
/*!40000 ALTER TABLE `diabeticreferencemeasures_table` DISABLE KEYS */;
INSERT INTO `diabeticreferencemeasures_table` VALUES (18,'Male',10.39,206.84,9.35,118.56,30),(31,'Female',11.1,207.7,10.04,126.76,40),(41,'Female',11.02,181.11,10.04,156.83,50),(51,'Male',11.63,175.35,10.43,140.41,60),(61,'Male',13.33,219.45,11.13,177.47,150);
/*!40000 ALTER TABLE `diabeticreferencemeasures_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `doctor_table`
--

LOCK TABLES `doctor_table` WRITE;
/*!40000 ALTER TABLE `doctor_table` DISABLE KEYS */;
INSERT INTO `doctor_table` VALUES (1,'Joseph Avruch','6138928989'),(2,'Lloyd Axelrod','6170023020'),(3,'Enrico Cagliero','8170035689'),(4,'John Elliott Godine','9782562323'),(5,'Mara Lorenzi','6178988989'),(6,'David Nathan','9876541235'),(7,'Steven Jon Russell','6178923636'),(8,'Enrico Cagliero','6178989999'),(9,'James Benjamin Meigs','6176176178'),(10,'David Nathan','6178729292');
/*!40000 ALTER TABLE `doctor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nondiabeticreferencemeasures_table`
--

LOCK TABLES `nondiabeticreferencemeasures_table` WRITE;
/*!40000 ALTER TABLE `nondiabeticreferencemeasures_table` DISABLE KEYS */;
INSERT INTO `nondiabeticreferencemeasures_table` VALUES (5.09,86.58,16,'Male',84.24,4.91,30),(6.38,94.67,31,'Female',89.07,5.6,40),(6.25,93.58,41,'Male',88.4,5.63,50),(7.35,103.61,51,'Female',92.47,6.65,60),(6.48,95.11,65,'Male',89.29,5.72,150);
/*!40000 ALTER TABLE `nondiabeticreferencemeasures_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `patient_table`
--

LOCK TABLES `patient_table` WRITE;
/*!40000 ALTER TABLE `patient_table` DISABLE KEYS */;
INSERT INTO `patient_table` VALUES (1,1,'Diabetic: FSG is well in Limits. FPG is well in Limits.',19,1),(2,1,'Diabetic: FSG is well in Limits. FPG is well in Limits.',13,2),(3,1,'Non-Diabetic: FSG is overshooting or closer to Higher limits. FPG is overshooting or closer to Higher limits.',14,3),(4,1,'Diabetic: FSG is well in Limits. FPG is well in Limits.',4,4),(5,1,'Diabetic: FSG is well in Limits. FPG is well in Limits.',8,5),(6,1,'Diabetic: FSG is overshooting or closer to Higher limits. FPG is well in Limits.',12,6),(7,1,'Diabetic: FSG is overshooting or closer to Higher limits. FPG is well in Limits.',5,7),(8,0,'Non-Diabetic: FSG is under or closer to lower limits. FPG is overshooting or closer to Higher limits.',6,8),(9,1,'Diabetic: FSG is well in Limits. FPG is well in Limits.',17,9),(10,1,'Diabetic: FSG is well in Limits. FPG is overshooting or closer to Higher limits.',9,10);
/*!40000 ALTER TABLE `patient_table` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Add_AGE_After_PatientTable_Insert AFTER INSERT ON patient_table

FOR EACH ROW
BEGIN
	call CalculateAge(New.UserID);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Archeive_Patient_Record_Update AFTER UPDATE ON patient_table

FOR EACH ROW
BEGIN				
    Declare docName varchar(50);
    Select Doctorname from doctor_table where DoctorID = old.DoctorID into docName;
    
    IF OLD.PatientIsDiabetic <> NEW.PatientIsDiabetic THEN
		insert into patienthistory_table(        
			patienthistory_table.PatientHistoryID,
			patienthistory_table.PatientDoctorName,
			patienthistory_table.PatientIsDiabetic,
			patienthistory_table.PatientUpdatedBy,
			patienthistory_table.PatientUpdateDate,
			patienthistory_table.PatientSystemSuggestion,
			patienthistory_table.PatientID,
			patienthistory_table.UserID,
			patienthistory_table.DoctorID)
		values
		(	DEFAULT,
			docName,
			OLD.PatientIsDiabetic,
			user(),
			curdate(),
			OLD.PatientSystemSuggestion,
			OLD.PatientID,
			OLD.UserID,
			OLD.DoctorID);
		
	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `patienthistory_table`
--

LOCK TABLES `patienthistory_table` WRITE;
/*!40000 ALTER TABLE `patienthistory_table` DISABLE KEYS */;
INSERT INTO `patienthistory_table` VALUES (1,'Enrico Cagliero',0,'root@localhost','2015-12-09 00:00:00',14,3,3,'Non-Diabetic: FSG is overshooting or closer to Higher limits. FPG is overshooting or closer to Higher limits.');
/*!40000 ALTER TABLE `patienthistory_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remedy_table`
--

LOCK TABLES `remedy_table` WRITE;
/*!40000 ALTER TABLE `remedy_table` DISABLE KEYS */;
INSERT INTO `remedy_table` VALUES (1,12,3,1),(1,12,5,1),(2,7,1,1),(2,7,2,1),(2,7,4,1),(3,8,2,1),(4,4,4,1),(5,15,3,1),(6,11,1,1),(6,11,2,1),(6,11,3,1),(7,18,2,1),(7,18,4,1),(8,2,4,1),(8,2,5,1),(9,16,3,1),(10,3,1,1),(10,3,2,1),(10,3,4,1),(11,13,5,1),(1,12,5,2),(2,7,1,2),(5,15,3,2),(6,11,3,2),(8,2,5,2),(10,3,2,2),(11,13,5,2);
/*!40000 ALTER TABLE `remedy_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `safeheartrate_table`
--

LOCK TABLES `safeheartrate_table` WRITE;
/*!40000 ALTER TABLE `safeheartrate_table` DISABLE KEYS */;
INSERT INTO `safeheartrate_table` VALUES (6,12,70,120),(12,19,70,150),(20,29,100,200),(30,34,95,190),(35,39,93,185),(40,44,90,180),(45,49,88,175),(50,54,85,170),(55,59,83,165),(60,64,80,160),(65,69,78,155),(70,74,75,150),(75,79,70,140),(80,84,65,130);
/*!40000 ALTER TABLE `safeheartrate_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `treatment_table`
--

LOCK TABLES `treatment_table` WRITE;
/*!40000 ALTER TABLE `treatment_table` DISABLE KEYS */;
INSERT INTO `treatment_table` VALUES (2001,3,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',1),(2002,5,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',2),(2003,8,'Low Sugar levels. Pramlintide (Symlin) is continued',3),(2004,1,'Cholesterol lowering drugs are prescribed by Doctor danziman. Case of HyperGlycemia',4),(2005,3,'Hypoglycemia. Physical activity is suggested.',5),(2006,2,'Continuous monitoring has shown good signs and same medications are continued.',6),(2007,1,'Hypoglycemia. Physical activity is suggested.',7),(2008,4,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',8),(2009,6,'Low Sugar levels. Pramlintide (Symlin) is continued',9),(2010,6,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',10);
/*!40000 ALTER TABLE `treatment_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1,'Roy','41 Smith St','Boston','2120','(123) 456-7896','1990-09-01',25,'male'),(2,'Paul','56 Smith St','Boston','2120','(201) 165-5986','1991-12-08',24,'male'),(3,'Jessica','203 Chestnut St','Seattle','4689','(318) 497-6597','1998-04-05',17,'female'),(4,'Rahi','118 Briston St','Chicago','3578','(677) 564-6233','1989-02-25',26,'female'),(5,'Reshma','40 Gordon St Apt 47','New york City','3001','(125) 469-5685','1994-07-12',21,'female'),(6,'Reena','154 Kyoto St','Statenham','1122','(236) 232-6595','1990-09-11',25,'female'),(7,'Ajay','118 selinar St','Phoenix','9867','(712) 141-2846','1994-11-04',21,'male'),(8,'Nix','118 Cranberry St','Rodeo','7410','(154) 232-6462','1981-10-11',34,'male'),(9,'Dabby','118 Blifton St','Austin','7785','(238) 414-8424','1974-02-02',41,'female'),(10,'veer','118 Ramsay St','Boston','2115','(985) 732-6559','1980-10-10',35,'male'),(11,'Rohit','118 Boylston St','Los Angeles','1569','(112) 152-6452','1984-12-15',30,'male'),(12,'Ashish','118 Pedar St','Leistershire','2548','(222) 369-4548','1993-08-02',22,'male'),(13,'Jacob','118 Agasis St','Manchester','2633','(478) 359-4127','1979-03-03',36,'male'),(14,'Kevin','118 Zichar St','Hobart','5216','(224) 965-4844','1965-07-06',50,'male'),(15,'Ruksat','118 Auburn St','Statenham','1101','(121) 425-4568','1986-05-11',29,'female'),(16,'Jin','118 colone St','Chicago','3498','(232) 892-3248','1990-09-07',25,'Male'),(17,'Rechel','118 Urban St','Washington','3640','(123) 395-2384','1970-10-12',45,'female'),(18,'Tom','118 Washington St','Boston','2015','(665) 695-2154','1980-11-09',35,'male'),(19,'Sindy','118 Worcester St','Baltimore','1199','(398) 336-9314','1972-05-01',43,'female');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  Archive_After_UserTbl_Update AFTER UPDATE ON user_table

FOR EACH ROW
BEGIN	

	insert into userhistory_table(
		userhistory_table.UserName,
		userhistory_table.UserAddress,
		userhistory_table.UserCity,
		userhistory_table.UserZipCode,
		userhistory_table.UserPhoneNumber,
		userhistory_table.UserDOB,
		userhistory_table.UserAge,
		userhistory_table.UserGender,
		userhistory_table.UserUpdatedBy,
		userhistory_table.Userupdatedate,
		userhistory_table.UserID)
    values
    (	OLD.UserName,
		OLD.UserAddress,
		OLD.UserCity,
		OLD.UserZipCode,
		OLD.UserPhoneNumber,
		OLD.UserDOB,
		OLD.UserAge,
		OLD.UserGender,
		user(),
		curdate(),
		OLD.UserID);
                                    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `userdevice_table`
--

LOCK TABLES `userdevice_table` WRITE;
/*!40000 ALTER TABLE `userdevice_table` DISABLE KEYS */;
INSERT INTO `userdevice_table` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(12,1),(13,1),(15,1),(16,1),(6,2),(8,2),(9,2),(10,2),(11,2),(14,2),(17,2),(18,2),(19,2),(20,2);
/*!40000 ALTER TABLE `userdevice_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `userhistory_table`
--

LOCK TABLES `userhistory_table` WRITE;
/*!40000 ALTER TABLE `userhistory_table` DISABLE KEYS */;
INSERT INTO `userhistory_table` VALUES (3,'Rahi','118 Briston St','Chicago','3578','(677) 564-6233','1989-02-25',26,'female','root@localhost','2015-12-08 00:00:00',4),(4,'Reshma','40 Gordon St Apt 47','New york City','3001','(125) 469-5685','1994-07-12',20,'female','root@localhost','2015-12-08 00:00:00',5),(5,'Reena','154 Kyoto St','Statenham','1122','(236) 232-6595','1990-09-11',46,'female','root@localhost','2015-12-08 00:00:00',6),(6,'Nix','118 Cranberry St','Rodeo','7410','(154) 232-6462','1981-10-11',34,'male','root@localhost','2015-12-08 00:00:00',8),(7,'Dabby','118 Blifton St','Austin','7785','(238) 414-8424','1974-02-02',41,'female','root@localhost','2015-12-08 00:00:00',9),(8,'Ashish','118 Pedar St','Leistershire','2548','(222) 369-4548','1993-08-02',22,'male','root@localhost','2015-12-08 00:00:00',12),(9,'Jacob','118 Agasis St','Manchester','2633','(478) 359-4127','1979-03-03',36,'male','root@localhost','2015-12-08 00:00:00',13),(10,'Kevin','118 Zichar St','Hobart','5216','(224) 965-4844','1965-07-06',50,'male','root@localhost','2015-12-08 00:00:00',14),(11,'Rechel','118 Urban St','Washington','3640','(123) 395-2384','1970-10-12',44,'female','root@localhost','2015-12-08 00:00:00',17),(12,'Sindy','118 Worcester St','Baltimore','1199','(398) 336-9314','1972-05-01',43,'female','root@localhost','2015-12-08 00:00:00',19);
/*!40000 ALTER TABLE `userhistory_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'monitorhealth'
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateCaloriesBurnt`(in athID int, in useID int, in activID int)
Begin
declare calories int;
declare speed float;
declare km float;
declare weight double;
declare minutes double;


SELECT activity_table.ActivityTimeInterval, activity_table.ActivityDistance
FROM activity_table 
WHERE activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID into minutes, km;

select athlete_table.athleteweight 
from athlete_table
where athlete_table.AthleteID = athID into weight;

SET speed =  60 * (km/minutes);

IF activID = 5 THEN 												-- Activity Walking
SET calories = (weight * 0.45) * (minutes / 60) * ((0.0215 * CalculateCube(speed))
 + (0.01765 * CalculateSquare(speed)) + (0.8710 * speed) + 1.4577);
 
ELSEIF activID = 2 THEN 											-- Activity Cycling
SET calories = ((3.509* speed) + 0.2581 * CalculateCube(speed)) * minutes/69.78;

-- Running (9-minute mile) calories burned per pound per minute constant: 0.087

ELSEIF activID = 3 THEN 											-- Activity running
SET calories = 0.087 * minutes * weight;

-- Weight training, circuit training calories burned per pound per minute constant: 0.042 //

ELSEIF activID = 4 THEN 											-- Heavy Lifting
SET calories = 0.042 * weight * minutes;

-- Swimming, crawl, fast calories burned per pound per minute constant: 0.071 //

ELSEIF activID = 1 THEN 											-- Activity Swimming
SET calories = 0.071 * weight * minutes;
END IF;

update activity_table 
set activity_table.ActivityCaloriesBurnt = calories 
where activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDiabeticRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDiabeticRange`(in age int, out MaxFSG double, out MinFSG double, out MaxFPG double, out MinFPG double)
BEGIN
DECLARE done INT DEFAULT FALSE;

Declare HighAge int;
Declare LowAge int;
Declare HighFPG double;
Declare HighFSG double;
Declare LowFPG double;
Declare LowFSG double;

Declare  c_iterator CURSOR for
      SELECT DiabeticRefFSGHigh, DiabeticRefFPGHigh, DiabeticRefFSGLow, DiabeticRefFPGLow, DiabeticRefAgeMax, DiabeticRefAgeMin 
      FROM diabeticreferencemeasures_table;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO HighFSG, HighFPG, LowFSG, LowFPG, HighAge, LowAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= LowAge AND age <= HighAge THEN
	SET MaxFPG = HighFPG; 
    SET MaxFSG = HighFSG;
    SET MinFPG = LowFPG;
    SET MinFSG = LowFSG;
  END IF;
END LOOP;
CLOSE c_iterator;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetNonDiabeticRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNonDiabeticRange`(in age int, out MaxFSG double, out MinFSG double, out MaxFPG double, out MinFPG double)
BEGIN
DECLARE done INT DEFAULT FALSE;

Declare HighAge int;
Declare LowAge int;
Declare HighFPG double;
Declare HighFSG double;
Declare LowFPG double;
Declare LowFSG double;

Declare  c_iterator CURSOR for
      SELECT nonDiabeticRefFSGHigh, nonDiabeticRefFPGHigh, nonDiabeticRefFSGLow, nonDiabeticRefFPGLow, nonDiabeticRefAgeMax, nonDiabeticRefAgeMin 
      FROM nondiabeticreferencemeasures_table;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO HighFSG, HighFPG, LowFSG, LowFPG, HighAge, LowAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= LowAge AND age <= HighAge THEN
	SET MaxFPG = HighFPG; 
    SET MaxFSG = HighFSG;
    SET MinFPG = LowFPG;
    SET MinFSG = LowFSG;
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

-- Dump completed on 2015-12-09 13:53:21
