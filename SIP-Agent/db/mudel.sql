SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`firma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`firma` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`firma` (
  `firma_id` INT NOT NULL ,
  `firma_nimi` VARCHAR(45) NULL ,
  PRIMARY KEY (`firma_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`isikud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`isikud` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`isikud` (
  `isik_id` INT NOT NULL ,
  `eesnimi` VARCHAR(45) NULL COMMENT '\n' ,
  `perek_nimi` VARCHAR(45) NULL ,
  `firma_id` INT NOT NULL ,
  PRIMARY KEY (`isik_id`) ,
  INDEX `fk_isikud_firma1` (`firma_id` ASC) ,
  CONSTRAINT `fk_isikud_firma1`
    FOREIGN KEY (`firma_id` )
    REFERENCES `mydb`.`firma` (`firma_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tel_raamat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tel_raamat` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tel_raamat` (
  `kontakti_id` INT NOT NULL ,
  `tel_nr` INT NOT NULL ,
  `mobiil_nr` INT NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `isik_id` INT NOT NULL ,
  PRIMARY KEY (`kontakti_id`) ,
  UNIQUE INDEX `kontakti_id_UNIQUE` (`kontakti_id` ASC) ,
  INDEX `fk_tel_raamat_isikud1` (`isik_id` ASC) ,
  CONSTRAINT `fk_tel_raamat_isikud1`
    FOREIGN KEY (`isik_id` )
    REFERENCES `mydb`.`isikud` (`isik_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`liik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`liik` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`liik` (
  `liik_id` INT NOT NULL ,
  `too_liik` VARCHAR(45) NULL ,
  PRIMARY KEY (`liik_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`staatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`staatus` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`staatus` (
  `staatus_id` INT NOT NULL ,
  `staatus` VARCHAR(45) NULL ,
  PRIMARY KEY (`staatus_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tood` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tood` (
  `too_id` INT NOT NULL ,
  `too_kirjeldus` MEDIUMTEXT  NULL ,
  `teataja_id` VARCHAR(45) NOT NULL ,
  `vastutaja_id` VARCHAR(45) NULL ,
  `liik_id` INT NOT NULL ,
  `staatus_id` INT NOT NULL ,
  PRIMARY KEY (`too_id`) ,
  INDEX `fk_tood_isikud1` (`teataja_id` ASC) ,
  INDEX `fk_tood_liik1` (`liik_id` ASC) ,
  INDEX `fk_tood_staatus1` (`staatus_id` ASC) ,
  CONSTRAINT `fk_tood_isikud1`
    FOREIGN KEY (`teataja_id` )
    REFERENCES `mydb`.`isikud` (`isik_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tood_liik1`
    FOREIGN KEY (`liik_id` )
    REFERENCES `mydb`.`liik` (`liik_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tood_staatus1`
    FOREIGN KEY (`staatus_id` )
    REFERENCES `mydb`.`staatus` (`staatus_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`kone_kirjed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`kone_kirjed` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`kone_kirjed` (
  `kirje_id` INT NOT NULL ,
  `kokkuvote` VARCHAR(45) NOT NULL ,
  `kontakti_id` INT NOT NULL ,
  `algus` DATETIME NULL ,
  `lopp` DATETIME NULL ,
  `too_id` INT NULL ,
  `isik_id` INT NULL ,
  PRIMARY KEY (`kirje_id`) ,
  INDEX `fk_kone_kirjed_tel_raamat1` (`kontakti_id` ASC) ,
  INDEX `fk_kone_kirjed_tood1` (`too_id` ASC) ,
  INDEX `fk_kone_kirjed_isikud1` (`isik_id` ASC) ,
  CONSTRAINT `fk_kone_kirjed_tel_raamat1`
    FOREIGN KEY (`kontakti_id` )
    REFERENCES `mydb`.`tel_raamat` (`kontakti_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kone_kirjed_tood1`
    FOREIGN KEY (`too_id` )
    REFERENCES `mydb`.`tood` (`too_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kone_kirjed_isikud1`
    FOREIGN KEY (`isik_id` )
    REFERENCES `mydb`.`isikud` (`isik_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
