/*
Created: 16-11-2015
Modified: 07-12-2015
Project: Health Monitoring System
Model: MySQL 5.6
Company: Northeastern University
Author: Data Revolvers
Version: 1.1
Database: MySQL 5.6
*/


-- Create tables section -------------------------------------------------

-- Table AllDevices_Table

CREATE TABLE `AllDevices_Table`
(
  `DeviceID` Smallint NOT NULL,
  `DeviceName` Char(20),
  `DeviceDescription` Varchar(200),
  `DevicePrice` Double,
  `DeviceRechargeCycles` Int,
  `DeviceChargeTime` Int,
  `DeviceRadioConn` Char(20),
  `DeviceOpTempLow` Float,
  `DeviceOpTempHigh` Float,
  `DeviceAltitudeMax` Int
)
;

ALTER TABLE `AllDevices_Table` ADD  PRIMARY KEY (`DeviceID`)
;

-- Table User_Table

CREATE TABLE `User_Table`
(
  `UserID` Int NOT NULL,
  `UserName` Char(30) NOT NULL,
  `UserAddress` Varchar(80),
  `UserCity` Char(20),
  `UserZipCode` Char(20),
  `UserPhoneNumber` Char(15) NOT NULL,
  `UserDOB` Date NOT NULL,
  `UserAge` Smallint,
  `UserGender` Char(6),
  `DeviceID` Smallint NOT NULL
)
;

ALTER TABLE `User_Table` ADD  PRIMARY KEY (`UserID`,`DeviceID`)
;

ALTER TABLE `User_Table` ADD UNIQUE `UserPhoneNumber` (`UserPhoneNumber`)
;

-- Table UserHistory_Table

CREATE TABLE `UserHistory_Table`
(
  `UserHistoryID` Char(20) NOT NULL,
  `UserName` Char(30) NOT NULL,
  `UserAddress` Varchar(80),
  `UserCity` Char(20),
  `UserZipCode` Char(20),
  `UserPhoneNumber` Char(15) NOT NULL,
  `UserDOB` Date NOT NULL,
  `UserAge` Smallint,
  `UserGender` Char(6),
  `UserUpdatedBy` Char(20),
  `UserUpdateDate` Date,
  `UserID` Int NOT NULL,
  `DeviceID` Smallint NOT NULL
)
;

ALTER TABLE `UserHistory_Table` ADD  PRIMARY KEY (`UserHistoryID`,`UserID`,`DeviceID`)
;

ALTER TABLE `UserHistory_Table` ADD UNIQUE `UserPhoneNumber` (`UserPhoneNumber`)
;

-- Table Athlete_Table

CREATE TABLE `Athlete_Table`
(
  `AthleteID` Int NOT NULL,
  `AthleteHeight` Smallint NOT NULL
 COMMENT 'In centimeters',
  `AthleteWeight` Double(3,2) NOT NULL
 COMMENT 'InPounds',
  `AthleteBMI` Double(3,2),
  `AthleteSignCaptureDate` Date NOT NULL,
  `UserID` Int NOT NULL,
  `DeviceID` Smallint NOT NULL
)
;

ALTER TABLE `Athlete_Table` ADD  PRIMARY KEY (`AthleteID`,`UserID`,`DeviceID`)
;

-- Table SafeHeartRate_Table

CREATE TABLE `SafeHeartRate_Table`
(
  `ShrAgeMin` Smallint,
  `ShrAgeMax` Smallint,
  `ShrMinHR` Smallint,
  `ShrMaxHR` Smallint
)
;

-- Table Activity_Table

CREATE TABLE `Activity_Table`
(
  `ActivityDistance` Double
 COMMENT 'Distance in miles',
  `ActivityTimeInterval` Smallint,
  `ActivityCaloriesBurnt` Int,
  `ActivityDate` Date,
  `ActivityMaxHeartRate` Smallint,
  `AthleteID` Int NOT NULL,
  `UserID` Int NOT NULL,
  `ActivityID` Smallint NOT NULL,
  `DeviceID` Smallint NOT NULL
)
;

ALTER TABLE `Activity_Table` ADD  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`,`DeviceID`)
;

-- Table Remedy_Table

CREATE TABLE `Remedy_Table`
(
  `AthleteID` Int NOT NULL,
  `UserID` Int NOT NULL,
  `ActivityID` Smallint NOT NULL,
  `RemedyID` Smallint NOT NULL,
  `DeviceID` Smallint NOT NULL
)
;

ALTER TABLE `Remedy_Table` ADD  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`,`RemedyID`,`DeviceID`)
;

-- Table Patient_Table

CREATE TABLE `Patient_Table`
(
  `PatientID` Int NOT NULL,
  `PatientIsDiabetic` Bool,
  `PatientSystemSuggestion` Varchar(100),
  `UserID` Int NOT NULL,
  `DeviceID` Smallint NOT NULL,
  `DoctorID` Int NOT NULL,
  `ClinicID` Int NOT NULL
)
;

ALTER TABLE `Patient_Table` ADD  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
;

ALTER TABLE `Patient_Table` ADD UNIQUE `PatientID` (`PatientID`)
;

-- Table PatientHistory_Table

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

ALTER TABLE `PatientHistory_Table` ADD UNIQUE `PatientID` (`PatientID`)
;

-- Table DiabeticMeasure_Table

CREATE TABLE `DiabeticMeasure_Table`
(
  `DiabeticMeasureFSGLevel` Double,
  `DiabeticMeasureFPGLevel` Double,
  `DiabeticMeasuresDate` Date,
  `PatientID` Int NOT NULL,
  `UserID` Int NOT NULL,
  `DeviceID` Smallint NOT NULL,
  `DoctorID` Int NOT NULL,
  `ClinicID` Int NOT NULL
)
;

