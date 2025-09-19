-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Subscription Box Service Mini World
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Subscription Box Service Mini World
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Subscription Box Service Mini World` DEFAULT CHARACTER SET utf8 ;
USE `Subscription Box Service Mini World` ;

-- -----------------------------------------------------
-- Table `Subscription Box Service Mini World`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Subscription Box Service Mini World`.`Payment` (
  `Payment_ID` INT NOT NULL AUTO_INCREMENT,
  `Subscription_ID` INT NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `Payment_date` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
FOREIGN KEY (`Subscription_ID`)
    REFERENCES `Subscription Box Service Mini World`.Subscriptions(`Subscription_ID`))

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Subscription Box Service Mini World`.`Subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Subscription Box Service Mini World`.`Subscriptions` (
  `Subscription_ID` INT NOT NULL AUTO_INCREMENT,
  `Customer_ID` INT NOT NULL,
  `Plan_ID` INT NOT NULL,
  `Start_date` DATE NOT NULL,
  `End_date` DATE NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Subscription_ID`),

  
    FOREIGN KEY (Customer_ID)
    REFERENCES `Subscription Box Service Mini World`.`Customer` (Customer_ID),
FOREIGN KEY (Plan_ID)
    REFERENCES `Subscription Box Service Mini World`. Subscription_Plans (Plan_id))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Subscription Box Service Mini World`.`Customer` (
  `Customer_ID` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(155) NOT NULL Unique,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Signup_date` DATE NULL,
  `Shipping_Add` VARCHAR(100) NOT NULL,
  `Billing_Add` VARCHAR(100) NOT NULL,
  `Status` TINYINT NOT NULL,
  `Subscriptions_Subscription_ID` INT NOT NULL,
  PRIMARY KEY (`Customer_ID`))
 
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Subscription Box Service Mini World`.`Subscription_Plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Subscription Box Service Mini World`.`Subscription_Plans` (
  `Plan_id` INT NOT NULL AUTO_INCREMENT Primary Key,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(155),
  `price` DECIMAL(10,2) NOT NULL,
  `Frequency` VARCHAR(45) NOT NULL,
  `items_per_box` INT NOT NULL)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Subscription Box Service Mini World`.`Boxes` (
  `Box_ID` INT NOT NULL Primary Key,
  `Subscription_ID` INT NOT NULL,
  `Shipment_date` DATE NOT NULL,
  `Delivery_date` DATE NOT NULL,
  `Tracking_Number` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Boxes_Box_ID` INT NOT NULL,

    FOREIGN KEY (Subscription_ID)
    REFERENCES `Subscription Box Service Mini World`.`Subscriptions` (`Subscription_ID`))
  
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Subscription Box Service Mini World`.`Subscriptions_has_Customer`
-- -----------------------------------------------------



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
