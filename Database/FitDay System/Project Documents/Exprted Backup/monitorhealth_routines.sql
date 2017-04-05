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
-- Temporary view structure for view `showcaloriesburned`
--

DROP TABLE IF EXISTS `showcaloriesburned`;
/*!50001 DROP VIEW IF EXISTS `showcaloriesburned`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `showcaloriesburned` AS SELECT 
 1 AS `userID`,
 1 AS `UserName`,
 1 AS `AthleteID`,
 1 AS `ActivityID`,
 1 AS `ActivityName`,
 1 AS `ActivityCaloriesBurnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patienttreatmentview`
--

DROP TABLE IF EXISTS `patienttreatmentview`;
/*!50001 DROP VIEW IF EXISTS `patienttreatmentview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `patienttreatmentview` AS SELECT 
 1 AS `UserID`,
 1 AS `patientID`,
 1 AS `UserName`,
 1 AS `PatientIsDiabetic`,
 1 AS `PatientSystemSuggestion`,
 1 AS `DoctorName`,
 1 AS `TreatmentDescription`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `systemdiabeticsuggestions`
--

DROP TABLE IF EXISTS `systemdiabeticsuggestions`;
/*!50001 DROP VIEW IF EXISTS `systemdiabeticsuggestions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `systemdiabeticsuggestions` AS SELECT 
 1 AS `userID`,
 1 AS `UserName`,
 1 AS `patientID`,
 1 AS `patientisdiabetic`,
 1 AS `patientSystemSuggestion`,
 1 AS `DiabeticmeasureFSGLevel`,
 1 AS `DiabeticmeasureFPGLevel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `athleteactivityview`
--

DROP TABLE IF EXISTS `athleteactivityview`;
/*!50001 DROP VIEW IF EXISTS `athleteactivityview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `athleteactivityview` AS SELECT 
 1 AS `UserID`,
 1 AS `AthleteID`,
 1 AS `UserName`,
 1 AS `AthleteHeight`,
 1 AS `athleteweight`,
 1 AS `athletebmi`,
 1 AS `ActivityName`,
 1 AS `ActivityCaloriesBurnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `showcaloriesburned`
--

/*!50001 DROP VIEW IF EXISTS `showcaloriesburned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showcaloriesburned` AS select `user_table`.`UserID` AS `userID`,`user_table`.`UserName` AS `UserName`,`athlete_table`.`AthleteID` AS `AthleteID`,`activity_table`.`ActivityID` AS `ActivityID`,`allactivity_table`.`ActivityName` AS `ActivityName`,`activity_table`.`ActivityCaloriesBurnt` AS `ActivityCaloriesBurnt` from (((`user_table` join `athlete_table` on((`user_table`.`UserID` = `athlete_table`.`UserID`))) join `activity_table` on((`athlete_table`.`AthleteID` = `activity_table`.`AthleteID`))) join `allactivity_table` on((`activity_table`.`ActivityID` = `allactivity_table`.`ActivityID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patienttreatmentview`
--

/*!50001 DROP VIEW IF EXISTS `patienttreatmentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patienttreatmentview` AS select `user_table`.`UserID` AS `UserID`,`patient_table`.`PatientID` AS `patientID`,`user_table`.`UserName` AS `UserName`,`patient_table`.`PatientIsDiabetic` AS `PatientIsDiabetic`,`patient_table`.`PatientSystemSuggestion` AS `PatientSystemSuggestion`,`doctor_table`.`DoctorName` AS `DoctorName`,`treatment_table`.`TreatmentDescription` AS `TreatmentDescription` from (((`user_table` join `patient_table` on((`user_table`.`UserID` = `patient_table`.`UserID`))) join `doctor_table` on((`patient_table`.`DoctorID` = `doctor_table`.`DoctorID`))) join `treatment_table` on((`doctor_table`.`DoctorID` = `treatment_table`.`DoctorID`))) where (`user_table`.`UserID` = 12) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `systemdiabeticsuggestions`
--

/*!50001 DROP VIEW IF EXISTS `systemdiabeticsuggestions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `systemdiabeticsuggestions` AS select `user_table`.`UserID` AS `userID`,`user_table`.`UserName` AS `UserName`,`patient_table`.`PatientID` AS `patientID`,`patient_table`.`PatientIsDiabetic` AS `patientisdiabetic`,`patient_table`.`PatientSystemSuggestion` AS `patientSystemSuggestion`,`diabeticmeasure_table`.`DiabeticMeasureFSGLevel` AS `DiabeticmeasureFSGLevel`,`diabeticmeasure_table`.`DiabeticMeasureFPGLevel` AS `DiabeticmeasureFPGLevel` from ((`user_table` join `patient_table` on((`user_table`.`UserID` = `patient_table`.`UserID`))) join `diabeticmeasure_table` on((`diabeticmeasure_table`.`PatientID` = `patient_table`.`PatientID`))) where (`patient_table`.`PatientIsDiabetic` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `athleteactivityview`
--

/*!50001 DROP VIEW IF EXISTS `athleteactivityview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `athleteactivityview` AS select `user_table`.`UserID` AS `UserID`,`athlete_table`.`AthleteID` AS `AthleteID`,`user_table`.`UserName` AS `UserName`,`athlete_table`.`AthleteHeight` AS `AthleteHeight`,`athlete_table`.`athleteweight` AS `athleteweight`,`athlete_table`.`athletebmi` AS `athletebmi`,`allactivity_table`.`ActivityName` AS `ActivityName`,`activity_table`.`ActivityCaloriesBurnt` AS `ActivityCaloriesBurnt` from (((`user_table` join `athlete_table` on((`user_table`.`UserID` = `athlete_table`.`UserID`))) join `activity_table` on((`athlete_table`.`AthleteID` = `activity_table`.`AthleteID`))) join `allactivity_table` on((`activity_table`.`ActivityID` = `allactivity_table`.`ActivityID`))) where (`user_table`.`UserID` = 7) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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

-- Dump completed on 2015-12-09 14:01:39
