CREATE SCHEMA `iotdb` DEFAULT CHARACTER SET utf8;
GRANT ALL ON iotdb.* TO 'user'@'%';
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: iotdb
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
-- Current Database: `iotdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `iotdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `iotdb`;

--
-- Table structure for table `EXT_values_rules`
--

DROP TABLE IF EXISTS `EXT_values_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXT_values_rules` (
  `Name` varchar(45) NOT NULL,
  `If_statement` text DEFAULT NULL,
  `Then_statement` text DEFAULT NULL,
  `Organization` varchar(45) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `mode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Rules to ingestion of external broker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_log`
--

DROP TABLE IF EXISTS `access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accessed_by` varchar(100) NOT NULL,
  `target_entity_type` varchar(50) NOT NULL,
  `access_type` varchar(50) NOT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `result` set('success','faliure','') DEFAULT NULL,
  `organization` varchar(50) DEFAULT 'DISIT',
  PRIMARY KEY (`id`,`time`,`accessed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `association_rules`
--

DROP TABLE IF EXISTS `association_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `association_rules` (
  `input_data_type` varchar(30) DEFAULT NULL,
  `input_value_type` varchar(120) DEFAULT NULL,
  `input_context_broker` varchar(20) DEFAULT NULL,
  `input_device_type` varchar(80) DEFAULT NULL,
  `input_model` varchar(40) DEFAULT NULL,
  `input_protocol` varchar(20) DEFAULT NULL,
  `input_format` varchar(20) DEFAULT NULL,
  `input_value_unit` varchar(20) DEFAULT NULL,
  `output_data_type` varchar(30) DEFAULT NULL,
  `output_value_type` varchar(120) DEFAULT NULL,
  `output_value_unit` varchar(20) DEFAULT NULL,
  `output_context_broker` varchar(20) DEFAULT NULL,
  `output_device_type` varchar(80) DEFAULT NULL,
  `output_model` varchar(40) DEFAULT NULL,
  `output_protocol` varchar(20) DEFAULT NULL,
  `output_format` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `support` int(11) NOT NULL,
  `confidence` int(11) NOT NULL,
  `lift` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkload_status`
--

DROP TABLE IF EXISTS `bulkload_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulkload_status` (
  `username` varchar(100) NOT NULL,
  `is_bulk_processing` tinyint(1) NOT NULL,
  `number_processed` int(11) NOT NULL,
  `totale` int(11) NOT NULL,
  `is_finished` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contextbroker`
--

DROP TABLE IF EXISTS `contextbroker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contextbroker` (
  `name` varchar(40) NOT NULL,
  `protocol` varchar(20) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `port` varchar(5) NOT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `accesslink` varchar(100) NOT NULL,
  `accessport` varchar(5) NOT NULL,
  `sha` varchar(100) DEFAULT NULL,
  `organization` varchar(50) DEFAULT 'DISIT',
  `apikey` varchar(40) DEFAULT NULL,
  `visibility` set('public','private','') NOT NULL DEFAULT 'private',
  `version` varchar(50) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `kind` set('external','internal') DEFAULT NULL,
  `subscription_id` varchar(255) DEFAULT NULL,
  `urlnificallback` varchar(100) DEFAULT NULL,
  `req_frequency` int(11) DEFAULT NULL,
  `timestampstatus` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`name`),
  KEY `protocol` (`protocol`),
  CONSTRAINT `contextbroker_ibfk_1` FOREIGN KEY (`protocol`) REFERENCES `protocols` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `data_type` varchar(30) NOT NULL,
  PRIMARY KEY (`data_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `defaultcontestbrokerpolicy`
--

DROP TABLE IF EXISTS `defaultcontestbrokerpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultcontestbrokerpolicy` (
  `policyname` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `contextbroker` varchar(40) NOT NULL,
  `protocol` varchar(20) NOT NULL,
  `format` varchar(20) NOT NULL,
  PRIMARY KEY (`policyname`),
  KEY `contextbroker` (`contextbroker`),
  KEY `protocol` (`protocol`),
  KEY `format` (`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `defaultpolicy`
--

DROP TABLE IF EXISTS `defaultpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultpolicy` (
  `policyname` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `contextbroker` varchar(40) NOT NULL,
  `protocol` varchar(20) NOT NULL,
  `format` varchar(20) NOT NULL,
  `healthiness_criteria` set('refresh_rate','different_values','within_bounds','') NOT NULL DEFAULT 'refresh_rate',
  `healthiness_value` varchar(20) NOT NULL DEFAULT '300',
  PRIMARY KEY (`policyname`),
  KEY `contextbroker` (`contextbroker`),
  KEY `protocol` (`protocol`),
  KEY `format` (`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deleted_devices`
--

DROP TABLE IF EXISTS `deleted_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_devices` (
  `contextBroker` varchar(40) NOT NULL,
  `id` varchar(255) NOT NULL,
  `uri` text DEFAULT NULL,
  `devicetype` varchar(80) NOT NULL,
  `kind` set('sensor','actuator') DEFAULT NULL,
  `mandatoryproperties` tinyint(1) NOT NULL,
  `mandatoryvalues` tinyint(1) NOT NULL,
  `macaddress` varchar(20) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `producer` varchar(125) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL,
  `format` varchar(20) NOT NULL,
  `visibility` set('public','private') DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` date DEFAULT NULL,
  `privatekey` varchar(50) DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL,
  `organization` varchar(50) DEFAULT 'DISIT',
  `subnature` varchar(50) DEFAULT NULL,
  `static_attributes` text DEFAULT NULL,
  `service` varchar(25) DEFAULT NULL,
  `servicePath` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`,`contextBroker`),
  KEY `contextBroker` (`contextBroker`),
  KEY `protocol` (`protocol`),
  KEY `format` (`format`),
  CONSTRAINT `deleted_devices_ibfk_1` FOREIGN KEY (`contextBroker`) REFERENCES `contextbroker` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deleted_devices_ibfk_2` FOREIGN KEY (`protocol`) REFERENCES `protocols` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deleted_devices_ibfk_3` FOREIGN KEY (`format`) REFERENCES `formats` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deleted_event_values`
--

DROP TABLE IF EXISTS `deleted_event_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_event_values` (
  `cb` varchar(40) NOT NULL,
  `device` varchar(255) NOT NULL,
  `value_name` varchar(120) NOT NULL,
  `data_type` varchar(30) NOT NULL,
  `value_type` varchar(120) DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `value_unit` varchar(30) DEFAULT NULL,
  `healthiness_criteria` set('refresh_rate','different_values','within_bounds','') DEFAULT NULL,
  `value_refresh_rate` int(11) DEFAULT NULL,
  `different_values` int(11) DEFAULT NULL,
  `value_bounds` varchar(10) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`cb`,`device`,`value_name`),
  KEY `data_type` (`data_type`),
  CONSTRAINT `deleted_event_values_ibfk_1` FOREIGN KEY (`data_type`) REFERENCES `data_types` (`data_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deleted_event_values_ibfk_3` FOREIGN KEY (`cb`, `device`) REFERENCES `deleted_devices` (`contextBroker`, `id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `contextBroker` varchar(40) NOT NULL,
  `id` varchar(255) NOT NULL,
  `uri` text DEFAULT NULL,
  `devicetype` varchar(80) NOT NULL,
  `kind` set('sensor','actuator') NOT NULL DEFAULT 'sensor',
  `mandatoryproperties` tinyint(1) NOT NULL DEFAULT 0,
  `mandatoryvalues` tinyint(1) NOT NULL DEFAULT 0,
  `macaddress` varchar(20) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `producer` varchar(125) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL,
  `format` varchar(20) NOT NULL,
  `visibility` set('public','private') NOT NULL DEFAULT 'public',
  `frequency` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` date DEFAULT NULL,
  `privatekey` varchar(100) DEFAULT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `organization` varchar(50) DEFAULT 'DISIT',
  `subnature` varchar(50) DEFAULT NULL,
  `static_attributes` text DEFAULT NULL,
  `service` varchar(25) DEFAULT NULL,
  `servicePath` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`,`contextBroker`),
  KEY `contextBroker` (`contextBroker`),
  KEY `protocol` (`protocol`),
  KEY `format` (`format`),
  CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`contextBroker`) REFERENCES `contextbroker` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `devices_ibfk_2` FOREIGN KEY (`protocol`) REFERENCES `protocols` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `devices_ibfk_3` FOREIGN KEY (`format`) REFERENCES `formats` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edgegatewaytype`
--

DROP TABLE IF EXISTS `edgegatewaytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgegatewaytype` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_values`
--

DROP TABLE IF EXISTS `event_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_values` (
  `cb` varchar(40) NOT NULL,
  `device` varchar(255) NOT NULL,
  `value_name` varchar(120) NOT NULL,
  `data_type` varchar(30) NOT NULL,
  `value_type` varchar(120) DEFAULT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT 0,
  `value_unit` varchar(30) DEFAULT NULL,
  `healthiness_criteria` set('refresh_rate','different_values','within_bounds','') DEFAULT NULL,
  `value_refresh_rate` int(11) DEFAULT 0,
  `different_values` int(11) DEFAULT NULL,
  `value_bounds` varchar(10) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `old_value_name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`cb`,`device`,`value_name`),
  KEY `data_type` (`data_type`),
  CONSTRAINT `event_values_ibfk_1` FOREIGN KEY (`data_type`) REFERENCES `data_types` (`data_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_values_ibfk_3` FOREIGN KEY (`cb`, `device`) REFERENCES `devices` (`contextBroker`, `id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extractionRules`
--

DROP TABLE IF EXISTS `extractionRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extractionRules` (
  `id` varchar(40) NOT NULL,
  `contextbroker` varchar(40) NOT NULL,
  `format` set('csv','json','xml','') NOT NULL DEFAULT 'json',
  `selector` text NOT NULL,
  `kind` set('value','property') DEFAULT NULL,
  `value_type` varchar(120) DEFAULT NULL,
  `value_unit` varchar(30) DEFAULT NULL,
  `data_type` varchar(30) DEFAULT NULL,
  `structure_flag` set('yes','no') DEFAULT 'no',
  `organization` varchar(30) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `service` varchar(25) DEFAULT NULL,
  `servicePath` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`,`contextbroker`),
  KEY `contextbroker_erfk_1` (`contextbroker`),
  CONSTRAINT `contextbroker_erfk_1` FOREIGN KEY (`contextbroker`) REFERENCES `contextbroker` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldType`
--

DROP TABLE IF EXISTS `fieldType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldType` (
  `fieldName` varchar(80) NOT NULL,
  `menuType` varchar(40) DEFAULT NULL,
  `query` text DEFAULT NULL,
  `fieldsHtml` text DEFAULT NULL,
  `autocomplete` text DEFAULT NULL,
  PRIMARY KEY (`fieldName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formats` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `functionalities`
--

DROP TABLE IF EXISTS `functionalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functionalities` (
  `id` int(11) NOT NULL,
  `functionality` varchar(200) DEFAULT '0',
  `ToolAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `AreaManager` tinyint(1) NOT NULL DEFAULT 0,
  `Manager` tinyint(1) NOT NULL DEFAULT 0,
  `Public` tinyint(1) NOT NULL DEFAULT 0,
  `link` varchar(200) DEFAULT NULL,
  `view` varchar(40) DEFAULT NULL,
  `class` varchar(200) DEFAULT NULL,
  `RootAdmin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mainmenu`
--

DROP TABLE IF EXISTS `mainmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkUrl` varchar(200) NOT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `pageTitle` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(125) DEFAULT NULL,
  `devicetype` varchar(80) NOT NULL,
  `kind` set('sensor','actuator','') DEFAULT NULL,
  `producer` varchar(125) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `policy` varchar(20) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `contextbroker` varchar(40) NOT NULL,
  `protocol` varchar(20) NOT NULL,
  `format` varchar(20) NOT NULL,
  `healthiness_criteria` set('refresh_rate','different_values','within_bounds','') NOT NULL DEFAULT 'refresh_rate',
  `healthiness_value` varchar(20) NOT NULL DEFAULT '300',
  `k1` varchar(50) DEFAULT NULL,
  `k2` varchar(50) DEFAULT NULL,
  `kgenerator` set('normal','special','authenticated','') DEFAULT NULL,
  `edgegateway_type` varchar(20) DEFAULT NULL,
  `organization` varchar(50) DEFAULT 'DISIT',
  `visibility` set('public','private') DEFAULT 'public',
  `subnature` varchar(50) DEFAULT NULL,
  `static_attributes` text DEFAULT NULL,
  `service` varchar(25) DEFAULT NULL,
  `servicePath` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `policy` (`policy`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`policy`) REFERENCES `defaultpolicy` (`policyname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orionbrokers`
--

DROP TABLE IF EXISTS `orionbrokers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orionbrokers` (
  `id_orionbroker` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `external_port` varchar(45) DEFAULT NULL,
  `access_port` varchar(45) DEFAULT NULL,
  `multitenacy` varchar(45) DEFAULT NULL,
  `urlnificallback` varchar(255) DEFAULT NULL,
  `orion_image` varchar(45) DEFAULT NULL,
  `enable_direct_access` tinyint(4) DEFAULT 0,
  `status` varchar(45) DEFAULT NULL,
  `status_timestamp` datetime DEFAULT NULL,
  `status_history` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_orionbroker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protocols`
--

DROP TABLE IF EXISTS `protocols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocols` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `broker_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `broker_name_ibfk_1` (`broker_name`),
  CONSTRAINT `broker_name_ibfk_1` FOREIGN KEY (`broker_name`) REFERENCES `contextbroker` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temporary_devices`
--

DROP TABLE IF EXISTS `temporary_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_devices` (
  `username` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `contextBroker` varchar(40) NOT NULL,
  `id` varchar(255) NOT NULL,
  `uri` text DEFAULT NULL,
  `devicetype` varchar(80) DEFAULT NULL,
  `kind` set('sensor','actuator','') DEFAULT NULL,
  `status` set('valid','invalid') DEFAULT 'invalid',
  `macaddress` varchar(20) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) DEFAULT NULL,
  `format` varchar(20) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `visibility` set('public','private','') NOT NULL DEFAULT 'private',
  `deleted` date DEFAULT NULL,
  `k1` varchar(40) DEFAULT NULL,
  `k2` varchar(40) DEFAULT NULL,
  `producer` varchar(125) DEFAULT NULL,
  `validity_msg` text DEFAULT NULL,
  `edge_gateway_type` varchar(30) DEFAULT NULL,
  `edge_gateway_uri` text DEFAULT NULL,
  `toDelete` varchar(10) DEFAULT NULL,
  `should_be_registered` set('yes','no') NOT NULL DEFAULT 'yes',
  `organization` varchar(50) DEFAULT 'DISIT',
  `subnature` varchar(50) DEFAULT NULL,
  `static_attributes` text DEFAULT NULL,
  `service` varchar(25) DEFAULT NULL,
  `servicePath` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`,`contextBroker`),
  KEY `contextBroker` (`contextBroker`),
  KEY `protocol` (`protocol`),
  KEY `format` (`format`),
  KEY `id` (`id`),
  CONSTRAINT `temporary_devices_ibfk_1` FOREIGN KEY (`contextBroker`) REFERENCES `contextbroker` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temporary_event_values`
--

DROP TABLE IF EXISTS `temporary_event_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_event_values` (
  `cb` varchar(40) NOT NULL,
  `device` varchar(255) NOT NULL,
  `value_name` varchar(120) NOT NULL,
  `old_value_name` varchar(120) NOT NULL,
  `data_type` varchar(30) DEFAULT NULL,
  `value_type` varchar(120) DEFAULT NULL,
  `editable` varchar(5) DEFAULT NULL,
  `value_unit` varchar(30) DEFAULT NULL,
  `healthiness_criteria` set('refresh_rate','different_values','within_bounds','') DEFAULT NULL,
  `value_refresh_rate` int(11) DEFAULT NULL,
  `different_values` int(11) DEFAULT NULL,
  `value_bounds` varchar(10) DEFAULT NULL,
  `toDelete` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cb`,`device`,`value_name`),
  KEY `data_type` (`data_type`),
  KEY `value_type` (`value_type`),
  KEY `temporary_event_values_ibfk_1` (`device`,`cb`),
  CONSTRAINT `temporary_event_values_ibfk_1` FOREIGN KEY (`device`, `cb`) REFERENCES `temporary_devices` (`id`, `contextBroker`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temporary_event_values_for_registered_devices`
--

DROP TABLE IF EXISTS `temporary_event_values_for_registered_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_event_values_for_registered_devices` (
  `cb` varchar(40) NOT NULL,
  `device` varchar(255) NOT NULL,
  `value_name` varchar(120) NOT NULL,
  `old_value_name` varchar(120) NOT NULL,
  `data_type` varchar(30) DEFAULT NULL,
  `value_type` varchar(120) DEFAULT NULL,
  `editable` varchar(5) DEFAULT NULL,
  `value_unit` varchar(30) DEFAULT NULL,
  `healthiness_criteria` set('refresh_rate','different_values','within_bounds','') DEFAULT NULL,
  `value_refresh_rate` int(11) DEFAULT NULL,
  `different_values` int(11) DEFAULT NULL,
  `value_bounds` varchar(10) DEFAULT NULL,
  `toDelete` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cb`,`device`,`value_name`),
  KEY `data_type` (`data_type`),
  KEY `value_type` (`value_type`),
  KEY `temporary_event_values_for_registered_devices_ibfk_1` (`device`,`cb`),
  CONSTRAINT `temporary_event_values_for_registered_devices_ibfk_1` FOREIGN KEY (`device`, `cb`) REFERENCES `devices` (`id`, `contextBroker`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `surname` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `organization` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `reg_data` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `admin` varchar(32) NOT NULL DEFAULT 'Manager',
  `activationHash` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`IdUser`)
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

-- Dump completed on 2022-04-27 14:22:55
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: iotdb
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
-- Dumping data for table `functionalities`
--

LOCK TABLES `functionalities` WRITE;
/*!40000 ALTER TABLE `functionalities` DISABLE KEYS */;
INSERT INTO `functionalities` VALUES (1,'View Sensors and Actuators',1,1,1,0,'value.php','view','#mainContentCnt',1),(2,'Search Sensors and Actuators on the Map',1,1,1,0,'value.php','popup','#addMap1SA',1),(3,'New Sensor/Actuator',1,1,0,0,'value.php','popup','#addValueBtn',1),(4,'Modify Sensor/Actuator',1,1,0,0,'value.php','popup','.editDashBtn',1),(5,'Delete Sensor/Actuator',1,1,0,0,'value.php','popup','.delDashBtn',1),(6,'View Sensor/Actuator on Map',1,1,0,0,'value.php','popup','.addMapBtn',1),(7,'View Devices',1,1,1,0,'devices.php','view','#mainContentCnt',1),(8,'Search Devices on the Map',1,1,1,0,'devices.php','popup','#displayDevicesMap',1),(9,'New Device',1,1,0,0,'devices.php','popup','#addDeviceBtn',1),(10,'Modify Device',1,1,0,0,'devices.php','popup','.editDashBtn',1),(11,'Delete Device',1,1,0,0,'devices.php','popup','.delDashBtn',1),(12,'View Device on Map',1,1,1,0,'devices.php','popup','.addMapBtn',1),(13,'View Context Brokers',1,0,0,0,'contextbroker.php','view','.mainContentCnt',1),(14,'Search Context Brokers On the Map',1,0,0,0,'contextbroker.php','popup','#displayDevicesMapCB',1),(15,'New Context Broker',1,0,0,0,'contextbroker.php','popup','#addContextBrokerBtn',1),(16,'Modify Context Broker',1,0,0,0,'contextbroker.php','popup','.editDashBtn',1),(17,'Delete Context Broker',1,0,0,0,'contextbroker.php','popup','.delDashBtn',1),(18,'View Device Manager Board',0,0,1,0,'devices.php','view','#managerBoard',0),(19,'Stub for gathering devices',1,0,0,0,'contextbroker.php','popup','.viewDashBtn',1),(20,'View Syntesis',1,0,0,0,'devices.php','view','#synthesis',0),(21,'View Syntesis',1,0,0,0,'value.php','view','#synthesis',0),(22,'View Syntesis',1,0,0,0,'contextbroker.php','view','#synthesis',0),(23,'View Devices',1,1,1,0,'mydevices.php','view','#mainContentCnt',1),(24,'Search Devices on the Map',0,0,1,0,'mydevices.php','popup','#displayDevicesMap',0),(25,'New Device',0,0,0,0,'mydevices.php','popup','#addDeviceBtn',0),(26,'Modify Device',1,1,0,0,'mydevices.php','popup','.editDashBtn',1),(27,'Delete Device',1,1,1,0,'mydevices.php','popup','.delDashBtn',1),(28,'View Device on Map',1,1,1,0,'mydevices.php','popup','.addMapBtn',1),(29,'View Device Manager Board',1,1,1,0,'mydevices.php','view','#managerBoard',1),(30,'View Syntesis',0,0,0,0,'mydevices.php','view','#synthesis',0),(31,'View Devices',1,0,0,0,'alldevices.php','view','#mainContentCnt',1),(32,'Search Devices on the Map',1,0,0,0,'alldevices.php','popup','#displayDevicesMap',1),(33,'New Device',1,0,0,0,'alldevices.php','popup','#addDeviceBtn',1),(34,'Modify Device',1,0,0,0,'alldevices.php','popup','.editDashBtn',1),(35,'View Device on Map',1,1,1,0,'alldevices.php','popup','.addMapBtn',1),(36,'View Device Manager Board',0,0,1,0,'alldevices.php','view','#managerBoard',0),(37,'View Syntesis',1,0,0,0,'alldevices.php','view','#synthesis',1),(38,'Delete Device',1,0,0,0,'alldevices.php','popup','.delDashBtn',1);
/*!40000 ALTER TABLE `functionalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mainmenu`
--

LOCK TABLES `mainmenu` WRITE;
/*!40000 ALTER TABLE `mainmenu` DISABLE KEYS */;
INSERT INTO `mainmenu` VALUES (1,'value.php','valueLink','fa fa-podcast','Sensors&amp;Actuators','[\"AreaManager\",\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#f3cf58',1,'IoT Directory: Sensors and Actuators'),(2,'devices.php','devicesLink','fa fa-microchip','Devices','[\"AreaManager\",\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#33cc33',1,'IoT Directory: Devices'),(3,'contextbroker.php','contextbrokerLink','fa fa-object-group','Context Brokers','[\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#d84141',1,'IoT Directory: Context Brokers'),(5,'users.php','userLink','fa fa-user','List of Users','[\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#FFFFFF',1,'IoT Directory: Users'),(6,'account.php','accountManagementLink','fa fa-lock','Account','[\"AreaManager\",\"Manager\",\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#ff9933',1,'IoT Directory: Account'),(8,'bulkUpdate.php','bulkDUpdateLink','fa fa-microchip','Update Devices ','[]','any','no','samePage','#33cc33',0,'IoT Directory: Device Bulk Updates'),(9,'bulkCBUpdate.php','bulkCBUpdateLink','fa fa-microchip','Update COntext Broker','[]','any','no','samePage','#33cc33',0,'IoT Directory: Device Bulk Updates'),(10,'setup.php','setupLink','fa fa-cogs','Settings','[\"AreaManager\",\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#00e6e6',1,'IoT Directory: Setup'),(11,'mydevices.php','mydevicesLink','fa fa-microchip','Devices','[\"AreaManager\",\"Manager\",\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#33cc33',1,'IoT Directory: Devices'),(12,'alldevices.php','alldevicesLink','fa fa-microchip','Devices','[\"RootAdmin\"]','any','no','samePage','#33cc33',1,'IoT Directory: Devices'),(13,'model.php','modelLink','fa fa-microchip','Models','[\"AreaManager\",\"ToolAdmin\", \"RootAdmin\"]','any','no','samePage','#33cc33',1,'IoT Directory: Models');
/*!40000 ALTER TABLE `mainmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `defaultpolicy`
--

LOCK TABLES `defaultpolicy` WRITE;
/*!40000 ALTER TABLE `defaultpolicy` DISABLE KEYS */;
INSERT INTO `defaultpolicy` VALUES ('advances',0,'mqttUNIFI','mqtt','csv','refresh_rate','300'),('basic',1,'orionUNIFI','ngsi','json','refresh_rate','300');
/*!40000 ALTER TABLE `defaultpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `formats`
--

LOCK TABLES `formats` WRITE;
/*!40000 ALTER TABLE `formats` DISABLE KEYS */;
INSERT INTO `formats` VALUES ('csv'),('json'),('xml');
/*!40000 ALTER TABLE `formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `protocols`
--

LOCK TABLES `protocols` WRITE;
/*!40000 ALTER TABLE `protocols` DISABLE KEYS */;
INSERT INTO `protocols` VALUES ('amqp'),('coap'),('mqtt'),('ngsi'),('ngsi w/MultiService'),('sigfox');
/*!40000 ALTER TABLE `protocols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES ('binary'),('boolean'),('button'),('collection'),('date'),('datetime'),('float'),('html'),('identifier'),('image'),('integer'),('json'),('path'),('set'),('shape'),('string'),('switch'),('time'),('timestamp'),('url'),('vector'),('webpage'),('wkt'),('xml');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `defaultcontestbrokerpolicy`
--

LOCK TABLES `defaultcontestbrokerpolicy` WRITE;
/*!40000 ALTER TABLE `defaultcontestbrokerpolicy` DISABLE KEYS */;
INSERT INTO `defaultcontestbrokerpolicy` VALUES ('advances',0,'mqttUNIFI','mqtt','csv'),('basic',1,'orionUNIFI','ngsi','json');
/*!40000 ALTER TABLE `defaultcontestbrokerpolicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 14:22:55
