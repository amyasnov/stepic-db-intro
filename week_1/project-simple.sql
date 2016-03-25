SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `project_simple` ;
CREATE SCHEMA IF NOT EXISTS `project_simple` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `project_simple` ;

-- -----------------------------------------------------
-- Table `project_simple`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_simple`.`project` ;

CREATE TABLE IF NOT EXISTS `project_simple`.`project` (
  `project_name` VARCHAR(255) NULL,
  `client_name` VARCHAR(255) NULL,
  `project_start` DATE NULL,
  `project_finish` DATE NULL,
  `budget` DECIMAL(18,2) NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `project_simple`.`project`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_simple`;
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Accidentally Railroad', 'Bradly Noonan', '27.04.2015', '21.10.2015', 64741.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Oyster Stormy', 'Lina Southey', '27.02.2015', '29.12.2015', 297752.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Subtle Poseidon', 'Liliana Payton', '05.01.2015', '02.08.2015', 831756.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Accidentally Skilled Pottery', 'Lina Southey', '31.05.2015', '13.10.2015', 157639.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Liquid Panther', 'Poppy Whitney', '18.02.2015', '21.08.2015', 359697.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rapid Monkey', 'Tavia Chatham', '06.02.2015', '22.12.2015', 969210.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Insane Bulldozer', 'Casey Copeland', '18.01.2015', '27.09.2015', 122786.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rapid Limousine', 'Lina Southey', '18.06.2015', '10.07.2015', 498218.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Confidential Metaphor', 'Copper Smith', '05.05.2015', '02.07.2015', 254164.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Hollow Eternal Nitrogen', 'Liliana Payton', '07.04.2015', '18.10.2015', 716153.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Essential Peasant', 'Catalina Barlow', '12.05.2015', '25.12.2015', 795797.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Restless Monkey', 'Tavia Chatham', '21.02.2015', '06.11.2015', 561243.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Aberrant Insane Eagle', 'Xavier Abram', '02.06.2015', '28.08.2015', 839598.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Hot Pure Mountain', 'Fearn Hayden', '09.02.2015', '19.09.2015', 919429.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Sleepy Uranium', 'Pell Dudley', '11.05.2015', '04.12.2015', 991093.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Dreaded Steady Weather', 'Ballard Ridley', '03.02.2015', '01.12.2015', 670338.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Helpless Shower', 'Blade Padley', '23.05.2015', '24.10.2015', 78214.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Stormy Flannel', 'Ballard Ridley', '17.02.2015', '26.07.2015', 842305.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Dead Sapphire', 'Copper Smith', '19.06.2015', '03.11.2015', 455783.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Appropriate Swallow', 'Bradly Noonan', '10.06.2015', '23.12.2015', 702889.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Omega Accidentally', 'Krista Stamper', '08.03.2015', '19.07.2015', 493309.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Green Storm', 'Elmore Shelly', '08.01.2015', '13.10.2015', 589506.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rare Emerald', 'Merry Ramsay', '02.03.2015', '26.12.2015', 630439.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Maroon Snake', 'Fearn Hayden', '23.05.2015', '05.07.2015', 656082.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Grim Sledgehammer', 'Liliana Payton', '09.06.2015', '03.10.2015', 287998.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Heavy Cobra', 'Xavier Abram', '02.06.2015', '05.07.2015', 246467.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Silver Rhinestone', 'Blade Padley', '11.02.2015', '03.08.2015', 499913.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Cheerful Barbershop', 'Pell Dudley', '07.03.2015', '25.08.2015', 324410.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rare Jazz', 'Merry Ramsay', '16.03.2015', '10.08.2015', 479205.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Dangerous Longitude', 'Lina Southey', '28.06.2015', '30.08.2015', 742558.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Forgotten Planet', 'Tavia Chatham', '10.03.2015', '31.10.2015', 50968.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Grim Butter', 'Mckenna Appleton', '12.02.2015', '02.08.2015', 720540.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Husky Global Peasant', 'Copper Smith', '03.01.2015', '28.08.2015', 114016.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Long Crayon', 'Fearn Hayden', '09.06.2015', '23.12.2015', 497455.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Lonesome Metaphor', 'Bradly Noonan', '19.01.2015', '18.12.2015', 485056.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Microphone Scarlet', 'Iris Allerton', '16.04.2015', '16.09.2015', 980556.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Abandoned Puppet', 'Casey Copeland', '24.06.2015', '26.07.2015', 79097.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Dusty Star', 'Poppy Whitney', '03.02.2015', '21.09.2015', 241318.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Dreadful Mars', 'Elmore Shelly', '12.01.2015', '15.10.2015', 558032.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Winter Severe', 'Krista Stamper', '24.03.2015', '27.12.2015', 965648.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Big Serpent', 'Edmund Nottley', '27.04.2015', '06.12.2015', 880260.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Accidentally Eagle', 'Copper Smith', '26.03.2015', '04.12.2015', 953352.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Persistent Scissors', 'Iris Allerton', '19.03.2015', '23.07.2015', 348640.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Forsaken Knife', 'Liliana Payton', '05.03.2015', '20.11.2015', 655675.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Mysterious Gamma', 'Mckenna Appleton', '27.03.2015', '12.07.2015', 188308.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Sad Alarm', 'Catalina Barlow', '20.04.2015', '19.09.2015', 176048.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Eastern Avenue', 'Merry Ramsay', '02.02.2015', '13.10.2015', 541069.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Gruesome Longitude', 'Xavier Abram', '26.04.2015', '15.11.2015', 753107.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Meaningful Full Iron', 'Blade Padley', '20.03.2015', '21.11.2015', 737504.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Hot Toupee', 'Krista Stamper', '13.04.2015', '14.09.2015', 286691.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Tainted Viper', 'Pell Dudley', '03.02.2015', '14.10.2015', 396670.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rainbow Crossbow', 'Catalina Barlow', '08.04.2015', '30.07.2015', 7923.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rusty Moon', 'Sandon Alden', '24.02.2015', '31.10.2015', 540931.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Tasty Appropriate Beta', 'Lina Southey', '07.02.2015', '24.10.2015', 901936.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Next Elastic Crossbow', 'Casey Copeland', '04.02.2015', '02.08.2015', 997068.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Liquid Tasty Trombone', 'Lina Southey', '13.06.2015', '27.07.2015', 158561.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Frozen Strong Tungsten', 'Edmund Nottley', '18.04.2015', '13.08.2015', 406210.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Barbaric Cosmic', 'Edmund Nottley', '24.06.2015', '12.08.2015', 66586.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Temple Tainted', 'Copper Smith', '03.03.2015', '20.09.2015', 464050.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Barbaric Puppet', 'Edmund Nottley', '07.01.2015', '02.11.2015', 771896.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Autopsy Brown', 'Mckenna Appleton', '18.06.2015', '16.07.2015', 479639.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Strong Crayon', 'Copper Smith', '24.01.2015', '01.12.2015', 806897.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Worthy Monkey', 'Merry Ramsay', '05.06.2015', '06.12.2015', 622554.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Risky Galaxy', 'Blade Padley', '24.05.2015', '29.08.2015', 588300.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Gutsy Lama', 'Iris Allerton', '07.02.2015', '15.08.2015', 972895.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Supersonic Haystack', 'Liliana Payton', '12.02.2015', '24.12.2015', 427237.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Autopsy Eastern', 'Elmore Shelly', '20.06.2015', '27.11.2015', 289980.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Tiger Orange', 'Pell Dudley', '15.04.2015', '25.11.2015', 477511.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rocky Burst', 'Krista Stamper', '21.04.2015', '22.09.2015', 276592.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Ninth Breeze', 'Iris Allerton', '30.03.2015', '04.11.2015', 214331.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rare Tuba', 'Tavia Chatham', '11.05.2015', '25.08.2015', 276424.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Freaky Gamma', 'Blade Padley', '20.01.2015', '13.11.2015', 409790.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Husky Crossbow', 'Casey Copeland', '27.03.2015', '02.12.2015', 98388.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Angry Summer', 'Poppy Whitney', '19.04.2015', '09.12.2015', 573828.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Quality Yard', 'Tavia Chatham', '12.05.2015', '29.09.2015', 54315.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Permanent Mercury', 'Casey Copeland', '06.03.2015', '07.10.2015', 782932.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Brown Jazz', 'Casey Copeland', '24.05.2015', '28.09.2015', 485646.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Surreal Storm', 'Lina Southey', '03.02.2015', '17.11.2015', 131727.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Vital Limousine', 'Edmund Nottley', '02.03.2015', '28.11.2015', 748869.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Sliding Proton', 'Krista Stamper', '01.02.2015', '05.11.2015', 470672.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Strawberry Helium', 'Pell Dudley', '27.03.2015', '15.08.2015', 107812.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Helpless Helium', 'Mckenna Appleton', '18.01.2015', '01.09.2015', 307084.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Rapid Doorstop', 'Edmund Nottley', '18.01.2015', '25.10.2015', 278010.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Dirty Longitude', 'Krista Stamper', '02.04.2015', '15.10.2015', 913923.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Skilled Tire', 'Pell Dudley', '19.04.2015', '03.07.2015', 634937.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Stony Knife', 'Ballard Ridley', '15.02.2015', '11.11.2015', 267142.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Doorstop Risky', 'Bradly Noonan', '28.02.2015', '13.08.2015', 330603.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Aggressive Fist', 'Krista Stamper', '08.04.2015', '15.09.2015', 58626.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Empty Reborn Cloud', 'Lina Southey', '22.04.2015', '23.11.2015', 3696.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Lucky Sunshine', 'Tavia Chatham', '18.01.2015', '27.09.2015', 535424.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Solid Waffle', 'Ballard Ridley', '20.06.2015', '18.10.2015', 106093.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Lucky Trendy', 'Iris Allerton', '17.02.2015', '23.12.2015', 920068.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Red Scarecrow', 'Edmund Nottley', '05.06.2015', '03.09.2015', 810767.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Frostbite Black', 'Ballard Ridley', '05.03.2015', '20.10.2015', 278322.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Lucky Puppet', 'Tavia Chatham', '21.01.2015', '03.11.2015', 128992.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Supersonic Oyster', 'Elmore Shelly', '16.01.2015', '15.08.2015', 755794.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Toupee Liquid', 'Fearn Hayden', '27.01.2015', '10.08.2015', 956311.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Tainted Tasty Tea', 'Iris Allerton', '08.01.2015', '15.07.2015', 205097.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Eastern Galaxy', 'Xavier Abram', '13.05.2015', '04.07.2015', 529133.00);
INSERT INTO `project_simple`.`project` (`project_name`, `client_name`, `project_start`, `project_finish`, `budget`) VALUES ('Outstanding Viper', 'Bradly Noonan', '09.01.2015', '06.07.2015', 133021.00);

COMMIT;

