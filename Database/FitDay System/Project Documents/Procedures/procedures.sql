-- create procedure to calculate user age
DELIMITER $$

drop procedure if exists CalculateAge;

CREATE PROCEDURE `CalculateAge`(in ID int)
BEGIN
Declare age int;
SET age = (SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),(select UserDOB from user_table where UserID = ID))), '%Y'));
update user_table set UserAge = age where UserID = ID;
END$$
DELIMITER ;

-- call procedure CalculateAge

call CalculateAge(1);


-- create procedure to calculate BMI
DELIMITER $$

drop procedure if exists CalculateBMI;

CREATE PROCEDURE `CalculateBMI`(in ID int)
Begin
declare BMI double;
declare height int;
declare weight double;
select AthleteHeight, AthleteWeight from athlete_table where AthleteID = ID into height,weight;
set BMI = (weight * 4500)/(height * height);
select BMI;
update athlete_table set AthleteBMI = BMI where AthleteID = ID;
END$$
DELIMITER ;

-- call procedure CalculateBMI
call CalculateBMI(1);


-- create procedure to calculate Calories Burnt

DELIMITER $$
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

-- Running (9-minute mile) calories burned per pound per minute constant: 0.087

ELSEIF activID = 3 THEN 											-- Activity running
SET calories = 0.087 * minutes * weight;

-- Weight training, circuit training calories burned per pound per minute constant: 0.042 //

ELSEIF activID = 4 THEN 											-- Heavy Lifting
SET calories = 0.042 * weight * minutes;

-- Swimming, crawl, fast calories burned per pound per minute constant: 0.071 //

ELSEIF activID = 1 THEN 											-- Activity Swimming
SET calories = 0.071* weight * minutes;
END IF;


update activity_table 
set activity_table.ActivityCaloriesBurnt = calories 
where activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID AND activity_table.DeviceID = devID;

END$$
DELIMITER ;

-- call procedure CalculateCaloriesBurnt
call CalculateCaloriesBurnt(1,12,5,1);


-- create function to calculate Cube

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateCube`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num * num;
RETURN result;
END$$
DELIMITER ;

-- call procedure to calculateCube
select CalculateCube(10);

-- create function to calculate square

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateSquare`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num;
RETURN result;
END$$
DELIMITER ;

-- call procedure to calculateSquare
select CalculateSquare(10);



-- Update Trigger to fill data in remedy table according to heart rate

DELIMITER $$

CREATE TRIGGER  Alert_After_HeartRate_Update AFTER UPDATE ON activity_table

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
    END$$
DELIMITER ;

-- call Trigger automatically on update of activity table

update activity_table set activity_table.ActivityMaxHeartRate = 220 
where activity_table.AthleteID = 1 AND activity_table.UserID = 12
AND activity_table.ActivityID = 3 AND activity_table.DeviceID = 1;

-- Insert Trigger to fill data in remedy table according to heart rate. Please write this same as Update.

DELIMITER $$

CREATE TRIGGER  Alert_After_HeartRate_Insert AFTER INSERT ON activity_table

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
    END$$
DELIMITER ;
-- Delete Trigger to delete data in remedy table according activity table.

DELIMITER $$
CREATE TRIGGER  Alert_After_HeartRate_Delete AFTER DELETE ON activity_table

FOR EACH ROW
BEGIN	

	Delete FROM remedy_table where remedy_table.AthleteID = OLD.AthleteID AND
									remedy_table.UserID = OLD.UserID AND
									remedy_table.DeviceID = OLD.DeviceID AND
									remedy_table.ActivityID = OLD.ActivityID;
                                    
    END$$
DELIMITER ;
-- call Trigger automatically on Insert/Delete on activity table

-- create procedure to calculate Maximum heart rate
DELIMITER $$
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
END$$

DELIMITER ;

-- calling this procedure in trigger.

call GetMaxHR(age, @MaxHR);



-- ----------------------------------------------------------------------------------------------------------------------------



DELIMITER $$
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
END$$
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
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
END$$
DELIMITER ;

-- -----------------------------------------------------------------------------------------------------------------------------------------------


DELIMITER $$

CREATE TRIGGER  Check_Diabetic_Value_Update AFTER UPDATE ON diabeticmeasure_table

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
    patient_table.DoctorID = NEW.DoctorID AND
    patient_table.ClinicID = NEW.ClinicID
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
				patient_table.ClinicID = NEW.ClinicID AND
				patient_table.UserID = NEW.UserID AND
				patient_table.PatientID = NEW.PatientID ;
	END IF;
    END$$
DELIMITER ;


-- ------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE TRIGGER  Check_Diabetic_Value_Insert AFTER INSERT ON diabeticmeasure_table

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
    patient_table.DoctorID = NEW.DoctorID AND
    patient_table.ClinicID = NEW.ClinicID
    into isDiabetic;
        
        
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
            patient_table.ClinicID = NEW.ClinicID AND
            patient_table.UserID = NEW.UserID AND
            patient_table.PatientID = NEW.PatientID ;
            
    END$$
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER  Archive_After_UserTbl_Update AFTER UPDATE ON user_table

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
		userhistory_table.UserID,
		userhistory_table.DeviceID)
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
		OLD.UserID,
		OLD.DeviceID);
                                    
    END$$
DELIMITER ;

update user_table set user_table.UserName = "Ryan" where user_table.UserID = 7;

-- -------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE OR REPLACE VIEW `MyCalorieConsumption` AS

Select  user_table.userID, user_table.UserName,
 athlete_table.AthleteID, 
 activity_table.ActivityID, 
 allactivity_table.ActivityName ,
 activity_table.ActivityCaloriesBurnt
 From user_table INNER JOIN athlete_table 
 ON user_table.UserID = athlete_table.UserID
 INNER JOIN activity_table ON
 athlete_table.AthleteID = activity_table.AthleteID INNER JOIN
 allactivity_table ON activity_table.ActivityID = allactivity_table.ActivityID;

DELIMITER ;

-- ------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER  Add_AGE_After_PatientTable_Insert AFTER INSERT ON patient_table

FOR EACH ROW
BEGIN
	call CalculateAge(New.UserID);
END$$

DELIMITER ;

-- ------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER  Add_AGE_After_AthleteTable_Insert AFTER INSERT ON athlete_table

FOR EACH ROW
BEGIN
	call CalculateAge(New.UserID);
END$$

DELIMITER ;
-- ------------------------------------------------------------------------------------------------------------------------------------------------

Create index Measure_FPG_FSG_index ON  diabeticmeasure_table(diabeticmeasureFSGlevel, diabeticmeasureFPGlevel);

-- ------------------------------------------------------------------------------------------------------------------------------------------------
Create USER 'sysadmin' @'localhost' identified by 'sysadmin';
GRANT ALL privileges ON healthmonitoring.* to 'sysadmin' @'localhost';

-- ------------------------------------------------------------------------------------------------------------------------------------------------
