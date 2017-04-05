

alter table activity_table
Add column ActivitySpeed float;
select * from activity_table;

update activity_table set ActivitySpeed = 15;
update activity_table set ActivityDistance = null where ActivityDistance = 0;

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

END$$
DELIMITER ;

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

update diabeticmeasure_table Set DiabeticMeasureFPGLevel = 200.1 where PatientID = 10 AND DoctorID = 10;

Select * from diabeticmeasure_table;
select * from patient_table;
drop TRIGGER  Check_Diabetic_Value_Update;

desc Athlete_Table;

ALTER TABLE User_Table ADD  PRIMARY KEY (UserID,DeviceID);
ALTER TABLE `User_Table` ADD UNIQUE `UserPhoneNumber` (`UserPhoneNumber`);



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
SET calories = 0.071 * weight * minutes;
END IF;

update activity_table 
set activity_table.ActivityCaloriesBurnt = calories 
where activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID AND activity_table.DeviceID = devID;

END$$

DELIMITER ;


call CalculateCaloriesBurnt(2,7,4,1);
select 123;
select * from activity_table;




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


call GetMaxHR(22, @hr);
select @hr;

select * from activity_table;
select * from user_table;
