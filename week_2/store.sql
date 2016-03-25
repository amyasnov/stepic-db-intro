SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `store` ;
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`good`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`good` ;

CREATE TABLE IF NOT EXISTS `store`.`good` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `store`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`category` ;

CREATE TABLE IF NOT EXISTS `store`.`category` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `store`.`category_has_good`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`category_has_good` ;

CREATE TABLE IF NOT EXISTS `store`.`category_has_good` (
  `category_id` INT NOT NULL,
  `good_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `good_id`),
  CONSTRAINT `fk_category_has_good_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `store`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_good_good1`
    FOREIGN KEY (`good_id`)
    REFERENCES `store`.`good` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `fk_category_has_good_good1_idx` ON `store`.`category_has_good` (`good_id` ASC);

CREATE INDEX `fk_category_has_good_category_idx` ON `store`.`category_has_good` (`category_id` ASC);


-- -----------------------------------------------------
-- Table `store`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`status` ;

CREATE TABLE IF NOT EXISTS `store`.`status` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `store`.`source`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`source` ;

CREATE TABLE IF NOT EXISTS `store`.`source` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`client` ;

CREATE TABLE IF NOT EXISTS `store`.`client` (
  `id` INT NOT NULL,
  `code` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `source_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_client_source1`
    FOREIGN KEY (`source_id`)
    REFERENCES `store`.`source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_client_source1_idx` ON `store`.`client` (`source_id` ASC);


-- -----------------------------------------------------
-- Table `store`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`order` ;

CREATE TABLE IF NOT EXISTS `store`.`order` (
  `id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `number` VARCHAR(255) NULL,
  `dt_created` DATETIME NOT NULL,
  `dt_modified` DATETIME NOT NULL,
  `sum` DECIMAL(18,2) NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `store`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `store`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE UNIQUE INDEX `number_UNIQUE` ON `store`.`order` (`number` ASC);

CREATE INDEX `fk_order_status1_idx` ON `store`.`order` (`status_id` ASC);

CREATE INDEX `fk_order_client1_idx` ON `store`.`order` (`client_id` ASC);


-- -----------------------------------------------------
-- Table `store`.`order_has_good`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`order_has_good` ;

CREATE TABLE IF NOT EXISTS `store`.`order_has_good` (
  `order_id` INT NOT NULL,
  `good_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `good_id`),
  CONSTRAINT `fk_order_has_good_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `store`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_good_good1`
    FOREIGN KEY (`good_id`)
    REFERENCES `store`.`good` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `fk_order_has_good_good1_idx` ON `store`.`order_has_good` (`good_id` ASC);

CREATE INDEX `fk_order_has_good_order1_idx` ON `store`.`order_has_good` (`order_id` ASC);


-- -----------------------------------------------------
-- Table `store`.`order_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`order_history` ;

CREATE TABLE IF NOT EXISTS `store`.`order_history` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `sum` DECIMAL(18,2) NULL,
  `active_from` DATETIME NOT NULL,
  `active_to` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_history_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `store`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_history_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `store`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_order_history_order1_idx` ON `store`.`order_history` (`order_id` ASC);

CREATE INDEX `fk_order_history_status1_idx` ON `store`.`order_history` (`status_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
