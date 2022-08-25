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
  `image_url` TEXT NULL,
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
  `needed_by_date` DATE NULL,
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
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (3, '1234 Good Eats Ave', NULL, 'Marietta', 'GA', '30008', '(770)234-5678');
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (4, '8956 Dog Way', NULL, 'Mill Neck', 'NY', '11560', '(516)654-8923');
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (5, '247 W 38th Street', 'Floor Thirteen', 'New York', 'NY', '10018', '(212)625-3369');
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (6, '123 Cake Way', NULL, 'Littleton', 'CO', '80120', '(575)222-3333');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (2, 'nyeGuy', '1234', 1, 'customer', 'Bill', 'Nye', 1, 'https://images.squarespace-cdn.com/content/v1/5991dbfef43b5576c6ec7eda/1507513713189-2784HYO9WM9JDIEA7INP/bill_nye_mobile.jpg?format=2500w', '2022-08-19', 'I love cake!');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (1, 'La Patisserie Chouquette', '1234', 1, 'bakery', 'Simone', 'Faure', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrBtjb432W6-gQeeXnkjC-oJrvQIvxNMN-9w&usqp=CAU', '2022-08-19', 'Patisserie bakery owner');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (3, 'altonEats', '1234', 1, 'customer', 'Alton', 'Brown', 3, NULL, '2022-08-23', 'television personality! ');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (4, 'WickJ', '4567', 1, 'customer', 'John', 'Wick', 4, '', '2022-08-24', 'Everything\'s got a price');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (5, 'IsrealNYC', '4567', 1, 'bakery', 'Ron-Ben', 'Isreal', 5, NULL, '2022-08-24', 'Israeli-American Pastry Chef');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `address_id`, `profile_picture`, `create_date`, `about_me`) VALUES (6, 'cakeCO', '912', 1, 'bakery', 'Samantha', 'Heisterkamp-Reno', 6, NULL, '2022-08-24', 'Cake Artist');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bakery`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `bakery` (`id`, `owner_id`, `name`, `description`, `image_url`, `website_url`, `hours_operation`) VALUES (1, 1, 'La Patisserie Chouquette', 'Chic French bakery', 'data:image/jpeg;base64,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', 'https://www.simonefaure.com/', 'Wed-Sat 10am-2pm');
INSERT INTO `bakery` (`id`, `owner_id`, `name`, `description`, `image_url`, `website_url`, `hours_operation`) VALUES (2, 5, 'Ron Ben-Israel Cakes', 'Bespoke cakes for special occassions', 'data:image/png;base64,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', 'https://www.instagram.com/rbicakes/?hl=en', 'by appointment only');
INSERT INTO `bakery` (`id`, `owner_id`, `name`, `description`, `image_url`, `website_url`, `hours_operation`) VALUES (3, 6, 'Cake. By Samantha', 'Custom Desgined Cakes', 'https://i.pinimg.com/236x/52/db/04/52db04b28dedd9103dab20aa11b7264b.jpg', 'https://www.instagram.com/cake.bysamantha/', 'by appointment only');

COMMIT;


-- -----------------------------------------------------
-- Data for table `occasion`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `occasion` (`id`, `name`, `date`, `user_id`, `description`, `address_id`) VALUES (1, 'wedding', '2022-08-25', 2, '3 tier watercolor cake', 1);
INSERT INTO `occasion` (`id`, `name`, `date`, `user_id`, `description`, `address_id`) VALUES (2, 'birthday', '2022-09-15', 3, 'chocolate birthday cake ', 3);
INSERT INTO `occasion` (`id`, `name`, `date`, `user_id`, `description`, `address_id`) VALUES (3, 'graduation', '2022-10-23', 4, 'cake with a grad hat on top! ', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_type` (`id`, `name`) VALUES (1, 'Tiered Cake');
INSERT INTO `cake_type` (`id`, `name`) VALUES (2, 'Kitchen Cake');
INSERT INTO `cake_type` (`id`, `name`) VALUES (3, 'Sculpture Cake');
INSERT INTO `cake_type` (`id`, `name`) VALUES (4, 'Double Barrell');
INSERT INTO `cake_type` (`id`, `name`) VALUES (5, '6 inch Smash Cake');

COMMIT;


