-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospital_mgmt_sys
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hospital_mgmt_sys` ;

-- -----------------------------------------------------
-- Schema hospital_mgmt_sys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital_mgmt_sys` DEFAULT CHARACTER SET utf8 ;
USE `hospital_mgmt_sys` ;

-- -----------------------------------------------------
-- Table `ward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward` ;

CREATE TABLE IF NOT EXISTS `ward` (
  `WARDid` INT(11) NOT NULL COMMENT '',
  `WARDname` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `WARDtotal_rooms` INT(11) NULL DEFAULT NULL COMMENT '',
  `WARDcapacity` INT(11) NULL DEFAULT NULL COMMENT '',
  `WARDfacilities` VARCHAR(200) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`WARDid`)  COMMENT '',
  UNIQUE INDEX `WARDid_UNIQUE` (`WARDid` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `room` ;

CREATE TABLE IF NOT EXISTS `room` (
  `ROOMnum` INT(11) NOT NULL COMMENT '',
  `WARDid` INT(11) NOT NULL COMMENT '',
  `ROOMno_of_beds` INT(11) NULL DEFAULT NULL COMMENT '',
  `ROOMmaintenance_comments` VARCHAR(400) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`ROOMnum`, `WARDid`)  COMMENT '',
  UNIQUE INDEX `ROOMnum_UNIQUE` (`ROOMnum` ASC)  COMMENT '',
  UNIQUE INDEX `WARDid_UNIQUE` (`WARDid` ASC)  COMMENT '',
  CONSTRAINT `fk_ward_room`
    FOREIGN KEY (`WARDid`)
    REFERENCES `ward` (`WARDid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bed` ;

CREATE TABLE IF NOT EXISTS `bed` (
  `BEDid` INT(11) NOT NULL COMMENT '',
  `ROOMnum` INT(11) NOT NULL COMMENT '',
  `WARDid` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`BEDid`, `ROOMnum`, `WARDid`)  COMMENT '',
  INDEX `fk_bed_room_idx` (`ROOMnum` ASC, `WARDid` ASC)  COMMENT '',
  CONSTRAINT `fk_bed_room`
    FOREIGN KEY (`ROOMnum` , `WARDid`)
    REFERENCES `room` (`ROOMnum` , `WARDid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patient` ;

CREATE TABLE IF NOT EXISTS `patient` (
  `PATIENTid` INT(11) NOT NULL COMMENT '',
  `PATIENTname` VARCHAR(100) NOT NULL COMMENT '',
  `PATIENTstreet` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `PATIENTcity` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `PATIENTzip` INT(11) NULL DEFAULT NULL COMMENT '',
  `PATIENThouse_no` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `PATIENTemer_cont_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `PATIENTemer_cont_no` DECIMAL NULL COMMENT '',
  PRIMARY KEY (`PATIENTid`)  COMMENT '',
  UNIQUE INDEX `Patientid_UNIQUE` (`PATIENTid` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `admitted`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `admitted` ;

CREATE TABLE IF NOT EXISTS `admitted` (
  `PATIENTid` INT(11) NOT NULL COMMENT '',
  `BEDid` INT(11) NOT NULL COMMENT '',
  `ADMITTEDdate` DATETIME NOT NULL COMMENT '',
  `ADMITTEDdischarge_date` DATETIME NULL DEFAULT NULL COMMENT '',
  `ADMITTEDreason` VARCHAR(400) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`PATIENTid`, `BEDid`, `ADMITTEDdate`)  COMMENT '',
  INDEX `fk_bed_admit_idx` (`BEDid` ASC)  COMMENT '',
  CONSTRAINT `fk_bed_admit`
    FOREIGN KEY (`BEDid`)
    REFERENCES `bed` (`BEDid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bed_pat`
    FOREIGN KEY (`PATIENTid`)
    REFERENCES `patient` (`PATIENTid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `EMPLOYEEid` INT(11) NOT NULL COMMENT '',
  `EMPLOYEEname` VARCHAR(100) NOT NULL COMMENT '',
  `EMPLOYEEjoin_date` DATE NOT NULL COMMENT '',
  `EMPLOYEEqualification` VARCHAR(50) NULL DEFAULT NULL COMMENT '',
  `EMPLOYEEpreferred_shift` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `EMPLOYEEsalary` FLOAT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`EMPLOYEEid`)  COMMENT '',
  UNIQUE INDEX `idEMPLOYEE_UNIQUE` (`EMPLOYEEid` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `doctor` ;

CREATE TABLE IF NOT EXISTS `doctor` (
  `EMPLOYEEid` INT(11) NOT NULL COMMENT '',
  `DOCTORspecialization` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`EMPLOYEEid`)  COMMENT '',
  UNIQUE INDEX `EMPLOYEEid_UNIQUE` (`EMPLOYEEid` ASC)  COMMENT '',
  CONSTRAINT `fk_doc_emp`
    FOREIGN KEY (`EMPLOYEEid`)
    REFERENCES `employee` (`EMPLOYEEid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `technician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `technician` ;

CREATE TABLE IF NOT EXISTS `technician` (
  `EMPLOYEEid` INT(11) NOT NULL COMMENT '',
  `TECHNICIANdepartment` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`EMPLOYEEid`)  COMMENT '',
  UNIQUE INDEX `EMPLOYEEid_UNIQUE` (`EMPLOYEEid` ASC)  COMMENT '',
  CONSTRAINT `fk_tech_employee`
    FOREIGN KEY (`EMPLOYEEid`)
    REFERENCES `employee` (`EMPLOYEEid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tests` ;

CREATE TABLE IF NOT EXISTS `tests` (
  `TESTSid` INT(11) NOT NULL COMMENT '',
  `TECHINICIANid` INT(11) NOT NULL COMMENT '',
  `DOCTORid` INT(11) NOT NULL COMMENT '',
  `PATIENTid` INT(11) NOT NULL COMMENT '',
  `TESTStype` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `TESTSdate` DATE NULL DEFAULT NULL COMMENT '',
  `TESTSresult_date` DATE NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`TESTSid`)  COMMENT '',
  INDEX `fk_tech_test_idx` (`TECHINICIANid` ASC)  COMMENT '',
  INDEX `fk_pat_test_idx` (`PATIENTid` ASC)  COMMENT '',
  INDEX `fk_doc_test_idx` (`DOCTORid` ASC)  COMMENT '',
  CONSTRAINT `fk_doc_test`
    FOREIGN KEY (`DOCTORid`)
    REFERENCES `doctor` (`EMPLOYEEid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pat_test`
    FOREIGN KEY (`PATIENTid`)
    REFERENCES `patient` (`PATIENTid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tech_test`
    FOREIGN KEY (`TECHINICIANid`)
    REFERENCES `technician` (`EMPLOYEEid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `treats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `treats` ;

CREATE TABLE IF NOT EXISTS `treats` (
  `DOCTORid` INT(11) NOT NULL COMMENT '',
  `PATIENTid` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`PATIENTid`, `DOCTORid`)  COMMENT '',
  INDEX `fk_treats_pat_idx` (`PATIENTid` ASC)  COMMENT '',
  INDEX `fk_treats_doc` (`DOCTORid` ASC)  COMMENT '',
  CONSTRAINT `fk_treats_doc`
    FOREIGN KEY (`DOCTORid`)
    REFERENCES `doctor` (`EMPLOYEEid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_treats_pat`
    FOREIGN KEY (`PATIENTid`)
    REFERENCES `patient` (`PATIENTid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
