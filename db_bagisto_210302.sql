-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: bagisto_db
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_company_id_foreign` (`company_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`),
  KEY `admins_company_id_foreign` (`company_id`),
  CONSTRAINT `admins_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,1,'dsfsdf ','thaodo.it4@gmail.com','$2y$10$L3z79gpC31qDliXpOH3uSe/74nlUX2hIkHhZ5IUC2LlhFp.6m4kHm',NULL,1,1,NULL,'2020-12-25 09:48:50','2020-12-25 09:48:50'),(2,2,'sang nguyen','nhocqn@gmail.com','$2y$10$zbRXhH13h80/guIHra9ase6zfKR/2IG5ya.8f4GkNJjbEZ5OTPQxe',NULL,1,2,NULL,'2020-12-28 10:55:56','2020-12-28 10:55:56'),(3,3,'sang nguyen','nhocqn111@gmail.com','$2y$10$6f6YbNhA3QpkZufvxS2lYuckQCP0NZMKI/lwFwr8Dr117vbwltjTW',NULL,1,3,NULL,'2020-12-29 08:55:42','2020-12-29 08:55:42'),(4,4,'sanjana singh','test345@gmail.com','$2y$10$V/iB2L.IrA5U41w8krcqX.9Uf5saR5y72MIFaoYCo4SJAHHM.GReS',NULL,1,4,NULL,'2020-12-30 14:46:40','2020-12-30 14:46:40'),(5,5,'sanjana singh','test3451@gmail.com','$2y$10$fc3ANaAYZNCf/axWvaue6ee25Wcg0aFg4bFxFloNZOoHLPePAhmdS',NULL,1,5,NULL,'2020-12-30 14:56:10','2020-12-30 14:56:10'),(6,6,'dsfdsfds nguyen','nhocqn1@gmail.com','$2y$10$60eIJHhaqzZdrROFAOveduH4YLHe7284lhLeL8thC5IsRY0ieC8oS',NULL,1,6,NULL,'2020-12-30 14:58:23','2020-12-30 14:58:23'),(7,7,'sang ','laobian@gmail.com','$2y$10$PeedmEAeglvp3DoWpQjlAu/364JxXuYzB10yEbYH1M1UG51KRYn12',NULL,1,7,NULL,'2020-12-31 10:31:53','2020-12-31 10:31:53'),(8,8,'sang nguyen','nhocqn1111@gmail.com','$2y$10$ABVJoTxRbhKhxXQABsVY6OTsao5gk5XNmYX3TPMlFdo86Fd.r44py',NULL,1,8,NULL,'2021-01-05 14:37:55','2021-01-05 14:37:55'),(9,9,'thaod do','thaodo.ledu@gmail.com','$2y$10$3qk5ZrZmiRDkyHV22hjMvOL.uqqlrEfAOlSbHxODdivQw/axXQ3/e',NULL,1,9,NULL,'2021-03-02 07:51:52','2021-03-02 07:51:52');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `attribute_families_company_id_foreign` (`company_id`),
  CONSTRAINT `attribute_families_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,5,'default','Default',0,1),(2,6,'default','Default',0,1),(3,7,'default','Default',0,1),(4,8,'default','Default',0,1),(5,9,'default','Default',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_group_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,5),(5,1,6),(6,1,7),(7,1,8),(8,1,9),(9,2,2),(10,2,3),(11,4,2),(12,4,3),(13,4,4),(14,4,5),(15,4,6),(16,3,2),(17,3,3),(18,3,4),(19,5,2),(20,5,3),(21,5,4),(22,5,5),(23,1,10),(24,1,11),(25,1,12),(26,1,13),(27,6,2),(28,6,3),(29,6,4),(30,6,5),(31,6,6),(32,6,7),(33,6,8),(34,6,9),(35,7,2),(36,7,3),(37,9,2),(38,9,3),(39,9,4),(40,9,5),(41,9,6),(42,8,2),(43,8,3),(44,8,4),(45,10,2),(46,10,3),(47,10,4),(48,10,5),(49,6,10),(50,6,11),(51,6,12),(52,6,13),(53,11,2),(54,11,3),(55,11,4),(56,11,5),(57,11,6),(58,11,7),(59,11,8),(60,11,9),(61,12,2),(62,12,3),(63,14,2),(64,14,3),(65,14,4),(66,14,5),(67,14,6),(68,13,2),(69,13,3),(70,13,4),(71,15,2),(72,15,3),(73,15,4),(74,15,5),(75,11,10),(76,11,11),(77,11,12),(78,11,13),(79,16,2),(80,16,3),(81,16,4),(82,16,5),(83,16,6),(84,16,7),(85,16,8),(86,16,9),(87,17,2),(88,17,3),(89,19,2),(90,19,3),(91,19,4),(92,19,5),(93,19,6),(94,18,2),(95,18,3),(96,18,4),(97,20,2),(98,20,3),(99,20,4),(100,20,5),(101,16,10),(102,16,11),(103,16,12),(104,16,13),(105,21,2),(106,21,3),(107,21,4),(108,21,5),(109,21,6),(110,21,7),(111,21,8),(112,21,9),(113,22,2),(114,22,3),(115,24,2),(116,24,3),(117,24,4),(118,24,5),(119,24,6),(120,23,2),(121,23,3),(122,23,4),(123,25,2),(124,25,3),(125,25,4),(126,25,5),(127,21,10),(128,21,11),(129,21,12),(130,21,13);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_family_id_name_company_id_unique_index` (`attribute_family_id`,`name`,`company_id`),
  KEY `attribute_groups_company_id_foreign` (`company_id`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'General',1,0,1,5),(2,'Description',2,0,1,5),(3,'Meta Description',3,0,1,5),(4,'Price',4,0,1,5),(5,'Shipping',5,0,1,5),(6,'General',1,0,2,6),(7,'Description',2,0,2,6),(8,'Meta Description',3,0,2,6),(9,'Price',4,0,2,6),(10,'Shipping',5,0,2,6),(11,'General',1,0,3,7),(12,'Description',2,0,3,7),(13,'Meta Description',3,0,3,7),(14,'Price',4,0,3,7),(15,'Shipping',5,0,3,7),(16,'General',1,0,4,8),(17,'Description',2,0,4,8),(18,'Meta Description',3,0,4,8),(19,'Price',4,0,4,8),(20,'Shipping',5,0,4,8),(21,'General',1,0,5,9),(22,'Description',2,0,5,9),(23,'Meta Description',3,0,5,9),(24,'Price',4,0,5,9),(25,'Shipping',5,0,5,9);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,'en','Red',1),(2,'en','Green',2),(3,'en','Yellow',3),(4,'en','Black',4),(5,'en','White',5),(6,'en','S',6),(7,'en','M',7),(8,'en','L',8),(9,'en','XL',9),(10,'en','Red',10),(11,'en','Green',11),(12,'en','Yellow',12),(13,'en','Black',13),(14,'en','White',14),(15,'en','S',15),(16,'en','M',16),(17,'en','L',17),(18,'en','XL',18),(19,'en','Red',19),(20,'en','Green',20),(21,'en','Yellow',21),(22,'en','Black',22),(23,'en','White',23),(24,'en','S',24),(25,'en','M',25),(26,'en','L',26),(27,'en','XL',27),(28,'en','Red',28),(29,'en','Green',29),(30,'en','Yellow',30),(31,'en','Black',31),(32,'en','White',32),(33,'en','S',33),(34,'en','M',34),(35,'en','L',35),(36,'en','XL',36),(37,'en','Red',37),(38,'en','Green',38),(39,'en','Yellow',39),(40,'en','Black',40),(41,'en','White',41),(42,'en','S',42),(43,'en','M',43),(44,'en','L',44),(45,'en','XL',45);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,'Red',1,23,NULL),(2,'Green',2,23,NULL),(3,'Yellow',3,23,NULL),(4,'Black',4,23,NULL),(5,'White',5,23,NULL),(6,'S',1,24,NULL),(7,'M',2,24,NULL),(8,'L',3,24,NULL),(9,'XL',4,24,NULL),(10,'Red',1,49,NULL),(11,'Green',2,49,NULL),(12,'Yellow',3,49,NULL),(13,'Black',4,49,NULL),(14,'White',5,49,NULL),(15,'S',1,50,NULL),(16,'M',2,50,NULL),(17,'L',3,50,NULL),(18,'XL',4,50,NULL),(19,'Red',1,75,NULL),(20,'Green',2,75,NULL),(21,'Yellow',3,75,NULL),(22,'Black',4,75,NULL),(23,'White',5,75,NULL),(24,'S',1,76,NULL),(25,'M',2,76,NULL),(26,'L',3,76,NULL),(27,'XL',4,76,NULL),(28,'Red',1,101,NULL),(29,'Green',2,101,NULL),(30,'Yellow',3,101,NULL),(31,'Black',4,101,NULL),(32,'White',5,101,NULL),(33,'S',1,102,NULL),(34,'M',2,102,NULL),(35,'L',3,102,NULL),(36,'XL',4,102,NULL),(37,'Red',1,127,NULL),(38,'Green',2,127,NULL),(39,'Yellow',3,127,NULL),(40,'Black',4,127,NULL),(41,'White',5,127,NULL),(42,'S',1,128,NULL),(43,'M',2,128,NULL),(44,'L',3,128,NULL),(45,'XL',4,128,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,'en','SKU',1),(2,'en','Name',2),(3,'en','URL Key',3),(4,'en','Tax Category',4),(5,'en','New',5),(6,'en','Featured',6),(7,'en','Visible Individually',7),(8,'en','Status',8),(9,'en','Short Description',9),(10,'en','Description',10),(11,'en','Price',11),(12,'en','Cost',12),(13,'en','Special Price',13),(14,'en','Special Price From',14),(15,'en','Special Price To',15),(16,'en','Meta Title',16),(17,'en','Meta Keywords',17),(18,'en','Meta Description',18),(19,'en','Width',19),(20,'en','Height',20),(21,'en','Depth',21),(22,'en','Weight',22),(23,'en','Color',23),(24,'en','Size',24),(25,'en','Brand',25),(26,'en','Guest Checkout',26),(27,'en','SKU',27),(28,'en','Name',28),(29,'en','URL Key',29),(30,'en','Tax Category',30),(31,'en','New',31),(32,'en','Featured',32),(33,'en','Visible Individually',33),(34,'en','Status',34),(35,'en','Short Description',35),(36,'en','Description',36),(37,'en','Price',37),(38,'en','Cost',38),(39,'en','Special Price',39),(40,'en','Special Price From',40),(41,'en','Special Price To',41),(42,'en','Meta Title',42),(43,'en','Meta Keywords',43),(44,'en','Meta Description',44),(45,'en','Width',45),(46,'en','Height',46),(47,'en','Depth',47),(48,'en','Weight',48),(49,'en','Color',49),(50,'en','Size',50),(51,'en','Brand',51),(52,'en','Guest Checkout',52),(53,'en','SKU',53),(54,'en','Name',54),(55,'en','URL Key',55),(56,'en','Tax Category',56),(57,'en','New',57),(58,'en','Featured',58),(59,'en','Visible Individually',59),(60,'en','Status',60),(61,'en','Short Description',61),(62,'en','Description',62),(63,'en','Price',63),(64,'en','Cost',64),(65,'en','Special Price',65),(66,'en','Special Price From',66),(67,'en','Special Price To',67),(68,'en','Meta Title',68),(69,'en','Meta Keywords',69),(70,'en','Meta Description',70),(71,'en','Width',71),(72,'en','Height',72),(73,'en','Depth',73),(74,'en','Weight',74),(75,'en','Color',75),(76,'en','Size',76),(77,'en','Brand',77),(78,'en','Guest Checkout',78),(79,'en','SKU',79),(80,'en','Name',80),(81,'en','URL Key',81),(82,'en','Tax Category',82),(83,'en','New',83),(84,'en','Featured',84),(85,'en','Visible Individually',85),(86,'en','Status',86),(87,'en','Short Description',87),(88,'en','Description',88),(89,'en','Price',89),(90,'en','Cost',90),(91,'en','Special Price',91),(92,'en','Special Price From',92),(93,'en','Special Price To',93),(94,'en','Meta Title',94),(95,'en','Meta Keywords',95),(96,'en','Meta Description',96),(97,'en','Width',97),(98,'en','Height',98),(99,'en','Depth',99),(100,'en','Weight',100),(101,'en','Color',101),(102,'en','Size',102),(103,'en','Brand',103),(104,'en','Guest Checkout',104),(105,'en','SKU',105),(106,'en','Name',106),(107,'en','URL Key',107),(108,'en','Tax Category',108),(109,'en','New',109),(110,'en','Featured',110),(111,'en','Visible Individually',111),(112,'en','Status',112),(113,'en','Short Description',113),(114,'en','Description',114),(115,'en','Price',115),(116,'en','Cost',116),(117,'en','Special Price',117),(118,'en','Special Price From',118),(119,'en','Special Price To',119),(120,'en','Meta Title',120),(121,'en','Meta Keywords',121),(122,'en','Meta Description',122),(123,'en','Width',123),(124,'en','Height',124),(125,'en','Depth',125),(126,'en','Weight',126),(127,'en','Color',127),(128,'en','Size',128),(129,'en','Brand',129),(130,'en','Guest Checkout',130);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `use_in_flat` tinyint(1) NOT NULL DEFAULT '1',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_company_code_unique_index` (`code`,`company_id`),
  KEY `attributes_company_id_foreign` (`company_id`),
  CONSTRAINT `attributes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(2,'name','Name','text',NULL,2,1,0,1,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,1),(3,'url_key','URL Key','text',NULL,3,1,1,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(4,'tax_category_id','Tax Category','select',NULL,4,0,0,0,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(5,'new','New','boolean',NULL,5,0,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(6,'featured','Featured','boolean',NULL,6,0,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(7,'visible_individually','Visible Individually','boolean',NULL,7,1,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(8,'status','Status','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(9,'short_description','Short Description','textarea',NULL,9,1,0,1,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(10,'description','Description','textarea',NULL,10,1,0,1,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,1),(11,'price','Price','price','decimal',11,1,0,0,0,1,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,1),(12,'cost','Cost','price','decimal',12,0,0,0,1,0,0,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(13,'special_price','Special Price','price','decimal',13,0,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(14,'special_price_from','Special Price From','date',NULL,14,0,0,0,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(15,'special_price_to','Special Price To','date',NULL,15,0,0,0,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(16,'meta_title','Meta Title','textarea',NULL,16,0,0,1,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(17,'meta_keywords','Meta Keywords','textarea',NULL,17,0,0,1,1,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(18,'meta_description','Meta Description','textarea',NULL,18,0,0,1,1,0,0,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(19,'width','Width','text','decimal',19,0,0,0,0,0,0,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(20,'height','Height','text','decimal',20,0,0,0,0,0,0,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(21,'depth','Depth','text','decimal',21,0,0,0,0,0,0,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(22,'weight','Weight','text','decimal',22,1,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(23,'color','Color','select',NULL,23,0,0,0,0,1,1,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(24,'size','Size','select',NULL,24,0,0,0,0,1,1,1,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(25,'brand','Brand','select',NULL,25,0,0,0,0,1,0,0,1,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(26,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-12-30 14:56:11','2020-12-30 14:56:11',NULL,5,1,0),(27,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(28,'name','Name','text',NULL,2,1,0,1,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,1),(29,'url_key','URL Key','text',NULL,3,1,1,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(30,'tax_category_id','Tax Category','select',NULL,4,0,0,0,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(31,'new','New','boolean',NULL,5,0,0,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(32,'featured','Featured','boolean',NULL,6,0,0,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(33,'visible_individually','Visible Individually','boolean',NULL,7,1,0,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(34,'status','Status','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(35,'short_description','Short Description','textarea',NULL,9,1,0,1,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(36,'description','Description','textarea',NULL,10,1,0,1,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,1),(37,'price','Price','price','decimal',11,1,0,0,0,1,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,1),(38,'cost','Cost','price','decimal',12,0,0,0,1,0,0,1,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(39,'special_price','Special Price','price','decimal',13,0,0,0,0,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(40,'special_price_from','Special Price From','date',NULL,14,0,0,0,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(41,'special_price_to','Special Price To','date',NULL,15,0,0,0,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(42,'meta_title','Meta Title','textarea',NULL,16,0,0,1,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(43,'meta_keywords','Meta Keywords','textarea',NULL,17,0,0,1,1,0,0,0,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(44,'meta_description','Meta Description','textarea',NULL,18,0,0,1,1,0,0,1,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(45,'width','Width','text','decimal',19,0,0,0,0,0,0,1,0,'2020-12-30 14:58:23','2020-12-30 14:58:23',NULL,6,1,0),(46,'height','Height','text','decimal',20,0,0,0,0,0,0,1,0,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(47,'depth','Depth','text','decimal',21,0,0,0,0,0,0,1,0,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(48,'weight','Weight','text','decimal',22,1,0,0,0,0,0,0,0,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(49,'color','Color','select',NULL,23,0,0,0,0,1,1,1,0,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(50,'size','Size','select',NULL,24,0,0,0,0,1,1,1,0,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(51,'brand','Brand','select',NULL,25,0,0,0,0,1,0,0,1,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(52,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,6,1,0),(53,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(54,'name','Name','text',NULL,2,1,0,1,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,1),(55,'url_key','URL Key','text',NULL,3,1,1,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(56,'tax_category_id','Tax Category','select',NULL,4,0,0,0,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(57,'new','New','boolean',NULL,5,0,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(58,'featured','Featured','boolean',NULL,6,0,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(59,'visible_individually','Visible Individually','boolean',NULL,7,1,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(60,'status','Status','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(61,'short_description','Short Description','textarea',NULL,9,1,0,1,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(62,'description','Description','textarea',NULL,10,1,0,1,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,1),(63,'price','Price','price','decimal',11,1,0,0,0,1,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,1),(64,'cost','Cost','price','decimal',12,0,0,0,1,0,0,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(65,'special_price','Special Price','price','decimal',13,0,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(66,'special_price_from','Special Price From','date',NULL,14,0,0,0,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(67,'special_price_to','Special Price To','date',NULL,15,0,0,0,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(68,'meta_title','Meta Title','textarea',NULL,16,0,0,1,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(69,'meta_keywords','Meta Keywords','textarea',NULL,17,0,0,1,1,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(70,'meta_description','Meta Description','textarea',NULL,18,0,0,1,1,0,0,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(71,'width','Width','text','decimal',19,0,0,0,0,0,0,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(72,'height','Height','text','decimal',20,0,0,0,0,0,0,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(73,'depth','Depth','text','decimal',21,0,0,0,0,0,0,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(74,'weight','Weight','text','decimal',22,1,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(75,'color','Color','select',NULL,23,0,0,0,0,1,1,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(76,'size','Size','select',NULL,24,0,0,0,0,1,1,1,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(77,'brand','Brand','select',NULL,25,0,0,0,0,1,0,0,1,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(78,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-12-31 10:31:54','2020-12-31 10:31:54',NULL,7,1,0),(79,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(80,'name','Name','text',NULL,2,1,0,1,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,1),(81,'url_key','URL Key','text',NULL,3,1,1,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(82,'tax_category_id','Tax Category','select',NULL,4,0,0,0,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(83,'new','New','boolean',NULL,5,0,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(84,'featured','Featured','boolean',NULL,6,0,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(85,'visible_individually','Visible Individually','boolean',NULL,7,1,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(86,'status','Status','boolean',NULL,8,1,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(87,'short_description','Short Description','textarea',NULL,9,1,0,1,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(88,'description','Description','textarea',NULL,10,1,0,1,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,1),(89,'price','Price','price','decimal',11,1,0,0,0,1,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,1),(90,'cost','Cost','price','decimal',12,0,0,0,1,0,0,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(91,'special_price','Special Price','price','decimal',13,0,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(92,'special_price_from','Special Price From','date',NULL,14,0,0,0,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(93,'special_price_to','Special Price To','date',NULL,15,0,0,0,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(94,'meta_title','Meta Title','textarea',NULL,16,0,0,1,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(95,'meta_keywords','Meta Keywords','textarea',NULL,17,0,0,1,1,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(96,'meta_description','Meta Description','textarea',NULL,18,0,0,1,1,0,0,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(97,'width','Width','text','decimal',19,0,0,0,0,0,0,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(98,'height','Height','text','decimal',20,0,0,0,0,0,0,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(99,'depth','Depth','text','decimal',21,0,0,0,0,0,0,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(100,'weight','Weight','text','decimal',22,1,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(101,'color','Color','select',NULL,23,0,0,0,0,1,1,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(102,'size','Size','select',NULL,24,0,0,0,0,1,1,1,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(103,'brand','Brand','select',NULL,25,0,0,0,0,1,0,0,1,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(104,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2021-01-05 14:37:56','2021-01-05 14:37:56',NULL,8,1,0),(105,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(106,'name','Name','text',NULL,2,1,0,1,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,1),(107,'url_key','URL Key','text',NULL,3,1,1,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(108,'tax_category_id','Tax Category','select',NULL,4,0,0,0,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(109,'new','New','boolean',NULL,5,0,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(110,'featured','Featured','boolean',NULL,6,0,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(111,'visible_individually','Visible Individually','boolean',NULL,7,1,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(112,'status','Status','boolean',NULL,8,1,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(113,'short_description','Short Description','textarea',NULL,9,1,0,1,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(114,'description','Description','textarea',NULL,10,1,0,1,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,1),(115,'price','Price','price','decimal',11,1,0,0,0,1,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,1),(116,'cost','Cost','price','decimal',12,0,0,0,1,0,0,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(117,'special_price','Special Price','price','decimal',13,0,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(118,'special_price_from','Special Price From','date',NULL,14,0,0,0,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(119,'special_price_to','Special Price To','date',NULL,15,0,0,0,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(120,'meta_title','Meta Title','textarea',NULL,16,0,0,1,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(121,'meta_keywords','Meta Keywords','textarea',NULL,17,0,0,1,1,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(122,'meta_description','Meta Description','textarea',NULL,18,0,0,1,1,0,0,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(123,'width','Width','text','decimal',19,0,0,0,0,0,0,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(124,'height','Height','text','decimal',20,0,0,0,0,0,0,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(125,'depth','Depth','text','decimal',21,0,0,0,0,0,0,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(126,'weight','Weight','text','decimal',22,1,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(127,'color','Color','select',NULL,23,0,0,0,0,1,1,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(128,'size','Size','select',NULL,24,0,0,0,0,1,1,1,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(129,'brand','Brand','select',NULL,25,0,0,0,0,1,0,0,1,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0),(130,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,9,1,0);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_appointment_slots`
--

DROP TABLE IF EXISTS `booking_product_appointment_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_appointment_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_appointment_slots`
--

LOCK TABLES `booking_product_appointment_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_appointment_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_appointment_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_default_slots`
--

DROP TABLE IF EXISTS `booking_product_default_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_default_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_default_slots`
--

LOCK TABLES `booking_product_default_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_default_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_default_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_ticket_translations`
--

DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_ticket_translations`
--

LOCK TABLES `booking_product_event_ticket_translations` WRITE;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_tickets`
--

DROP TABLE IF EXISTS `booking_product_event_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_event_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int(11) DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_tickets`
--

LOCK TABLES `booking_product_event_tickets` WRITE;
/*!40000 ALTER TABLE `booking_product_event_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_rental_slots`
--

DROP TABLE IF EXISTS `booking_product_rental_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_rental_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `renting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_rental_slots`
--

LOCK TABLES `booking_product_rental_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_rental_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_rental_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_table_slots`
--

DROP TABLE IF EXISTS `booking_product_table_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_table_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `break_time` int(11) NOT NULL,
  `prevent_scheduling_before` int(11) NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_table_slots`
--

LOCK TABLES `booking_product_table_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_table_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_table_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_products`
--

DROP TABLE IF EXISTS `booking_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) DEFAULT '0',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_products`
--

LOCK TABLES `booking_products` WRITE;
/*!40000 ALTER TABLE `booking_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT '0',
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `booking_product_event_ticket_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  KEY `cart_company_id_foreign` (`company_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `cart_item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int(11) NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_coupons_company_id_foreign` (`company_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupons_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int(11) NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int(11) NOT NULL DEFAULT '0',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int(11) NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rules_company_id_foreign` (`company_id`),
  CONSTRAINT `cart_rules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`),
  CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  KEY `catalog_rule_product_prices_company_id_foreign` (`company_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  KEY `catalog_rule_products_company_id_foreign` (`company_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rules_company_id_foreign` (`company_id`),
  CONSTRAINT `catalog_rules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int(10) unsigned NOT NULL DEFAULT '0',
  `_rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `category_icon_path` text COLLATE utf8mb4_unicode_ci,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`),
  KEY `categories_company_id_foreign` (`company_id`),
  CONSTRAINT `categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,5,1,NULL,1,1,2,NULL,'2020-12-30 14:56:11','2020-12-30 14:56:11','products_and_description',NULL,NULL),(2,6,1,NULL,1,1,2,NULL,'2020-12-30 14:58:23','2020-12-30 14:58:23','products_and_description',NULL,NULL),(3,7,1,NULL,1,1,2,NULL,'2020-12-31 10:31:54','2020-12-31 10:31:54','products_and_description',NULL,NULL),(4,8,1,NULL,1,1,2,NULL,'2021-01-05 14:37:56','2021-01-05 14:37:56','products_and_description',NULL,NULL),(5,9,1,NULL,1,1,2,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53','products_and_description',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto_user`@`localhost`*/ /*!50003 TRIGGER trig_categories_insert
            AFTER INSERT ON categories
            FOR EACH ROW
            BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto_user`@`localhost`*/ /*!50003 TRIGGER trig_categories_update
            AFTER UPDATE ON categories
            FOR EACH ROW
            BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'maintained by database triggers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_slug_locale_company_id_unique_index` (`category_id`,`slug`,`locale`,`company_id`),
  KEY `category_translations_company_id_foreign` (`company_id`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,'Root','root','Root','','','',1,'en',5,1,''),(2,'Root','root','Root','','','',2,'en',6,2,''),(3,'Root','root','Root','','','',3,'en',7,3,''),(4,'Root','root','Root','','','',4,'en',8,4,''),(5,'Root','root','Root','','','',5,'en',9,5,'');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto_user`@`localhost`*/ /*!50003 TRIGGER trig_category_translations_insert
            BEFORE INSERT ON category_translations
            FOR EACH ROW
            BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto_user`@`localhost`*/ /*!50003 TRIGGER trig_category_translations_update
            BEFORE UPDATE ON category_translations
            FOR EACH ROW
            BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_locales` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_content` text COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int(10) unsigned NOT NULL,
  `base_currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int(10) unsigned DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channels_hostname_unique` (`hostname`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_company_id_foreign` (`company_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,5,'johndoe','Default Channel','Default Channel',NULL,'velocity','johndoe.vietsy.com',NULL,NULL,'<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p><div class=\"banner-container\"><div class=\"left-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581f9494b8a1.png\" /></div><div class=\"right-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fb045cf02.png\" /> <img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fc352d803.png\" /></div></div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span><ul class=\"list-group\"><li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li></ul></div><div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span><ul class=\"list-group\"><li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li><li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li><li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li><li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li><li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li></ul></div>',1,1,'2020-12-30 14:56:11','2020-12-30 14:56:11',1,'{\"meta_title\": \"Default Channel\", \"meta_keywords\": \"Default Channel\", \"meta_description\": \"Default Channel Description\"}'),(2,6,'bilacac111','Default Channel','Default Channel',NULL,'velocity','bilacac111.vietsy.com',NULL,NULL,'<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p><div class=\"banner-container\"><div class=\"left-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581f9494b8a1.png\" /></div><div class=\"right-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fb045cf02.png\" /> <img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fc352d803.png\" /></div></div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span><ul class=\"list-group\"><li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li></ul></div><div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span><ul class=\"list-group\"><li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li><li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li><li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li><li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li><li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li></ul></div>',2,2,'2020-12-30 14:58:23','2020-12-30 14:58:23',2,'{\"meta_title\": \"Default Channel\", \"meta_keywords\": \"Default Channel\", \"meta_description\": \"Default Channel Description\"}'),(3,7,'laobian93','Default Channel','Default Channel',NULL,'velocity','laobian93.vietsy.com',NULL,NULL,'<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p><div class=\"banner-container\"><div class=\"left-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581f9494b8a1.png\" /></div><div class=\"right-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fb045cf02.png\" /> <img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fc352d803.png\" /></div></div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span><ul class=\"list-group\"><li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li></ul></div><div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span><ul class=\"list-group\"><li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li><li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li><li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li><li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li><li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li></ul></div>',3,3,'2020-12-31 10:31:54','2020-12-31 10:31:54',3,'{\"meta_title\": \"Default Channel\", \"meta_keywords\": \"Default Channel\", \"meta_description\": \"Default Channel Description\"}'),(4,8,'sadafasdg','Default Channel','Default Channel',NULL,'velocity','sadafasdg.vietsy.com',NULL,NULL,'<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p><div class=\"banner-container\"><div class=\"left-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581f9494b8a1.png\" /></div><div class=\"right-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fb045cf02.png\" /> <img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fc352d803.png\" /></div></div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span><ul class=\"list-group\"><li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li></ul></div><div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span><ul class=\"list-group\"><li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li><li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li><li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li><li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li><li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li></ul></div>',4,4,'2021-01-05 14:37:56','2021-01-05 14:37:56',4,'{\"meta_title\": \"Default Channel\", \"meta_keywords\": \"Default Channel\", \"meta_description\": \"Default Channel Description\"}'),(5,9,'thaodo','Default Channel','Default Channel',NULL,'velocity','thaodo.vietsy.com',NULL,NULL,'<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p><div class=\"banner-container\"><div class=\"left-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581f9494b8a1.png\" /></div><div class=\"right-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fb045cf02.png\" /> <img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fc352d803.png\" /></div></div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span><ul class=\"list-group\"><li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li></ul></div><div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span><ul class=\"list-group\"><li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li><li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li><li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li><li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li><li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li></ul></div>',5,5,'2021-03-02 07:51:53','2021-03-02 07:51:53',5,'{\"meta_title\": \"Default Channel\", \"meta_keywords\": \"Default Channel\", \"meta_description\": \"Default Channel Description\"}');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  KEY `cms_page_translations_company_id_foreign` (`company_id`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_translations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (1,'About Us','about-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">About us page content</div>\n                                   </div>','about us','','aboutus','en',1,5),(2,'Return Policy','return-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Return policy page content</div>\n                                   </div>','return policy','','return, policy','en',2,5),(3,'Refund Policy','refund-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Refund policy page content</div>\n                                   </div>','Refund policy','','refund, policy','en',3,5),(4,'Terms & Conditions','terms-conditions','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms & conditions page content</div>\n                                   </div>','Terms & Conditions','','term, conditions','en',4,5),(5,'Terms of use','terms-of-use','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms of use page content</div>\n                                   </div>','Terms of use','','term, use','en',5,5),(6,'Contact Us','contact-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Contact us page content</div>\n                                   </div>','Contact Us','','contact, us','en',6,5),(7,'About Us','about-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">About us page content</div>\n                                   </div>','about us','','aboutus','en',7,6),(8,'Return Policy','return-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Return policy page content</div>\n                                   </div>','return policy','','return, policy','en',8,6),(9,'Refund Policy','refund-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Refund policy page content</div>\n                                   </div>','Refund policy','','refund, policy','en',9,6),(10,'Terms & Conditions','terms-conditions','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms & conditions page content</div>\n                                   </div>','Terms & Conditions','','term, conditions','en',10,6),(11,'Terms of use','terms-of-use','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms of use page content</div>\n                                   </div>','Terms of use','','term, use','en',11,6),(12,'Contact Us','contact-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Contact us page content</div>\n                                   </div>','Contact Us','','contact, us','en',12,6),(13,'About Us','about-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">About us page content</div>\n                                   </div>','about us','','aboutus','en',13,7),(14,'Return Policy','return-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Return policy page content</div>\n                                   </div>','return policy','','return, policy','en',14,7),(15,'Refund Policy','refund-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Refund policy page content</div>\n                                   </div>','Refund policy','','refund, policy','en',15,7),(16,'Terms & Conditions','terms-conditions','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms & conditions page content</div>\n                                   </div>','Terms & Conditions','','term, conditions','en',16,7),(17,'Terms of use','terms-of-use','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms of use page content</div>\n                                   </div>','Terms of use','','term, use','en',17,7),(18,'Contact Us','contact-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Contact us page content</div>\n                                   </div>','Contact Us','','contact, us','en',18,7),(19,'About Us','about-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">About us page content</div>\n                                   </div>','about us','','aboutus','en',19,8),(20,'Return Policy','return-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Return policy page content</div>\n                                   </div>','return policy','','return, policy','en',20,8),(21,'Refund Policy','refund-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Refund policy page content</div>\n                                   </div>','Refund policy','','refund, policy','en',21,8),(22,'Terms & Conditions','terms-conditions','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms & conditions page content</div>\n                                   </div>','Terms & Conditions','','term, conditions','en',22,8),(23,'Terms of use','terms-of-use','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms of use page content</div>\n                                   </div>','Terms of use','','term, use','en',23,8),(24,'Contact Us','contact-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Contact us page content</div>\n                                   </div>','Contact Us','','contact, us','en',24,8),(25,'About Us','about-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">About us page content</div>\n                                   </div>','about us','','aboutus','en',25,9),(26,'Return Policy','return-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Return policy page content</div>\n                                   </div>','return policy','','return, policy','en',26,9),(27,'Refund Policy','refund-policy','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Refund policy page content</div>\n                                   </div>','Refund policy','','refund, policy','en',27,9),(28,'Terms & Conditions','terms-conditions','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms & conditions page content</div>\n                                   </div>','Terms & Conditions','','term, conditions','en',28,9),(29,'Terms of use','terms-of-use','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Terms of use page content</div>\n                                   </div>','Terms of use','','term, use','en',29,9),(30,'Contact Us','contact-us','<div class=\"static-container\">\n                                   <div class=\"mb-5\">Contact us page content</div>\n                                   </div>','Contact Us','','contact, us','en',30,9);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pages_company_id_foreign` (`company_id`),
  CONSTRAINT `cms_pages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,5,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(2,5,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(3,5,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(4,5,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(5,5,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(6,5,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(7,6,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(8,6,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(9,6,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(10,6,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(11,6,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(12,6,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(13,7,NULL,'2020-12-31 10:31:54','2020-12-31 10:31:54'),(14,7,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(15,7,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(16,7,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(17,7,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(18,7,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(19,8,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(20,8,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(21,8,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(22,8,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(23,8,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(24,8,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(25,9,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(26,9,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(27,9,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(28,9,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(29,9,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(30,9,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `more_info` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`),
  UNIQUE KEY `companies_username_unique` (`username`),
  UNIQUE KEY `companies_domain_unique` (`domain`),
  UNIQUE KEY `companies_cname_unique` (`cname`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'234223','thaodo.it4@gmail.com','laobian','laobian.vietsy.com',NULL,NULL,'{\"seeded\": false, \"created\": true}',1,'2020-12-25 09:48:50','2020-12-25 09:48:50',0),(2,'sadasdafa','nhocqn@gmail.com','bilacac','bilacac.vietsy.com',NULL,NULL,'{\"seeded\": false, \"created\": true}',1,'2020-12-28 10:55:56','2020-12-28 10:55:56',0),(3,'erfdsf','nhocqn111@gmail.com','laoibiuan2','laoibiuan2.vietsy.com',NULL,NULL,'{\"seeded\": false, \"created\": true}',1,'2020-12-29 08:55:42','2020-12-29 08:55:42',0),(4,'bagisto','test345@gmail.com','test','test.vietsy.com',NULL,NULL,'{\"seeded\": false, \"created\": true}',1,'2020-12-30 14:46:40','2020-12-30 14:46:40',0),(5,'test','test3451@gmail.com','johndoe','johndoe.vietsy.com',NULL,NULL,'{\"seeded\": true, \"company_created\": true}',1,'2020-12-30 14:56:09','2020-12-30 14:56:13',1),(6,'sangsang','nhocqn1@gmail.com','bilacac111','bilacac111.vietsy.com',NULL,NULL,'{\"seeded\": true, \"company_created\": true}',1,'2020-12-30 14:58:23','2020-12-30 14:58:25',2),(7,'lao bi an ','laobian@gmail.com','laobian93','laobian93.vietsy.com',NULL,NULL,'{\"seeded\": true, \"company_created\": true}',1,'2020-12-31 10:31:53','2020-12-31 10:31:55',3),(8,'111','nhocqn1111@gmail.com','sadafasdg','sadafasdg.vietsy.com',NULL,NULL,'{\"seeded\": true, \"company_created\": true}',1,'2021-01-05 14:37:55','2021-01-05 14:37:58',4),(9,'psa','thaodo.ledu@gmail.com','thaodo','thaodo.vietsy.com',NULL,NULL,'{\"seeded\": true, \"company_created\": true}',1,'2021-03-02 07:51:52','2021-03-02 07:51:54',5);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_addresses`
--

DROP TABLE IF EXISTS `company_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address1` text COLLATE utf8mb4_unicode_ci,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` json DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_addresses_company_id_foreign` (`company_id`),
  CONSTRAINT `company_addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_addresses`
--

LOCK TABLES `company_addresses` WRITE;
/*!40000 ALTER TABLE `company_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_personal_details`
--

DROP TABLE IF EXISTS `company_personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_personal_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `more_info` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_personal_details_email_unique` (`email`),
  KEY `company_personal_details_company_id_foreign` (`company_id`),
  CONSTRAINT `company_personal_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_personal_details`
--

LOCK TABLES `company_personal_details` WRITE;
/*!40000 ALTER TABLE `company_personal_details` DISABLE KEYS */;
INSERT INTO `company_personal_details` VALUES (1,'dsfsdf',NULL,'thaodo.it4@gmail.com',NULL,1,NULL,'2020-12-25 09:48:50','2020-12-25 09:48:50','24523423'),(2,'sang','nguyen','nhocqn@gmail.com',NULL,2,NULL,'2020-12-28 10:55:56','2020-12-28 10:55:56','0979044325'),(3,'sang','nguyen','nhocqn111@gmail.com',NULL,3,NULL,'2020-12-29 08:55:42','2020-12-29 08:55:42','0979044325'),(4,'sanjana','singh','test345@gmail.com',NULL,4,NULL,'2020-12-30 14:46:40','2020-12-30 14:46:40','01212121212'),(5,'sanjana','singh','test3451@gmail.com',NULL,5,NULL,'2020-12-30 14:56:10','2020-12-30 14:56:10','01212121212'),(6,'dsfdsfds','nguyen','nhocqn1@gmail.com',NULL,6,NULL,'2020-12-30 14:58:23','2020-12-30 14:58:23','0979044325'),(7,'sang',NULL,'laobian@gmail.com',NULL,7,NULL,'2020-12-31 10:31:53','2020-12-31 10:31:53','99999999'),(8,'sang','nguyen','nhocqn1111@gmail.com',NULL,8,NULL,'2021-01-05 14:37:55','2021-01-05 14:37:55','0979044325'),(9,'thaod','do','thaodo.ledu@gmail.com',NULL,9,NULL,'2021-03-02 07:51:52','2021-03-02 07:51:52','1234567');
/*!40000 ALTER TABLE `company_personal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_config_channel_id_foreign` (`channel_code`),
  KEY `core_config_company_id_foreign` (`company_id`),
  CONSTRAINT `core_config_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,5,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(2,5,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(3,5,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(4,5,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(5,5,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(6,5,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(7,5,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(8,5,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(9,5,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(10,5,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(11,5,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(12,5,'catalog.products.review.guest_review','0',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(13,5,'general.general.email_setting.general.general.email_setting.sender_name','Bagisto Shop',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(14,5,'general.general.email_setting.general.general.email_setting.shop_email_from','johndoe@bagshop.com',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(15,5,'general.general.email_setting.general.general.email_setting.admin_name','Bagisto Admin',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(16,5,'general.general.email_setting.general.general.email_setting.admin_email','johndoe@bagadmin.com',NULL,NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(17,5,'general.content.shop.compare_option','1','johndoe','en','2020-12-30 14:56:12','2020-12-30 14:56:12'),(18,5,'customer.settings.social_login.enable_facebook','1','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(19,5,'customer.settings.social_login.enable_twitter','1','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(20,5,'customer.settings.social_login.enable_google','1','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(21,5,'customer.settings.social_login.enable_linkedin','1','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(22,5,'customer.settings.social_login.enable_github','1','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(23,5,'customer.social_login.facebook.FACEBOOK_CALLBACK_URL','http://johndoe.vietsy.com/customer/social-login/facebook/callback','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(24,5,'customer.social_login.twitter.TWITTER_CALLBACK_URL','http://johndoe.vietsy.com/customer/social-login/twitter/callback','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(25,5,'customer.social_login.google.GOOGLE_CALLBACK_URL','http://johndoe.vietsy.com/customer/social-login/google/callback','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(26,5,'customer.social_login.linkedin.LINKEDIN_CALLBACK_URL','http://johndoe.vietsy.com/customer/social-login/linkedin/callback','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(27,5,'customer.social_login.github.GITHUB_CALLBACK_URL','http://johndoe.vietsy.com/customer/social-login/github/callback','johndoe',NULL,'2020-12-30 14:56:12','2020-12-30 14:56:12'),(28,6,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(29,6,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(30,6,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(31,6,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(32,6,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(33,6,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(34,6,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(35,6,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(36,6,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(37,6,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(38,6,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(39,6,'catalog.products.review.guest_review','0',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(40,6,'general.general.email_setting.general.general.email_setting.sender_name','Bagisto Shop',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(41,6,'general.general.email_setting.general.general.email_setting.shop_email_from','bilacac111@bagshop.com',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(42,6,'general.general.email_setting.general.general.email_setting.admin_name','Bagisto Admin',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(43,6,'general.general.email_setting.general.general.email_setting.admin_email','bilacac111@bagadmin.com',NULL,NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(44,6,'general.content.shop.compare_option','1','bilacac111','en','2020-12-30 14:58:24','2020-12-30 14:58:24'),(45,6,'customer.settings.social_login.enable_facebook','1','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(46,6,'customer.settings.social_login.enable_twitter','1','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(47,6,'customer.settings.social_login.enable_google','1','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(48,6,'customer.settings.social_login.enable_linkedin','1','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(49,6,'customer.settings.social_login.enable_github','1','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(50,6,'customer.social_login.facebook.FACEBOOK_CALLBACK_URL','http://bilacac111.vietsy.com/customer/social-login/facebook/callback','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(51,6,'customer.social_login.twitter.TWITTER_CALLBACK_URL','http://bilacac111.vietsy.com/customer/social-login/twitter/callback','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(52,6,'customer.social_login.google.GOOGLE_CALLBACK_URL','http://bilacac111.vietsy.com/customer/social-login/google/callback','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(53,6,'customer.social_login.linkedin.LINKEDIN_CALLBACK_URL','http://bilacac111.vietsy.com/customer/social-login/linkedin/callback','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(54,6,'customer.social_login.github.GITHUB_CALLBACK_URL','http://bilacac111.vietsy.com/customer/social-login/github/callback','bilacac111',NULL,'2020-12-30 14:58:24','2020-12-30 14:58:24'),(55,7,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(56,7,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(57,7,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(58,7,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(59,7,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(60,7,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(61,7,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(62,7,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(63,7,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(64,7,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(65,7,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(66,7,'catalog.products.review.guest_review','0',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(67,7,'general.general.email_setting.general.general.email_setting.sender_name','Bagisto Shop',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(68,7,'general.general.email_setting.general.general.email_setting.shop_email_from','laobian93@bagshop.com',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(69,7,'general.general.email_setting.general.general.email_setting.admin_name','Bagisto Admin',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(70,7,'general.general.email_setting.general.general.email_setting.admin_email','laobian93@bagadmin.com',NULL,NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(71,7,'general.content.shop.compare_option','1','laobian93','en','2020-12-31 10:31:55','2020-12-31 10:31:55'),(72,7,'customer.settings.social_login.enable_facebook','1','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(73,7,'customer.settings.social_login.enable_twitter','1','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(74,7,'customer.settings.social_login.enable_google','1','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(75,7,'customer.settings.social_login.enable_linkedin','1','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(76,7,'customer.settings.social_login.enable_github','1','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(77,7,'customer.social_login.facebook.FACEBOOK_CALLBACK_URL','http://laobian93.vietsy.com/customer/social-login/facebook/callback','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(78,7,'customer.social_login.twitter.TWITTER_CALLBACK_URL','http://laobian93.vietsy.com/customer/social-login/twitter/callback','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(79,7,'customer.social_login.google.GOOGLE_CALLBACK_URL','http://laobian93.vietsy.com/customer/social-login/google/callback','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(80,7,'customer.social_login.linkedin.LINKEDIN_CALLBACK_URL','http://laobian93.vietsy.com/customer/social-login/linkedin/callback','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(81,7,'customer.social_login.github.GITHUB_CALLBACK_URL','http://laobian93.vietsy.com/customer/social-login/github/callback','laobian93',NULL,'2020-12-31 10:31:55','2020-12-31 10:31:55'),(82,8,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(83,8,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(84,8,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(85,8,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(86,8,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(87,8,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(88,8,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(89,8,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(90,8,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(91,8,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(92,8,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(93,8,'catalog.products.review.guest_review','0',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(94,8,'general.general.email_setting.general.general.email_setting.sender_name','Bagisto Shop',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(95,8,'general.general.email_setting.general.general.email_setting.shop_email_from','sadafasdg@bagshop.com',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(96,8,'general.general.email_setting.general.general.email_setting.admin_name','Bagisto Admin',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(97,8,'general.general.email_setting.general.general.email_setting.admin_email','sadafasdg@bagadmin.com',NULL,NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(98,8,'general.content.shop.compare_option','1','sadafasdg','en','2021-01-05 14:37:57','2021-01-05 14:37:57'),(99,8,'customer.settings.social_login.enable_facebook','1','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(100,8,'customer.settings.social_login.enable_twitter','1','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(101,8,'customer.settings.social_login.enable_google','1','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(102,8,'customer.settings.social_login.enable_linkedin','1','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(103,8,'customer.settings.social_login.enable_github','1','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(104,8,'customer.social_login.facebook.FACEBOOK_CALLBACK_URL','http://sadafasdg.vietsy.com/customer/social-login/facebook/callback','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(105,8,'customer.social_login.twitter.TWITTER_CALLBACK_URL','http://sadafasdg.vietsy.com/customer/social-login/twitter/callback','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(106,8,'customer.social_login.google.GOOGLE_CALLBACK_URL','http://sadafasdg.vietsy.com/customer/social-login/google/callback','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(107,8,'customer.social_login.linkedin.LINKEDIN_CALLBACK_URL','http://sadafasdg.vietsy.com/customer/social-login/linkedin/callback','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(108,8,'customer.social_login.github.GITHUB_CALLBACK_URL','http://sadafasdg.vietsy.com/customer/social-login/github/callback','sadafasdg',NULL,'2021-01-05 14:37:57','2021-01-05 14:37:57'),(109,9,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(110,9,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(111,9,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(112,9,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(113,9,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(114,9,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(115,9,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(116,9,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(117,9,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(118,9,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(119,9,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(120,9,'catalog.products.review.guest_review','0',NULL,NULL,'2021-03-02 07:51:53','2021-03-02 07:51:53'),(121,9,'general.general.email_setting.general.general.email_setting.sender_name','Bagisto Shop',NULL,NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(122,9,'general.general.email_setting.general.general.email_setting.shop_email_from','thaodo@bagshop.com',NULL,NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(123,9,'general.general.email_setting.general.general.email_setting.admin_name','Bagisto Admin',NULL,NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(124,9,'general.general.email_setting.general.general.email_setting.admin_email','thaodo@bagadmin.com',NULL,NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(125,9,'general.content.shop.compare_option','1','thaodo','en','2021-03-02 07:51:54','2021-03-02 07:51:54'),(126,9,'customer.settings.social_login.enable_facebook','1','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(127,9,'customer.settings.social_login.enable_twitter','1','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(128,9,'customer.settings.social_login.enable_google','1','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(129,9,'customer.settings.social_login.enable_linkedin','1','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(130,9,'customer.settings.social_login.enable_github','1','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(131,9,'customer.social_login.facebook.FACEBOOK_CALLBACK_URL','http://thaodo.vietsy.com/customer/social-login/facebook/callback','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(132,9,'customer.social_login.twitter.TWITTER_CALLBACK_URL','http://thaodo.vietsy.com/customer/social-login/twitter/callback','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(133,9,'customer.social_login.google.GOOGLE_CALLBACK_URL','http://thaodo.vietsy.com/customer/social-login/google/callback','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(134,9,'customer.social_login.linkedin.LINKEDIN_CALLBACK_URL','http://thaodo.vietsy.com/customer/social-login/linkedin/callback','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54'),(135,9,'customer.social_login.github.GITHUB_CALLBACK_URL','http://thaodo.vietsy.com/customer/social-login/github/callback','thaodo',NULL,'2021-03-02 07:51:54','2021-03-02 07:51:54');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_state_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  `country_state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_company_id_foreign` (`company_id`),
  CONSTRAINT `currencies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,5,'USD','US Dollar','2020-12-30 14:56:11','2020-12-30 14:56:11','$'),(2,6,'USD','US Dollar','2020-12-30 14:58:23','2020-12-30 14:58:23','$'),(3,7,'USD','US Dollar','2020-12-31 10:31:54','2020-12-31 10:31:54','$'),(4,8,'USD','US Dollar','2021-01-05 14:37:56','2021-01-05 14:37:56','$'),(5,9,'USD','US Dollar','2021-03-02 07:51:53','2021-03-02 07:51:53','$');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_currency_company_id_unique_id` (`target_currency`,`company_id`),
  KEY `currency_exchange_rates_company_id_foreign` (`company_id`),
  CONSTRAINT `currency_exchange_rates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_company_id_unique` (`code`,`company_id`),
  KEY `customer_groups_company_id_foreign` (`company_id`),
  CONSTRAINT `customer_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,5,'Guest',0,'2020-12-30 14:56:11','2020-12-30 14:56:11','guest'),(2,5,'General',0,'2020-12-30 14:56:11','2020-12-30 14:56:11','general'),(3,5,'Wholesale',0,'2020-12-30 14:56:11','2020-12-30 14:56:11','wholesale'),(4,6,'Guest',0,'2020-12-30 14:58:23','2020-12-30 14:58:23','guest'),(5,6,'General',0,'2020-12-30 14:58:23','2020-12-30 14:58:23','general'),(6,6,'Wholesale',0,'2020-12-30 14:58:23','2020-12-30 14:58:23','wholesale'),(7,7,'Guest',0,'2020-12-31 10:31:54','2020-12-31 10:31:54','guest'),(8,7,'General',0,'2020-12-31 10:31:54','2020-12-31 10:31:54','general'),(9,7,'Wholesale',0,'2020-12-31 10:31:54','2020-12-31 10:31:54','wholesale'),(10,8,'Guest',0,'2021-01-05 14:37:56','2021-01-05 14:37:56','guest'),(11,8,'General',0,'2021-01-05 14:37:56','2021-01-05 14:37:56','general'),(12,8,'Wholesale',0,'2021-01-05 14:37:56','2021-01-05 14:37:56','wholesale'),(13,9,'Guest',0,'2021-03-02 07:51:53','2021-03-02 07:51:53','guest'),(14,9,'General',0,'2021-03-02 07:51:53','2021-03-02 07:51:53','general'),(15,9,'Wholesale',0,'2021-03-02 07:51:53','2021-03-02 07:51:53','wholesale');
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_company_id_unique` (`email`,`company_id`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_company_id_foreign` (`company_id`),
  CONSTRAINT `customers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT '0',
  `download_used` int(11) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  KEY `downloadable_link_purchased_company_id_foreign` (`company_id`),
  CONSTRAINT `downloadable_link_purchased_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_company_id_unique` (`code`,`company_id`),
  KEY `inventory_sources_company_id_foreign` (`company_id`),
  CONSTRAINT `inventory_sources_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','123456789',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,'2020-12-30 14:56:11','2020-12-30 14:56:11',5),(2,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','123456789',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,'2020-12-30 14:58:23','2020-12-30 14:58:23',6),(3,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','123456789',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,'2020-12-31 10:31:54','2020-12-31 10:31:54',7),(4,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','123456789',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,'2021-01-05 14:37:56','2021-01-05 14:37:56',8),(5,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','123456789',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,'2021-03-02 07:51:53','2021-03-02 07:51:53',9);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  KEY `invoice_items_company_id_foreign` (`company_id`),
  CONSTRAINT `invoice_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_company_id_foreign` (`company_id`),
  KEY `invoices_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_company_id_unqiue_index` (`code`,`company_id`),
  KEY `locales_company_id_foreign` (`company_id`),
  CONSTRAINT `locales_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English','2020-12-30 14:56:11','2020-12-30 14:56:11',5,'ltr',NULL),(2,'en','English','2020-12-30 14:58:23','2020-12-30 14:58:23',6,'ltr',NULL),(3,'en','English','2020-12-31 10:31:54','2020-12-31 10:31:54',7,'ltr',NULL),(4,'en','English','2021-01-05 14:37:56','2021-01-05 14:37:56',8,'ltr',NULL),(5,'en','English','2021-03-02 07:51:53','2021-03-02 07:51:53',9,'ltr',NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_24_083025_create_customer_addresses_table',1),(23,'2018_07_27_065727_create_products_table',1),(24,'2018_07_27_070011_create_product_attribute_values_table',1),(25,'2018_07_27_092623_create_product_reviews_table',1),(26,'2018_07_27_113941_create_product_images_table',1),(27,'2018_07_27_113956_create_product_inventories_table',1),(28,'2018_08_03_114203_create_sliders_table',1),(29,'2018_08_30_064755_create_tax_categories_table',1),(30,'2018_08_30_065042_create_tax_rates_table',1),(31,'2018_08_30_065840_create_tax_mappings_table',1),(32,'2018_09_05_150444_create_cart_table',1),(33,'2018_09_05_150915_create_cart_items_table',1),(34,'2018_09_11_064045_customer_password_resets',1),(35,'2018_09_19_092845_create_cart_address',1),(36,'2018_09_19_093453_create_cart_payment',1),(37,'2018_09_19_093508_create_cart_shipping_rates_table',1),(38,'2018_09_20_060658_create_core_config_table',1),(39,'2018_09_27_113154_create_orders_table',1),(40,'2018_09_27_113207_create_order_items_table',1),(41,'2018_09_27_113405_create_order_address_table',1),(42,'2018_09_27_115022_create_shipments_table',1),(43,'2018_09_27_115029_create_shipment_items_table',1),(44,'2018_09_27_115135_create_invoices_table',1),(45,'2018_09_27_115144_create_invoice_items_table',1),(46,'2018_10_01_095504_create_order_payment_table',1),(47,'2018_10_03_025230_create_wishlist_table',1),(48,'2018_10_12_101803_create_country_translations_table',1),(49,'2018_10_12_101913_create_country_states_table',1),(50,'2018_10_12_101923_create_country_state_translations_table',1),(51,'2018_11_15_153257_alter_order_table',1),(52,'2018_11_15_163729_alter_invoice_table',1),(53,'2018_11_16_173504_create_subscribers_list_table',1),(54,'2018_11_17_165758_add_is_verified_column_in_customers_table',1),(55,'2018_11_21_144411_create_cart_item_inventories_table',1),(56,'2018_11_26_110500_change_gender_column_in_customers_table',1),(57,'2018_11_27_174449_change_content_column_in_sliders_table',1),(58,'2018_12_05_132625_drop_foreign_key_core_config_table',1),(59,'2018_12_05_132629_alter_core_config_table',1),(60,'2018_12_06_185202_create_product_flat_table',1),(61,'2018_12_21_101307_alter_channels_table',1),(62,'2018_12_24_123812_create_channel_inventory_sources_table',1),(63,'2018_12_24_184402_alter_shipments_table',1),(64,'2018_12_26_165327_create_product_ordered_inventories_table',1),(65,'2018_12_31_161114_alter_channels_category_table',1),(66,'2019_01_11_122452_add_vendor_id_column_in_product_inventories_table',1),(67,'2019_01_25_124522_add_updated_at_column_in_product_flat_table',1),(68,'2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table',1),(69,'2019_01_31_164117_update_value_column_type_to_text_in_core_config_table',1),(70,'2019_02_21_145238_alter_product_reviews_table',1),(71,'2019_02_21_152709_add_swatch_type_column_in_attributes_table',1),(72,'2019_02_21_153035_alter_customer_id_in_product_reviews_table',1),(73,'2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table',1),(74,'2019_03_15_123337_add_display_mode_column_in_categories_table',1),(75,'2019_03_26_151001_create_companies_table',1),(76,'2019_03_26_152524_alter_all_unique_contraints',1),(77,'2019_03_28_103658_add_notes_column_in_customers_table',1),(78,'2019_04_05_105951_create_company_personal_details_table',1),(79,'2019_04_24_155820_alter_product_flat_table',1),(80,'2019_05_13_024320_remove_tables',1),(81,'2019_05_13_024321_create_cart_rules_table',1),(82,'2019_05_13_024322_create_cart_rule_channels_table',1),(83,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(84,'2019_05_13_024324_create_cart_rule_translations_table',1),(85,'2019_05_13_024325_create_cart_rule_customers_table',1),(86,'2019_05_13_024326_create_cart_rule_coupons_table',1),(87,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(88,'2019_05_20_102233_create_super_admins_table',1),(89,'2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table',1),(90,'2019_05_23_113407_add_remaining_column_in_product_flat_table',1),(91,'2019_05_23_155520_add_discount_columns_in_invoice_items_table',1),(92,'2019_05_23_184029_rename_discount_columns_in_cart_table',1),(93,'2019_06_04_114009_add_phone_column_in_customers_table',1),(94,'2019_06_06_195905_update_custom_price_to_nullable_in_cart_items',1),(95,'2019_06_15_183412_add_code_column_in_customer_groups_table',1),(96,'2019_06_17_180258_create_product_downloadable_samples_table',1),(97,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(98,'2019_06_17_180325_create_product_downloadable_links_table',1),(99,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(100,'2019_06_19_162817_remove_unique_in_phone_column_in_customers_table',1),(101,'2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table',1),(102,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(103,'2019_07_02_180307_create_booking_products_table',1),(104,'2019_07_05_114157_add_symbol_column_in_currencies_table',1),(105,'2019_07_05_154415_create_booking_product_default_slots_table',1),(106,'2019_07_05_154429_create_booking_product_appointment_slots_table',1),(107,'2019_07_05_154440_create_booking_product_event_tickets_table',1),(108,'2019_07_05_154451_create_booking_product_rental_slots_table',1),(109,'2019_07_05_154502_create_booking_product_table_slots_table',1),(110,'2019_07_11_151210_add_locale_id_in_category_translations',1),(111,'2019_07_23_033128_alter_locales_table',1),(112,'2019_07_23_174708_create_velocity_contents_table',1),(113,'2019_07_23_175212_create_velocity_contents_translations_table',1),(114,'2019_07_29_142734_add_use_in_flat_column_in_attributes_table',1),(115,'2019_07_30_153530_create_cms_pages_table',1),(116,'2019_07_31_143339_create_category_filterable_attributes_table',1),(117,'2019_08_02_105320_create_product_grouped_products_table',1),(118,'2019_08_12_184925_add_additional_cloumn_in_wishlist_table',1),(119,'2019_08_19_222319_alter_customer_groups_table',1),(120,'2019_08_20_170510_create_product_bundle_options_table',1),(121,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(122,'2019_08_20_170528_create_product_bundle_option_products_table',1),(123,'2019_08_21_123707_add_seo_column_in_channels_table',1),(124,'2019_09_04_161454_add_misc_column_in_super_admins_table',1),(125,'2019_09_11_184511_create_refunds_table',1),(126,'2019_09_11_184519_create_refund_items_table',1),(127,'2019_09_26_163950_remove_channel_id_from_customers_table',1),(128,'2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table',1),(129,'2019_10_21_105136_order_brands',1),(130,'2019_10_24_173358_change_postcode_column_type_in_order_address_table',1),(131,'2019_10_24_173437_change_postcode_column_type_in_cart_address_table',1),(132,'2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table',1),(133,'2019_10_30_111255_restructure_company_tables',1),(134,'2019_10_31_153136_modify_table_for_bagisto_compatibility_018',1),(135,'2019_11_21_194541_add_column_url_path_to_category_translations',1),(136,'2019_11_21_194608_add_stored_function_to_get_url_path_of_category',1),(137,'2019_11_21_194627_add_trigger_to_category_translations',1),(138,'2019_11_21_194648_add_url_path_to_existing_category_translations',1),(139,'2019_11_21_194703_add_trigger_to_categories',1),(140,'2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table',1),(141,'2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table',1),(142,'2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table',1),(143,'2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table',1),(144,'2019_12_03_175253_create_remove_catalog_rule_tables',1),(145,'2019_12_03_184613_create_catalog_rules_table',1),(146,'2019_12_03_184651_create_catalog_rule_channels_table',1),(147,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(148,'2019_12_06_101110_create_catalog_rule_products_table',1),(149,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(150,'2019_12_16_121748_alter_cms_catalog_rule_table',1),(151,'2019_12_16_164314_alter_cart_rules_tables',1),(152,'2019_12_30_155256_create_velocity_meta_data',1),(153,'2020_01_02_201029_add_api_token_columns',1),(154,'2020_01_06_173505_alter_trigger_category_translations',1),(155,'2020_01_06_173524_alter_stored_function_url_path_category',1),(156,'2020_01_06_195305_alter_trigger_on_categories',1),(157,'2020_01_09_154851_add_shipping_discount_columns_in_orders_table',1),(158,'2020_01_09_202815_add_inventory_source_name_column_in_shipments_table',1),(159,'2020_01_10_122226_update_velocity_meta_data',1),(160,'2020_01_10_151902_customer_address_improvements',1),(161,'2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table',1),(162,'2020_01_13_155803_add_velocity_locale_icon',1),(163,'2020_01_13_192149_add_category_velocity_meta_data',1),(164,'2020_01_14_191854_create_cms_page_translations_table',1),(165,'2020_01_14_192206_remove_columns_from_cms_pages_table',1),(166,'2020_01_15_130209_create_cms_page_channels_table',1),(167,'2020_01_15_145637_add_product_policy',1),(168,'2020_01_15_152121_add_banner_link',1),(169,'2020_01_23_195444_add_channel_id_to_companies',1),(170,'2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table',1),(171,'2020_01_29_111903_create_super_admin_password_resets_table',1),(172,'2020_01_29_124748_alter_name_column_in_country_state_translations_table',1),(173,'2020_02_18_165639_create_bookings_table',1),(174,'2020_02_21_121201_create_booking_product_event_ticket_translations_table',1),(175,'2020_02_24_190025_add_is_comparable_column_in_attributes_table',1),(176,'2020_02_25_181902_propagate_company_name',1),(177,'2020_02_26_163908_change_column_type_in_cart_rules_table',1),(178,'2020_02_27_164318_create_super_currencies_and_exchange_rates_table',1),(179,'2020_02_27_164922_create_super_locales_table',1),(180,'2020_02_27_165627_alter_super_channel_table',1),(181,'2020_02_27_170217_create_super_config_table',1),(182,'2020_02_27_170538_alter_super_admins_table',1),(183,'2020_02_28_105104_fix_order_columns',1),(184,'2020_02_28_111958_create_customer_compare_products_table',1),(185,'2020_02_28_123518_alter_cms_page_translations_table',1),(186,'2020_02_29_131108_add_company_id_to_downloadable_link_purchased',1),(187,'2020_03_02_174017_alter_velocity_tables_table',1),(188,'2020_03_23_201431_alter_booking_products_table',1),(189,'2020_04_13_224524_add_locale_in_sliders_table',1),(190,'2020_04_16_130351_remove_channel_from_tax_category',1),(191,'2020_04_16_185147_add_table_addresses',1),(192,'2020_05_06_171638_create_order_comments_table',1),(193,'2020_05_21_171500_create_product_customer_group_prices_table',1),(194,'2020_05_26_170958_add_cname_column_to_companies',1),(195,'2020_06_08_161708_add_sale_prices_to_booking_product_event_tickets',1),(196,'2020_06_10_201453_add_locale_velocity_meta_data',1),(197,'2020_06_25_162154_create_customer_social_accounts_table',1),(198,'2020_06_25_162340_change_email_password_columns_in_customers_table',1),(199,'2020_06_30_163510_remove_unique_name_in_tax_categories_table',1),(200,'2020_07_31_142021_update_cms_page_translations_table_field_html_content',1),(201,'2020_08_01_132239_add_header_content_count_velocity_meta_data_table',1),(202,'2020_08_12_114128_removing_foriegn_key',1),(203,'2020_08_17_104228_add_channel_to_velocity_meta_data_table',1),(204,'2020_09_04_155556_add_company_id_to_addresses_table',1),(205,'2020_09_07_120413_add_unique_index_to_increment_id_in_orders_table',1),(206,'2020_09_07_195157_add_additional_to_category',1),(207,'2020_03_26_155942_create_saas_subscription_plans_table',2),(208,'2020_03_26_162308_create_saas_subscription_recurring_profiles_table',2),(209,'2020_03_26_165026_create_saas_subscription_invoices_table',2),(210,'2020_03_26_165032_create_saas_subscription_purchased_plans_table',2),(211,'2020_03_26_165036_create_saas_subscription_billing_addresses_table',2),(212,'2019_02_20_131808_create_stripe_cards_table',3),(213,'2019_06_09_152250_create_stripe_companies_table',3),(214,'2019_06_11_174319_create_stripe_cart_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_brands`
--

DROP TABLE IF EXISTS `order_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `brand` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_brands_order_id_foreign` (`order_id`),
  KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  KEY `order_brands_product_id_foreign` (`product_id`),
  KEY `order_brands_brand_foreign` (`brand`),
  KEY `order_brands_company_id_foreign` (`company_id`),
  CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_brands`
--

LOCK TABLES `order_brands` WRITE;
/*!40000 ALTER TABLE `order_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int(11) DEFAULT '0',
  `qty_shipped` int(11) DEFAULT '0',
  `qty_invoiced` int(11) DEFAULT '0',
  `qty_canceled` int(11) DEFAULT '0',
  `qty_refunded` int(11) DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_company_id_foreign` (`company_id`),
  CONSTRAINT `order_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  KEY `order_payment_company_id_foreign` (`company_id`),
  CONSTRAINT `order_payment_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  KEY `orders_company_id_foreign` (`company_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_locale_attr_id_product_id_company_unique` (`channel`,`locale`,`attribute_id`,`product_id`,`company_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_values_company_id_foreign` (`company_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `cost` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `color_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `size_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `width` decimal(12,4) DEFAULT NULL,
  `height` decimal(12,4) DEFAULT NULL,
  `depth` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`,`company_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  KEY `product_flat_company_id_foreign` (`company_id`),
  CONSTRAINT `product_flat_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_grouped_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `associated_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_grouped_products_product_id_foreign` (`product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `product_inventories_company_id_foreign` (`company_id`),
  CONSTRAINT `product_inventories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_relations` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_relations_parent_id_foreign` (`parent_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  KEY `product_reviews_customer_id_foreign` (`customer_id`),
  KEY `product_reviews_company_id_foreign` (`company_id`),
  CONSTRAINT `product_reviews_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `product_super_attributes_product_id_foreign` (`product_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_company_id_unique` (`sku`,`company_id`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  KEY `products_company_id_foreign` (`company_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `refund_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_company_id_foreign` (`company_id`),
  CONSTRAINT `refund_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  KEY `refunds_company_id_foreign` (`company_id`),
  CONSTRAINT `refunds_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_company_id_foreign` (`company_id`),
  CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'Administrator','Administrator role','all',NULL,'2020-12-25 09:48:50','2020-12-25 09:48:50'),(2,2,'Administrator','Administrator role','all',NULL,'2020-12-28 10:55:56','2020-12-28 10:55:56'),(3,3,'Administrator','Administrator role','all',NULL,'2020-12-29 08:55:42','2020-12-29 08:55:42'),(4,4,'Administrator','Administrator role','all',NULL,'2020-12-30 14:46:40','2020-12-30 14:46:40'),(5,5,'Administrator','Administrator role','all',NULL,'2020-12-30 14:56:10','2020-12-30 14:56:10'),(6,6,'Administrator','Administrator role','all',NULL,'2020-12-30 14:58:23','2020-12-30 14:58:23'),(7,7,'Administrator','Administrator role','all',NULL,'2020-12-31 10:31:53','2020-12-31 10:31:53'),(8,8,'Administrator','Administrator role','all',NULL,'2021-01-05 14:37:55','2021-01-05 14:37:55'),(9,9,'Administrator','Administrator role','all',NULL,'2021-03-02 07:51:52','2021-03-02 07:51:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_subscription_billing_addresses`
--

DROP TABLE IF EXISTS `saas_subscription_billing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_subscription_billing_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` int(11) NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saas_subscription_recurring_profile_id` int(10) unsigned DEFAULT NULL,
  `saas_subscription_invoice_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saas_subscription_billing_addresses_recurring_profile_id_foreign` (`saas_subscription_recurring_profile_id`),
  KEY `saas_subscription_billing_addresses_invoice_id_foreign` (`saas_subscription_invoice_id`),
  KEY `saas_subscription_billing_addresses_company_id_foreign` (`company_id`),
  CONSTRAINT `saas_subscription_billing_addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_billing_addresses_invoice_id_foreign` FOREIGN KEY (`saas_subscription_invoice_id`) REFERENCES `saas_subscription_invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_billing_addresses_recurring_profile_id_foreign` FOREIGN KEY (`saas_subscription_recurring_profile_id`) REFERENCES `saas_subscription_recurring_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_subscription_billing_addresses`
--

LOCK TABLES `saas_subscription_billing_addresses` WRITE;
/*!40000 ALTER TABLE `saas_subscription_billing_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscription_billing_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_subscription_invoices`
--

DROP TABLE IF EXISTS `saas_subscription_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_subscription_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending_reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cycle_expired_on` date DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saas_subscription_recurring_profile_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `saas_subscription_purchased_plan_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saas_subscription_invoices_recurring_profile_id_foreign` (`saas_subscription_recurring_profile_id`),
  KEY `saas_subscription_invoices_company_id_foreign` (`company_id`),
  KEY `saas_subscription_invoices_purchased_plan_id_foreign` (`saas_subscription_purchased_plan_id`),
  CONSTRAINT `saas_subscription_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_invoices_purchased_plan_id_foreign` FOREIGN KEY (`saas_subscription_purchased_plan_id`) REFERENCES `saas_subscription_purchased_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_invoices_recurring_profile_id_foreign` FOREIGN KEY (`saas_subscription_recurring_profile_id`) REFERENCES `saas_subscription_recurring_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_subscription_invoices`
--

LOCK TABLES `saas_subscription_invoices` WRITE;
/*!40000 ALTER TABLE `saas_subscription_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscription_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_subscription_plans`
--

DROP TABLE IF EXISTS `saas_subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_subscription_plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `yearly_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `allowed_categories` int(11) NOT NULL DEFAULT '0',
  `allowed_attributes` int(11) NOT NULL DEFAULT '0',
  `allowed_attribute_families` int(11) NOT NULL DEFAULT '0',
  `allowed_channels` int(11) NOT NULL DEFAULT '0',
  `allowed_orders` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `saas_subscription_plans_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_subscription_plans`
--

LOCK TABLES `saas_subscription_plans` WRITE;
/*!40000 ALTER TABLE `saas_subscription_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_subscription_purchased_plans`
--

DROP TABLE IF EXISTS `saas_subscription_purchased_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_subscription_purchased_plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `yearly_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `allowed_categories` int(11) NOT NULL DEFAULT '0',
  `allowed_attributes` int(11) NOT NULL DEFAULT '0',
  `allowed_attribute_families` int(11) NOT NULL DEFAULT '0',
  `allowed_channels` int(11) NOT NULL DEFAULT '0',
  `allowed_orders` int(11) NOT NULL DEFAULT '0',
  `saas_subscription_recurring_profile_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saas_subscription_purchased_plans_recurring_profile_id_foreign` (`saas_subscription_recurring_profile_id`),
  KEY `saas_subscription_purchased_plans_company_id_foreign` (`company_id`),
  CONSTRAINT `saas_subscription_purchased_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_purchased_plans_recurring_profile_id_foreign` FOREIGN KEY (`saas_subscription_recurring_profile_id`) REFERENCES `saas_subscription_recurring_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_subscription_purchased_plans`
--

LOCK TABLES `saas_subscription_purchased_plans` WRITE;
/*!40000 ALTER TABLE `saas_subscription_purchased_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscription_purchased_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_subscription_recurring_profiles`
--

DROP TABLE IF EXISTS `saas_subscription_recurring_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saas_subscription_recurring_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cycle_expired_on` date DEFAULT NULL,
  `next_due_date` date DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `saas_subscription_invoice_id` int(10) unsigned DEFAULT NULL,
  `saas_subscription_purchased_plan_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saas_subscription_recurring_profiles_company_id_foreign` (`company_id`),
  KEY `saas_subscription_recurring_profiles_invoice_id_foreign` (`saas_subscription_invoice_id`),
  KEY `saas_subscription_recurring_profiles_purchased_plan_id_foreign` (`saas_subscription_purchased_plan_id`),
  CONSTRAINT `saas_subscription_recurring_profiles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_recurring_profiles_invoice_id_foreign` FOREIGN KEY (`saas_subscription_invoice_id`) REFERENCES `saas_subscription_invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `saas_subscription_recurring_profiles_purchased_plan_id_foreign` FOREIGN KEY (`saas_subscription_purchased_plan_id`) REFERENCES `saas_subscription_purchased_plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_subscription_recurring_profiles`
--

LOCK TABLES `saas_subscription_recurring_profiles` WRITE;
/*!40000 ALTER TABLE `saas_subscription_recurring_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscription_recurring_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `shipments_company_id_foreign` (`company_id`),
  KEY `shipments_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `shipments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_channel_id_foreign` (`channel_id`),
  KEY `sliders_company_id_foreign` (`company_id`),
  CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sliders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_cards`
--

DROP TABLE IF EXISTS `stripe_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stripe_cards_customer_id_foreign` (`customer_id`),
  CONSTRAINT `stripe_cards_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_cards`
--

LOCK TABLES `stripe_cards` WRITE;
/*!40000 ALTER TABLE `stripe_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_cart`
--

DROP TABLE IF EXISTS `stripe_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) unsigned NOT NULL,
  `stripe_token` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stripe_cart_cart_id_foreign` (`cart_id`),
  CONSTRAINT `stripe_cart_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_cart`
--

LOCK TABLES `stripe_cart` WRITE;
/*!40000 ALTER TABLE `stripe_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_companies`
--

DROP TABLE IF EXISTS `stripe_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_publishable_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stripe_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `stripe_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_companies`
--

LOCK TABLES `stripe_companies` WRITE;
/*!40000 ALTER TABLE `stripe_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  KEY `subscribers_list_company_id_foreign` (`company_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admin_password_resets`
--

DROP TABLE IF EXISTS `super_admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `super_admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admin_password_resets`
--

LOCK TABLES `super_admin_password_resets` WRITE;
/*!40000 ALTER TABLE `super_admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admins`
--

DROP TABLE IF EXISTS `super_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `misc` json DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `super_admins_id_unique` (`id`),
  UNIQUE KEY `super_admins_email_unique` (`email`),
  UNIQUE KEY `super_admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admins`
--

LOCK TABLES `super_admins` WRITE;
/*!40000 ALTER TABLE `super_admins` DISABLE KEYS */;
INSERT INTO `super_admins` VALUES (1,'admin@example.com','$2y$10$qGPNx94eCySzQ.H6Z/0oA.4oL5jdRr6jaOw4UvIJ1IoEJLh4d9fE6',1,NULL,'2020-12-23 13:02:29','2020-12-23 13:02:29',NULL,'admin','',NULL,0);
/*!40000 ALTER TABLE `super_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_channel`
--

DROP TABLE IF EXISTS `super_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_page_content` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `default_locale_id` int(10) unsigned DEFAULT NULL,
  `base_currency_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_channel_domain_unique` (`hostname`),
  UNIQUE KEY `super_channel_code_unique` (`code`),
  KEY `super_channel_default_locale_id_foreign` (`default_locale_id`),
  KEY `super_channel_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `super_channel_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `super_currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `super_channel_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `super_locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_channel`
--

LOCK TABLES `super_channel` WRITE;
/*!40000 ALTER TABLE `super_channel` DISABLE KEYS */;
INSERT INTO `super_channel` VALUES (1,'Default Channel','',NULL,NULL,'2020-12-23 13:02:29','2020-12-23 13:02:29','default',NULL,'<div class=\"banner-container\">\n                <div class=\"full-banner\"><img src=\"../../../vendor/webkul/saas/assets/images/banner-full.png\" />\n                <div class=\"banner-content\">\n                <h1>Turn Your Passion Into a Business</h1>\n                <p>Shake hand with the most reported company known for eCommerce and the marketplace. We reached around all the corners of the world. We serve the customer with our best service experiences.</p>\n                <a href=\"../../../company/register\" class=\"btn btn-black btn-lg\">Open Shop Now</a></div>\n                </div>\n                <div class=\"left-banner\"><img src=\"../../../vendor/webkul/saas/assets/images/banner-left.jpg\" /></div>\n                <div class=\"right-banner\"><img src=\"../../../vendor/webkul/saas/assets/images/banner-right-1.png\" /><img src=\"../../../vendor/webkul/saas/assets/images/banner-right-2.jpg\" /></div>\n                </div>','<div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span><ul class=\"list-group\"><li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li><li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li><li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li><li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li><li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li></ul></div>','{\"meta_title\": \"Super Meta Title\", \"meta_keywords\": \"Super Meta Keyword\", \"meta_description\": \"Super Meta Description\"}',1,1);
/*!40000 ALTER TABLE `super_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_channel_currencies`
--

DROP TABLE IF EXISTS `super_channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_channel_currencies` (
  `super_channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`super_channel_id`,`currency_id`),
  KEY `super_channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `super_channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `super_currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `super_channel_currencies_super_channel_id_foreign` FOREIGN KEY (`super_channel_id`) REFERENCES `super_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_channel_currencies`
--

LOCK TABLES `super_channel_currencies` WRITE;
/*!40000 ALTER TABLE `super_channel_currencies` DISABLE KEYS */;
INSERT INTO `super_channel_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `super_channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_channel_locales`
--

DROP TABLE IF EXISTS `super_channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_channel_locales` (
  `super_channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`super_channel_id`,`locale_id`),
  KEY `super_channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `super_channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `super_locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `super_channel_locales_super_channel_id_foreign` FOREIGN KEY (`super_channel_id`) REFERENCES `super_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_channel_locales`
--

LOCK TABLES `super_channel_locales` WRITE;
/*!40000 ALTER TABLE `super_channel_locales` DISABLE KEYS */;
INSERT INTO `super_channel_locales` VALUES (1,1);
/*!40000 ALTER TABLE `super_channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_config`
--

DROP TABLE IF EXISTS `super_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_config`
--

LOCK TABLES `super_config` WRITE;
/*!40000 ALTER TABLE `super_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_currencies`
--

DROP TABLE IF EXISTS `super_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_currencies_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_currencies`
--

LOCK TABLES `super_currencies` WRITE;
/*!40000 ALTER TABLE `super_currencies` DISABLE KEYS */;
INSERT INTO `super_currencies` VALUES (1,'USD','US Dollar','$','2020-12-23 13:02:29','2020-12-23 13:02:29');
/*!40000 ALTER TABLE `super_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_currency_exchange_rates`
--

DROP TABLE IF EXISTS `super_currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `super_currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `super_currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_currency_exchange_rates`
--

LOCK TABLES `super_currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `super_currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_locales`
--

DROP TABLE IF EXISTS `super_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_locales`
--

LOCK TABLES `super_locales` WRITE;
/*!40000 ALTER TABLE `super_locales` DISABLE KEYS */;
INSERT INTO `super_locales` VALUES (1,'en','English','ltr','2020-12-23 13:02:29','2020-12-23 13:02:29');
/*!40000 ALTER TABLE `super_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`,`company_id`),
  KEY `tax_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `tax_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`,`company_id`),
  KEY `tax_rates_company_id_foreign` (`company_id`),
  CONSTRAINT `tax_rates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents`
--

DROP TABLE IF EXISTS `velocity_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_company_id_foreign` (`company_id`),
  CONSTRAINT `velocity_contents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents`
--

LOCK TABLES `velocity_contents` WRITE;
/*!40000 ALTER TABLE `velocity_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents_translations`
--

DROP TABLE IF EXISTS `velocity_contents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_contents_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_translations_content_id_foreign` (`content_id`),
  KEY `velocity_contents_translations_company_id_foreign` (`company_id`),
  CONSTRAINT `velocity_contents_translations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents_translations`
--

LOCK TABLES `velocity_contents_translations` WRITE;
/*!40000 ALTER TABLE `velocity_contents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_customer_compare_products`
--

DROP TABLE IF EXISTS `velocity_customer_compare_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_customer_compare_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_flat_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_customer_compare_products_product_flat_id_foreign` (`product_flat_id`),
  KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `velocity_customer_compare_products_product_flat_id_foreign` FOREIGN KEY (`product_flat_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_customer_compare_products`
--

LOCK TABLES `velocity_customer_compare_products` WRITE;
/*!40000 ALTER TABLE `velocity_customer_compare_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_customer_compare_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_meta_data`
--

DROP TABLE IF EXISTS `velocity_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_meta_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int(11) NOT NULL DEFAULT '9',
  `featured_product_count` int(11) NOT NULL DEFAULT '10',
  `new_products_count` int(11) NOT NULL DEFAULT '10',
  `subscription_bar_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text COLLATE utf8mb4_unicode_ci,
  `locale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content_count` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_meta_data_company_id_foreign` (`company_id`),
  CONSTRAINT `velocity_meta_data_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_meta_data`
--

LOCK TABLES `velocity_meta_data` WRITE;
/*!40000 ALTER TABLE `velocity_meta_data` DISABLE KEYS */;
INSERT INTO `velocity_meta_data` VALUES (1,5,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\">About Us</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Customer Service</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">What&rsquo;s New</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\"> Order and Returns </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Payment Policy </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Shipping Policy</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>','2020-12-30 14:56:12','2020-12-30 14:56:12',NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>','en','johndoe',''),(2,6,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\">About Us</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Customer Service</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">What&rsquo;s New</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\"> Order and Returns </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Payment Policy </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Shipping Policy</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>','2020-12-30 14:58:24','2020-12-30 14:58:24',NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>','en','bilacac111',''),(3,7,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\">About Us</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Customer Service</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">What&rsquo;s New</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\"> Order and Returns </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Payment Policy </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Shipping Policy</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>','2020-12-31 10:31:55','2020-12-31 10:31:55',NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>','en','laobian93',''),(4,8,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\">About Us</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Customer Service</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">What&rsquo;s New</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\"> Order and Returns </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Payment Policy </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Shipping Policy</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>','2021-01-05 14:37:57','2021-01-05 14:37:57',NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>','en','sadafasdg',''),(5,9,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\">About Us</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Customer Service</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">What&rsquo;s New</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\"> Order and Returns </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Payment Policy </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Shipping Policy</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>','2021-03-02 07:51:53','2021-03-02 07:51:53',NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>','en','thaodo','');
/*!40000 ALTER TABLE `velocity_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  KEY `wishlist_company_id_foreign` (`company_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-02  7:42:13