-- -----------------------------------------------------
-- Data for table `delivery_method`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `delivery_method` (`id`, `delivery_type`) VALUES (1, 'pick-up');
INSERT INTO `delivery_method` (`id`, `delivery_type`) VALUES (2, 'delivery');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake` (`id`, `name`, `description`, `special_instructions`, `date_added`, `occasion_id`, `cake_type_id`, `delivery_id`, `cake_inspiration`, `budget`, `needed_by_date`) VALUES (1, 'Bill Nye\'s birthday!', '2 tier science theme cake', 'put a giant atom on the top!', '2022-06-23', 1, 1, 1, 'https://images.squarespace-cdn.com/content/v1/5c4b6b663c3a5399055adb5f/1599371701267-GW1ZKK9N8HH8GF9GQCVZ/10bd2e1ed5f7a58d40345af8070b1a4d.jpg', 200.00, NULL);
INSERT INTO `cake` (`id`, `name`, `description`, `special_instructions`, `date_added`, `occasion_id`, `cake_type_id`, `delivery_id`, `cake_inspiration`, `budget`, `needed_by_date`) VALUES (2, 'birthday cake ', '3 tier cake ', NULL, '2022-08-15', 2, 1, 2, NULL, 300.00, NULL);
INSERT INTO `cake` (`id`, `name`, `description`, `special_instructions`, `date_added`, `occasion_id`, `cake_type_id`, `delivery_id`, `cake_inspiration`, `budget`, `needed_by_date`) VALUES (3, 'graduation cake', 'sculpted cake like dog', '', '2022-08-13', 1, 3, 2, NULL, 200.00, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `flavor`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `flavor` (`id`, `name`) VALUES (1, 'chocolate/chocolate');
INSERT INTO `flavor` (`id`, `name`) VALUES (2, 'vanilla/vanilla');
INSERT INTO `flavor` (`id`, `name`) VALUES (3, 'almond/raspberry');
INSERT INTO `flavor` (`id`, `name`) VALUES (4, 'vanilla/strawberry');
INSERT INTO `flavor` (`id`, `name`) VALUES (5, 'chocolate/dulce');
INSERT INTO `flavor` (`id`, `name`) VALUES (6, 'red velvet/cream cheese');
INSERT INTO `flavor` (`id`, `name`) VALUES (7, 'pumpkin/cream cheese');
INSERT INTO `flavor` (`id`, `name`) VALUES (8, 'king cake');

COMMIT;


-- -----------------------------------------------------
-- Data for table `filling`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `filling` (`id`, `filling_type`) VALUES (1, 'lemon-curd');
INSERT INTO `filling` (`id`, `filling_type`) VALUES (2, 'dulce ribbons');
INSERT INTO `filling` (`id`, `filling_type`) VALUES (3, 'ganache');
INSERT INTO `filling` (`id`, `filling_type`) VALUES (4, 'raspberry compote');
INSERT INTO `filling` (`id`, `filling_type`) VALUES (5, 'chessecake bites');
INSERT INTO `filling` (`id`, `filling_type`) VALUES (6, 'cookie dough');

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
INSERT INTO `cake_has_fillings` (`cake_id`, `fillings_type_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_has_flavor`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_has_flavor` (`cake_flavor_id`, `cake_id`) VALUES (7, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_bid`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_bid` (`id`, `bakery_id`, `cake_id`, `price`, `bid_date`, `accepted_date`, `fulfilled_date`, `description`) VALUES (1, 1, 1, 150.00, '2022-08-19', '2022-08-20', '2022-08-23', 'need a drip cake yo!');
INSERT INTO `cake_bid` (`id`, `bakery_id`, `cake_id`, `price`, `bid_date`, `accepted_date`, `fulfilled_date`, `description`) VALUES (2, 3, 2, 300.00, '2022-08-15', '2022-08-23', '2022-08-24', '3 tier cake');
INSERT INTO `cake_bid` (`id`, `bakery_id`, `cake_id`, `price`, `bid_date`, `accepted_date`, `fulfilled_date`, `description`) VALUES (3, 3, 3, 200.00, '2022-08-13', '2022-08-15', '2022-08-22', 'sculpted dog cake');

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
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrWpm_FlhUvrPbHcGWGaP0uGEff_SW_UBrVQ&usqp=CAU', 'pancake cake', 1);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (3, 'https://i.pinimg.com/736x/78/54/15/7854150ecfbe56ae1f10b7f86b398144.jpg', 'wedding cake', 1);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZrWxqSm89RtI_FJtmSYDdCwiNljXDI8UYQ&usqp=CAU', 'caramel cake ', 1);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr16-pkI2JEoMM2JL3UBgmms7uJr4e9NU4yw&usqp=CAU', 'rainbow cake', 2);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3IRb8BVuk7XMiVzj-YD13AqWM-fOzohu-CA&usqp=CAU', 'whimsical cake', 2);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpMfXZVafgWwuIZKdYtNzAwfnmQYrpuQge8A&usqp=CAU', 'gold ribbon cake', 2);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw4PsE2Mic9pH6R6iUeKZW0FL3xT9hnoUjGw&usqp=CAU', 'tiered wedding cake', 2);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (9, 'https://i.pinimg.com/236x/00/b1/7e/00b17ef716e32930fab7976d42f74303.jpg', 'sunshine cake', 3);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (10, 'https://i.pinimg.com/236x/cb/50/ab/cb50abfe7e7017bba797b23eb5c6e606.jpg', 'black', 3);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (11, 'https://i.pinimg.com/236x/8a/e2/a4/8ae2a4db2581f71a931f4c1ab2fa8219.jpg', 'wedding', 3);
INSERT INTO `bakery_image` (`id`, `image_url`, `description`, `bakery_id`) VALUES (12, 'https://i.pinimg.com/236x/f6/da/29/f6da291452bd127e557b498ab25a009a.jpg', 'boho cake ', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cake_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakebidsdb`;
INSERT INTO `cake_image` (`id`, `image_url`, `description`, `cake_id`) VALUES (1, 'https://thefirstyearblog.com/wp-content/uploads/2015/11/chocolate-chocolate-cake-1.png', 'chocolate cake', 1);

COMMIT;

