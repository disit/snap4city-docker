CREATE SCHEMA `heatmap` DEFAULT CHARACTER SET utf8;
GRANT ALL ON heatmap.* TO 'user'@'%';


-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 192.168.0.59    Database: heatmap
-- ------------------------------------------------------
-- Server version	5.7.24

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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `heatmap` /*!40100 DEFAULT CHARACTER SET utf8 */;

use heatmap;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metric_name` varchar(255) DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `rgb` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `order` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `completed_jobs`
--

DROP TABLE IF EXISTS `completed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `interpolated` int(1) DEFAULT '0',
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `processed_jobs_token_IDX` (`token`,`from_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_name` varchar(255) DEFAULT NULL,
  `metric_name` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `value` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `num` double DEFAULT NULL,
  `average` double DEFAULT NULL,
  `clustered` int(1) DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_UN` (`map_name`,`metric_name`,`latitude`,`longitude`,`clustered`,`date`),
  KEY `mapname_date` (`map_name`,`date`),
  KEY `mix` (`metric_name`,`latitude`,`longitude`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_name` varchar(255) DEFAULT NULL,
  `metric_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `minLat` double DEFAULT NULL,
  `maxLat` double DEFAULT NULL,
  `minLon` double DEFAULT NULL,
  `maxLon` double DEFAULT NULL,
  `color_map` varchar(255) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `write` int(1) DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  `completed` int(1) DEFAULT '0',
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_map_name_IDX` (`map_name`,`metric_name`,`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maps_completed`
--

DROP TABLE IF EXISTS `maps_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maps_completed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_name` varchar(255) DEFAULT NULL,
  `metric_name` varchar(255) DEFAULT NULL,
  `completed` int(1) DEFAULT '0',
  `indexed` int(1) DEFAULT '0',
  `attempts` varchar(100) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_UN` (`map_name`,`metric_name`,`date`),
  KEY `maps_completed_completed_IDX` (`completed`,`indexed`) USING BTREE,
  KEY `maps_completed_last_updated_IDX` (`last_updated`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_name` varchar(255) DEFAULT NULL,
  `metric_name` varchar(255) DEFAULT NULL,
  `clustered` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `days` int(11) DEFAULT '0',
  `service_uris` varchar(255) DEFAULT NULL,
  `x_length` double DEFAULT '0',
  `y_length` double DEFAULT '0',
  `deleted` int(1) DEFAULT '0',
  `projection` int(11) DEFAULT '4326',
  `file` int(1) DEFAULT '0',
  `binary` int(1) DEFAULT '0',
  `insertOnDB` int(1) DEFAULT '0',
  `fileType` varchar(100) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `insertDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `nature` varchar(250) DEFAULT NULL,
  `subnature` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `metadata_UN` (`map_name`,`metric_name`,`clustered`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `map_name` varchar(255) NOT NULL,
  `metric_name` varchar(255) NOT NULL,
  `num` bigint(20) DEFAULT NULL,
  `min_date` timestamp NULL DEFAULT NULL,
  `max_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`map_name`,`metric_name`)
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

-- Dump completed on 2021-11-11 12:43:48
