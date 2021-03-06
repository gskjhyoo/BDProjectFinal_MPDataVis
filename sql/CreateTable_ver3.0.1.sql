-- MySQL Script generated by MySQL Workbench
-- 08/18/15 00:07:05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MPDatabase
-- -----------------------------------------------------
-- Korea Data Base -P- Project Data Base in MySQL

-- -----------------------------------------------------
-- Schema MPDatabase
--
-- Korea Data Base -P- Project Data Base in MySQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MPDatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `MPDatabase` ;

-- -----------------------------------------------------
-- Table `MPDatabase`.`PERSON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`PERSON` (
  `PERSON_ID` INT(8) NOT NULL,
  PRIMARY KEY (`PERSON_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`M_SPECIFICATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`M_SPECIFICATION` (
  `PERSON_ID` INT(8) NOT NULL,
  `KEY_SEQ` VARCHAR(12) NOT NULL,
  `YKIHO_ID` INT(6) NULL,
  `RECU_FR_DT` VARCHAR(8) NOT NULL,
  `FORM_CD` VARCHAR(2) NULL,person
  `DSBJT_CD` VARCHAR(2) NULL,
  `MAIN_SICK` VARCHAR(6) NULL,
  `SUB_SICK` VARCHAR(6) NULL,
  `IN_PAT_CORS_TYPE` VARCHAR(2) NULL,
  `OFFC_INJ_TYPE` VARCHAR(1) NULL,
  `RECN` INT(3) NULL,
  `VSCN` INT(3) NULL,
  `FST_IN_PAT_DT` VARCHAR(8) NULL,
  `DMD_TRAMT` INT(8) NULL,
  `DMD_SBRDN_AMT` INT(8) NULL,
  `DMD_JBRDN_AMT` INT(8) NULL,
  `DMD_CT_TOT_AMT` INT(8) NULL,
  `DMD_MRI_TOT_AMT` INT(8) NULL,
  `EDEC_ADD_RT` INT(3) NULL,
  `EDEC_TRAMT` INT(8) NULL,
  `EDEC_SBRDN_AMT` INT(8) NULL,
  `EDEC_JBRDN_AMT` INT(8) NULL,
  `EDEC_CT_TOT_AMT` INT(8) NULL,
  `EDEC_MRI_TOT_AMT` INT(8) NULL,
  `DMD_DRG_NO` VARCHAR(10) NULL,
  `MPRSC_ISSUE_ADMIN_ID` INT(6) NULL,
  `MPRSC_GRANT_NO` VARCHAR(13) NULL,
  `TOT_PRES_DD_CNT` INT(3) NULL,
  PRIMARY KEY (`KEY_SEQ`),
  INDEX `fk_명세서_개_idx` (`PERSON_ID` ASC),
  CONSTRAINT `fk_명세서_개`
    FOREIGN KEY (`PERSON_ID`)
    REFERENCES `MPDatabase`.`PERSON` (`PERSON_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`M_MEDICAL_DETAIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`M_MEDICAL_DETAIL` (
  `KEY_SEQ` VARCHAR(12) NOT NULL,
  `SEQ_NO` INT(4) NOT NULL,
  `RECU_FR_DT` VARCHAR(8) NULL,
  `CLAUSE_CD` VARCHAR(2) NULL,
  `ITEM_CD` VARCHAR(2) NULL,
  `DIV_TYPE_CD` VARCHAR(1) NULL,
  `DIV_CD` VARCHAR(9) NULL,
  `I_II_TYPE` VARCHAR(1) NULL,
  `UN_COST` INT(8) NULL,
  `AMT` INT(8) NULL,
  `DD_MQTY_EXEC_FREQ` INT(8) NULL,
  `MDCN_EXEC_FREQ` INT(8) NULL,
  `DD_MQTY_FREQ` INT(8) NULL,
  PRIMARY KEY (`KEY_SEQ`, `SEQ_NO`),
  INDEX `fk_진료내역_명세서1_idx` (`KEY_SEQ` ASC),
  CONSTRAINT `fk_진료내역_명세서1`
    FOREIGN KEY (`KEY_SEQ`)
    REFERENCES `MPDatabase`.`M_SPECIFICATION` (`KEY_SEQ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`M_SB_DETAIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`M_SB_DETAIL` (
  `KEY_SEQ` VARCHAR(12) NOT NULL,
  `SEQ_NO` INT(4) NOT NULL,
  `RECU_FR_DT` VARCHAR(8) NULL,
  `DSBJT_CD` VARCHAR(2) NULL,
  `SICK_SYM` VARCHAR(6) NULL,
  PRIMARY KEY (`KEY_SEQ`, `SEQ_NO`),
  INDEX `fk_상병내역_명세서1_idx` (`KEY_SEQ` ASC),
  CONSTRAINT `fk_상병내역_명세서1`
    FOREIGN KEY (`KEY_SEQ`)
    REFERENCES `MPDatabase`.`M_SPECIFICATION` (`KEY_SEQ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`M_MEDICAL_DB_SPECIFI_SUB_DETAIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`M_MEDICAL_DB_SPECIFI_SUB_DETAIL` (
  `KEY_SEQ` VARCHAR(12) NOT NULL,
  `SEQ_NO` INT(4) NOT NULL,
  `RECU_FR_DT` VARCHAR(8) NULL,
  `DIV_TYPE_CD` VARCHAR(1) NULL,
  `DIV_CD` VARCHAR(9) NULL,
  `GNL_NM_CD` VARCHAR(9) NULL,
  `DD_MQTY_FREQ` INT(8) NULL,
  `DD_EXEC_FREQ` INT(8) NULL,
  `MDCN_EXEC_FREQ` INT(8) NULL,
  `UN_COST` INT(8) NULL,
  `AMT` INT(8) NULL,
  PRIMARY KEY (`KEY_SEQ`, `SEQ_NO`),
  INDEX `fk_진료DB처방전교부상세내역_명세서1_idx` (`KEY_SEQ` ASC),
  CONSTRAINT `fk_진료DB처방전교부상세내역_명세서1`
    FOREIGN KEY (`KEY_SEQ`)
    REFERENCES `MPDatabase`.`M_SPECIFICATION` (`KEY_SEQ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`CERTIFICATION_DB_LAYOUT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`CERTIFICATION_DB_LAYOUT` (
  `PERSON_ID` INT(8) NOT NULL,
  `STND_Y` VARCHAR(4) NULL,
  `SEX` VARCHAR(1) NULL,
  `AGE_GROUP` VARCHAR(2) NULL,
  `DTH_YM` VARCHAR(6) NULL,
  `DTH_CODE1` VARCHAR(14) NULL,
  `DTH_CODE2` VARCHAR(14) NULL,
  `SIDO` VARCHAR(2) NULL,
  `SGG` VARCHAR(5) NULL,
  `IPSN_TYPE_CD` VARCHAR(1) NULL,
  `CTRB_PT_TYPE_CD` VARCHAR(2) NULL,
  `DFAB_GRD_CD` VARCHAR(1) NULL,
  `DFAB_PTN_CD` VARCHAR(1) NULL,
  `DFAV_REG_YM` VARCHAR(6) NULL,
  PRIMARY KEY (`PERSON_ID`),
  CONSTRAINT `fk_자격DB레이아웃_개인1`
    FOREIGN KEY (`PERSON_ID`)
    REFERENCES `MPDatabase`.`PERSON` (`PERSON_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`P_SPECIFICATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`P_SPECIFICATION` (
  `PERSON_ID` INT(8) NOT NULL,
  `KEY_SEQ` VARCHAR(12) NOT NULL,
  `YKIHO_ID` INT(6) NULL,
  `RECU_FR_DT` VARCHAR(8) NOT NULL,
  `FORM_CD` VARCHAR(2) NULL,
  `DSBJT_CD` VARCHAR(2) NULL,
  `MAIN_SICK` VARCHAR(6) NULL,
  `SUB_SICK` VARCHAR(6) NULL,
  `IN_PAT_CORS_TYPE` VARCHAR(2) NULL,
  `OFFC_INJ_TYPE` VARCHAR(1) NULL,
  `RECN` INT(3) NULL,
  `VSCN` INT(3) NULL,
  `FST_IN_PAT_DT` VARCHAR(8) NULL,
  `DMD_TRAMT` INT(8) NULL,
  `DMD_SBRDN_AMT` INT(8) NULL,
  `DMD_JBRDN_AMT` INT(8) NULL,
  `DMD_CT_TOT_AMT` INT(8) NULL,
  `DMD_MRI_TOT_AMT` INT(8) NULL,
  `EDEC_ADD_RT` INT(3) NULL,
  `EDEC_TRAMT` INT(8) NULL,
  `EDEC_SBRDN_AMT` INT(8) NULL,
  `EDEC_JBRDN_AMT` INT(8) NULL,
  `EDEC_CT_TOT_AMT` INT(8) NULL,
  `EDEC_MRI_TOT_AMT` INT(8) NULL,
  `DMD_DRG_NO` VARCHAR(10) NULL,
  `MPRSC_ISSUE_ADMIN_ID` INT(6) NULL,
  `MPRSC_GRANT_NO` VARCHAR(13) NULL,
  `TOT_PRES_DD_CNT` INT(3) NULL,
  PRIMARY KEY (`KEY_SEQ`),
  INDEX `fk_명세서_개_idx` (`PERSON_ID` ASC),
  CONSTRAINT `fk_명세서_개0`
    FOREIGN KEY (`PERSON_ID`)
    REFERENCES `MPDatabase`.`PERSON` (`PERSON_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MPDatabase`.`P_MEDICAL_DETAIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MPDatabase`.`P_MEDICAL_DETAIL` (
  `KEY_SEQ` VARCHAR(12) NOT NULL,
  `SEQ_NO` INT(4) NOT NULL,
  `RECU_FR_DT` VARCHAR(8) NULL,
  `CLAUSE_CD` VARCHAR(2) NULL,
  `ITEM_CD` VARCHAR(2) NULL,
  `DIV_TYPE_CD` VARCHAR(1) NULL,
  `DIV_CD` VARCHAR(9) NULL,
  `I_II_TYPE` VARCHAR(1) NULL,
  `UN_COST` INT(8) NULL,
  `AMT` INT(8) NULL,
  `DD_MQTY_EXEC_FREQ` INT(8) NULL,
  `MDCN_EXEC_FREQ` INT(8) NULL,
  `DD_MQTY_FREQ` INT(8) NULL,
  PRIMARY KEY (`KEY_SEQ`, `SEQ_NO`),
  INDEX `fk_진료내역_명세서1_idx` (`KEY_SEQ` ASC),
  CONSTRAINT `fk_진료내역_명세서10`
    FOREIGN KEY (`KEY_SEQ`)
    REFERENCES `MPDatabase`.`P_SPECIFICATION` (`KEY_SEQ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
