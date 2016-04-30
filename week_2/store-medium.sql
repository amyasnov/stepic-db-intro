SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `store-medium`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store-medium`.`category` ;

CREATE TABLE IF NOT EXISTS `store-medium`.`category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store-medium`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store-medium`.`product` ;

CREATE TABLE IF NOT EXISTS `store-medium`.`product` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(255) NULL,
  `price` DECIMAL(18,2) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `fk_product_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `store-medium`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `store-medium`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `store-medium`;
INSERT INTO `store-medium`.`category` (`category_id`, `category_name`) VALUES (1, 'Water');
INSERT INTO `store-medium`.`category` (`category_id`, `category_name`) VALUES (2, 'Cakes');
INSERT INTO `store-medium`.`category` (`category_id`, `category_name`) VALUES (3, 'Juices');
INSERT INTO `store-medium`.`category` (`category_id`, `category_name`) VALUES (4, 'Candy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `store-medium`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `store-medium`;
INSERT INTO `store-medium`.`product` (`product_id`, `product_name`, `price`, `category_id`) VALUES (1, 'Konksing', 95, 3);
INSERT INTO `store-medium`.`product` (`product_id`, `product_name`, `price`, `category_id`) VALUES (2, 'Sancof', 917, 2);
INSERT INTO `store-medium`.`product` (`product_id`, `product_name`, `price`, `category_id`) VALUES (3, 'Faxtom', 694, 1);
INSERT INTO `store-medium`.`product` (`product_id`, `product_name`, `price`, `category_id`) VALUES (4, 'Hot Ex', 976, 1);
INSERT INTO `store-medium`.`product` (`product_id`, `product_name`, `price`, `category_id`) VALUES (5, 'Lightin', 786, 2);
INSERT INTO `store-medium`.`product` (`product_id`, `product_name`, `price`, `category_id`) VALUES (6, 'Vaiaing', 915, 1);

COMMIT;

