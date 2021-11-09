CREATE SCHEMA `profiledb` DEFAULT CHARACTER SET utf8;
GRANT ALL ON profiledb.* TO 'user'@'%';
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: profiledb
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
-- Current Database: `profiledb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `profiledb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `profiledb`;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `delegated_app_id` varchar(255) DEFAULT NULL,
  `delegated_username` varchar(45) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `delegated_app_name` varchar(255) DEFAULT NULL,
  `source_request` varchar(255) DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `motivation` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_violation`
--

DROP TABLE IF EXISTS `activity_violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_violation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `source_request` varchar(255) DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `motivation` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL,
  `query` varchar(4096) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `stacktrace` blob DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_idx` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `data_time` datetime DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `elapse_time` datetime DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `motivation` varchar(255) DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `variable_value` text CHARACTER SET utf8 DEFAULT NULL,
  `variable_unit` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `un_ai_mo_vn_index` (`username`,`app_id`,`motivation`,`variable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delegation`
--

DROP TABLE IF EXISTS `delegation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username_delegator` varchar(45) DEFAULT NULL,
  `username_delegated` varchar(45) DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `motivation` varchar(255) DEFAULT NULL,
  `element_id` varchar(255) DEFAULT NULL,
  `element_type` varchar(20) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `delegation_details` text DEFAULT NULL,
  `groupname_delegated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devicegroup`
--

DROP TABLE IF EXISTS `devicegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicegroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ownership` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `high_level_type` varchar(128) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devicegroupelement`
--

DROP TABLE IF EXISTS `devicegroupelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicegroupelement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_group_id` bigint(20) NOT NULL,
  `elementId` varchar(255) NOT NULL,
  `elementType` varchar(64) NOT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kpiactivity`
--

DROP TABLE IF EXISTS `kpiactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpiactivity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `kpi_id` bigint(20) DEFAULT NULL,
  `source_request` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `elapse_time` datetime DEFAULT NULL,
  `source_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kpiactivity_violation`
--

DROP TABLE IF EXISTS `kpiactivity_violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpiactivity_violation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `kpi_id` bigint(20) DEFAULT NULL,
  `source_request` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `elapse_time` datetime DEFAULT NULL,
  `query` varchar(4096) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `stacktrace` blob DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kpidata`
--

DROP TABLE IF EXISTS `kpidata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpidata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `high_level_type` varchar(128) DEFAULT NULL,
  `nature` varchar(128) DEFAULT NULL,
  `sub_nature` varchar(128) DEFAULT NULL,
  `value_name` varchar(128) DEFAULT NULL,
  `value_type` varchar(128) DEFAULT NULL,
  `data_type` varchar(128) DEFAULT NULL,
  `instance_uri` varchar(256) DEFAULT NULL,
  `get_instances` varchar(128) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `last_value` text DEFAULT NULL,
  `last_check` datetime DEFAULT NULL,
  `last_latitude` varchar(45) DEFAULT NULL,
  `last_longitude` varchar(45) DEFAULT NULL,
  `metric` varchar(128) DEFAULT NULL,
  `saved_direct` varchar(128) DEFAULT NULL,
  `kb_based` varchar(128) DEFAULT NULL,
  `sm_based` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `widgets` varchar(128) DEFAULT NULL,
  `parameters` varchar(512) DEFAULT NULL,
  `healthiness` varchar(128) DEFAULT 'false',
  `microAppExtServIcon` varchar(100) DEFAULT NULL,
  `ownership` varchar(64) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `info` varchar(250) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `db_values_type` varchar(128) DEFAULT NULL,
  `db_values_link` varchar(255) DEFAULT NULL,
  `value_unit` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kpimetadata`
--

DROP TABLE IF EXISTS `kpimetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpimetadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kpi_id` bigint(20) DEFAULT NULL,
  `value_key` varchar(128) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  `elapse_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kpivalues`
--

