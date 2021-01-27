-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `store` ;

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`good`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`good` ;

CREATE TABLE IF NOT EXISTS `store`.`good` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `price` DECIMAL(16,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`category` ;

CREATE TABLE IF NOT EXISTS `store`.`category` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`category_has_good`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`category_has_good` ;

CREATE TABLE IF NOT EXISTS `store`.`category_has_good` (
  `category_id` INT NOT NULL,
  `good_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `good_id`),
  INDEX `fk_category_has_good_good1_idx` (`good_id` ASC),
  INDEX `fk_category_has_good_category_idx` (`category_id` ASC),
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
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`status` ;

CREATE TABLE IF NOT EXISTS `store`.`status` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  `source_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_source1_idx` (`source_id` ASC),
  CONSTRAINT `fk_client_source1`
    FOREIGN KEY (`source_id`)
    REFERENCES `store`.`source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`sale` ;

CREATE TABLE IF NOT EXISTS `store`.`sale` (
  `id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `number` VARCHAR(255) NULL,
  `dt_created` DATETIME NOT NULL,
  `dt_modified` DATETIME NOT NULL,
  `sale_sum` DECIMAL(18,2) NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `number_UNIQUE` (`number` ASC),
  INDEX `fk_order_status1_idx` (`status_id` ASC),
  INDEX `fk_order_client1_idx` (`client_id` ASC),
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
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`sale_has_good`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`sale_has_good` ;

CREATE TABLE IF NOT EXISTS `store`.`sale_has_good` (
  `sale_id` INT NOT NULL,
  `good_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`, `good_id`),
  INDEX `fk_order_has_good_good1_idx` (`good_id` ASC),
  INDEX `fk_order_has_good_sale1_idx` (`sale_id` ASC),
  CONSTRAINT `fk_order_has_good_sale1`
    FOREIGN KEY (`sale_id`)
    REFERENCES `store`.`sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_good_good1`
    FOREIGN KEY (`good_id`)
    REFERENCES `store`.`good` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;