ALTER TABLE `DiabeticMeasure_Table` ADD  PRIMARY KEY (`PatientID`,`UserID`,`DeviceID`,`DoctorID`,`ClinicID`)
;

-- Table DiabeticReferenceMeasures_Table

CREATE TABLE `DiabeticReferenceMeasures_Table`
(
  `DiabeticRefAgeMin` Smallint,
  `DiabeticRefGender` Char(10),
  `DiabeticRefFSGHigh` Double,
  `DiabeticRefFPGHigh` Double,
  `DiabeticRefFSGLow` Double,
  `DiabeticRefFPGLow` Double,
  `DiabeticRefAgeMax` Smallint
)
;

-- Table NonDiabeticReferenceMeasures_Table

CREATE TABLE `NonDiabeticReferenceMeasures_Table`
(
  `NonDiabeticRefFSGHigh` Double,
  `NonDiabeticRefFPGHigh` Double,
  `NonDiabeticRefAgeMin` Smallint,
  `NonDiabeticRefGender` Char(10),
  `NonDiabeticRefFPGLow` Double,
  `NonDiabeticRefFSGLow` Double,
  `NonDiabeticRefAgeMax` Smallint
)
;

-- Table Doctor_Table

CREATE TABLE `Doctor_Table`
(
  `DoctorID` Int NOT NULL,
  `DoctorName` Char(20),
  `DoctorPhoneNumber` Char(20),
  `ClinicID` Int NOT NULL
)
;

ALTER TABLE `Doctor_Table` ADD  PRIMARY KEY (`DoctorID`,`ClinicID`)
;

ALTER TABLE `Doctor_Table` ADD UNIQUE `DoctorID` (`DoctorID`)
;

-- Table Clinic_Table

CREATE TABLE `Clinic_Table`
(
  `ClinicID` Int NOT NULL,
  `ClinicName` Char(30),
  `ClinicAddress` Varchar(50),
  `ClinicCity` Char(20),
  `ClinicZipCode` Char(20)
)
;

ALTER TABLE `Clinic_Table` ADD  PRIMARY KEY (`ClinicID`)
;

ALTER TABLE `Clinic_Table` ADD UNIQUE `ClinicID` (`ClinicID`)
;

-- Table Treatment_Table

CREATE TABLE `Treatment_Table`
(
  `TreatmentID` Int NOT NULL,
  `TreatmentDuration` Int,
  `TreatmentDescription` Varchar(200),
  `DoctorID` Int NOT NULL,
  `ClinicID` Int NOT NULL
)
;

ALTER TABLE `Treatment_Table` ADD  PRIMARY KEY (`TreatmentID`,`DoctorID`,`ClinicID`)
;

-- Table AllActivity_Table

CREATE TABLE `AllActivity_Table`
(
  `ActivityID` Smallint NOT NULL,
  `ActivityName` Char(20) NOT NULL
)
;

ALTER TABLE `AllActivity_Table` ADD  PRIMARY KEY (`ActivityID`)
;

-- Table AllRemedy_Table

CREATE TABLE `AllRemedy_Table`
(
  `RemedyID` Smallint NOT NULL,
  `RemedyDescription` Varchar(200)
)
;

ALTER TABLE `AllRemedy_Table` ADD  PRIMARY KEY (`RemedyID`)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `Athlete_Table` ADD CONSTRAINT `IsA` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `Performs` FOREIGN KEY (`AthleteID`, `UserID`, `DeviceID`) REFERENCES `Athlete_Table` (`AthleteID`, `UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DiabeticMeasure_Table` ADD CONSTRAINT `SampleMeasures` FOREIGN KEY (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Treatment_Table` ADD CONSTRAINT `Suggests` FOREIGN KEY (`DoctorID`, `ClinicID`) REFERENCES `Doctor_Table` (`DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Patient_Table` ADD CONSTRAINT `CanBeA` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `UserHistory_Table` ADD CONSTRAINT `UserHistoryMaintained` FOREIGN KEY (`UserID`, `DeviceID`) REFERENCES `User_Table` (`UserID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `PatientHistory_Table` ADD CONSTRAINT `ArchievedIn` FOREIGN KEY (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DeviceID`, `DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `ConsistsOf` FOREIGN KEY (`ActivityID`) REFERENCES `AllActivity_Table` (`ActivityID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Remedy_Table` ADD CONSTRAINT `Recommends` FOREIGN KEY (`AthleteID`, `UserID`, `ActivityID`, `DeviceID`) REFERENCES `Activity_Table` (`AthleteID`, `UserID`, `ActivityID`, `DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `ComparedWith` FOREIGN KEY () REFERENCES `SafeHeartRate_Table` () ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Remedy_Table` ADD CONSTRAINT `ComprisesOf` FOREIGN KEY (`RemedyID`) REFERENCES `AllRemedy_Table` (`RemedyID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DiabeticMeasure_Table` ADD CONSTRAINT `NonDiabeticReferences` FOREIGN KEY () REFERENCES `NonDiabeticReferenceMeasures_Table` () ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DiabeticMeasure_Table` ADD CONSTRAINT `DiabeticReferences` FOREIGN KEY () REFERENCES `DiabeticReferenceMeasures_Table` () ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `User_Table` ADD CONSTRAINT `usedBy` FOREIGN KEY (`DeviceID`) REFERENCES `AllDevices_Table` (`DeviceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Doctor_Table` ADD CONSTRAINT `hasA` FOREIGN KEY (`ClinicID`) REFERENCES `Clinic_Table` (`ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Patient_Table` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`DoctorID`, `ClinicID`) REFERENCES `Doctor_Table` (`DoctorID`, `ClinicID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

