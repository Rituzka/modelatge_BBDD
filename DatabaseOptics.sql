-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: optics
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int unsigned NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `customer_adress` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(12) NOT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_registerDate` date DEFAULT NULL,
  `customer_clientRecommended` int unsigned DEFAULT NULL COMMENT 'customerId that recommend the product to the new customer.',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Gafotas','Bellavista 2','11223344','gafotas@ahoraveo.com','2001-02-20',3),(2,'Clark Kent','Beperfecto 2000','11223344','superman@nosoyclarkent.com','2001-02-20',3),(3,'Harry Potter','Comisiones Porgafas 24','11223344','harrypotter@granmagodeventas.com','2001-02-20',NULL),(4,'Milhouse','Novenada 17','11223344','milhouse@vanhouten.com','2001-02-20',3),(5,'Austin Powers','Astigmatismo esq Miopia 2','11223344','Apowers@superdetective.com','2001-02-20',3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `glasses_id` int unsigned NOT NULL,
  `glasses_brand` varchar(45) NOT NULL,
  `glasses_prescriptionLeft` varchar(10) NOT NULL,
  `glasses_prescriptionRight` varchar(10) NOT NULL,
  `glasses_frameType` varchar(30) NOT NULL,
  `glasses_colorFrame` varchar(30) DEFAULT NULL,
  `glasses_colorLens` varchar(30) DEFAULT NULL,
  `glasses_price` float DEFAULT NULL,
  `supplier_supplier_id` int unsigned NOT NULL,
  `salesPerson_salesPerson_id` int unsigned NOT NULL,
  PRIMARY KEY (`glasses_id`),
  KEY `fk_Glasses_Supplier_idx` (`supplier_supplier_id`),
  KEY `fk_glasses_salesPerson1_idx` (`salesPerson_salesPerson_id`),
  CONSTRAINT `fk_glasses_salesPerson1` FOREIGN KEY (`salesPerson_salesPerson_id`) REFERENCES `salesperson` (`salesPerson_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Supplier` FOREIGN KEY (`supplier_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (400,'Ray-Ban','3.35 -450','2.67 -68','Solida','Rojo','transparente',284.34,101,202),(401,'Serenguetti','3.35 -450','2.67 -68','Aluminio','Gris','transparente',584.34,102,202),(402,'Adidas','3.35 -450','2.67 -68','Pasta','Negro','transparente',384.34,103,201),(403,'Adidas','4.35 -450','0.67 -68','Pasta','Azul','transparente',384.34,103,202),(404,'Ray-Ban','4.35 -450','0.67 -68','Solida','Dorado','transparente',284.34,101,202);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses_has_invoice`
--

DROP TABLE IF EXISTS `glasses_has_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses_has_invoice` (
  `glasses_glasses_id` int unsigned NOT NULL,
  `invoice_invoice_id` int unsigned NOT NULL,
  PRIMARY KEY (`glasses_glasses_id`,`invoice_invoice_id`),
  KEY `fk_glasses_has_invoice_invoice1_idx` (`invoice_invoice_id`),
  KEY `fk_glasses_has_invoice_glasses1_idx` (`glasses_glasses_id`),
  CONSTRAINT `fk_glasses_has_invoice_glasses1` FOREIGN KEY (`glasses_glasses_id`) REFERENCES `glasses` (`glasses_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_has_invoice_invoice1` FOREIGN KEY (`invoice_invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses_has_invoice`
--

LOCK TABLES `glasses_has_invoice` WRITE;
/*!40000 ALTER TABLE `glasses_has_invoice` DISABLE KEYS */;
INSERT INTO `glasses_has_invoice` VALUES (400,500),(401,501),(402,502),(403,503),(404,504);
/*!40000 ALTER TABLE `glasses_has_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int unsigned NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_prodQuantity` int NOT NULL,
  `invoice_itemPrice` double NOT NULL,
  `customer_customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_id_UNIQUE` (`invoice_id`),
  UNIQUE KEY `customer_customer_id_UNIQUE` (`customer_customer_id`),
  KEY `fk_invoice_customer1_idx` (`customer_customer_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (500,'2023-01-20',1,324.18,1),(501,'2023-01-20',2,624.18,2),(502,'2024-01-20',1,189.18,4),(503,'2024-01-20',3,924.18,5),(504,'2026-01-20',1,89.18,3);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesperson` (
  `salesPerson_id` int unsigned NOT NULL,
  `salesPerson_name` varchar(45) NOT NULL,
  PRIMARY KEY (`salesPerson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
INSERT INTO `salesperson` VALUES (201,'Pedro Gonzalez'),(202,'Heidi Perez'),(203,'Niebla Blanca');
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int unsigned NOT NULL,
  `supplier_NIF` varchar(45) NOT NULL,
  `supplier_name` varchar(45) NOT NULL,
  `supplier_phone` varchar(45) NOT NULL,
  `supplier_fax` varchar(20) DEFAULT NULL,
  `supplier_adressStreet` varchar(70) DEFAULT NULL,
  `supplier_adressHouseNumber` varchar(15) DEFAULT NULL,
  `supplier_adressHouseFloor` int DEFAULT NULL,
  `supplier_adressApartmentNumberl` varchar(5) DEFAULT NULL,
  `supplier_adressPostalCode` varchar(20) DEFAULT NULL,
  `supplier_adressTown` varchar(45) DEFAULT NULL,
  `supplier_adressCountry` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (101,'B1234561','Gafas para todos SLU','23456789',NULL,'Miraquebienveo','101',1,'A','08024','Barcelona','Espana'),(102,'B1234562','AlFin veo SLU','23456789',NULL,'Bello Paisaje','102',1,'A','01234','Valencia','Espana'),(103,'B1234563','Adios ceguera SLU','23456789',NULL,'Nomas Borrones','104',1,'A','12345','Tarragona','Espana');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-01 23:35:17
