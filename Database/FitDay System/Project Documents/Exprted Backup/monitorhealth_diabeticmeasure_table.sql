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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-09 14:01:38
