

use healthmonitoring;
Desc patient_table;
desc patienthistory_table;
desc user_table;
desc diabeticmeasure_table;

alter table user_table
Drop foreign key;

ALTER TABLE `Patient_Table` ADD  PRIMARY KEY (`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
;

ALTER TABLE `PatientHistory_Table` ADD CONSTRAINT `ArchievedIn` FOREIGN KEY (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Patient_Table` ADD CONSTRAINT `CanBeA` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DiabeticMeasure_Table` ADD  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
;

ALTER TABLE `DiabeticMeasure_Table` ADD CONSTRAINT `SampleMeasures` FOREIGN KEY (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

desc user_table;

desc activity_table;
desc athlete_table;

ALTER TABLE `Athlete_Table` ADD  PRIMARY KEY (`AthleteID`,`UserID`,`DeviceID`)
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `ConsistsOf` FOREIGN KEY (`ActivityID`) REFERENCES `AllActivity_Table` (`ActivityID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `Performs` FOREIGN KEY (`AthleteID`, `UserID`, `DeviceID`) REFERENCES `Athlete_Table` (`AthleteID`, `UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Athlete_Table` ADD CONSTRAINT `IsA` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

desc userhistory_table;

desc user_table;
desc athlete_table;
desc patient_table;

select * from information_schema.TABLE_CONSTRAINTS where information_schema.TABLE_CONSTRAINTS.constraint_TYPE =  'FOREIGN KEY';

alter table user_table
drop foreign key usedBy;

ALTER TABLE `Athlete_Table` ADD CONSTRAINT `IsA` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Patient_Table` ADD CONSTRAINT `CanBeA` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `User_Table` ADD CONSTRAINT `usedBy` FOREIGN KEY (`DeviceID`) REFERENCES `AllDevices_Table` (`DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;



CREATE TABLE `UserDevice_Table`
(
  `UserID` Int NOT NULL,
  `DeviceID` Smallint NOT NULL
)
;

ALTER TABLE `UserDevice_Table` ADD  PRIMARY KEY (`UserID`,`DeviceID`)
;

ALTER TABLE `UserDevice_Table` ADD CONSTRAINT `uses` FOREIGN KEY (`UserID`) REFERENCES `User_Table` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `UserDevice_Table` ADD CONSTRAINT `usedBy` FOREIGN KEY (`DeviceID`) REFERENCES `AllDevices_Table` (`DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

update patient_table set PatientIsDiabetic = 1 where PatientID = 3;