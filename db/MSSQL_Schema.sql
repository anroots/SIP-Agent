SET time_zone = "+00:00";

CREATE TABLE "calls" (
  "id" int(10) unsigned NOT NULL,
  "summary" text,
  "caller_id" int(10) unsigned DEFAULT NULL COMMENT 'The number that called',
  "clerk_id" int(10) unsigned DEFAULT NULL COMMENT 'The number who answered (if any)',
  "start" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "end" timestamp NULL DEFAULT NULL,
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id"),
  KEY "fk_kone_kirjed_tel_raamat1" ("caller_id"),
  KEY "fk_calls_phonebook1" ("clerk_id")
) AUTO_INCREMENT=8 ;

INSERT INTO `calls` (`id`, `summary`, `caller_id`, `clerk_id`, `start`, `end`, `deleted`) VALUES
(1, 'Asi on katki', 1, 1, '2011-02-01 14:12:01', '2011-02-01 14:12:01', 0),
(2, 'Midagi on mäda', 2, 2, '2011-02-01 13:19:01', '2011-02-01 13:29:01', 0),
(3, 'Totaalne katastroof', 3, 1, '2011-02-01 17:12:01', '2011-02-01 17:32:01', 0),
(4, 'Vale number', NULL, 3, '2011-02-01 09:12:01', '2011-02-01 09:12:51', 1),
(5, 'Helistas uksehoidja', NULL, 2, '2011-03-01 13:12:01', '2011-03-01 13:13:21', 0),
(6, 'Taheti pakkuda müügiks printerit, me ei ostnud', 2, 2, '2011-01-01 13:12:01', '2011-01-01 13:18:01', 0),
(7, 'Jaan helistab ja küsib töö edenemise üle', 1, 1, '2011-02-01 12:12:01', '2011-02-01 12:19:01', 0);

CREATE TABLE "companies" (
  "id" int(10) unsigned NOT NULL,
  "name" varchar(60) NOT NULL,
  "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "address" text,
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id")
) AUTO_INCREMENT=5 ;

INSERT INTO `companies` (`id`, `name`, `created`, `address`, `deleted`) VALUES
(1, 'Keemikud OÜ', '2011-11-10 23:02:08', NULL, 0),
(2, 'Adjöö AS', '2011-11-10 23:02:08', NULL, 0),
(3, 'Salvest', '2011-11-10 23:02:08', NULL, 0),
(4, 'IT Kolledþ', '2011-11-10 23:02:08', NULL, 0);

CREATE TABLE "persons" (
  "id" int(10) unsigned NOT NULL,
  "first_name" varchar(45) DEFAULT NULL COMMENT '\n',
  "last_name" varchar(45) DEFAULT NULL,
  "username" varchar(45) NOT NULL,
  "password" varchar(64) DEFAULT NULL,
  "company_id" int(10) unsigned DEFAULT NULL,
  "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id"),
  UNIQUE KEY "username_UNIQUE" ("username"),
  KEY "fk_isikud_firma1" ("company_id")
) AUTO_INCREMENT=6 ;

INSERT INTO `persons` (`id`, `first_name`, `last_name`, `username`, `password`, `company_id`, `created`, `deleted`) VALUES
(1, 'Ants', 'Tael', 'ants', 'ants', 1, '2011-11-10 23:02:08', 0),
(2, 'Iili', 'Siilikas', 'iili', 'iili', 2, '2011-11-10 23:02:08', 0),
(3, 'Vidali', 'Illidas', 'vidali', 'vidali', 3, '2011-11-10 23:02:08', 0),
(4, 'Ando', 'Roots', 'ando', 'ando', 1, '2011-11-10 23:02:08', 0),
(5, 'Tõnis', 'Umbsaar', 'tonis', 'tonis', 2, '2011-11-10 23:02:08', 0);

CREATE TABLE "phonebook" (
  "id" int(10) unsigned NOT NULL,
  "phone" varchar(32) DEFAULT NULL,
  "email" varchar(64) DEFAULT NULL,
  "person_id" int(10) unsigned DEFAULT NULL,
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE KEY "kontakti_id_UNIQUE" ("id"),
  KEY "fk_tel_raamat_isikud1" ("person_id")
) AUTO_INCREMENT=8 ;

INSERT INTO `phonebook` (`id`, `phone`, `email`, `person_id`, `deleted`) VALUES
(1, '56798742', 'ants.tael@mail.ee', 1, 0),
(2, '52122528', 'iili.siilikas@mail.ee', 1, 0),
(3, '59871282', 'vidali.illikas@gmail.com', 2, 0),
(4, '372451254', NULL, 3, 0),
(5, '55321425', 'mika@sola.ee', 2, 0),
(6, '214512424', 'test@example.com', 2, 0),
(7, '981525465', NULL, 1, 0);

CREATE TABLE "tasks" (
  "id" int(10) unsigned NOT NULL,
  "parent_id" int(10) unsigned DEFAULT NULL,
  "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated" timestamp NULL DEFAULT NULL,
  "title" varchar(255) NOT NULL DEFAULT 'Task',
  "details" mediumtext,
  "notifier_id" int(10) unsigned NOT NULL COMMENT 'The person who reported the task',
  "assignee_id" int(10) unsigned DEFAULT NULL COMMENT 'The person who has to solve the task',
  "clerk_id" int(10) unsigned NOT NULL COMMENT 'The person who entered the task',
  "status_id" int(10) unsigned NOT NULL DEFAULT '1',
  "category_id" int(10) unsigned NOT NULL DEFAULT '10',
  "deleted" tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id"),
  KEY "fk_tood_isikud1" ("notifier_id"),
  KEY "fk_tood_staatus1" ("status_id"),
  KEY "fk_tood_isikud2" ("assignee_id"),
  KEY "fk_tasks_task_categories1" ("category_id"),
  KEY "fk_tasks_tasks1" ("parent_id"),
  KEY "fk_tasks_persons1" ("clerk_id")
) AUTO_INCREMENT=4 ;

