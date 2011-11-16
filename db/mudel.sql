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
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(60) NOT NULL ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `address` TEXT NULL DEFAULT NULL ,
  `deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`persons` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`persons` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL COMMENT '\n' ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(64) NULL DEFAULT NULL ,
  `company_id` INT UNSIGNED NULL DEFAULT NULL ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_isikud_firma1` (`company_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) ,
  CONSTRAINT `fk_isikud_firma1`
    FOREIGN KEY (`company_id` )
    REFERENCES `sip-agent`.`companies` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`phonebook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`phonebook` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`phonebook` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `phone` VARCHAR(32) NULL DEFAULT NULL ,
  `email` VARCHAR(64) NULL DEFAULT NULL ,
  `person_id` INT UNSIGNED NULL DEFAULT NULL ,
  `deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `kontakti_id_UNIQUE` (`id` ASC) ,
  INDEX `fk_tel_raamat_isikud1` (`person_id` ASC) ,
  CONSTRAINT `fk_tel_raamat_isikud1`
    FOREIGN KEY (`person_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`calls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`calls` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`calls` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `summary` TEXT NULL DEFAULT NULL ,
  `caller_id` INT UNSIGNED NULL DEFAULT NULL COMMENT 'The number that called' ,
  `clerk_id` INT UNSIGNED NULL DEFAULT NULL COMMENT 'The number who answered (if any)' ,
  `start` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  `end` TIMESTAMP NULL DEFAULT NULL ,
  `deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_kone_kirjed_tel_raamat1` (`caller_id` ASC) ,
  INDEX `fk_calls_phonebook1` (`clerk_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_kone_kirjed_tel_raamat1`
    FOREIGN KEY (`caller_id` )
    REFERENCES `sip-agent`.`phonebook` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_calls_phonebook1`
    FOREIGN KEY (`clerk_id` )
    REFERENCES `sip-agent`.`phonebook` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`task_statuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`task_statuses` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`task_statuses` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 ,
  `parent_id` INT UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_task_statuses_task_statuses1` (`parent_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_task_statuses_task_statuses1`
    FOREIGN KEY (`parent_id` )
    REFERENCES `sip-agent`.`task_statuses` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`task_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`task_categories` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`task_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `parent_id` INT UNSIGNED NULL DEFAULT NULL COMMENT 'One category can be a subcategory of another' ,
  `deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_task_categories_task_categories1` (`parent_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_task_categories_task_categories1`
    FOREIGN KEY (`parent_id` )
    REFERENCES `sip-agent`.`task_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`tasks` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`tasks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parent_id` INT UNSIGNED NULL DEFAULT NULL ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated` TIMESTAMP NULL DEFAULT NULL ,
  `title` VARCHAR(255) NOT NULL DEFAULT 'Task' ,
  `details` MEDIUMTEXT  NULL DEFAULT NULL ,
  `notifier_id` INT UNSIGNED NOT NULL COMMENT 'The person who reported the task' ,
  `assignee_id` INT UNSIGNED NULL COMMENT 'The person who has to solve the task' ,
  `clerk_id` INT UNSIGNED NOT NULL COMMENT 'The person who entered the task' ,
  `status_id` INT UNSIGNED NOT NULL DEFAULT 1 ,
  `category_id` INT UNSIGNED NOT NULL DEFAULT 10 ,
  `deleted` TINYINT(1) UNSIGNED NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tood_isikud1` (`notifier_id` ASC) ,
  INDEX `fk_tood_staatus1` (`status_id` ASC) ,
  INDEX `fk_tood_isikud2` (`assignee_id` ASC) ,
  INDEX `fk_tasks_task_categories1` (`category_id` ASC) ,
  INDEX `fk_tasks_tasks1` (`parent_id` ASC) ,
  INDEX `fk_tasks_persons1` (`clerk_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_tood_isikud1`
    FOREIGN KEY (`notifier_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tood_staatus1`
    FOREIGN KEY (`status_id` )
    REFERENCES `sip-agent`.`task_statuses` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tood_isikud2`
    FOREIGN KEY (`assignee_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tasks_task_categories1`
    FOREIGN KEY (`category_id` )
    REFERENCES `sip-agent`.`task_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tasks_tasks1`
    FOREIGN KEY (`parent_id` )
    REFERENCES `sip-agent`.`tasks` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tasks_persons1`
    FOREIGN KEY (`clerk_id` )
    REFERENCES `sip-agent`.`persons` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sip-agent`.`task_calls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sip-agent`.`task_calls` ;

CREATE  TABLE IF NOT EXISTS `sip-agent`.`task_calls` (
  `call_id` INT UNSIGNED NOT NULL ,
  `task_id` INT UNSIGNED NOT NULL ,
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
INSERT INTO `sip-agent`.`companies` (`id`, `name`, `created`, `address`, `deleted`) VALUES (1, 'Keemikud OÜ', '2011-11-11 01:02:08', NULL, 0);
INSERT INTO `sip-agent`.`companies` (`id`, `name`, `created`, `address`, `deleted`) VALUES (2, 'Adjöö AS', '2011-11-11 01:02:08', NULL, 0);
INSERT INTO `sip-agent`.`companies` (`id`, `name`, `created`, `address`, `deleted`) VALUES (3, 'Salvest', '2011-11-11 01:02:08', NULL, 0);
INSERT INTO `sip-agent`.`companies` (`id`, `name`, `created`, `address`, `deleted`) VALUES (4, 'IT Kolledž', '2011-11-11 01:02:08', NULL, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`persons`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `username`, `password`, `company_id`, `created`, `deleted`) VALUES (1, 'Ants', 'Tael', 'ants', 'ants', 1, '2011-11-11 01:02:08', 0);
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `username`, `password`, `company_id`, `created`, `deleted`) VALUES (2, 'Iili', 'Siilikas', 'iili', 'iili', 2, '2011-11-11 01:02:08', 0);
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `username`, `password`, `company_id`, `created`, `deleted`) VALUES (3, 'Vidali', 'Illidas', 'vidali', 'vidali', 3, '2011-11-11 01:02:08', 0);
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `username`, `password`, `company_id`, `created`, `deleted`) VALUES (4, 'Ando', 'Roots', 'ando', 'ando', 1, '2011-11-11 01:02:08', 0);
INSERT INTO `sip-agent`.`persons` (`id`, `first_name`, `last_name`, `username`, `password`, `company_id`, `created`, `deleted`) VALUES (5, 'Tõnis', 'Umbsaar', 'tonis', 'tonis', 2, '2011-11-11 01:02:08', 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`phonebook`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (1, '56798742', 'ants.tael@mail.ee', 1, 0);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (2, '52122528', 'iili.siilikas@mail.ee', 1, 0);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (3, '59871282', 'vidali.illikas@gmail.com', 2, 0);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (4, '372451254', NULL, 3, 0);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (5, '55321425', 'mika@sola.ee', 2, 0);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (6, '214512424', 'test@example.com', 2, 0);
INSERT INTO `sip-agent`.`phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES (NULL, '981525465', NULL, 1, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`calls`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (1, 'Asi on katki', 1, 1, '2011-02-01 16:12:01', '2011-02-01 16:12:01', 0);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (2, 'Midagi on mäda', 2, 2, '2011-02-01 15:19:01', '2011-02-01 15:29:01', 0);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (3, 'Totaalne katastroof', 3, 1, '2011-02-01 19:12:01', '2011-02-01 19:32:01', 0);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (4, 'Vale number', NULL, 3, '2011-02-01 11:12:01', '2011-02-01 11:12:51', 1);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (5, 'Helistas uksehoidja', NULL, 2, '2011-03-01 15:12:01', '2011-03-01 15:13:21', 0);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (6, 'Taheti pakkuda müügiks printerit, me ei ostnud', 2, 2, '2011-01-01 15:12:01', '2011-01-01 15:18:01', 0);
INSERT INTO `sip-agent`.`calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES (7, 'Jaan helistab ja küsib töö edenemise üle', 1, 1, '2011-02-01 14:12:01', '2011-02-01 14:19:01', 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`task_statuses`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (1, 'New', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (2, 'Planned', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (3, 'Active', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (4, 'Resolved', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (5, 'Feedback', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (6, 'Closed', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (7, 'Deleted', 0, NULL);
INSERT INTO `sip-agent`.`task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES (8, 'Archived', 0, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`task_categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (1, 'Hardware', NULL, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (2, 'Software', NULL, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (3, 'Consultation', NULL, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (4, 'Software Installation', 2, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (5, 'Hardware Installation', 1, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (6, 'Hardware Consultation', 1, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (7, 'Software Consultation', 2, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (8, 'Hardware Malfunction', 1, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (9, 'Software Malfunction', 2, 0);
INSERT INTO `sip-agent`.`task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES (10, 'Default', NULL, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`tasks`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`tasks` (`id`, `parent_id`, `created`, `updated`, `title`, `details`, `notifier_id`, `assignee_id`, `clerk_id`, `status_id`, `category_id`, `deleted`) VALUES (1, NULL, '2011-01-01 03:00:00', NULL, 'Printer on katki', 'Mälu läbi mädanenud.', 1, 2, 1, 1, 2, 0);
INSERT INTO `sip-agent`.`tasks` (`id`, `parent_id`, `created`, `updated`, `title`, `details`, `notifier_id`, `assignee_id`, `clerk_id`, `status_id`, `category_id`, `deleted`) VALUES (2, NULL, '2011-01-02 03:00:00', NULL, 'AutoCAD ei tööta', 'Katastroofiliselt palju tolmu oli asjas.', 2, 1, 1, 2, 2, 0);
INSERT INTO `sip-agent`.`tasks` (`id`, `parent_id`, `created`, `updated`, `title`, `details`, `notifier_id`, `assignee_id`, `clerk_id`, `status_id`, `category_id`, `deleted`) VALUES (3, NULL, '2011-01-01 05:00:00', NULL, 'E-maile ei saa saata välistele aadressidele hommikust saadik', 'Oligi lihtsalt katki.', 3, 1, 1, 3, 1, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sip-agent`.`task_calls`
-- -----------------------------------------------------
START TRANSACTION;
USE `sip-agent`;
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (1, 1);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (2, 2);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (3, 3);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (4, 2);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (5, 1);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (6, 2);
INSERT INTO `sip-agent`.`task_calls` (`call_id`, `task_id`) VALUES (7, 2);

COMMIT;
