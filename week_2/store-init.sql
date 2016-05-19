-- -----------------------------------------------------
-- Table `good`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `good` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `price` DECIMAL(16,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `status` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
ENGINE = InnoDB;


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
ENGINE = InnoDB;


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


-- -----------------------------------------------------
-- Data for table `good`
-- -----------------------------------------------------
INSERT INTO `good` (`id`, `name`, `price`) VALUES (1, 'Trust-Dax', 165.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (2, 'Statcom', 516.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (3, 'Konksing', 857.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (4, 'Sancof', 960.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (5, 'Geo-Ity', 250.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (6, 'Faxtom', 944.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (7, 'K-ing', 881.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (8, 'Re Hattip', 295.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (9, 'Transtraxing', 394.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (10, 'Sailjob', 438.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (11, 'Hot Ex', 221.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (12, 'Volt Fan', 770.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (13, 'Zaam Warm', 548.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (14, 'Saoplus', 705.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (15, 'Bio Hotin', 710.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (16, 'S--Tip', 707.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (17, 'Saltsoft', 310.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (18, 'Rankeco', 141.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (19, 'Zenron', 233.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (20, 'Pluswarm', 881.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (21, 'Lam Zumtrax', 123.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (22, 'Bigwarm', 146.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (23, 'Homelex', 501.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (24, 'Fresh Strong', 171.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (25, 'Flexkix', 781.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (26, 'Lightin', 153.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (27, 'Biostrong', 350.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (28, 'Kin Sillux', 290.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (29, 'Groovejob', 186.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (30, 'Vaiaing', 704.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (31, 'Apcantech', 426.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (32, 'Tough Statla', 642.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (33, 'Ranex', 354.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (34, 'Keydandom', 447.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (35, 'Tamp-Tex', 286.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (36, 'Zoombam', 691.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (37, 'Spanplus', 867.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (38, 'Jay Keydex', 423.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (39, 'Jobcof', 467.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (40, 'Grooveity', 245.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (41, 'Techeco', 555.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (42, 'Zerdex', 607.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (43, 'Overlight', 1000.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (44, 'Geolax', 904.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (45, 'Fase Jaylux', 929.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (46, 'Alphagohold', 735.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (47, 'Canlatplus', 217.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (48, 'Strongfind', 713.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (49, 'Hattip', 586.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (50, 'Opestring', 398.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (51, 'Nimdom', 216.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (52, 'Singtough', 519.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (53, 'Kan String', 534.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (54, 'Zerwarm', 707.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (55, 'Danity', 252.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (56, 'Bam-Sing', 994.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (57, 'Unisantech', 365.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (58, 'Ontofind', 859.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (59, 'Refan', 386.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (60, 'Intip', 441.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (61, 'Eco Nimtouch', 542.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (62, 'Alphaflex', 626.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (63, 'Funtoit', 225.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (64, 'Stim Tone', 235.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (65, 'Key Solostock', 646.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (66, 'Singlezumjob', 506.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (67, 'Nimtone', 503.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (68, 'Xxx-tam', 397.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (69, 'Trippleovetough', 467.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (70, 'Sandax', 225.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (71, 'Strongis', 625.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (72, 'Stockdom', 603.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (73, 'Salt Sanity', 972.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (74, 'Zathzimis', 562.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (75, 'Light-Dax', 816.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (76, 'New Dom', 192.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (77, 'Tempphase', 372.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (78, 'Flexstock', 533.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (79, 'Freshnix', 728.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (80, 'Zencom', 605.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (81, 'K--Fax', 161.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (82, 'Tipstring', 216.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (83, 'Sumzap', 588.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (84, 'Strongflex', 567.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (85, 'Zotex', 379.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (86, 'Roundit', 632.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (87, 'Namnix', 849.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (88, 'Zon Kayfresh', 905.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (89, 'Strong Ozejob', 532.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (90, 'Jaykix', 661.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (91, 'Ranknix', 923.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (92, 'Superhome', 322.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (93, 'Geo Plus', 317.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (94, 'Treeit', 407.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (95, 'Zam-La', 167.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (96, 'Quad Finkix', 469.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (97, 'Zaam Runnix', 346.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (98, 'Dantax', 696.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (99, 'Voldox', 359.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (100, 'Laming', 672.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (101, 'Opensoft', 185.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (102, 'Ecotax', 197.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (103, 'Transla', 866.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (104, 'Zenphase', 548.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (105, 'Donredlex', 720.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (106, 'Doublecof', 863.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (107, 'Latnix', 485.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (108, 'Alpha Qvotone', 200.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (109, 'Ozerit', 989.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (110, 'Soft Phase', 274.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (111, 'An Sanstring', 113.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (112, 'Physfind', 134.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (113, 'Airsantom', 797.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (114, 'Ontozap', 848.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (115, 'Zonedex', 707.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (116, 'Vaiatone', 232.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (117, 'Superlab', 317.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (118, 'Open Dom', 516.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (119, 'Itdom', 788.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (120, 'Zoolex', 772.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (121, 'Tran Ancom', 635.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (122, 'Zotstring', 222.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (123, 'Lam Nimplus', 558.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (124, 'Over Dubtough', 105.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (125, 'Dam Jaystock', 386.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (126, 'Tripple-Dox', 758.00);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (127, 'Sanlex', 704.00);

-- -----------------------------------------------------
-- Data for table `good`
-- -----------------------------------------------------
INSERT INTO `good` (`id`, `name`, `price`) VALUES (1, 'Trust-Dax', 165);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (2, 'Statcom', 516);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (3, 'Konksing', 857);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (4, 'Sancof', 960);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (5, 'Geo-Ity', 250);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (6, 'Faxtom', 944);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (7, 'K-ing', 881);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (8, 'Re Hattip', 295);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (9, 'Transtraxing', 394);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (10, 'Sailjob', 438);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (11, 'Hot Ex', 221);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (12, 'Volt Fan', 770);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (13, 'Zaam Warm', 548);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (14, 'Saoplus', 705);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (15, 'Bio Hotin', 710);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (16, 'S--Tip', 707);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (17, 'Saltsoft', 310);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (18, 'Rankeco', 141);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (19, 'Zenron', 233);
INSERT INTO `good` (`id`, `name`, `price`) VALUES (20, 'Pluswarm', 881);

-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Air Fresheners');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Bath Products');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Cakes');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Candy');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Dental Care');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'Health & Medicine');
INSERT INTO `category` (`id`, `name`) VALUES (7, 'Juices');
INSERT INTO `category` (`id`, `name`) VALUES (8, 'Snacks');
INSERT INTO `category` (`id`, `name`) VALUES (9, 'Tea & Coffee');
INSERT INTO `category` (`id`, `name`) VALUES (10, 'Water');
INSERT INTO `category` (`id`, `name`) VALUES (11, 'Seasonings & Spices');
INSERT INTO `category` (`id`, `name`) VALUES (12, 'Pasta & Noodles');
INSERT INTO `category` (`id`, `name`) VALUES (13, 'Fruits & Vegetables');


-- -----------------------------------------------------
-- Data for table `category_has_good`
-- -----------------------------------------------------
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 17);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 18);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 13);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 9);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 13);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (1, 3);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 17);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (8, 1);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 7);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 3);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 7);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (1, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 9);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 9);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 9);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 6);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 12);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (7, 18);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (5, 7);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 8);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 15);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 1);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (8, 2);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 1);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (5, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (7, 6);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 12);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 8);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (5, 6);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 10);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 15);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 14);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (7, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 10);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (5, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 6);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 18);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 8);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 17);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (8, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 7);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 11);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 6);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 13);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (1, 8);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 14);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (1, 1);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 15);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (1, 5);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (5, 13);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 10);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (8, 7);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (5, 15);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (8, 18);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 3);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (10, 11);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 12);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 17);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (8, 11);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 6);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (2, 18);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (7, 4);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (6, 3);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (7, 15);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (3, 5);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 7);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (4, 18);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (9, 16);
INSERT INTO `category_has_good` (`category_id`, `good_id`) VALUES (7, 11);


-- -----------------------------------------------------
-- Data for table `status`
-- -----------------------------------------------------
INSERT INTO `status` (`id`, `name`) VALUES (1, 'new');
INSERT INTO `status` (`id`, `name`) VALUES (2, 'process');
INSERT INTO `status` (`id`, `name`) VALUES (3, 'assembly');
INSERT INTO `status` (`id`, `name`) VALUES (4, 'ready');
INSERT INTO `status` (`id`, `name`) VALUES (5, 'delivering');
INSERT INTO `status` (`id`, `name`) VALUES (6, 'issued');
INSERT INTO `status` (`id`, `name`) VALUES (7, 'rejected');


-- -----------------------------------------------------
-- Data for table `source`
-- -----------------------------------------------------
INSERT INTO `source` (`id`, `name`) VALUES (1, 'Direct link');
INSERT INTO `source` (`id`, `name`) VALUES (2, 'Google search');
INSERT INTO `source` (`id`, `name`) VALUES (3, 'Campaign');
INSERT INTO `source` (`id`, `name`) VALUES (4, 'AdWords');
INSERT INTO `source` (`id`, `name`) VALUES (5, 'Advertisement');
INSERT INTO `source` (`id`, `name`) VALUES (6, 'Banner');
INSERT INTO `source` (`id`, `name`) VALUES (7, 'SN');


-- -----------------------------------------------------
-- Data for table `client`
-- -----------------------------------------------------
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (1, 'client_1', 'Kristy', 'Dean', 5);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (2, 'client_2', 'Ellis', 'Ortega', 1);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (3, 'client_3', 'Joseph', 'Bridges', 4);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (4, 'client_4', 'Brandon', 'Porter', 3);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (5, 'client_5', 'Lowell', 'Hamilton', 5);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (6, 'client_6', 'Sherman', 'Rogers', 1);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (7, 'client_7', 'Bessie', 'Reynolds', 7);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (8, 'client_8', 'Willie', 'Day', 2);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (9, 'client_9', 'Maggie', 'Jennings', 5);
INSERT INTO `client` (`id`, `code`, `first_name`, `last_name`, `source_id`) VALUES (10, 'client_10', 'Gene', 'Copeland', 7);


-- -----------------------------------------------------
-- Data for table `sale`
-- -----------------------------------------------------
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (1, 2, 'ORD_1', '14.02.2015', '15.02.2015', 4303, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (2, 2, 'ORD_2', '03.02.2015', '22.05.2015', 7740, 3);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (3, 3, 'ORD_3', '24.03.2015', '06.05.2015', 5369, 3);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (4, 4, 'ORD_4', '01.01.2015', '19.04.2015', 2749, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (5, 5, 'ORD_5', '27.05.2015', '27.06.2015', 4768, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (6, 5, 'ORD_6', '19.06.2015', '25.06.2015', 3242, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (7, 7, 'ORD_7', '10.06.2015', '23.06.2015', 7181, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (8, 6, 'ORD_8', '29.01.2015', '16.05.2015', 1766, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (9, 8, 'ORD_9', '09.06.2015', '29.06.2015', 4695, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (10, 10, 'ORD_10', '18.02.2015', '30.03.2015', 5904, 3);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (11, 2, 'ORD_11', '03.03.2015', '27.06.2015', 3672, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (12, 2, 'ORD_12', '29.05.2015', '12.06.2015', 8400, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (13, 4, 'ORD_13', '03.01.2015', '21.04.2015', 9238, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (14, 2, 'ORD_14', '19.05.2015', '16.06.2015', 9197, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (15, 6, 'ORD_15', '19.03.2015', '08.05.2015', 3038, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (16, 2, 'ORD_16', '29.01.2015', '11.05.2015', 3305, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (17, 7, 'ORD_17', '06.06.2015', '24.06.2015', 6980, 4);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (18, 3, 'ORD_18', '15.05.2015', '01.06.2015', 8154, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (19, 3, 'ORD_19', '13.02.2015', '03.06.2015', 8100, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (20, 9, 'ORD_20', '21.01.2015', '01.06.2015', 8349, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (21, 10, 'ORD_21', '13.06.2015', '29.06.2015', 5875, 4);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (22, 4, 'ORD_22', '29.04.2015', '07.06.2015', 7681, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (23, 9, 'ORD_23', '22.03.2015', '01.06.2015', 8493, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (24, 8, 'ORD_24', '16.06.2015', '24.06.2015', 2662, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (25, 5, 'ORD_25', '19.06.2015', '29.06.2015', 7256, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (26, 6, 'ORD_26', '06.01.2015', '23.06.2015', 1956, 4);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (27, 5, 'ORD_27', '05.04.2015', '01.06.2015', 6373, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (28, 1, 'ORD_28', '16.06.2015', '29.06.2015', 7018, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (29, 4, 'ORD_29', '22.03.2015', '27.04.2015', 7470, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (30, 2, 'ORD_30', '01.03.2015', '19.05.2015', 8467, 5);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (31, 1, 'ORD_31', '08.05.2015', '26.06.2015', 9968, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (32, 5, 'ORD_32', '22.06.2015', '28.06.2015', 2059, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (33, 10, 'ORD_33', '25.03.2015', '26.06.2015', 3695, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (34, 9, 'ORD_34', '09.06.2015', '12.06.2015', 3934, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (35, 10, 'ORD_35', '19.05.2015', '24.06.2015', 6821, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (36, 10, 'ORD_36', '24.06.2015', '29.06.2015', 9434, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (37, 8, 'ORD_37', '22.01.2015', '14.06.2015', 9973, 6);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (38, 10, 'ORD_38', '28.03.2015', '25.05.2015', 5867, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (39, 5, 'ORD_39', '24.03.2015', '12.04.2015', 3167, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (40, 2, 'ORD_40', '14.01.2015', '16.04.2015', 9280, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (41, 5, 'ORD_41', '09.06.2015', '25.06.2015', 8326, 4);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (42, 9, 'ORD_42', '09.02.2015', '13.06.2015', 9676, 2);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (43, 4, 'ORD_43', '30.01.2015', '14.05.2015', 2818, 7);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (44, 2, 'ORD_44', '01.02.2015', '19.06.2015', 4681, 4);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (45, 6, 'ORD_45', '24.06.2015', '28.06.2015', 6557, 3);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (46, 4, 'ORD_46', '31.05.2015', '11.06.2015', 4026, 1);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (47, 7, 'ORD_47', '31.05.2015', '13.06.2015', 5286, 4);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (48, 4, 'ORD_48', '05.05.2015', '16.06.2015', 5945, 3);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (49, 1, 'ORD_49', '08.05.2015', '24.06.2015', 6559, 5);
INSERT INTO `sale` (`id`, `client_id`, `number`, `dt_created`, `dt_modified`, `sale_sum`, `status_id`) VALUES (50, 4, 'ORD_50', '13.03.2015', '28.04.2015', 9287, 1);


-- -----------------------------------------------------
-- Data for table `sale_has_good`
-- -----------------------------------------------------
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (44, 5);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (41, 7);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (30, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (44, 2);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (19, 18);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (41, 12);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (24, 5);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (14, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (13, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (3, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (23, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (30, 2);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (18, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (45, 1);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (22, 14);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (39, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (34, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (50, 6);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (22, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (30, 17);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (38, 7);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (3, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (16, 5);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (39, 13);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (21, 12);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (7, 10);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (29, 5);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (47, 6);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (16, 17);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (1, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (39, 14);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (9, 19);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (22, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (10, 5);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (33, 14);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (30, 12);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (25, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (42, 9);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (7, 7);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (29, 2);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (17, 12);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (3, 17);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (24, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (38, 8);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (31, 13);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (33, 20);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (38, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (17, 6);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (39, 19);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (15, 13);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (44, 19);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (48, 3);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (2, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (3, 2);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (37, 10);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (14, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (37, 1);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (7, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (16, 3);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (37, 3);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (40, 7);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (41, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (38, 9);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (14, 20);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (46, 18);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (30, 8);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (32, 3);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (32, 7);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (44, 13);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (16, 12);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (45, 20);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (36, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (43, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (38, 2);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (5, 6);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (29, 17);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (36, 4);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (46, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (31, 8);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (15, 8);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (22, 8);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (7, 18);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (42, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (25, 12);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (15, 6);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (36, 16);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (24, 6);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (30, 13);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (3, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (5, 15);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (25, 17);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (50, 11);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (50, 18);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (1, 9);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (18, 7);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (13, 8);
INSERT INTO `sale_has_good` (`sale_id`, `good_id`) VALUES (5, 4);


-- -----------------------------------------------------
-- Data for table `sale_history`
-- -----------------------------------------------------
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (1, 46, 3, 3418, '22.02.2015', '06.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (2, 7, 6, 9551, '14.03.2015', '27.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (3, 3, 7, 6378, '26.01.2015', '20.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (4, 42, 1, 2213, '03.02.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (5, 28, 4, 6878, '01.05.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (6, 44, 6, 5611, '19.01.2015', '16.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (7, 3, 1, 9883, '12.01.2015', '13.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (8, 42, 5, 2877, '12.01.2015', '29.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (9, 20, 2, 1677, '04.05.2015', '17.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (10, 40, 6, 1395, '15.04.2015', '29.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (11, 27, 3, 3704, '03.01.2015', '04.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (12, 12, 6, 4205, '24.04.2015', '08.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (13, 16, 4, 6685, '07.05.2015', '14.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (14, 23, 5, 5150, '18.06.2015', '03.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (15, 50, 7, 7646, '20.03.2015', '19.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (16, 5, 3, 7939, '27.02.2015', '18.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (17, 4, 2, 3150, '29.05.2015', '10.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (18, 3, 3, 5814, '02.03.2015', '02.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (19, 10, 7, 4774, '07.05.2015', '02.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (20, 46, 5, 6858, '23.03.2015', '13.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (21, 32, 6, 9853, '24.05.2015', '24.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (22, 26, 3, 3397, '03.06.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (23, 26, 6, 7078, '12.06.2015', '07.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (24, 10, 5, 1477, '17.04.2015', '09.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (25, 44, 4, 8759, '09.01.2015', '06.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (26, 14, 7, 5389, '07.05.2015', '30.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (27, 22, 5, 1065, '24.06.2015', '30.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (28, 42, 3, 5471, '04.01.2015', '15.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (29, 36, 7, 8879, '10.03.2015', '30.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (30, 34, 7, 2113, '17.04.2015', '27.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (31, 50, 2, 7319, '18.02.2015', '02.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (32, 10, 1, 4322, '01.06.2015', '20.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (33, 13, 3, 5365, '20.04.2015', '18.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (34, 49, 5, 5878, '22.04.2015', '10.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (35, 17, 3, 7836, '21.05.2015', '16.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (36, 43, 4, 9750, '20.01.2015', '24.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (37, 18, 4, 1833, '28.02.2015', '16.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (38, 16, 2, 8815, '04.05.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (39, 23, 5, 8008, '15.02.2015', '10.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (40, 11, 5, 2030, '25.03.2015', '02.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (41, 9, 4, 8247, '08.01.2015', '21.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (42, 49, 6, 4539, '18.03.2015', '04.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (43, 40, 3, 7982, '15.02.2015', '25.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (44, 7, 3, 2247, '25.01.2015', '04.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (45, 1, 3, 2023, '21.06.2015', '15.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (46, 23, 6, 7436, '26.04.2015', '14.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (47, 3, 6, 8992, '08.02.2015', '07.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (48, 14, 2, 1634, '16.06.2015', '26.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (49, 25, 2, 9398, '13.02.2015', '17.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (50, 5, 7, 3225, '12.03.2015', '25.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (51, 6, 7, 4983, '20.03.2015', '24.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (52, 7, 3, 4585, '15.03.2015', '02.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (53, 50, 5, 5622, '27.02.2015', '06.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (54, 36, 6, 5960, '16.03.2015', '17.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (55, 17, 7, 5240, '22.01.2015', '26.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (56, 14, 4, 3873, '08.01.2015', '23.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (57, 11, 7, 7621, '28.03.2015', '28.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (58, 1, 4, 6116, '25.02.2015', '16.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (59, 9, 6, 8291, '28.03.2015', '14.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (60, 48, 6, 2876, '19.04.2015', '22.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (61, 11, 1, 9364, '31.03.2015', '03.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (62, 20, 6, 6034, '23.05.2015', '27.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (63, 4, 6, 8948, '26.01.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (64, 33, 3, 8819, '20.02.2015', '13.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (65, 39, 4, 5431, '10.02.2015', '28.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (66, 24, 2, 1847, '08.05.2015', '10.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (67, 2, 5, 4191, '14.06.2015', '24.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (68, 37, 5, 1770, '05.06.2015', '22.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (69, 15, 4, 7167, '12.03.2015', '30.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (70, 28, 3, 5002, '24.01.2015', '21.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (71, 14, 5, 4384, '01.03.2015', '17.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (72, 19, 6, 2020, '06.06.2015', '29.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (73, 34, 3, 8315, '22.04.2015', '29.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (74, 29, 3, 7451, '07.04.2015', '08.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (75, 24, 7, 8240, '22.04.2015', '11.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (76, 32, 4, 7572, '13.01.2015', '12.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (77, 49, 1, 3354, '22.01.2015', '28.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (78, 22, 5, 5703, '16.06.2015', '14.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (79, 29, 3, 9637, '17.01.2015', '31.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (80, 26, 4, 1395, '19.01.2015', '27.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (81, 5, 5, 7795, '11.03.2015', '21.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (82, 1, 5, 7393, '13.06.2015', '19.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (83, 3, 4, 4963, '02.02.2015', '03.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (84, 33, 4, 9850, '16.03.2015', '20.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (85, 37, 1, 4132, '28.03.2015', '04.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (86, 5, 5, 6977, '03.01.2015', '03.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (87, 9, 7, 1233, '01.01.2015', '09.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (88, 50, 4, 2717, '27.01.2015', '15.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (89, 30, 6, 2078, '08.06.2015', '15.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (90, 40, 1, 8158, '06.06.2015', '10.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (91, 22, 4, 7996, '27.06.2015', '26.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (92, 39, 4, 4730, '05.03.2015', '21.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (93, 14, 3, 6508, '19.04.2015', '06.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (94, 26, 4, 8560, '24.04.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (95, 10, 3, 8495, '10.02.2015', '25.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (96, 29, 7, 3425, '23.05.2015', '05.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (97, 31, 1, 2509, '04.06.2015', '06.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (98, 1, 2, 3663, '18.05.2015', '14.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (99, 34, 2, 1275, '04.02.2015', '16.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (100, 10, 1, 9944, '11.05.2015', '11.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (101, 36, 1, 7972, '06.03.2015', '10.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (102, 38, 7, 6194, '14.03.2015', '17.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (103, 4, 4, 5890, '26.03.2015', '13.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (104, 40, 3, 5789, '27.03.2015', '10.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (105, 49, 7, 9647, '26.04.2015', '21.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (106, 35, 6, 2844, '14.05.2015', '28.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (107, 48, 3, 4267, '11.01.2015', '28.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (108, 14, 3, 2469, '10.03.2015', '09.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (109, 5, 5, 7148, '30.06.2015', '11.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (110, 40, 7, 2499, '23.05.2015', '15.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (111, 41, 3, 9434, '04.01.2015', '12.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (112, 22, 7, 7822, '24.06.2015', '05.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (113, 37, 6, 5302, '15.03.2015', '11.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (114, 23, 7, 6061, '12.02.2015', '30.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (115, 19, 7, 6818, '28.02.2015', '24.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (116, 9, 2, 6481, '24.06.2015', '30.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (117, 30, 6, 9050, '06.03.2015', '07.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (118, 5, 4, 8091, '30.06.2015', '27.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (119, 47, 6, 2870, '21.04.2015', '23.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (120, 12, 4, 5109, '25.02.2015', '20.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (121, 26, 4, 7146, '07.06.2015', '28.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (122, 31, 5, 9154, '20.04.2015', '22.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (123, 39, 7, 2336, '23.06.2015', '23.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (124, 10, 2, 2643, '17.05.2015', '06.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (125, 5, 7, 8065, '14.06.2015', '20.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (126, 18, 3, 7923, '25.04.2015', '17.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (127, 41, 7, 9484, '23.02.2015', '15.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (128, 2, 5, 9880, '26.01.2015', '08.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (129, 30, 1, 4293, '09.04.2015', '16.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (130, 28, 6, 6683, '02.01.2015', '03.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (131, 20, 6, 6432, '17.01.2015', '01.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (132, 18, 4, 3047, '10.04.2015', '10.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (133, 45, 6, 7140, '19.06.2015', '22.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (134, 17, 2, 1017, '22.04.2015', '11.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (135, 44, 4, 1030, '11.05.2015', '01.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (136, 3, 1, 6398, '05.04.2015', '19.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (137, 44, 5, 3788, '07.05.2015', '25.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (138, 3, 7, 2859, '26.01.2015', '13.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (139, 40, 6, 4105, '13.05.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (140, 50, 5, 4400, '02.06.2015', '13.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (141, 6, 5, 6716, '11.02.2015', '21.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (142, 25, 2, 3728, '14.01.2015', '04.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (143, 17, 5, 5339, '23.04.2015', '03.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (144, 8, 5, 2176, '15.01.2015', '06.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (145, 40, 5, 6881, '08.01.2015', '29.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (146, 1, 1, 3614, '11.05.2015', '01.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (147, 38, 6, 6752, '09.05.2015', '20.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (148, 45, 4, 5153, '08.01.2015', '22.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (149, 19, 5, 2674, '27.05.2015', '26.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (150, 28, 2, 2044, '03.03.2015', '11.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (151, 45, 1, 9504, '14.03.2015', '08.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (152, 11, 3, 3332, '01.04.2015', '09.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (153, 15, 7, 1020, '09.03.2015', '29.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (154, 2, 1, 3550, '10.02.2015', '22.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (155, 50, 3, 9927, '19.03.2015', '27.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (156, 50, 4, 9150, '10.04.2015', '21.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (157, 28, 1, 3340, '25.06.2015', '18.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (158, 18, 3, 8524, '18.03.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (159, 10, 2, 2246, '11.05.2015', '25.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (160, 38, 3, 7446, '22.04.2015', '02.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (161, 16, 5, 3217, '20.01.2015', '03.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (162, 47, 5, 9942, '24.04.2015', '30.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (163, 15, 5, 3293, '16.02.2015', '12.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (164, 49, 6, 4105, '04.02.2015', '23.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (165, 44, 1, 6330, '22.04.2015', '17.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (166, 34, 1, 7066, '07.06.2015', '20.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (167, 49, 4, 3235, '22.04.2015', '01.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (168, 38, 2, 7686, '04.03.2015', '18.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (169, 16, 6, 6514, '13.04.2015', '05.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (170, 1, 7, 1662, '12.02.2015', '28.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (171, 33, 6, 8259, '11.01.2015', '12.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (172, 35, 6, 5631, '15.03.2015', '30.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (173, 7, 3, 1005, '13.01.2015', '12.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (174, 14, 5, 5963, '13.01.2015', '23.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (175, 40, 3, 6601, '18.03.2015', '11.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (176, 19, 4, 4057, '27.03.2015', '21.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (177, 17, 1, 6474, '05.05.2015', '01.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (178, 3, 2, 6499, '15.04.2015', '29.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (179, 50, 4, 5032, '28.05.2015', '09.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (180, 19, 3, 2557, '31.01.2015', '04.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (181, 30, 2, 9855, '31.01.2015', '12.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (182, 8, 1, 8941, '12.04.2015', '23.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (183, 43, 4, 3159, '30.05.2015', '08.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (184, 45, 2, 1474, '20.04.2015', '23.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (185, 21, 1, 6062, '17.05.2015', '26.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (186, 48, 4, 7526, '07.01.2015', '23.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (187, 17, 1, 2572, '09.02.2015', '18.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (188, 43, 2, 1879, '02.03.2015', '09.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (189, 9, 4, 5507, '13.06.2015', '02.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (190, 44, 3, 9687, '18.03.2015', '16.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (191, 30, 3, 9145, '05.04.2015', '18.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (192, 6, 4, 6729, '16.06.2015', '16.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (193, 19, 5, 8544, '28.05.2015', '26.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (194, 13, 2, 4868, '30.05.2015', '16.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (195, 4, 7, 6900, '15.02.2015', '30.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (196, 9, 3, 9141, '13.06.2015', '09.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (197, 35, 5, 8610, '13.03.2015', '02.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (198, 31, 6, 2023, '07.06.2015', '09.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (199, 38, 5, 9191, '07.03.2015', '14.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (200, 31, 6, 9446, '14.06.2015', '20.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (201, 11, 6, 2906, '12.03.2015', '21.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (202, 31, 5, 1981, '04.04.2015', '13.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (203, 43, 4, 7888, '15.02.2015', '29.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (204, 40, 1, 3379, '08.01.2015', '02.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (205, 43, 6, 5096, '13.06.2015', '15.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (206, 14, 7, 3280, '12.06.2015', '21.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (207, 22, 2, 4723, '06.03.2015', '21.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (208, 21, 5, 5682, '05.01.2015', '30.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (209, 42, 6, 8336, '01.05.2015', '29.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (210, 46, 5, 5720, '28.06.2015', '12.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (211, 27, 5, 5470, '23.04.2015', '24.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (212, 19, 7, 4579, '26.06.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (213, 29, 3, 4322, '27.04.2015', '18.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (214, 27, 5, 9257, '06.03.2015', '22.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (215, 50, 3, 8532, '19.03.2015', '20.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (216, 9, 6, 1519, '15.02.2015', '09.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (217, 28, 5, 5571, '27.03.2015', '01.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (218, 18, 3, 4382, '22.04.2015', '02.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (219, 36, 1, 1506, '16.03.2015', '14.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (220, 14, 4, 8248, '01.01.2015', '08.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (221, 14, 7, 8715, '21.04.2015', '27.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (222, 29, 5, 5546, '25.01.2015', '20.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (223, 28, 7, 2187, '22.02.2015', '15.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (224, 43, 1, 8225, '23.02.2015', '15.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (225, 9, 2, 1317, '14.03.2015', '23.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (226, 22, 1, 5706, '26.05.2015', '27.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (227, 5, 7, 9112, '25.03.2015', '12.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (228, 24, 4, 8936, '28.04.2015', '01.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (229, 16, 5, 2389, '06.02.2015', '23.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (230, 43, 7, 5524, '17.04.2015', '10.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (231, 11, 6, 8662, '21.03.2015', '05.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (232, 28, 3, 5227, '21.01.2015', '15.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (233, 40, 7, 8859, '28.06.2015', '06.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (234, 35, 7, 8938, '09.01.2015', '24.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (235, 1, 2, 9864, '27.05.2015', '22.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (236, 47, 3, 1656, '15.03.2015', '23.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (237, 30, 5, 2791, '18.05.2015', '17.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (238, 13, 4, 9677, '04.05.2015', '05.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (239, 13, 1, 2232, '29.05.2015', '29.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (240, 7, 3, 2861, '07.03.2015', '02.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (241, 18, 1, 2690, '08.06.2015', '14.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (242, 49, 2, 8120, '06.01.2015', '12.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (243, 20, 7, 3084, '17.05.2015', '01.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (244, 7, 7, 3656, '01.03.2015', '09.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (245, 35, 5, 6843, '25.06.2015', '03.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (246, 26, 2, 1984, '06.05.2015', '06.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (247, 45, 4, 5988, '29.03.2015', '04.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (248, 33, 7, 4251, '26.02.2015', '02.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (249, 25, 4, 1948, '26.03.2015', '04.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (250, 12, 7, 7239, '20.03.2015', '23.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (251, 50, 4, 8841, '26.04.2015', '07.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (252, 19, 5, 9625, '10.03.2015', '10.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (253, 37, 2, 3942, '19.01.2015', '15.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (254, 12, 3, 1273, '14.01.2015', '12.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (255, 35, 7, 3788, '30.05.2015', '07.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (256, 48, 5, 5003, '07.06.2015', '11.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (257, 25, 7, 8737, '20.01.2015', '22.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (258, 4, 7, 6831, '01.04.2015', '10.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (259, 47, 3, 1304, '21.01.2015', '26.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (260, 12, 5, 1516, '01.01.2015', '08.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (261, 34, 4, 4040, '14.06.2015', '27.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (262, 31, 6, 9854, '23.06.2015', '20.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (263, 4, 7, 7213, '07.02.2015', '22.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (264, 20, 1, 2736, '24.04.2015', '01.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (265, 12, 4, 9437, '22.04.2015', '09.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (266, 2, 3, 6650, '02.04.2015', '02.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (267, 32, 5, 5786, '07.05.2015', '14.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (268, 27, 2, 8736, '22.02.2015', '05.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (269, 39, 5, 7142, '24.02.2015', '18.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (270, 28, 1, 2702, '18.06.2015', '27.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (271, 25, 6, 5534, '10.03.2015', '13.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (272, 50, 2, 8566, '02.06.2015', '06.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (273, 10, 4, 7571, '08.02.2015', '28.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (274, 48, 3, 7592, '14.04.2015', '15.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (275, 43, 2, 6519, '24.02.2015', '26.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (276, 47, 2, 4043, '22.06.2015', '28.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (277, 28, 1, 8663, '15.05.2015', '11.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (278, 21, 7, 7275, '14.05.2015', '31.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (279, 10, 5, 8600, '18.04.2015', '02.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (280, 22, 6, 8722, '04.02.2015', '14.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (281, 50, 2, 9530, '02.05.2015', '27.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (282, 9, 1, 2133, '16.02.2015', '12.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (283, 38, 4, 2372, '05.01.2015', '27.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (284, 40, 6, 1001, '26.03.2015', '05.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (285, 31, 5, 5382, '29.06.2015', '14.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (286, 1, 3, 1520, '18.02.2015', '05.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (287, 43, 2, 5959, '07.06.2015', '06.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (288, 23, 7, 8313, '02.05.2015', '20.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (289, 1, 4, 5677, '27.01.2015', '04.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (290, 9, 1, 1931, '14.05.2015', '08.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (291, 19, 5, 6449, '18.04.2015', '07.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (292, 6, 2, 3336, '03.01.2015', '20.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (293, 20, 2, 2569, '01.01.2015', '11.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (294, 18, 4, 2281, '23.04.2015', '06.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (295, 33, 3, 6107, '07.02.2015', '21.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (296, 40, 3, 8327, '02.05.2015', '03.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (297, 21, 2, 9065, '12.01.2015', '22.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (298, 16, 3, 4686, '21.04.2015', '06.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (299, 13, 3, 1674, '19.02.2015', '29.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (300, 45, 6, 5249, '13.04.2015', '13.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (301, 43, 2, 6912, '14.02.2015', '05.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (302, 37, 2, 3418, '25.02.2015', '17.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (303, 18, 7, 9711, '28.01.2015', '28.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (304, 50, 7, 4194, '09.02.2015', '25.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (305, 42, 6, 9083, '07.01.2015', '14.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (306, 8, 5, 6887, '23.05.2015', '08.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (307, 6, 1, 8510, '10.05.2015', '20.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (308, 10, 3, 7401, '15.05.2015', '06.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (309, 32, 6, 3686, '20.06.2015', '05.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (310, 9, 1, 4709, '27.04.2015', '21.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (311, 44, 6, 8421, '18.02.2015', '15.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (312, 4, 6, 5563, '26.06.2015', '24.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (313, 13, 1, 3468, '26.04.2015', '04.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (314, 43, 3, 2723, '06.06.2015', '30.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (315, 23, 1, 7524, '16.04.2015', '25.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (316, 11, 5, 2222, '09.02.2015', '31.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (317, 48, 6, 5963, '10.03.2015', '12.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (318, 1, 6, 6805, '10.04.2015', '27.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (319, 19, 4, 5313, '15.02.2015', '05.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (320, 30, 5, 4021, '26.03.2015', '08.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (321, 4, 5, 5503, '24.04.2015', '31.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (322, 23, 3, 5697, '19.04.2015', '14.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (323, 33, 5, 6829, '22.01.2015', '19.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (324, 20, 2, 2028, '20.03.2015', '18.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (325, 10, 5, 3544, '29.01.2015', '22.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (326, 10, 6, 6632, '07.02.2015', '03.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (327, 41, 4, 5352, '16.03.2015', '04.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (328, 17, 6, 7084, '19.02.2015', '11.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (329, 6, 7, 6446, '02.06.2015', '20.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (330, 39, 2, 1288, '28.02.2015', '22.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (331, 49, 1, 8099, '07.04.2015', '25.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (332, 18, 6, 4570, '16.05.2015', '20.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (333, 41, 5, 9035, '05.02.2015', '22.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (334, 16, 7, 3207, '29.03.2015', '18.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (335, 21, 3, 6936, '04.06.2015', '15.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (336, 44, 5, 3760, '21.06.2015', '21.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (337, 37, 4, 6309, '21.03.2015', '08.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (338, 50, 5, 5317, '03.02.2015', '16.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (339, 12, 1, 4263, '22.05.2015', '21.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (340, 6, 7, 5426, '21.02.2015', '11.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (341, 32, 1, 2564, '14.01.2015', '05.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (342, 33, 2, 9933, '09.05.2015', '12.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (343, 3, 5, 4060, '07.01.2015', '12.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (344, 9, 3, 9273, '25.06.2015', '03.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (345, 25, 2, 2057, '25.04.2015', '17.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (346, 15, 3, 5044, '03.06.2015', '02.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (347, 29, 1, 9107, '01.02.2015', '31.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (348, 10, 6, 7061, '01.04.2015', '17.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (349, 24, 7, 6035, '11.04.2015', '16.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (350, 4, 6, 4051, '30.06.2015', '20.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (351, 11, 2, 1450, '10.01.2015', '20.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (352, 39, 7, 6102, '28.02.2015', '22.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (353, 7, 6, 2494, '17.06.2015', '13.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (354, 38, 5, 3516, '08.05.2015', '15.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (355, 1, 7, 9471, '02.06.2015', '20.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (356, 11, 5, 5733, '25.02.2015', '26.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (357, 9, 6, 4899, '01.03.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (358, 26, 5, 6264, '28.03.2015', '17.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (359, 8, 7, 7806, '24.03.2015', '25.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (360, 13, 7, 3456, '19.02.2015', '11.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (361, 31, 3, 8420, '30.06.2015', '16.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (362, 46, 1, 4849, '24.02.2015', '27.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (363, 50, 5, 1137, '30.05.2015', '16.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (364, 13, 2, 9300, '04.01.2015', '16.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (365, 45, 5, 3478, '14.06.2015', '24.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (366, 22, 5, 4831, '23.01.2015', '27.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (367, 49, 3, 4066, '23.01.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (368, 47, 7, 6728, '24.05.2015', '26.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (369, 45, 4, 9295, '04.05.2015', '27.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (370, 12, 3, 6183, '18.01.2015', '12.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (371, 50, 4, 2688, '07.02.2015', '25.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (372, 50, 6, 5026, '06.02.2015', '21.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (373, 3, 4, 1293, '28.01.2015', '04.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (374, 45, 2, 1977, '30.04.2015', '18.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (375, 8, 1, 2019, '03.06.2015', '16.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (376, 45, 3, 9429, '13.06.2015', '25.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (377, 7, 2, 6020, '01.02.2015', '21.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (378, 49, 1, 2505, '09.02.2015', '15.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (379, 13, 5, 4490, '10.01.2015', '01.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (380, 42, 3, 7587, '07.03.2015', '07.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (381, 16, 6, 6601, '11.04.2015', '05.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (382, 30, 6, 1257, '09.02.2015', '30.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (383, 41, 5, 8208, '31.01.2015', '23.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (384, 27, 4, 6366, '14.04.2015', '09.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (385, 8, 4, 8965, '17.03.2015', '23.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (386, 26, 2, 5806, '02.06.2015', '27.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (387, 5, 5, 9699, '29.03.2015', '29.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (388, 35, 4, 8711, '20.02.2015', '19.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (389, 15, 7, 8011, '15.03.2015', '01.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (390, 39, 4, 6727, '20.02.2015', '20.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (391, 41, 3, 5993, '03.04.2015', '29.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (392, 27, 6, 1893, '02.01.2015', '25.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (393, 23, 7, 5040, '04.02.2015', '19.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (394, 21, 6, 8346, '01.02.2015', '11.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (395, 41, 2, 4654, '10.04.2015', '02.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (396, 48, 5, 7945, '22.03.2015', '02.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (397, 2, 4, 2742, '28.06.2015', '06.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (398, 25, 7, 5072, '14.04.2015', '13.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (399, 48, 2, 8947, '04.05.2015', '14.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (400, 44, 4, 1489, '03.01.2015', '04.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (401, 12, 6, 8426, '08.05.2015', '22.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (402, 31, 5, 4418, '01.05.2015', '20.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (403, 14, 4, 2381, '17.06.2015', '10.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (404, 20, 1, 5142, '24.01.2015', '19.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (405, 14, 7, 9726, '04.05.2015', '27.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (406, 29, 4, 7795, '12.01.2015', '20.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (407, 3, 4, 6868, '23.01.2015', '01.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (408, 38, 2, 1410, '27.01.2015', '11.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (409, 7, 7, 5618, '04.03.2015', '02.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (410, 35, 4, 7877, '25.01.2015', '12.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (411, 18, 5, 7410, '03.05.2015', '19.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (412, 18, 2, 9535, '27.02.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (413, 47, 5, 3370, '25.01.2015', '31.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (414, 5, 4, 7385, '05.06.2015', '16.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (415, 34, 6, 1803, '15.03.2015', '17.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (416, 10, 7, 5875, '28.03.2015', '03.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (417, 28, 5, 2821, '03.03.2015', '21.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (418, 1, 7, 8024, '23.03.2015', '17.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (419, 10, 3, 3685, '19.02.2015', '14.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (420, 49, 1, 5855, '21.01.2015', '19.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (421, 14, 4, 6291, '08.05.2015', '01.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (422, 21, 5, 6507, '05.03.2015', '22.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (423, 20, 1, 3011, '04.03.2015', '01.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (424, 28, 4, 1882, '04.05.2015', '14.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (425, 13, 6, 5497, '02.05.2015', '12.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (426, 20, 6, 4025, '31.05.2015', '09.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (427, 7, 4, 4261, '22.04.2015', '06.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (428, 7, 4, 4313, '11.06.2015', '17.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (429, 28, 3, 7160, '06.04.2015', '08.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (430, 19, 1, 6209, '16.04.2015', '22.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (431, 36, 3, 6922, '23.05.2015', '04.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (432, 25, 4, 3082, '29.04.2015', '09.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (433, 42, 6, 2008, '05.04.2015', '16.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (434, 16, 6, 8579, '23.06.2015', '24.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (435, 12, 1, 1608, '06.05.2015', '26.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (436, 25, 2, 9717, '13.02.2015', '25.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (437, 19, 4, 3687, '10.06.2015', '25.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (438, 22, 4, 1926, '09.04.2015', '23.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (439, 28, 4, 4635, '02.02.2015', '05.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (440, 50, 7, 9743, '05.06.2015', '16.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (441, 5, 2, 1496, '15.03.2015', '20.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (442, 38, 2, 5491, '19.02.2015', '04.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (443, 12, 2, 9617, '03.05.2015', '18.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (444, 21, 3, 8244, '16.01.2015', '11.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (445, 31, 5, 2085, '15.03.2015', '24.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (446, 38, 6, 5391, '24.06.2015', '01.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (447, 11, 4, 7574, '11.03.2015', '24.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (448, 24, 5, 1853, '23.04.2015', '11.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (449, 50, 1, 4162, '11.04.2015', '26.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (450, 8, 4, 3056, '01.01.2015', '27.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (451, 48, 1, 1566, '05.02.2015', '09.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (452, 18, 7, 3542, '02.02.2015', '17.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (453, 47, 3, 6984, '26.03.2015', '26.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (454, 18, 5, 3437, '17.01.2015', '28.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (455, 29, 5, 7670, '26.06.2015', '12.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (456, 50, 7, 2684, '22.03.2015', '26.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (457, 10, 2, 9606, '28.01.2015', '23.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (458, 4, 2, 3928, '23.04.2015', '05.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (459, 16, 1, 3610, '01.04.2015', '19.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (460, 3, 4, 6493, '30.01.2015', '24.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (461, 4, 3, 5417, '13.04.2015', '18.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (462, 29, 3, 1389, '12.06.2015', '02.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (463, 32, 7, 3821, '15.02.2015', '19.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (464, 5, 3, 3363, '28.04.2015', '22.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (465, 32, 6, 4527, '28.02.2015', '24.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (466, 12, 7, 8850, '12.04.2015', '12.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (467, 32, 6, 7547, '27.04.2015', '06.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (468, 40, 5, 5044, '04.03.2015', '08.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (469, 49, 1, 7112, '12.03.2015', '01.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (470, 44, 1, 7352, '15.06.2015', '19.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (471, 14, 3, 6563, '29.05.2015', '13.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (472, 14, 1, 9063, '03.04.2015', '19.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (473, 25, 7, 8491, '02.04.2015', '14.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (474, 9, 6, 3070, '10.02.2015', '11.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (475, 17, 7, 5172, '13.03.2015', '27.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (476, 21, 2, 9011, '14.01.2015', '03.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (477, 38, 6, 1275, '22.05.2015', '18.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (478, 31, 1, 9260, '12.04.2015', '27.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (479, 29, 2, 9889, '24.01.2015', '03.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (480, 24, 4, 2406, '11.04.2015', '24.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (481, 14, 6, 9670, '23.01.2015', '16.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (482, 49, 6, 5891, '31.03.2015', '27.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (483, 2, 2, 4663, '06.03.2015', '08.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (484, 36, 3, 1192, '08.05.2015', '16.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (485, 37, 4, 8363, '10.06.2015', '05.02.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (486, 13, 1, 7541, '15.04.2015', '21.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (487, 8, 5, 3763, '01.05.2015', '29.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (488, 36, 2, 4903, '19.05.2015', '28.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (489, 33, 2, 2096, '24.05.2015', '23.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (490, 5, 1, 8821, '14.02.2015', '08.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (491, 14, 1, 6812, '15.02.2015', '29.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (492, 31, 1, 9255, '12.04.2015', '08.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (493, 43, 2, 1755, '24.06.2015', '27.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (494, 41, 4, 7040, '13.04.2015', '28.06.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (495, 47, 4, 6231, '28.04.2015', '07.01.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (496, 32, 4, 8247, '25.01.2015', '02.05.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (497, 15, 6, 3720, '27.02.2015', '23.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (498, 40, 7, 5990, '24.04.2015', '05.03.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (499, 3, 6, 6767, '18.02.2015', '21.04.2015');
INSERT INTO `sale_history` (`id`, `sale_id`, `status_id`, `sale_sum`, `active_from`, `active_to`) VALUES (500, 16, 5, 5623, '18.06.2015', '30.03.2015');

COMMIT;