DROP TABLE IF EXISTS `kpivalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpivalues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kpi_id` bigint(20) DEFAULT NULL,
  `insert_time` timestamp NULL DEFAULT NULL,
  `value` varchar(256) DEFAULT NULL,
  `data_time` timestamp NULL DEFAULT NULL,
  `elapse_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kpi_id` (`kpi_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lightactivity`
--

DROP TABLE IF EXISTS `lightactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lightactivity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element_id` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) DEFAULT NULL,
  `source_request` varchar(255) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `source_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `limits`
--

DROP TABLE IF EXISTS `limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limits` (
  `organization` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL,
  `elementType` varchar(45) NOT NULL,
  `maxCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`organization`,`username`,`role`,`elementType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownership`
--

DROP TABLE IF EXISTS `ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ownership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `elementId` varchar(255) DEFAULT NULL,
  `elementType` varchar(20) DEFAULT NULL,
  `elementName` varchar(255) DEFAULT NULL,
  `elementUrl` varchar(255) DEFAULT NULL,
  `elementDetails` text DEFAULT NULL,
  `publickeySHA1` varchar(40) DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  `deleted` timestamp NULL DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_type_name` (`username`,`elementType`,`elementName`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 17:28:19
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: profiledb
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-1:10.3.31+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
INSERT INTO `limits` VALUES ('any','any','any','AppID',0),('any','any','any','BrokerID',1),('any','any','any','DashboardID',10),('any','any','any','IOTID',5),('any','any','any','ModelID',1),('any','any','any','SynopticID',10),('any','any','any','SynopticTmplID',0),('any','any','AreaManager','AppID',3),('any','any','AreaManager','DAAppID',3),('any','any','AreaManager','DataTableID',30),('any','any','AreaManager','PoiTableID',30),('any','any','AreaManager','PortiaID',1),('any','any','AreaManager','SynopticID',10),('any','any','AreaManager','SynopticTmplID',10),('any','any','Manager','DataTableID',2),('any','any','Manager','PoiTableID',2),('any','any','Manager','SynopticID',5),('any','any','Manager','SynopticTmplID',5),('any','any','RootAdmin','BrokerID',999),('any','any','RootAdmin','DAAppID',10),('any','any','RootAdmin','DashboardID',100),('any','any','RootAdmin','DataTableID',100),('any','any','RootAdmin','IOTID',999),('any','any','RootAdmin','ModelID',999),('any','any','RootAdmin','PoiTableID',100),('any','any','RootAdmin','PortiaID',1),('any','any','RootAdmin','SynopticID',999),('any','any','RootAdmin','SynopticTmplID',999),('any','any','ToolAdmin','AppID',10),('any','any','ToolAdmin','BrokerID',20),('any','any','ToolAdmin','DAAppID',3),('any','any','ToolAdmin','DashboardID',50),('any','any','ToolAdmin','DataTableID',50),('any','any','ToolAdmin','IOTID',20),('any','any','ToolAdmin','ModelID',20),('any','any','ToolAdmin','PoiTableID',50),('any','any','ToolAdmin','PortiaID',1),('any','any','ToolAdmin','SynopticID',50),('any','any','ToolAdmin','SynopticTmplID',50);
/*!40000 ALTER TABLE `limits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 17:28:19
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: profiledb
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-1:10.3.31+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `ownership`
--
-- WHERE:  elementtype='APPID'

LOCK TABLES `ownership` WRITE;
/*!40000 ALTER TABLE `ownership` DISABLE KEYS */;
INSERT INTO `ownership` VALUES (16464,'userareamanager','nr1','AppID','nodered','http://dashboard/iotapp/nr1/','{\"edgegateway_type\":\"linux_Linux_4.9.0-8-amd64\"}',NULL,'2019-02-19 09:15:00',NULL,NULL),(16477,'userareamanager','nr2','AppID','nodered 2','http://dashboard/iotapp/nr2/','{\"edgegateway_type\":\"linux_Linux_4.9.0-8-amd64\"}',NULL,'2019-02-19 09:15:00',NULL,NULL);
/*!40000 ALTER TABLE `ownership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 17:28:19
