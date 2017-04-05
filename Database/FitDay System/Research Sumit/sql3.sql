

select * from diabeticmeasure_table;
select * from patient_table;

Alter table treatment_table
drop column doctorID;

Alter table patient_table
MODIFY column PatientSystemSuggestion varchar(300);

Alter table diabeticmeasure_table
Add column ClinicID int;

Alter table diabeticmeasure_table
Add column DoctorID int;


insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.55,160.3,1,19,2,1,101);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.9,174.38,2,13,2,2,102);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (6.8,101.33,3,14,2,3,103);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (9.81,190.22,4,4,2,4,104);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.34,140.1,5,8,2,5,105);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.64,173.44,6,12,2,6,106);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.49,160.84,7,5,2,7,107);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (5.01,85.15,8,6,2,8,108);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.55,170.32,9,17,2,9,109);
insert into diabeticmeasure_table(DiabeticMeasureFSGLevel, DiabeticMeasureFPGLevel, PatientID,UserID, DeviceID,DoctorID,ClinicID) values (10.5,200.01,10,9,2,10,110);


drop trigger Check_Diabetic_Value_Update;

alter table patienthistory_table
Add column UserID int;

alter table patienthistory_table
Add column PatientID int;

alter table patienthistory_table
Add column DeviceID int;

ALTER TABLE `PatientHistory_Table` ADD CONSTRAINT `ArchievedIn` FOREIGN KEY (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `PatientHistory_Table` ADD UNIQUE `PatientID` (`PatientID`)
;
drop table patienthistory_table;

Alter table patienthistory_table
drop column patientID;

Alter table patienthistory_table
drop column DeviceID;

ALTER TABLE `PatientHistory_Table` ADD  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
;

CREATE TABLE `PatientHistory_Table`
(
  `PatientHistoryID` Int NOT NULL,
  `PatientDoctorName` Char(20),
  `PatientIsDiabetic` Bool,
  `PatientUpdatedBy` Char(20),
  `PatientUpdateDate` Date,
  `UserID` Int NOT NULL,
  `PatientID` Int NOT NULL,
  `DeviceID` Smallint NOT NULL,
  `DoctorID` Int NOT NULL,
  `ClinicID` Int NOT NULL
)
;

ALTER TABLE `PatientHistory_Table` ADD  PRIMARY KEY (`PatientHistoryID`,`PatientID`,`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
;

desc patient_table;

ALTER TABLE `Patient_Table` ADD  PRIMARY KEY (`DoctorID`,`ClinicID`)
;