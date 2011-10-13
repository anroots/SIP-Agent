SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `sip-agent` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sip-agent` ;

-- -----------------------------------------------------
-- Table `sip-agent`.`companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`companies` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`companies` (
  `id` INT NOT NULL ,
  `name` VARCHAR(60) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`persons` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`persons` (
  `id` INT NOT NULL ,
  `first_name` VARCHAR(45) NULL COMMENT '\n' ,
  `last_name` VARCHAR(45) NULL ,
  `company_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_isikud_firma1` (`company_id` ASC) ,
  CONSTRAINT `fk_isikud_firma1`
    FOREIGN KEY (`company_id` )
    REFERENCES `sip-agent`.`companies` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`phonebook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`phonebook` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`phonebook` (
  `id` INT NOT NULL ,
  `phone_number` INT NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `person_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `kontakti_id_UNIQUE` (`id` ASC) ,
  INDEX `fk_tel_raamat_isikud1` (`person_id` ASC) ,
  CONSTRAINT `fk_tel_raamat_isikud1`
    FOREIGN KEY (`person_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`calls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`calls` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`calls` (
  `id` INT NOT NULL ,
  `summary` TEXT NOT NULL ,
  `caller_id` INT NOT NULL ,
  `started` DATETIME NULL ,
  `finished` DATETIME NULL ,
  `receiver_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_kone_kirjed_tel_raamat1` (`caller_id` ASC) ,
  INDEX `fk_kone_kirjed_isikud1` (`receiver_id` ASC) ,
  CONSTRAINT `fk_kone_kirjed_tel_raamat1`
    FOREIGN KEY (`caller_id` )
    REFERENCES `sip-agent`.`phonebook` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kone_kirjed_isikud1`
    FOREIGN KEY (`receiver_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`task_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`task_categories` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`task_categories` (
  `id` INT NOT NULL ,
  `nimetus` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`task_statuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`task_statuses` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`task_statuses` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`tasks` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`tasks` (
  `id` INT NOT NULL ,
  `title` VARCHAR(255) NULL ,
  `details` MEDIUMTEXT  NULL ,
  `notifier_id` VARCHAR(45) NOT NULL ,
  `assignee_id` INT NULL ,
  `type_id` INT NOT NULL ,
  `status_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tood_isikud1` (`notifier_id` ASC) ,
  INDEX `fk_tood_liik1` (`type_id` ASC) ,
  INDEX `fk_tood_staatus1` (`status_id` ASC) ,
  INDEX `fk_tood_isikud2` (`assignee_id` ASC) ,
  CONSTRAINT `fk_tood_isikud1`
    FOREIGN KEY (`notifier_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tood_liik1`
    FOREIGN KEY (`type_id` )
    REFERENCES `sip-agent`.`task_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tood_staatus1`
    FOREIGN KEY (`status_id` )
    REFERENCES `sip-agent`.`task_statuses` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tood_isikud2`
    FOREIGN KEY (`assignee_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`task_calls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`task_calls` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`task_calls` (
  `call_id` INT NOT NULL ,
  `task_id` INT NOT NULL ,
  PRIMARY KEY (`call_id`, `task_id`) ,
  INDEX `fk_kone_kirjed_has_tood_tood1` (`task_id` ASC) ,
  INDEX `fk_kone_kirjed_has_tood_kone_kirjed1` (`call_id` ASC) ,
  CONSTRAINT `fk_kone_kirjed_has_tood_kone_kirjed1`
    FOREIGN KEY (`call_id` )
    REFERENCES `sip-agent`.`calls` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_kone_kirjed_has_tood_tood1`
    FOREIGN KEY (`task_id` )
    REFERENCES `sip-agent`.`tasks` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
