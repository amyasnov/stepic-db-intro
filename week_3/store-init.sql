-- -----------------------------------------------------
-- Table `good`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `good` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `price` DECIMAL(16,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `category_has_good`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category_has_good` (
  `category_id` INT NOT NULL,
  `good_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `good_id`),
  INDEX `fk_category_has_good_good1_idx` (`good_id` ASC),
  INDEX `fk_category_has_good_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_good_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_good_good1`
    FOREIGN KEY (`good_id`)
    REFERENCES `good` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `status` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `source`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `client` (
  `id` INT NOT NULL,
  `code` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `source_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_source1_idx` (`source_id` ASC),
  CONSTRAINT `fk_client_source1`
    FOREIGN KEY (`source_id`)
    REFERENCES `source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sale` (
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
    REFERENCES `status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `sale_has_good`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sale_has_good` (
  `sale_id` INT NOT NULL,
  `good_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`, `good_id`),
  INDEX `fk_order_has_good_good1_idx` (`good_id` ASC),
  INDEX `fk_order_has_good_sale1_idx` (`sale_id` ASC),
  CONSTRAINT `fk_order_has_good_sale1`
    FOREIGN KEY (`sale_id`)
    REFERENCES `sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_good_good1`
    FOREIGN KEY (`good_id`)
    REFERENCES `good` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `sale_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sale_history` (
  `id` INT NOT NULL,
  `sale_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `sale_sum` DECIMAL(18,2) NULL,
  `active_from` DATETIME NOT NULL,
  `active_to` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_history_sale1_idx` (`sale_id` ASC),
  INDEX `fk_order_history_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_order_history_sale1`
    FOREIGN KEY (`sale_id`)
    REFERENCES `sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_history_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