INSERT INTO `tasks` (`id`, `parent_id`, `created`, `updated`, `title`, `details`, `notifier_id`, `assignee_id`, `clerk_id`, `status_id`, `category_id`, `deleted`) VALUES
(1, NULL, '2011-01-01 01:00:00', NULL, 'Printer on katki', 'Mälu läbi mädanenud.', 1, 2, 1, 1, 2, 0),
(2, NULL, '2011-01-02 01:00:00', NULL, 'AutoCAD ei tööta', 'Katastroofiliselt palju tolmu oli asjas.', 2, 1, 1, 2, 2, 0),
(3, NULL, '2011-01-01 03:00:00', NULL, 'E-maile ei saa saata välistele aadressidele hommikust saadik', 'Oligi lihtsalt katki.', 3, 1, 1, 3, 1, 0);

CREATE TABLE "task_calls" (
  "call_id" int(10) unsigned NOT NULL,
  "task_id" int(10) unsigned NOT NULL,
  PRIMARY KEY ("call_id","task_id"),
  KEY "fk_kone_kirjed_has_tood_tood1" ("task_id"),
  KEY "fk_kone_kirjed_has_tood_kone_kirjed1" ("call_id")
);

INSERT INTO `task_calls` (`call_id`, `task_id`) VALUES
(1, 1),
(5, 1),
(2, 2),
(4, 2),
(6, 2),
(7, 2),
(3, 3);

CREATE TABLE "task_categories" (
  "id" int(10) unsigned NOT NULL,
  "name" varchar(45) NOT NULL,
  "parent_id" int(10) unsigned DEFAULT NULL COMMENT 'One category can be a subcategory of another',
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id"),
  KEY "fk_task_categories_task_categories1" ("parent_id")
) AUTO_INCREMENT=11 ;

INSERT INTO `task_categories` (`id`, `name`, `parent_id`, `deleted`) VALUES
(1, 'Hardware', NULL, 0),
(2, 'Software', NULL, 0),
(3, 'Consultation', NULL, 0),
(4, 'Software Installation', 2, 0),
(5, 'Hardware Installation', 1, 0),
(6, 'Hardware Consultation', 1, 0),
(7, 'Software Consultation', 2, 0),
(8, 'Hardware Malfunction', 1, 0),
(9, 'Software Malfunction', 2, 0),
(10, 'Default', NULL, 0);

CREATE TABLE "task_statuses" (
  "id" int(10) unsigned NOT NULL,
  "name" varchar(255) NOT NULL,
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0',
  "parent_id" int(10) unsigned DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id"),
  KEY "fk_task_statuses_task_statuses1" ("parent_id")
) AUTO_INCREMENT=9 ;

INSERT INTO `task_statuses` (`id`, `name`, `deleted`, `parent_id`) VALUES
(1, 'New', 0, NULL),
(2, 'Planned', 0, NULL),
(3, 'Active', 0, NULL),
(4, 'Resolved', 0, NULL),
(5, 'Feedback', 0, NULL),
(6, 'Closed', 0, NULL),
(7, 'Deleted', 0, NULL),
(8, 'Archived', 0, NULL);


ALTER TABLE `calls`
  ADD CONSTRAINT "fk_kone_kirjed_tel_raamat1" FOREIGN KEY ("caller_id") REFERENCES "phonebook" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_calls_phonebook1" FOREIGN KEY ("clerk_id") REFERENCES "phonebook" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `persons`
  ADD CONSTRAINT "fk_isikud_firma1" FOREIGN KEY ("company_id") REFERENCES "companies" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `phonebook`
  ADD CONSTRAINT "fk_tel_raamat_isikud1" FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tasks`
  ADD CONSTRAINT "fk_tood_isikud1" FOREIGN KEY ("notifier_id") REFERENCES "persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_tood_staatus1" FOREIGN KEY ("status_id") REFERENCES "task_statuses" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_tood_isikud2" FOREIGN KEY ("assignee_id") REFERENCES "persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_tasks_task_categories1" FOREIGN KEY ("category_id") REFERENCES "task_categories" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_tasks_tasks1" FOREIGN KEY ("parent_id") REFERENCES "tasks" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_tasks_persons1" FOREIGN KEY ("clerk_id") REFERENCES "persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `task_calls`
  ADD CONSTRAINT "fk_kone_kirjed_has_tood_kone_kirjed1" FOREIGN KEY ("call_id") REFERENCES "calls" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "fk_kone_kirjed_has_tood_tood1" FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `task_categories`
  ADD CONSTRAINT "fk_task_categories_task_categories1" FOREIGN KEY ("parent_id") REFERENCES "task_categories" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `task_statuses`
  ADD CONSTRAINT "fk_task_statuses_task_statuses1" FOREIGN KEY ("parent_id") REFERENCES "task_statuses" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
