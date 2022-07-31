CREATE SCHEMA `datatable` DEFAULT CHARACTER SET utf8;
GRANT ALL ON datatable.* TO 'user'@'%';
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: datatable
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-1:10.3.31+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `datatable`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `datatable` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `datatable`;

--
-- Table structure for table `poi_data`
--

DROP TABLE IF EXISTS `poi_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poi_data` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `name` longtext DEFAULT NULL,
  `abbreviation` longtext DEFAULT NULL,
  `descriptionShort` longtext DEFAULT NULL,
  `descriptionLong` longtext DEFAULT NULL,
  `phone` longtext DEFAULT NULL,
  `fax` longtext DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `refPerson` longtext DEFAULT NULL,
  `secondPhone` longtext DEFAULT NULL,
  `secondFax` longtext DEFAULT NULL,
  `secondEmail` longtext DEFAULT NULL,
  `secondCivicNumber` longtext DEFAULT NULL,
  `secondStreetAddress` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `timetable` longtext DEFAULT NULL,
  `photo` longtext DEFAULT NULL,
  `other1` longtext DEFAULT NULL,
  `other2` longtext DEFAULT NULL,
  `other3` longtext DEFAULT NULL,
  `postalcode` longtext DEFAULT NULL,
  `province` longtext DEFAULT NULL,
  `city` longtext DEFAULT NULL,
  `streetAddress` longtext DEFAULT NULL,
  `civicNumber` longtext DEFAULT NULL,
  `latitude` longtext DEFAULT NULL,
  `longitude` longtext DEFAULT NULL,
  `center_lat` longtext DEFAULT NULL,
  `center_lon` longtext DEFAULT NULL,
  `radius` longtext DEFAULT NULL,
  `coord_type` longtext DEFAULT NULL,
  `nature` longtext DEFAULT NULL,
  `sub_nature` longtext DEFAULT NULL,
  `element_id` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `suri` longtext DEFAULT NULL,
  `file_name` longtext DEFAULT NULL,
  `sheet_name` longtext DEFAULT NULL,
  `upload_date_time` longtext DEFAULT NULL,
  `language` longtext DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `calculated_lat` longtext DEFAULT NULL,
  `calculated_lon` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sheet_data`
--

DROP TABLE IF EXISTS `sheet_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheet_data` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `value_name_type` longtext NOT NULL,
  `value_name` longtext NOT NULL,
  `data_type` longtext DEFAULT NULL,
  `value_type` longtext NOT NULL,
  `value_unit` longtext NOT NULL,
  `value_type_name` longtext NOT NULL,
  `sheet_name_type` longtext NOT NULL,
  `sheet_name` longtext NOT NULL,
  `value` longtext NOT NULL,
  `element_id` longtext NOT NULL,
  `processed` varchar(45) DEFAULT NULL,
  `file_name` longtext NOT NULL,
  `upload_date_time` longtext NOT NULL,
  `dateObserved_type` varchar(45) DEFAULT NULL,
  `dateObserved_column` longtext DEFAULT NULL,
  `dateObserved` longtext DEFAULT NULL,
  `lat` longtext DEFAULT NULL,
  `lon` longtext DEFAULT NULL,
  `nature` longtext DEFAULT NULL,
  `sub_nature` longtext DEFAULT NULL,
  `coord_type` varchar(45) DEFAULT NULL,
  `context_broker` longtext DEFAULT NULL,
  `lat_row_file` longtext DEFAULT NULL,
  `lon_row_file` longtext DEFAULT NULL,
  `lat_row_col` longtext DEFAULT NULL,
  `lon_row_col` longtext DEFAULT NULL,
  `organization` longtext DEFAULT NULL,
  `address_warning` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-31 19:14:29
