SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `project_simple_pk`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_simple_pk`.`project` ;

CREATE TABLE IF NOT EXISTS `project_simple_pk`.`project` (
  `project_number` INT NOT NULL,
  `project_name` VARCHAR(255) NULL,
  `client_name` VARCHAR(255) NULL,
  `project_start` DATE NULL,
  `project_finish` DATE NULL,
  `budget` DECIMAL(18,2) NULL,
  PRIMARY KEY (`project_number`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `project_simple_pk`.`project`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_simple_pk`;
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (13, 'Accidentally Railroad', 'Bradly Noonan', '26.01.2015', '31.10.2015', 972356.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (14, 'Oyster Stormy', 'Krista Stamper', '26.06.2015', '30.11.2015', 868144.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (15, 'Subtle Poseidon', 'Pell Dudley', '24.05.2015', '04.09.2015', 712319.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (16, 'Accidentally Skilled Pottery', 'Copper Smith', '17.04.2015', '12.07.2015', 235327.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (17, 'Liquid Panther', 'Copper Smith', '16.02.2015', '24.08.2015', 476494.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (18, 'Rapid Monkey', 'Lina Southey', '19.06.2015', '19.09.2015', 440185.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (19, 'Insane Bulldozer', 'Edmund Nottley', '04.06.2015', '04.09.2015', 28784.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (20, 'Rapid Limousine', 'Ballard Ridley', '12.01.2015', '23.12.2015', 419138.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (21, 'Confidential Metaphor', 'Elmore Shelly', '27.02.2015', '23.12.2015', 43736.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (22, 'Hollow Eternal Nitrogen', 'Tavia Chatham', '05.01.2015', '03.10.2015', 459069.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (23, 'Essential Peasant', 'Fearn Hayden', '16.04.2015', '14.09.2015', 785638.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (24, 'Restless Monkey', 'Pell Dudley', '29.01.2015', '28.07.2015', 157611.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (25, 'Aberrant Insane Eagle', 'Merry Ramsay', '23.06.2015', '24.07.2015', 392650.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (26, 'Hot Pure Mountain', 'Xavier Abram', '19.04.2015', '14.11.2015', 411553.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (27, 'Sleepy Uranium', 'Iris Allerton', '02.06.2015', '19.10.2015', 321838.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (28, 'Dreaded Steady Weather', 'Catalina Barlow', '23.02.2015', '12.12.2015', 369520.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (29, 'Helpless Shower', 'Catalina Barlow', '19.01.2015', '30.10.2015', 758351.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (30, 'Stormy Flannel', 'Tavia Chatham', '12.06.2015', '10.08.2015', 1934.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (31, 'Dead Sapphire', 'Pell Dudley', '30.04.2015', '17.11.2015', 570505.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (32, 'Appropriate Swallow', 'Xavier Abram', '18.06.2015', '19.09.2015', 557317.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (33, 'Omega Accidentally', 'Bradly Noonan', '24.04.2015', '14.08.2015', 709990.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (34, 'Green Storm', 'Merry Ramsay', '23.06.2015', '24.11.2015', 645179.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (35, 'Rare Emerald', 'Casey Copeland', '05.05.2015', '28.12.2015', 445619.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (36, 'Maroon Snake', 'Mckenna Appleton', '07.03.2015', '29.12.2015', 107135.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (37, 'Grim Sledgehammer', 'Liliana Payton', '31.01.2015', '28.10.2015', 370604.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (38, 'Heavy Cobra', 'Catalina Barlow', '24.05.2015', '14.12.2015', 442265.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (39, 'Silver Rhinestone', 'Blade Padley', '16.06.2015', '21.11.2015', 316579.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (40, 'Cheerful Barbershop', 'Lina Southey', '16.01.2015', '25.08.2015', 967179.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (41, 'Rare Jazz', 'Sandon Alden', '16.04.2015', '18.10.2015', 577562.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (42, 'Dangerous Longitude', 'Casey Copeland', '26.02.2015', '09.07.2015', 477836.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (43, 'Forgotten Planet', 'Ballard Ridley', '06.01.2015', '29.07.2015', 449654.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (44, 'Grim Butter', 'Iris Allerton', '25.03.2015', '10.10.2015', 576051.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (45, 'Husky Global Peasant', 'Elmore Shelly', '28.05.2015', '04.07.2015', 320379.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (46, 'Long Crayon', 'Liliana Payton', '17.04.2015', '29.12.2015', 814074.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (47, 'Lonesome Metaphor', 'Catalina Barlow', '17.01.2015', '26.07.2015', 42393.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (48, 'Microphone Scarlet', 'Fearn Hayden', '22.04.2015', '14.10.2015', 134598.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (49, 'Abandoned Puppet', 'Pell Dudley', '16.02.2015', '30.11.2015', 308744.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (50, 'Dusty Star', 'Mckenna Appleton', '22.03.2015', '08.08.2015', 453267.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (51, 'Dreadful Mars', 'Blade Padley', '25.03.2015', '26.12.2015', 486884.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (52, 'Winter Severe', 'Poppy Whitney', '21.04.2015', '12.12.2015', 930333.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (53, 'Big Serpent', 'Blade Padley', '01.01.2015', '09.12.2015', 346136.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (54, 'Accidentally Eagle', 'Copper Smith', '27.05.2015', '21.08.2015', 276125.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (55, 'Persistent Scissors', 'Fearn Hayden', '09.05.2015', '22.11.2015', 371374.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (56, 'Forsaken Knife', 'Tavia Chatham', '15.04.2015', '01.10.2015', 727921.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (57, 'Mysterious Gamma', 'Lina Southey', '06.03.2015', '01.10.2015', 801186.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (58, 'Sad Alarm', 'Edmund Nottley', '01.04.2015', '04.12.2015', 414863.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (59, 'Eastern Avenue', 'Fearn Hayden', '11.03.2015', '17.09.2015', 212939.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (60, 'Gruesome Longitude', 'Casey Copeland', '13.03.2015', '21.07.2015', 470996.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (61, 'Meaningful Full Iron', 'Ballard Ridley', '25.03.2015', '04.09.2015', 537626.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (62, 'Hot Toupee', 'Blade Padley', '08.02.2015', '13.08.2015', 833807.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (63, 'Tainted Viper', 'Lina Southey', '11.02.2015', '11.11.2015', 146570.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (64, 'Rainbow Crossbow', 'Casey Copeland', '23.03.2015', '16.07.2015', 213936.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (65, 'Rusty Moon', 'Ballard Ridley', '17.03.2015', '22.09.2015', 71664.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (66, 'Tasty Appropriate Beta', 'Tavia Chatham', '01.03.2015', '01.09.2015', 472229.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (67, 'Next Elastic Crossbow', 'Fearn Hayden', '19.04.2015', '25.07.2015', 580644.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (68, 'Liquid Tasty Trombone', 'Iris Allerton', '29.04.2015', '05.10.2015', 981131.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (69, 'Frozen Strong Tungsten', 'Sandon Alden', '26.01.2015', '12.07.2015', 473198.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (70, 'Barbaric Cosmic', 'Liliana Payton', '31.03.2015', '13.11.2015', 270952.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (71, 'Temple Tainted', 'Liliana Payton', '17.01.2015', '03.07.2015', 886416.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (72, 'Barbaric Puppet', 'Casey Copeland', '01.03.2015', '14.09.2015', 983834.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (73, 'Autopsy Brown', 'Bradly Noonan', '16.03.2015', '01.11.2015', 426805.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (74, 'Strong Crayon', 'Liliana Payton', '15.06.2015', '21.11.2015', 667039.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (75, 'Worthy Monkey', 'Catalina Barlow', '15.05.2015', '11.10.2015', 591569.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (76, 'Risky Galaxy', 'Iris Allerton', '24.01.2015', '15.07.2015', 186506.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (77, 'Gutsy Lama', 'Ballard Ridley', '22.04.2015', '10.11.2015', 804787.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (78, 'Supersonic Haystack', 'Copper Smith', '09.03.2015', '29.10.2015', 572529.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (79, 'Autopsy Eastern', 'Tavia Chatham', '08.05.2015', '18.12.2015', 814973.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (80, 'Tiger Orange', 'Pell Dudley', '30.04.2015', '27.09.2015', 727729.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (81, 'Rocky Burst', 'Pell Dudley', '24.05.2015', '07.12.2015', 370673.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (82, 'Ninth Breeze', 'Blade Padley', '11.04.2015', '17.12.2015', 178889.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (83, 'Rare Tuba', 'Sandon Alden', '22.06.2015', '20.07.2015', 253737.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (84, 'Freaky Gamma', 'Ballard Ridley', '27.05.2015', '04.12.2015', 35917.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (85, 'Husky Crossbow', 'Xavier Abram', '15.04.2015', '20.08.2015', 32244.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (86, 'Angry Summer', 'Merry Ramsay', '12.03.2015', '20.11.2015', 310792.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (87, 'Quality Yard', 'Pell Dudley', '15.04.2015', '21.10.2015', 680512.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (88, 'Permanent Mercury', 'Krista Stamper', '17.03.2015', '15.12.2015', 993664.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (89, 'Brown Jazz', 'Casey Copeland', '18.02.2015', '23.07.2015', 534920.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (90, 'Surreal Storm', 'Copper Smith', '02.04.2015', '24.10.2015', 623761.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (91, 'Vital Limousine', 'Xavier Abram', '07.01.2015', '03.10.2015', 588547.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (92, 'Sliding Proton', 'Liliana Payton', '17.03.2015', '27.07.2015', 56478.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (93, 'Strawberry Helium', 'Casey Copeland', '19.01.2015', '28.07.2015', 73578.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (94, 'Helpless Helium', 'Catalina Barlow', '27.01.2015', '17.10.2015', 943321.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (95, 'Rapid Doorstop', 'Sandon Alden', '04.02.2015', '31.12.2015', 125919.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (96, 'Dirty Longitude', 'Fearn Hayden', '03.02.2015', '22.11.2015', 195072.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (97, 'Skilled Tire', 'Pell Dudley', '06.05.2015', '04.07.2015', 604404.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (98, 'Stony Knife', 'Tavia Chatham', '20.02.2015', '26.08.2015', 200955.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (99, 'Doorstop Risky', 'Casey Copeland', '20.05.2015', '14.07.2015', 230424.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (100, 'Aggressive Fist', 'Bradly Noonan', '10.04.2015', '23.09.2015', 598673.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (101, 'Empty Reborn Cloud', 'Tavia Chatham', '16.04.2015', '07.10.2015', 593917.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (102, 'Lucky Sunshine', 'Mckenna Appleton', '26.03.2015', '01.07.2015', 12043.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (103, 'Solid Waffle', 'Liliana Payton', '24.03.2015', '08.10.2015', 339037.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (104, 'Lucky Trendy', 'Sandon Alden', '02.06.2015', '20.08.2015', 216415.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (105, 'Red Scarecrow', 'Iris Allerton', '18.01.2015', '23.12.2015', 533231.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (106, 'Frostbite Black', 'Blade Padley', '06.05.2015', '13.12.2015', 167963.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (107, 'Lucky Puppet', 'Elmore Shelly', '06.03.2015', '02.07.2015', 684486.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (108, 'Supersonic Oyster', 'Lina Southey', '21.06.2015', '24.11.2015', 633170.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (109, 'Toupee Liquid', 'Tavia Chatham', '27.03.2015', '15.11.2015', 735051.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (110, 'Tainted Tasty Tea', 'Lina Southey', '06.03.2015', '14.09.2015', 413939.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (111, 'Eastern Galaxy', 'Lina Southey', '18.01.2015', '08.10.2015', 376488.00);
INSERT INTO `project_simple_pk`.`project` (`project_number`, `project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES (112, 'Outstanding Viper', 'Catalina Barlow', '10.03.2015', '12.12.2015', 876230.00);

COMMIT;

