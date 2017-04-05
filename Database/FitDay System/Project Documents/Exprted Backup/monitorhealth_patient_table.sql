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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-09 14:01:38
