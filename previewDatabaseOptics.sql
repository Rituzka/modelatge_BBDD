-- MySQL Workbench Synchronization
-- Generated: 2020-01-30 22:39
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Admin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Optics` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Optics`.`Supplier` (
  `supplier_id` INT(11) NOT NULL,
  `supplier_NIF` VARCHAR(45) NOT NULL,
  `supplier_name` VARCHAR(45) NULL DEFAULT NULL,
  `supplier_phone` VARCHAR(45) NULL DEFAULT NULL,
  `supplier_fax` VARCHAR(20) NULL DEFAULT NULL,
  `supplier_adressStreet` VARCHAR(70) NULL DEFAULT NULL,
  `supplier_adressHouseNumber` VARCHAR(15) NULL DEFAULT NULL,
  `supplier_adressHouseFloor` INT(11) NULL DEFAULT NULL,
  `supplier_adressApartmentNumberl` VARCHAR(5) NULL DEFAULT NULL,
  `supplier_adressPostalCode` VARCHAR(20) NULL DEFAULT NULL,
  `supplier_adressTown` VARCHAR(45) NULL DEFAULT NULL,
  `supplier_adressCountry` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE INDEX `supplier_NIF_UNIQUE` (`supplier_NIF` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optics`.`Glasses` (
  `glasses_id` INT(11) NOT NULL,
  `glasses_brand` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_prescriptionLeft` VARCHAR(10) NULL DEFAULT NULL,
  `glasses_prescriptionRight` VARCHAR(10) NULL DEFAULT NULL,
  `glasses_frameType` VARCHAR(30) GENERATED ALWAYS AS () VIRTUAL,
  `glasses_colorFrame` VARCHAR(30) NULL DEFAULT NULL,
  `glasses_colorLens` VARCHAR(30) NULL DEFAULT NULL,
  `glasses_price` FLOAT(11) NULL DEFAULT NULL,
  `Supplier_supplier_id` INT(11) NOT NULL,
  `Customer_customer_id` INT(11) NOT NULL,
  `SalesPerson_salesPerson_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_Glasses_Supplier_idx` (`Supplier_supplier_id` ASC) VISIBLE,
  INDEX `fk_Glasses_Customer1_idx` (`Customer_customer_id` ASC) VISIBLE,
  INDEX `fk_Glasses_SalesPerson1_idx` (`SalesPerson_salesPerson_id` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier`
    FOREIGN KEY (`Supplier_supplier_id`)
    REFERENCES `Optics`.`Supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Customer1`
    FOREIGN KEY (`Customer_customer_id`)
    REFERENCES `Optics`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_SalesPerson1`
    FOREIGN KEY (`SalesPerson_salesPerson_id`)
    REFERENCES `Optics`.`SalesPerson` (`salesPerson_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optics`.`Customer` (
  `customer_id` INT(11) NOT NULL,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_adress` VARCHAR(50) NULL DEFAULT NULL,
  `customer_phone` VARCHAR(12) NULL DEFAULT NULL,
  `customer_email` VARCHAR(45) NULL DEFAULT NULL,
  `customer_registerDate` DATE NULL DEFAULT NULL,
  `customer_clientRecommended` INT(11) NULL DEFAULT NULL COMMENT 'customerId that recommend the product to the new customer.',
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optics`.`SalesPerson` (
  `salesPerson_id` INT(11) NOT NULL,
  `salesPerson_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`salesPerson_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
