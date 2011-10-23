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

-- -----------------------------------------------------
-- Data for table `sip-agent`.`companies`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`companies` (`id`, `name`) VALUES (12, 'Keemikud OÜ');
INSERT INTO `sip-agent`.`companies` (`id`, `name`) VALUES (53, 'Adjöö AS');
INSERT INTO `sip-agent`.`companies` (`id`, `name`) VALUES (76, 'Salvest');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`persons`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `company_id`) VALUES (151, 'Ants', 'Tael', 412);
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `company_id`) VALUES (512, 'Iili', 'Siilikas', 657);
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `company_id`) VALUES (212, 'Vidali', 'Illidas', 543);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`phonebook`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone_number`, `email`, `person_id`) VALUES (15, 56798742, 'ants.tael@mail.ee', 151);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone_number`, `email`, `person_id`) VALUES (24, 52122528, 'iili.siilikas@mail.ee', 512);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone_number`, `email`, `person_id`) VALUES (5, 59871282, 'vidali.illikas@gmail.com', 212);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`calls`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `started`, `finished`, `receiver_id`) VALUES (61, 'Asi on katki', 123, '13.05', '13.12', 41);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `started`, `finished`, `receiver_id`) VALUES (2, 'Midagi on mäda', 425, '15.10', '15.15', 24);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `started`, `finished`, `receiver_id`) VALUES (65, 'Totaalne katastroof', 657, '11.05', '11.50', 12);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`task_categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`task_categories` (`id`, `nimetus`) VALUES (1, 'komponendi viga');
INSERT INTO `sip-agent`.`task_categories` (`id`, `nimetus`) VALUES (2, 'ühenduse viga');
INSERT INTO `sip-agent`.`task_categories` (`id`, `nimetus`) VALUES (3, 'kasutaja viga');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`task_statuses`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`) VALUES (5, 'pooleli');
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`) VALUES (25, 'lõpetatud');
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`) VALUES (26, 'alustamata');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`tasks`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`tasks` (`id`, `title`, `details`, `notifier_id`, `assignee_id`, `type_id`, `status_id`) VALUES (1, 'Tiitel1', 'Mälu läbi mädanenud.', '425', 252, 689, 601);
INSERT INTO `sip-agent`.`tasks` (`id`, `title`, `details`, `notifier_id`, `assignee_id`, `type_id`, `status_id`) VALUES (2, 'Tiitel2', 'Katastroofiliselt palju tolmu oli asjas.', '427', 457, 123, 876);
INSERT INTO `sip-agent`.`tasks` (`id`, `title`, `details`, `notifier_id`, `assignee_id`, `type_id`, `status_id`) VALUES (3, 'Tiitel3', 'Oligi lihtsalt katki.', '421', 658, 432, 565);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`task_calls`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (2, 1);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (65, 2);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (61, 3);

COMMIT;
