-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cakebidsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cakebidsdb` ;

-- -----------------------------------------------------
-- Schema cakebidsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cakebidsdb` DEFAULT CHARACTER SET utf8 ;
USE `cakebidsdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NULL,
  `address2` VARCHAR(50) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address_id` INT NULL,
  `profile_picture` VARCHAR(2000) NULL,
  `create_date` DATETIME NULL,
  `about_me` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bakery` ;

CREATE TABLE IF NOT EXISTS `bakery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `owner_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `website_url` VARCHAR(2000) NULL,
  `hours_operation` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bakery_user1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_bakery_user1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `occasion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `occasion` ;

CREATE TABLE IF NOT EXISTS `occasion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `description` TEXT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_occassion_user1_idx` (`user_id` ASC),
  INDEX `fk_occassion_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_occassion_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_occassion_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake_type` ;

CREATE TABLE IF NOT EXISTS `cake_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery_method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery_method` ;

CREATE TABLE IF NOT EXISTS `delivery_method` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `delivery_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake` ;

CREATE TABLE IF NOT EXISTS `cake` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `special_instructions` TEXT NULL,
  `date_added` DATETIME NULL,
  `occasion_id` INT NOT NULL,
  `cake_type_id` INT NOT NULL,
  `delivery_id` INT NOT NULL,
  `cake_inspiration` VARCHAR(2000) NULL,
  `budget` DECIMAL(8,2) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cake_occassion1_idx` (`occasion_id` ASC),
  INDEX `fk_cake_cake_type1_idx` (`cake_type_id` ASC),
  INDEX `fk_cake_delivery_method1_idx` (`delivery_id` ASC),
  CONSTRAINT `fk_cake_occassion1`
    FOREIGN KEY (`occasion_id`)
    REFERENCES `occasion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cake_cake_type1`
    FOREIGN KEY (`cake_type_id`)
    REFERENCES `cake_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cake_delivery_method1`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `delivery_method` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flavor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flavor` ;

CREATE TABLE IF NOT EXISTS `flavor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `filling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `filling` ;

CREATE TABLE IF NOT EXISTS `filling` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filling_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bakery_review` ;

CREATE TABLE IF NOT EXISTS `bakery_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `review_date` DATETIME NULL,
  `review_title` VARCHAR(45) NULL,
  `review` TEXT(250) NULL,
  `user_id` INT NOT NULL,
  `bakery_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bakery_review_user1_idx` (`user_id` ASC),
  INDEX `fk_bakery_review_bakery1_idx` (`bakery_id` ASC),
  CONSTRAINT `fk_bakery_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bakery_review_bakery1`
    FOREIGN KEY (`bakery_id`)
    REFERENCES `bakery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake_has_fillings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake_has_fillings` ;

