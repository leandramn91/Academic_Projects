

-- Demo 1   (Calling a procedure)

-- call procedure CalculateCaloriesBurnt
-- CREATE PROCEDURE `CalculateCaloriesBurnt`(in athID int, in useID int, in activID int)
select * from activity_table;
call CalculateCaloriesBurnt(4,4,4);

-- Result
select * from activity_table;


-- Demo 2 (Invoking a Trigger)
update diabeticmeasure_table SET DiabeticMeasureFPGLevel = 104.4 where PatientID = 5 AND UserID = 8 AND DoctorID = 5;

-- Result
 select * from patient_table;
 select * from diabeticmeasure_table; 



UPDATE `monitorhealth`.`patient_table` SET `PatientSystemSuggestion`=NULL WHERE `PatientID`='5' and`UserID`='8' and`DoctorID`='5';


