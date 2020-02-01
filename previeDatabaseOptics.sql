-- MySQL Workbench Synchronization
-- Generated: 2020-01-31 23:25
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Admin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `optics`.`glasses` (
  `glasses_id` INT(11) NOT NULL,
  `glasses_brand` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_prescriptionLeft` VARCHAR(10) NULL DEFAULT NULL,
  `glasses_prescriptionRight` VARCHAR(10) NULL DEFAULT NULL,
  `glasses_frameType` VARCHAR(30) GENERATED ALWAYS AS () VIRTUAL,
  `glasses_colorFrame` VARCHAR(30) NULL DEFAULT NULL,
  `glasses_colorLens` VARCHAR(30) NULL DEFAULT NULL,
  `glasses_price` FLOAT(11) NULL DEFAULT NULL,
  `supplier_supplier_id` INT(11) NOT NULL,
  `salesPerson_salesPerson_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_Glasses_Supplier_idx` (`supplier_supplier_id` ASC) VISIBLE,
  UNIQUE INDEX `Supplier_supplier_id_UNIQUE` (`supplier_supplier_id` ASC) VISIBLE,
  INDEX `fk_glasses_salesPerson1_idx` (`salesPerson_salesPerson_id` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier`
    FOREIGN KEY (`supplier_supplier_id`)
    REFERENCES `optics`.`supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_salesPerson1`
    FOREIGN KEY (`salesPerson_salesPerson_id`)
    REFERENCES `optics`.`salesPerson` (`salesPerson_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`customer` (
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

CREATE TABLE IF NOT EXISTS `optics`.`salesPerson` (
  `salesPerson_id` INT(11) NOT NULL,
  `salesPerson_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`salesPerson_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`invoice` (
  `invoice_id` INT(11) NOT NULL,
  `invoice_date` DATE NULL DEFAULT NULL,
  `invoice_prodQuantity` INT(11) NULL DEFAULT NULL,
  `invoice_itemPrice` DOUBLE NULL DEFAULT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoice_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `optics`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`glasses_has_invoice` (
  `glasses_glasses_id` INT(11) NOT NULL,
  `invoice_invoice_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_glasses_id`, `invoice_invoice_id`),
  INDEX `fk_glasses_has_invoice_invoice1_idx` (`invoice_invoice_id` ASC) VISIBLE,
  INDEX `fk_glasses_has_invoice_glasses1_idx` (`glasses_glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_has_invoice_glasses1`
    FOREIGN KEY (`glasses_glasses_id`)
    REFERENCES `optics`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_has_invoice_invoice1`
    FOREIGN KEY (`invoice_invoice_id`)
    REFERENCES `optics`.`invoice` (`invoice_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