CREATE TABLE IF NOT EXISTS `cake_has_fillings` (
  `cake_id` INT NOT NULL,
  `fillings_type_id` INT NOT NULL,
  PRIMARY KEY (`cake_id`, `fillings_type_id`),
  INDEX `fk_cake_has_fillings_fillings1_idx` (`fillings_type_id` ASC),
  INDEX `fk_cake_has_fillings_cake1_idx` (`cake_id` ASC),
  CONSTRAINT `fk_cake_has_fillings_cake1`
    FOREIGN KEY (`cake_id`)
    REFERENCES `cake` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cake_has_fillings_fillings1`
    FOREIGN KEY (`fillings_type_id`)
    REFERENCES `filling` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake_has_flavor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake_has_flavor` ;

CREATE TABLE IF NOT EXISTS `cake_has_flavor` (
  `cake_flavor_id` INT NOT NULL,
  `cake_id` INT NOT NULL,
  PRIMARY KEY (`cake_flavor_id`, `cake_id`),
  INDEX `fk_cake_flavor_has_cake_cake1_idx` (`cake_id` ASC),
  INDEX `fk_cake_flavor_has_cake_cake_flavor1_idx` (`cake_flavor_id` ASC),
  CONSTRAINT `fk_cake_flavor_has_cake_cake_flavor1`
    FOREIGN KEY (`cake_flavor_id`)
    REFERENCES `flavor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cake_flavor_has_cake_cake1`
    FOREIGN KEY (`cake_id`)
    REFERENCES `cake` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake_bid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake_bid` ;

CREATE TABLE IF NOT EXISTS `cake_bid` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bakery_id` INT NOT NULL,
  `cake_id` INT NOT NULL,
  `price` DECIMAL(8,2) NULL,
  `bid_date` DATETIME NULL,
  `accepted_date` DATETIME NULL,
  `fulfilled_date` DATETIME NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cake_bid_bakery1_idx` (`bakery_id` ASC),
  INDEX `fk_cake_bid_cake1_idx` (`cake_id` ASC),
  CONSTRAINT `fk_cake_bid_bakery1`
    FOREIGN KEY (`bakery_id`)
    REFERENCES `bakery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cake_bid_cake1`
    FOREIGN KEY (`cake_id`)
    REFERENCES `cake` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake_review` ;

CREATE TABLE IF NOT EXISTS `cake_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `review_date` DATETIME NULL,
  `review_title` VARCHAR(45) NULL,
  `review` TEXT(250) NULL,
  `user_id` INT NOT NULL,
  `cake_bid_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bakery_review_user1_idx` (`user_id` ASC),
  INDEX `fk_cake_review_cake_bid1_idx` (`cake_bid_id` ASC),
  CONSTRAINT `fk_bakery_review_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cake_review_cake_bid1`
    FOREIGN KEY (`cake_bid_id`)
    REFERENCES `cake_bid` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bakery_image` ;

CREATE TABLE IF NOT EXISTS `bakery_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(3000) NULL,
  `description` TEXT NULL,
  `bakery_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_image_bakery1_idx` (`bakery_id` ASC),
  CONSTRAINT `fk_image_bakery1`
    FOREIGN KEY (`bakery_id`)
    REFERENCES `bakery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cake_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cake_image` ;

CREATE TABLE IF NOT EXISTS `cake_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `cake_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cake_image_cake1_idx` (`cake_id` ASC),
  CONSTRAINT `fk_cake_image_cake1`
    FOREIGN KEY (`cake_id`)
    REFERENCES `cake` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS cakebidsuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'cakebidsuser'@'localhost' IDENTIFIED BY 'cakebidsuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'cakebidsuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (1, '234 Science Way', 'Apt. 5', 'Houston', 'TX', '77084', '(281)330-8004');
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (2, '1626 Tower Grove Ave', NULL, 'St. Louis', 'MO', '63110', '(314)932-7935');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (2, 'nyeGuy', '1234', 1, 'customer', 'Bill', 'Nye', 1, 'https://images.squarespace-cdn.com/content/v1/5991dbfef43b5576c6ec7eda/1507513713189-2784HYO9WM9JDIEA7INP/bill_nye_mobile.jpg?format=2500w', '2022-08-19', 'I love cake!');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (1, 'La Patisserie Chouquette', '1234', 1, 'bakery', 'Simone', 'Faure', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrBtjb432W6-gQeeXnkjC-oJrvQIvxNMN-9w&usqp=CAU', '2022-08-19', 'Patisserie bakery owner');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bakery`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `bakery` (`id`, `owner_id`, `name`, `description`, `image_url`, `website_url`, `hours_operation`) VALUES (1, 1, 'La Patisserie Chouquette', 'Chic French bakery', 'https://www.simonefaure.com/', 'https://www.simonefaure.com/', 'Wed-Sat 10am-2pm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `occasion`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `occasion` (`id`, `name`, `date`, `user_id`, `description`, `address_id`) VALUES (1, 'wedding', '2022-08-25', 2, '3 tier watercolor cake', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_type` (`id`, `name`) VALUES (1, 'tiered');

COMMIT;


-- -----------------------------------------------------
-- Data for table `delivery_method`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `delivery_method` (`id`, `delivery_type`) VALUES (1, 'pick-up');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake` (`id`, `name`, `description`, `special_instructions`, `date_added`, `occasion_id`, `cake_type_id`, `delivery_id`, `cake_inspiration`, `budget`) VALUES (1, 'Bill Nye\'s birthday!', '2 tier science theme cake', 'put a giant atom on the top!', '2022-06-23', 1, 1, 1, 'https://images.squarespace-cdn.com/content/v1/5c4b6b663c3a5399055adb5f/1599371701267-GW1ZKK9N8HH8GF9GQCVZ/10bd2e1ed5f7a58d40345af8070b1a4d.jpg', 200.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `flavor`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `flavor` (`id`, `name`) VALUES (1, 'chocolate/chocolate');

COMMIT;


-- -----------------------------------------------------
-- Data for table `filling`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `filling` (`id`, `filling_type`) VALUES (1, 'lemon-curd');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bakery_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `bakery_review` (`id`, `rating`, `review_date`, `review_title`, `review`, `user_id`, `bakery_id`) VALUES (1, 5, '2022-08-19', 'Flakey Croissants!!', 'Literally the most buttery and flakey croissants I have ever had! LEGIT!', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_has_fillings`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_has_fillings` (`cake_id`, `fillings_type_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_has_flavor`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_has_flavor` (`cake_flavor_id`, `cake_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_bid`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_bid` (`id`, `bakery_id`, `cake_id`, `price`, `bid_date`, `accepted_date`, `fulfilled_date`, `description`) VALUES (1, 1, 1, 150.00, '2022-08-19', '2022-08-20', '2022-08-23', 'need a drip cake yo!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_review` (`id`, `rating`, `review_date`, `review_title`, `review`, `user_id`, `cake_bid_id`) VALUES (1, 2, '2022-08-19 00:00:00', 'yum', 'so delish', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bakery_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Pj_6y9xzcpWxjzB4IckMZa_jGYLlWh7nNg&usqp=CAU', 'drip cake ', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_image` (`id`, `image_url`, `description`, `cake_id`) VALUES (1, 'https://thefirstyearblog.com/wp-content/uploads/2015/11/chocolate-chocolate-cake-1.png', 'chocolate cake', 1);

COMMIT;

