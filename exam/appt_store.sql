SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `appt_store` ;
CREATE SCHEMA IF NOT EXISTS `appt_store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `appt_store` ;

-- -----------------------------------------------------
-- Table `appt_store`.`feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`feature` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`feature` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`developer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`developer` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`developer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`district` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`district` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`project` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`project` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `developer_id` INT NOT NULL,
  `district_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_project_developer1_idx` (`developer_id` ASC),
  INDEX `fk_project_district1_idx` (`district_id` ASC),
  CONSTRAINT `fk_project_developer1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `appt_store`.`developer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_district1`
    FOREIGN KEY (`district_id`)
    REFERENCES `appt_store`.`district` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`appt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`appt` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`appt` (
  `id` INT NOT NULL,
  `square` INT NULL,
  `room_num` INT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_appt_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_appt_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `appt_store`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`client` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`client` (
  `id` INT NOT NULL,
  `code` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`deal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`deal` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`deal` (
  `id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `number` VARCHAR(45) NULL,
  `deal_date` DATE NULL,
  `cost` INT NULL,
  `appt_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_deal_client1_idx` (`client_id` ASC),
  INDEX `fk_deal_appt1_idx` (`appt_id` ASC),
  UNIQUE INDEX `appt_id_UNIQUE` (`appt_id` ASC),
  CONSTRAINT `fk_deal_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `appt_store`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deal_appt1`
    FOREIGN KEY (`appt_id`)
    REFERENCES `appt_store`.`appt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`project_has_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`project_has_feature` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`project_has_feature` (
  `project_id` INT NOT NULL,
  `feature_id` INT NOT NULL,
  PRIMARY KEY (`project_id`, `feature_id`),
  INDEX `fk_project_has_feature_feature1_idx` (`feature_id` ASC),
  INDEX `fk_project_has_feature_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_feature_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `appt_store`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_feature_feature1`
    FOREIGN KEY (`feature_id`)
    REFERENCES `appt_store`.`feature` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appt_store`.`appt_has_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appt_store`.`appt_has_feature` ;

CREATE TABLE IF NOT EXISTS `appt_store`.`appt_has_feature` (
  `appt_id` INT NOT NULL,
  `feature_id` INT NOT NULL,
  PRIMARY KEY (`appt_id`, `feature_id`),
  INDEX `fk_appt_has_feature_feature1_idx` (`feature_id` ASC),
  INDEX `fk_appt_has_feature_appt1_idx` (`appt_id` ASC),
  CONSTRAINT `fk_appt_has_feature_appt1`
    FOREIGN KEY (`appt_id`)
    REFERENCES `appt_store`.`appt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appt_has_feature_feature1`
    FOREIGN KEY (`feature_id`)
    REFERENCES `appt_store`.`feature` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `appt_store`.`feature`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (1, 'Vysokie potolki');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (2, 'Okna vo dvor');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (3, 'Lift');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (4, 'Ryadom park');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (5, 'Ryadom metro');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (6, 'Nedaleko gipermarket');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (7, 'Poslednij ehtazh');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (8, 'Pervyj ehtazh');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (9, 'Otdelka');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (10, 'Panoramnye okna');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (11, 'Lodzhiya');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (12, 'Balkon');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (13, 'Horoshaya planirovka');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (14, 'Pomeshchenie dlya garderobnoj');
INSERT INTO `appt_store`.`feature` (`id`, `name`) VALUES (15, 'Gaz');

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`developer`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (1, 'Horoshie rebyata');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (2, 'Glaz-almaz');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (3, 'Megaprorab');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (4, 'Stroim vse');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (5, 'Sdelano na sovest\'');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (6, 'Ruki iz plech');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (7, 'YUzhnye profi');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (8, 'Kirpich-beton');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (9, 'Tyap-lyap i na prodazhu');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (10, 'I tak sojdet');
INSERT INTO `appt_store`.`developer` (`id`, `name`) VALUES (11, 'Vse ravno kupyat');

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`district`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (1, 'YUzhnyj central');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (2, 'Pribrezhnyj');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (3, 'Zelenyj');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (4, 'Pridorozhnyj');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (5, 'Central\'nyj');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (6, 'Gorod-satellit');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (7, 'Mazhornyj');
INSERT INTO `appt_store`.`district` (`id`, `name`) VALUES (8, 'Tihij');

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`project`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (1, 'Skazochnaya strana', 11, 6);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (2, 'Piramidy', 7, 7);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (3, 'Vechernij zvon', 9, 8);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (4, 'Kollizej', 8, 5);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (5, 'Volshebnyj sad', 9, 1);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (6, 'Rajskij raj', 7, 8);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (7, 'Normal\'noe zhil\'e', 11, 5);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (8, 'Neblizhnij svet', 5, 4);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (9, 'Zakol\'com', 1, 5);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (10, 'Zapovednik', 2, 5);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (11, 'Priroda-mat\'', 8, 4);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (12, 'Svalka ryadom!', 11, 3);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (13, 'Trava u doma', 5, 2);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (14, 'ZHizn\' u vody', 9, 1);
INSERT INTO `appt_store`.`project` (`id`, `name`, `developer_id`, `district_id`) VALUES (15, 'Acckaya perspektiva', 2, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`appt`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (1, 266, 4, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (2, 36, 5, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (3, 175, 1, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (4, 42, 2, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (5, 165, 3, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (6, 188, 3, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (7, 260, 4, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (8, 117, 2, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (9, 172, 1, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (10, 91, 3, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (11, 203, 3, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (12, 239, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (13, 46, 3, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (14, 222, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (15, 279, 2, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (16, 88, 3, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (17, 258, 5, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (18, 107, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (19, 287, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (20, 96, 4, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (21, 179, 1, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (22, 31, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (23, 264, 1, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (24, 76, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (25, 105, 2, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (26, 217, 1, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (27, 242, 4, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (28, 197, 3, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (29, 34, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (30, 91, 5, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (31, 259, 5, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (32, 269, 5, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (33, 78, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (34, 126, 2, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (35, 208, 2, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (36, 139, 2, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (37, 209, 2, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (38, 213, 1, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (39, 165, 2, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (40, 90, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (41, 231, 5, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (42, 265, 4, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (43, 287, 3, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (44, 156, 2, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (45, 243, 2, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (46, 256, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (47, 119, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (48, 206, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (49, 198, 5, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (50, 101, 5, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (51, 295, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (52, 58, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (53, 61, 4, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (54, 236, 3, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (55, 281, 1, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (56, 70, 1, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (57, 263, 1, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (58, 103, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (59, 199, 5, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (60, 166, 3, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (61, 235, 4, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (62, 129, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (63, 60, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (64, 149, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (65, 261, 4, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (66, 58, 4, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (67, 72, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (68, 197, 4, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (69, 262, 4, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (70, 201, 3, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (71, 246, 3, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (72, 153, 5, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (73, 294, 3, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (74, 259, 3, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (75, 279, 5, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (76, 55, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (77, 44, 3, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (78, 201, 3, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (79, 92, 2, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (80, 241, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (81, 172, 4, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (82, 247, 1, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (83, 101, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (84, 230, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (85, 258, 3, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (86, 149, 4, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (87, 165, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (88, 159, 3, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (89, 153, 3, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (90, 168, 2, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (91, 241, 2, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (92, 28, 3, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (93, 244, 1, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (94, 96, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (95, 293, 5, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (96, 61, 1, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (97, 175, 1, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (98, 177, 5, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (99, 201, 3, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (100, 281, 5, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (101, 141, 5, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (102, 50, 2, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (103, 234, 1, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (104, 27, 2, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (105, 55, 1, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (106, 175, 4, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (107, 186, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (108, 202, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (109, 119, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (110, 245, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (111, 104, 4, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (112, 141, 2, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (113, 137, 3, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (114, 232, 1, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (115, 134, 1, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (116, 293, 1, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (117, 41, 4, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (118, 279, 3, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (119, 142, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (120, 211, 1, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (121, 32, 4, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (122, 271, 4, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (123, 223, 1, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (124, 143, 3, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (125, 211, 2, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (126, 76, 5, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (127, 277, 3, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (128, 278, 1, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (129, 270, 5, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (130, 144, 2, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (131, 71, 1, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (132, 198, 1, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (133, 235, 4, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (134, 76, 1, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (135, 232, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (136, 190, 4, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (137, 213, 2, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (138, 266, 1, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (139, 217, 1, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (140, 207, 1, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (141, 187, 2, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (142, 64, 3, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (143, 187, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (144, 66, 2, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (145, 223, 3, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (146, 108, 1, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (147, 112, 1, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (148, 97, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (149, 277, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (150, 179, 3, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (151, 192, 3, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (152, 244, 5, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (153, 186, 3, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (154, 237, 2, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (155, 281, 1, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (156, 208, 1, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (157, 219, 1, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (158, 64, 3, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (159, 252, 5, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (160, 148, 4, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (161, 217, 4, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (162, 271, 4, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (163, 96, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (164, 124, 5, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (165, 126, 5, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (166, 64, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (167, 57, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (168, 229, 2, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (169, 137, 1, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (170, 205, 2, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (171, 147, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (172, 106, 2, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (173, 204, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (174, 204, 3, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (175, 93, 5, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (176, 97, 1, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (177, 166, 5, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (178, 191, 3, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (179, 43, 1, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (180, 146, 2, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (181, 294, 3, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (182, 183, 4, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (183, 279, 4, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (184, 298, 3, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (185, 259, 4, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (186, 277, 5, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (187, 172, 2, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (188, 252, 3, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (189, 128, 2, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (190, 235, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (191, 66, 3, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (192, 77, 5, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (193, 44, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (194, 212, 3, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (195, 204, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (196, 205, 5, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (197, 282, 2, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (198, 202, 5, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (199, 109, 3, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (200, 44, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (201, 292, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (202, 39, 3, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (203, 243, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (204, 298, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (205, 25, 2, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (206, 232, 2, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (207, 242, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (208, 173, 2, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (209, 239, 1, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (210, 245, 5, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (211, 73, 3, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (212, 91, 1, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (213, 135, 2, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (214, 73, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (215, 176, 2, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (216, 202, 4, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (217, 30, 3, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (218, 242, 1, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (219, 43, 3, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (220, 127, 2, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (221, 190, 2, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (222, 206, 3, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (223, 74, 4, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (224, 293, 2, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (225, 111, 2, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (226, 270, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (227, 263, 3, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (228, 209, 3, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (229, 240, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (230, 246, 5, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (231, 111, 1, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (232, 291, 2, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (233, 73, 2, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (234, 83, 1, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (235, 110, 2, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (236, 44, 2, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (237, 245, 5, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (238, 261, 1, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (239, 57, 3, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (240, 218, 2, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (241, 124, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (242, 172, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (243, 78, 5, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (244, 171, 5, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (245, 185, 2, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (246, 102, 2, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (247, 202, 3, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (248, 203, 5, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (249, 60, 4, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (250, 172, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (251, 131, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (252, 86, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (253, 294, 4, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (254, 224, 1, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (255, 47, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (256, 145, 4, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (257, 76, 5, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (258, 196, 2, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (259, 197, 4, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (260, 168, 3, 15);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (261, 139, 4, 5);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (262, 109, 3, 2);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (263, 147, 3, 7);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (264, 244, 4, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (265, 151, 1, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (266, 97, 1, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (267, 256, 4, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (268, 67, 5, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (269, 72, 4, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (270, 79, 2, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (271, 166, 2, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (272, 238, 3, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (273, 299, 4, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (274, 254, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (275, 282, 2, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (276, 94, 4, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (277, 222, 1, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (278, 289, 4, 10);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (279, 268, 4, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (280, 109, 1, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (281, 171, 4, 13);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (282, 125, 3, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (283, 47, 4, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (284, 294, 5, 6);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (285, 259, 3, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (286, 186, 4, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (287, 85, 2, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (288, 86, 4, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (289, 37, 4, 9);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (290, 37, 4, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (291, 115, 2, 8);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (292, 37, 5, 11);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (293, 212, 4, 12);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (294, 94, 1, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (295, 164, 5, 3);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (296, 148, 4, 4);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (297, 247, 5, 14);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (298, 287, 3, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (299, 288, 3, 1);
INSERT INTO `appt_store`.`appt` (`id`, `square`, `room_num`, `project_id`) VALUES (300, 26, 1, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`client`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (1, 'client_1', 'Brandi', 'Willis');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (2, 'client_2', 'Jaime', 'Cobb');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (3, 'client_3', 'Shirley', 'Payne');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (4, 'client_4', 'Daryl', 'Craig');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (5, 'client_5', 'Rachael', 'Williamson');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (6, 'client_6', 'Sara', 'Jordan');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (7, 'client_7', 'Earl', 'Lloyd');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (8, 'client_8', 'Toby', 'Roberts');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (9, 'client_9', 'Duane', 'Mcgee');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (10, 'client_10', 'Emanuel', 'Taylor');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (11, 'client_11', 'Marcia', 'Griffith');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (12, 'client_12', 'Ernest', 'Becker');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (13, 'client_13', 'Eunice', 'Blair');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (14, 'client_14', 'Erma', 'Bishop');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (15, 'client_15', 'Florence', 'Daniel');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (16, 'client_16', 'Priscilla', 'Hill');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (17, 'client_17', 'Nadine', 'Vaughn');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (18, 'client_18', 'Joanna', 'Carson');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (19, 'client_19', 'Nina', 'Richards');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (20, 'client_20', 'Luke', 'Gibbs');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (21, 'client_21', 'Grant', 'Jenkins');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (22, 'client_22', 'Kelly', 'Sanders');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (23, 'client_23', 'Angela', 'Welch');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (24, 'client_24', 'Rufus', 'Huff');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (25, 'client_25', 'Charles', 'Byrd');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (26, 'client_26', 'Sidney', 'Patton');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (27, 'client_27', 'Darrin', 'Obrien');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (28, 'client_28', 'Moses', 'Sanchez');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (29, 'client_29', 'Marcos', 'Harrison');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (30, 'client_30', 'Julie', 'Hughes');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (31, 'client_31', 'Ida', 'Barrett');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (32, 'client_32', 'Freda', 'Ramsey');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (33, 'client_33', 'Kristopher', 'Gregory');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (34, 'client_34', 'Neil', 'Wheeler');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (35, 'client_35', 'Marlon', 'Myers');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (36, 'client_36', 'Donna', 'Adkins');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (37, 'client_37', 'Leah', 'Hogan');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (38, 'client_38', 'Wanda', 'Little');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (39, 'client_39', 'Erin', 'Chapman');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (40, 'client_40', 'Shelia', 'Russell');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (41, 'client_41', 'Don', 'Bass');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (42, 'client_42', 'Bert', 'Larson');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (43, 'client_43', 'Dean', 'Steele');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (44, 'client_44', 'Esther', 'Castro');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (45, 'client_45', 'Yvette', 'Porter');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (46, 'client_46', 'Casey', 'Cain');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (47, 'client_47', 'Betsy', 'Moss');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (48, 'client_48', 'Orville', 'Goodman');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (49, 'client_49', 'Seth', 'Castillo');
INSERT INTO `appt_store`.`client` (`id`, `code`, `first_name`, `last_name`) VALUES (50, 'client_50', 'Floyd', 'Nunez');

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`deal`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (1, 10, 'ORD_1', '2015-05-30', 4276493, 300);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (2, 48, 'ORD_2', '2015-02-05', 9508838, 299);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (4, 38, 'ORD_4', '2015-05-06', 1658711, 297);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (5, 8, 'ORD_5', '2015-05-28', 9740129, 296);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (6, 16, 'ORD_6', '2015-04-26', 9452912, 295);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (7, 25, 'ORD_7', '2015-06-04', 5074397, 294);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (8, 32, 'ORD_8', '2015-03-17', 7545346, 293);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (9, 20, 'ORD_9', '2015-02-17', 9954409, 292);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (10, 33, 'ORD_10', '2015-05-04', 9369898, 291);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (11, 39, 'ORD_11', '2015-01-30', 5459929, 290);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (12, 46, 'ORD_12', '2015-05-29', 1404167, 289);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (13, 36, 'ORD_13', '2015-04-24', 4352703, 288);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (15, 26, 'ORD_15', '2015-06-14', 3266363, 286);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (16, 45, 'ORD_16', '2015-02-27', 4688593, 285);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (17, 21, 'ORD_17', '2015-06-20', 8031021, 284);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (18, 19, 'ORD_18', '2015-04-01', 399626, 283);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (19, 12, 'ORD_19', '2015-03-08', 8262338, 282);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (20, 31, 'ORD_20', '2015-06-12', 472060, 281);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (21, 49, 'ORD_21', '2015-05-25', 7085674, 280);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (22, 25, 'ORD_22', '2015-04-17', 8919013, 279);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (23, 5, 'ORD_23', '2015-05-26', 7027480, 278);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (24, 38, 'ORD_24', '2015-02-07', 8933684, 277);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (25, 30, 'ORD_25', '2015-03-13', 4878363, 276);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (26, 44, 'ORD_26', '2015-01-15', 1944740, 275);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (28, 5, 'ORD_28', '2015-01-27', 4775118, 273);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (29, 13, 'ORD_29', '2015-05-14', 2986062, 272);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (30, 3, 'ORD_30', '2015-03-25', 2543942, 271);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (31, 13, 'ORD_31', '2015-04-16', 8322786, 270);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (32, 5, 'ORD_32', '2015-05-15', 2384783, 269);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (33, 26, 'ORD_33', '2015-03-08', 3958270, 268);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (34, 20, 'ORD_34', '2015-05-27', 1611403, 267);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (35, 5, 'ORD_35', '2015-02-01', 9033124, 266);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (36, 16, 'ORD_36', '2015-05-20', 1422901, 265);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (37, 30, 'ORD_37', '2015-05-09', 9139586, 264);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (38, 19, 'ORD_38', '2015-03-16', 7893009, 263);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (39, 12, 'ORD_39', '2015-01-07', 6733083, 262);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (40, 38, 'ORD_40', '2015-03-13', 8787987, 261);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (46, 42, 'ORD_46', '2015-04-20', 6732935, 255);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (47, 1, 'ORD_47', '2015-06-29', 9340700, 254);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (48, 21, 'ORD_48', '2015-01-25', 9543419, 253);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (49, 49, 'ORD_49', '2015-03-03', 8687493, 252);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (50, 50, 'ORD_50', '2015-02-06', 6141250, 251);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (51, 32, 'ORD_51', '2015-01-06', 4966796, 250);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (52, 22, 'ORD_52', '2015-02-13', 2668824, 249);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (54, 39, 'ORD_54', '2015-02-08', 6624489, 247);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (55, 20, 'ORD_55', '2015-06-30', 3656623, 246);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (56, 17, 'ORD_56', '2015-05-16', 5559134, 245);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (57, 32, 'ORD_57', '2015-03-14', 9941147, 244);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (58, 34, 'ORD_58', '2015-06-19', 6721870, 243);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (60, 13, 'ORD_60', '2015-01-09', 2990865, 241);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (61, 34, 'ORD_61', '2015-06-16', 5421587, 240);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (62, 14, 'ORD_62', '2015-04-14', 8295171, 239);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (64, 29, 'ORD_64', '2015-06-07', 776188, 237);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (65, 35, 'ORD_65', '2015-01-07', 3325246, 236);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (66, 26, 'ORD_66', '2015-06-16', 8786579, 235);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (67, 41, 'ORD_67', '2015-02-26', 6824030, 234);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (68, 34, 'ORD_68', '2015-01-20', 3030152, 233);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (69, 13, 'ORD_69', '2015-04-18', 5250297, 232);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (70, 31, 'ORD_70', '2015-06-21', 3740269, 231);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (71, 44, 'ORD_71', '2015-06-02', 6951618, 230);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (72, 1, 'ORD_72', '2015-01-16', 7543736, 229);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (74, 9, 'ORD_74', '2015-06-10', 4756205, 227);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (76, 8, 'ORD_76', '2015-06-23', 8427125, 225);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (77, 17, 'ORD_77', '2015-05-20', 6040006, 224);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (78, 11, 'ORD_78', '2015-06-14', 5364780, 223);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (80, 35, 'ORD_80', '2015-01-18', 4760344, 221);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (81, 45, 'ORD_81', '2015-01-30', 4230893, 220);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (82, 11, 'ORD_82', '2015-06-30', 4414418, 219);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (83, 43, 'ORD_83', '2015-03-24', 9868718, 218);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (89, 27, 'ORD_89', '2015-05-26', 4722471, 212);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (90, 31, 'ORD_90', '2015-06-28', 1795829, 211);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (91, 1, 'ORD_91', '2015-05-17', 8715877, 210);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (92, 21, 'ORD_92', '2015-02-04', 6389006, 209);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (93, 14, 'ORD_93', '2015-04-15', 4041252, 208);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (94, 31, 'ORD_94', '2015-06-25', 9900324, 207);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (95, 50, 'ORD_95', '2015-06-16', 9600362, 206);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (96, 24, 'ORD_96', '2015-04-05', 3205249, 205);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (97, 21, 'ORD_97', '2015-01-18', 883692, 204);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (98, 29, 'ORD_98', '2015-05-21', 427190, 203);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (99, 15, 'ORD_99', '2015-06-13', 2734234, 202);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (100, 18, 'ORD_100', '2015-03-01', 5412952, 201);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (101, 4, 'ORD_101', '2015-01-04', 330613, 200);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (102, 49, 'ORD_102', '2015-06-27', 4759520, 199);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (103, 4, 'ORD_103', '2015-02-16', 1225066, 198);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (110, 15, 'ORD_110', '2015-01-19', 186879, 191);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (111, 33, 'ORD_111', '2015-01-11', 3372385, 190);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (112, 36, 'ORD_112', '2015-01-25', 7756577, 189);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (113, 38, 'ORD_113', '2015-02-06', 2816436, 188);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (114, 36, 'ORD_114', '2015-03-28', 3854693, 187);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (116, 34, 'ORD_116', '2015-04-22', 2455675, 185);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (117, 14, 'ORD_117', '2015-05-10', 5787005, 184);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (119, 28, 'ORD_119', '2015-02-28', 7070956, 182);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (120, 40, 'ORD_120', '2015-01-19', 3536348, 181);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (121, 50, 'ORD_121', '2015-06-20', 1968182, 180);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (122, 47, 'ORD_122', '2015-02-03', 9874129, 179);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (123, 39, 'ORD_123', '2015-05-06', 6423836, 178);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (124, 24, 'ORD_124', '2015-02-24', 286464, 177);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (125, 35, 'ORD_125', '2015-02-14', 4093167, 176);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (126, 8, 'ORD_126', '2015-06-20', 6040230, 175);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (127, 20, 'ORD_127', '2015-04-09', 1671650, 174);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (128, 42, 'ORD_128', '2015-04-12', 7752072, 173);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (129, 18, 'ORD_129', '2015-04-19', 6850899, 172);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (130, 33, 'ORD_130', '2015-01-08', 7383118, 171);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (131, 34, 'ORD_131', '2015-04-19', 7930843, 170);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (132, 45, 'ORD_132', '2015-02-25', 9511606, 169);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (133, 6, 'ORD_133', '2015-01-16', 2212965, 168);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (134, 37, 'ORD_134', '2015-05-12', 3162381, 167);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (135, 26, 'ORD_135', '2015-02-07', 6257222, 166);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (136, 33, 'ORD_136', '2015-03-01', 2786663, 165);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (137, 13, 'ORD_137', '2015-02-24', 7358195, 164);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (138, 36, 'ORD_138', '2015-04-19', 5592492, 163);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (139, 1, 'ORD_139', '2015-02-15', 5755024, 162);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (140, 25, 'ORD_140', '2015-05-15', 7845190, 161);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (141, 11, 'ORD_141', '2015-02-08', 2726745, 160);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (142, 39, 'ORD_142', '2015-06-20', 4354754, 159);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (143, 8, 'ORD_143', '2015-03-15', 7549476, 158);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (144, 2, 'ORD_144', '2015-05-02', 9077739, 157);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (145, 6, 'ORD_145', '2015-06-02', 1222644, 156);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (146, 50, 'ORD_146', '2015-06-17', 2394241, 155);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (147, 7, 'ORD_147', '2015-02-19', 5498267, 154);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (148, 36, 'ORD_148', '2015-03-26', 7771288, 153);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (149, 13, 'ORD_149', '2015-06-19', 8093761, 152);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (150, 17, 'ORD_150', '2015-06-27', 2869610, 151);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (151, 4, 'ORD_151', '2015-03-28', 5125373, 150);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (152, 9, 'ORD_152', '2015-01-17', 6353267, 149);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (153, 29, 'ORD_153', '2015-01-30', 3546798, 148);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (154, 35, 'ORD_154', '2015-05-02', 4549458, 147);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (155, 7, 'ORD_155', '2015-01-28', 5614285, 146);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (156, 27, 'ORD_156', '2015-04-22', 882749, 145);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (157, 7, 'ORD_157', '2015-03-15', 4076374, 144);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (158, 42, 'ORD_158', '2015-06-03', 5523949, 143);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (159, 4, 'ORD_159', '2015-02-05', 4215801, 142);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (160, 27, 'ORD_160', '2015-06-23', 2783961, 141);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (162, 1, 'ORD_162', '2015-01-24', 6161568, 139);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (163, 34, 'ORD_163', '2015-02-26', 1563959, 138);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (164, 41, 'ORD_164', '2015-01-27', 3918161, 137);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (166, 47, 'ORD_166', '2015-04-16', 6212798, 135);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (167, 30, 'ORD_167', '2015-06-29', 3116453, 134);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (168, 37, 'ORD_168', '2015-03-29', 3157240, 133);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (169, 2, 'ORD_169', '2015-02-14', 1300010, 132);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (170, 29, 'ORD_170', '2015-06-30', 3942898, 131);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (172, 43, 'ORD_172', '2015-04-22', 4277619, 129);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (173, 30, 'ORD_173', '2015-03-21', 4296647, 128);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (174, 26, 'ORD_174', '2015-04-13', 3784405, 127);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (175, 37, 'ORD_175', '2015-02-02', 6768536, 126);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (176, 2, 'ORD_176', '2015-04-06', 5199766, 125);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (177, 25, 'ORD_177', '2015-03-21', 5701352, 124);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (178, 23, 'ORD_178', '2015-04-09', 5424708, 123);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (179, 44, 'ORD_179', '2015-03-24', 9455820, 122);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (180, 14, 'ORD_180', '2015-02-09', 2677894, 121);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (181, 19, 'ORD_181', '2015-01-26', 6210936, 120);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (182, 2, 'ORD_182', '2015-03-02', 1015417, 119);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (183, 40, 'ORD_183', '2015-02-02', 6335353, 118);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (184, 25, 'ORD_184', '2015-04-20', 4624329, 117);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (185, 49, 'ORD_185', '2015-06-16', 2293052, 116);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (186, 11, 'ORD_186', '2015-02-09', 7961983, 115);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (187, 42, 'ORD_187', '2015-04-07', 5473932, 114);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (188, 22, 'ORD_188', '2015-02-04', 6370571, 113);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (189, 15, 'ORD_189', '2015-03-20', 4311188, 112);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (190, 4, 'ORD_190', '2015-02-25', 1685770, 111);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (191, 26, 'ORD_191', '2015-05-08', 1392481, 110);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (192, 5, 'ORD_192', '2015-01-19', 2411084, 109);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (193, 24, 'ORD_193', '2015-05-05', 645258, 108);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (195, 44, 'ORD_195', '2015-01-26', 8881154, 106);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (196, 36, 'ORD_196', '2015-01-31', 2224294, 105);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (197, 36, 'ORD_197', '2015-05-08', 982573, 104);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (198, 26, 'ORD_198', '2015-04-02', 7683872, 103);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (200, 22, 'ORD_200', '2015-01-11', 5537753, 101);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (201, 25, 'ORD_201', '2015-01-09', 212501, 100);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (203, 15, 'ORD_203', '2015-03-06', 6644304, 98);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (204, 39, 'ORD_204', '2015-05-19', 8620274, 97);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (205, 18, 'ORD_205', '2015-01-26', 7342966, 96);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (207, 33, 'ORD_207', '2015-06-11', 2246529, 94);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (208, 24, 'ORD_208', '2015-02-14', 7554181, 93);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (209, 46, 'ORD_209', '2015-03-11', 5108133, 92);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (210, 15, 'ORD_210', '2015-01-30', 2852834, 91);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (211, 24, 'ORD_211', '2015-01-10', 1408258, 90);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (213, 38, 'ORD_213', '2015-02-11', 2837863, 88);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (214, 22, 'ORD_214', '2015-05-03', 9873043, 87);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (215, 46, 'ORD_215', '2015-06-27', 7103534, 86);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (216, 7, 'ORD_216', '2015-05-09', 4562294, 85);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (218, 26, 'ORD_218', '2015-03-31', 2764282, 83);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (219, 2, 'ORD_219', '2015-01-09', 6689543, 82);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (220, 37, 'ORD_220', '2015-04-30', 9107916, 81);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (221, 26, 'ORD_221', '2015-03-03', 1404488, 80);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (222, 2, 'ORD_222', '2015-05-14', 2270491, 79);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (224, 28, 'ORD_224', '2015-04-08', 9642223, 77);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (225, 26, 'ORD_225', '2015-02-27', 9005710, 76);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (226, 38, 'ORD_226', '2015-06-05', 254158, 75);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (227, 8, 'ORD_227', '2015-04-02', 989277, 74);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (228, 32, 'ORD_228', '2015-06-18', 8169911, 73);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (230, 19, 'ORD_230', '2015-02-09', 485066, 71);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (231, 39, 'ORD_231', '2015-05-18', 1806592, 70);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (232, 20, 'ORD_232', '2015-03-28', 9686899, 69);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (233, 6, 'ORD_233', '2015-02-10', 6532420, 68);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (234, 5, 'ORD_234', '2015-06-15', 6791188, 67);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (235, 34, 'ORD_235', '2015-01-08', 9293591, 66);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (236, 47, 'ORD_236', '2015-03-09', 6559287, 65);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (237, 49, 'ORD_237', '2015-02-25', 3408519, 64);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (238, 4, 'ORD_238', '2015-05-04', 3965849, 63);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (239, 3, 'ORD_239', '2015-03-17', 1318099, 62);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (241, 22, 'ORD_241', '2015-06-02', 9175335, 60);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (242, 30, 'ORD_242', '2015-02-04', 4966343, 59);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (244, 26, 'ORD_244', '2015-05-23', 9452679, 57);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (246, 31, 'ORD_246', '2015-05-10', 482800, 55);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (247, 12, 'ORD_247', '2015-01-07', 3636679, 54);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (249, 19, 'ORD_249', '2015-04-14', 1224800, 52);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (250, 39, 'ORD_250', '2015-05-22', 9708677, 51);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (252, 20, 'ORD_252', '2015-05-27', 3253924, 49);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (253, 20, 'ORD_253', '2015-01-31', 5636260, 48);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (254, 9, 'ORD_254', '2015-04-03', 9109685, 47);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (255, 36, 'ORD_255', '2015-05-28', 9040524, 46);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (256, 24, 'ORD_256', '2015-01-14', 6545847, 45);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (257, 15, 'ORD_257', '2015-06-24', 6340226, 44);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (258, 14, 'ORD_258', '2015-02-27', 9734158, 43);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (260, 38, 'ORD_260', '2015-04-29', 9859147, 41);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (261, 30, 'ORD_261', '2015-05-25', 8262672, 40);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (262, 39, 'ORD_262', '2015-03-31', 9160233, 39);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (263, 43, 'ORD_263', '2015-05-08', 3754484, 38);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (265, 14, 'ORD_265', '2015-03-28', 8881156, 36);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (266, 24, 'ORD_266', '2015-02-02', 6942022, 35);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (267, 47, 'ORD_267', '2015-06-09', 7503164, 34);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (268, 4, 'ORD_268', '2015-05-30', 9281007, 33);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (269, 47, 'ORD_269', '2015-02-16', 8707153, 32);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (270, 23, 'ORD_270', '2015-03-01', 5554397, 31);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (271, 8, 'ORD_271', '2015-02-21', 6324722, 30);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (272, 35, 'ORD_272', '2015-03-03', 2987745, 29);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (274, 7, 'ORD_274', '2015-01-14', 134651, 27);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (275, 3, 'ORD_275', '2015-06-29', 6977860, 26);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (276, 49, 'ORD_276', '2015-04-19', 1987614, 25);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (277, 43, 'ORD_277', '2015-02-14', 5238561, 24);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (278, 9, 'ORD_278', '2015-06-17', 709853, 23);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (280, 12, 'ORD_280', '2015-01-24', 9789051, 21);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (281, 45, 'ORD_281', '2015-02-23', 5055836, 20);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (282, 3, 'ORD_282', '2015-01-03', 1320548, 19);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (283, 41, 'ORD_283', '2015-06-11', 2066377, 18);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (284, 5, 'ORD_284', '2015-04-21', 9953541, 17);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (285, 42, 'ORD_285', '2015-01-11', 7766415, 16);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (286, 4, 'ORD_286', '2015-02-15', 2737632, 15);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (288, 38, 'ORD_288', '2015-01-24', 9971046, 13);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (289, 43, 'ORD_289', '2015-04-29', 4392841, 12);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (290, 19, 'ORD_290', '2015-04-22', 2058454, 11);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (291, 36, 'ORD_291', '2015-01-08', 9625935, 10);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (292, 21, 'ORD_292', '2015-05-13', 6549394, 9);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (293, 15, 'ORD_293', '2015-05-11', 7591409, 8);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (294, 25, 'ORD_294', '2015-04-29', 6688428, 7);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (295, 18, 'ORD_295', '2015-02-06', 2025094, 6);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (296, 41, 'ORD_296', '2015-06-13', 145707, 5);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (297, 33, 'ORD_297', '2015-01-01', 7941840, 4);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (298, 21, 'ORD_298', '2015-01-13', 1879205, 3);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (299, 42, 'ORD_299', '2015-06-10', 7536487, 2);
INSERT INTO `appt_store`.`deal` (`id`, `client_id`, `number`, `deal_date`, `cost`, `appt_id`) VALUES (300, 14, 'ORD_300', '2015-03-20', 6695006, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`project_has_feature`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 1);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 1);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (9, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 5);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (3, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 7);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 5);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 7);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (4, 14);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 12);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 1);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 14);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 12);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (9, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (9, 14);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 7);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 7);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (9, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 5);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 14);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 5);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (4, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 12);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (4, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (2, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 12);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (2, 7);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (8, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 14);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (7, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 1);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (3, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 2);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 1);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (2, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (13, 12);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (1, 5);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 12);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (5, 4);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (4, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (3, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (14, 15);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (10, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (3, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 7);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 13);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 9);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (9, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (11, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (12, 11);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 3);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (3, 10);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (6, 6);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (4, 8);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (9, 1);
INSERT INTO `appt_store`.`project_has_feature` (`project_id`, `feature_id`) VALUES (15, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appt_store`.`appt_has_feature`
-- -----------------------------------------------------
START TRANSACTION;
USE `appt_store`;
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (220, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (182, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (48, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (13, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (204, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (81, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (7, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (147, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (250, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (192, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (232, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (36, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (138, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (264, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (141, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (300, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (235, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (77, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (219, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (186, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (16, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (223, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (181, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (282, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (39, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (95, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (64, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (145, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (252, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (179, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (57, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (74, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (10, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (81, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (83, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (263, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (176, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (140, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (31, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (248, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (293, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (167, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (285, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (18, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (290, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (55, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (151, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (175, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (22, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (58, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (135, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (208, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (223, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (174, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (239, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (203, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (55, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (200, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (114, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (29, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (99, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (204, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (229, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (219, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (205, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (76, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (240, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (189, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (182, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (146, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (57, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (236, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (142, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (133, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (300, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (190, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (180, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (148, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (42, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (103, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (24, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (156, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (175, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (3, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (283, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (296, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (15, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (86, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (155, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (77, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (58, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (124, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (272, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (175, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (125, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (133, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (149, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (94, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (273, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (166, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (243, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (150, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (123, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (201, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (114, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (18, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (87, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (276, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (261, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (38, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (258, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (168, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (118, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (280, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (247, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (234, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (207, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (244, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (1, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (160, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (67, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (106, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (270, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (220, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (223, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (61, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (280, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (18, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (133, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (208, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (285, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (226, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (274, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (127, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (143, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (85, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (179, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (253, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (169, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (293, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (275, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (40, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (203, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (68, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (134, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (34, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (115, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (70, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (178, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (133, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (156, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (13, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (201, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (88, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (251, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (217, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (72, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (203, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (169, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (95, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (164, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (11, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (128, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (159, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (248, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (220, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (232, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (43, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (198, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (178, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (114, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (90, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (31, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (68, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (176, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (16, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (116, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (92, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (83, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (188, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (282, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (4, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (62, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (10, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (219, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (213, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (11, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (44, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (68, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (286, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (59, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (46, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (277, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (128, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (21, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (249, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (241, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (230, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (226, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (132, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (55, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (237, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (93, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (298, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (77, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (100, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (279, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (79, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (268, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (106, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (225, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (114, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (172, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (1, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (259, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (249, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (91, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (187, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (49, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (188, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (206, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (20, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (269, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (77, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (97, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (180, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (259, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (45, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (260, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (158, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (99, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (263, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (190, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (237, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (96, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (111, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (208, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (149, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (102, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (47, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (84, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (67, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (107, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (197, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (29, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (7, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (161, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (63, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (224, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (253, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (183, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (144, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (254, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (8, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (255, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (275, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (73, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (52, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (213, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (43, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (166, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (136, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (183, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (141, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (109, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (225, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (247, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (255, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (162, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (162, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (287, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (13, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (179, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (259, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (279, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (236, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (65, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (131, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (5, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (133, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (112, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (140, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (239, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (223, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (175, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (61, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (284, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (126, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (161, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (170, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (185, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (27, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (56, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (8, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (99, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (56, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (231, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (34, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (279, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (16, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (99, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (144, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (26, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (140, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (167, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (234, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (149, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (13, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (108, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (223, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (152, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (118, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (239, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (201, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (101, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (50, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (59, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (191, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (300, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (204, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (40, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (150, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (230, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (48, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (283, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (13, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (110, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (263, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (64, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (184, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (84, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (166, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (125, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (161, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (37, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (80, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (63, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (282, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (171, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (105, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (262, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (68, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (31, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (72, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (121, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (168, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (279, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (82, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (263, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (4, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (213, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (102, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (5, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (235, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (73, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (88, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (66, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (54, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (24, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (120, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (52, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (288, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (100, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (245, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (198, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (215, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (238, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (88, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (34, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (15, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (267, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (96, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (247, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (239, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (33, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (145, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (272, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (216, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (292, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (276, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (37, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (227, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (181, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (72, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (134, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (49, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (155, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (165, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (204, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (169, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (30, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (21, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (187, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (123, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (47, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (167, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (31, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (138, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (61, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (6, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (291, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (226, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (48, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (225, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (224, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (44, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (175, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (256, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (173, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (73, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (248, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (194, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (217, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (61, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (17, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (7, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (299, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (78, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (199, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (199, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (261, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (260, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (19, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (269, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (61, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (279, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (292, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (200, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (161, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (162, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (173, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (117, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (179, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (274, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (95, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (14, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (123, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (128, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (219, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (148, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (209, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (238, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (293, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (250, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (42, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (26, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (233, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (37, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (18, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (45, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (120, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (150, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (270, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (161, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (241, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (6, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (98, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (60, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (109, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (120, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (267, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (85, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (205, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (258, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (49, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (62, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (27, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (21, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (236, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (261, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (192, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (142, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (123, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (36, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (251, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (102, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (177, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (278, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (150, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (121, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (79, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (225, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (14, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (160, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (110, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (102, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (52, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (198, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (202, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (9, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (139, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (249, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (46, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (251, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (240, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (154, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (166, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (195, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (144, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (136, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (259, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (15, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (112, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (140, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (67, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (190, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (154, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (242, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (190, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (108, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (292, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (134, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (289, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (77, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (127, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (127, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (137, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (173, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (177, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (156, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (40, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (22, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (147, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (117, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (153, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (79, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (31, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (221, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (33, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (43, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (19, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (93, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (44, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (28, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (46, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (39, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (103, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (244, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (48, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (173, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (31, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (71, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (255, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (123, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (151, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (74, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (227, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (201, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (71, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (272, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (36, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (187, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (123, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (283, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (12, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (209, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (105, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (204, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (130, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (132, 15);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (187, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (26, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (36, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (235, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (300, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (108, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (254, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (125, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (192, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (189, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (205, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (289, 1);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (55, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (184, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (183, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (13, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (140, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (150, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (178, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (144, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (188, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (233, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (224, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (206, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (18, 3);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (132, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (32, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (224, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (260, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (82, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (233, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (234, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (110, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (114, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (254, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (168, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (141, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (120, 8);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (253, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (263, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (295, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (93, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (14, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (38, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (138, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (282, 10);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (118, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (277, 11);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (83, 9);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (103, 14);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (244, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (71, 2);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (218, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (24, 12);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (161, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (274, 5);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (260, 7);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (206, 13);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (261, 4);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (246, 6);
INSERT INTO `appt_store`.`appt_has_feature` (`appt_id`, `feature_id`) VALUES (223, 11);

COMMIT;

