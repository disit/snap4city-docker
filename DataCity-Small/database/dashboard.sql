-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: Dashboard
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

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
-- Current Database: `Dashboard`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Dashboard` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Dashboard`;

--
-- Table structure for table `ActuatorsAppsValues`
--

DROP TABLE IF EXISTS `ActuatorsAppsValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActuatorsAppsValues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widgetName` text NOT NULL,
  `actionTime` varchar(20) NOT NULL,
  `value` text DEFAULT NULL,
  `username` text DEFAULT NULL,
  `ipAddress` varchar(16) DEFAULT NULL,
  `actuationResult` text DEFAULT NULL,
  `actuationResultTime` varchar(20) DEFAULT NULL,
  `nrInputId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ActuatorsEntitiesValues`
--

DROP TABLE IF EXISTS `ActuatorsEntitiesValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActuatorsEntitiesValues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityId` text NOT NULL,
  `actionTime` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `username` text DEFAULT NULL,
  `ipAddress` varchar(16) DEFAULT NULL,
  `actuationResult` text DEFAULT NULL,
  `actuationResultTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Config_dashboard`
--

DROP TABLE IF EXISTS `Config_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config_dashboard` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name_dashboard` varchar(300) DEFAULT NULL,
  `title_header` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `subtitle_header` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `color_header` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `num_rows` int(11) DEFAULT NULL,
  `num_columns` int(11) DEFAULT NULL,
  `user` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `status_dashboard` int(11) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT current_timestamp(),
  `color_background` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `external_frame_color` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `headerFontColor` varchar(40) CHARACTER SET latin1 DEFAULT '#ffffff',
  `headerFontSize` int(3) DEFAULT 45,
  `logoFilename` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `logoLink` varchar(400) CHARACTER SET latin1 DEFAULT NULL,
  `visibility` varchar(45) CHARACTER SET latin1 DEFAULT 'public',
  `headerVisible` int(1) DEFAULT 1,
  `embeddable` varchar(3) DEFAULT 'no',
  `authorizedPagesJson` text DEFAULT NULL,
  `viewMode` varchar(45) DEFAULT 'fixed',
  `fromNodeRed` varchar(3) DEFAULT 'no',
  `gridColor` varchar(40) DEFAULT 'rgb(89, 89, 89, 1)',
  `nrGpsRelativeUrl` text DEFAULT NULL,
  `last_edit_date` timestamp NULL DEFAULT NULL,
  `lastUsedColors` text DEFAULT NULL,
  `deleted` varchar(3) DEFAULT 'no',
  `screenshotFilename` varchar(150) DEFAULT '../standardIcon.png',
  `bckImgFilename` varchar(150) DEFAULT NULL,
  `useBckImg` varchar(3) DEFAULT 'no',
  `backOverlayOpacity` float DEFAULT 0,
  `organizations` varchar(150) DEFAULT 'Other',
  `scaleFactor` varchar(8) DEFAULT NULL,
  `orgMenuVisible` varchar(3) DEFAULT 'no',
  `infoMsgPopup` varchar(8) DEFAULT NULL,
  `infoMsgText` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_Config_dashboard_name_dashboard` (`name_dashboard`(255)),
  KEY `idx_Config_dashboard_name_dashboard_Id` (`name_dashboard`(255),`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Config_widget_dashboard`
--

DROP TABLE IF EXISTS `Config_widget_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config_widget_dashboard` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name_w` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `id_dashboard` int(11) DEFAULT NULL,
  `id_metric` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `type_w` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `n_row` int(11) DEFAULT NULL,
  `n_column` int(11) DEFAULT NULL,
  `size_rows` int(11) DEFAULT NULL,
  `size_columns` int(11) DEFAULT NULL,
  `title_w` varchar(600) CHARACTER SET latin1 DEFAULT NULL,
  `color_w` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `frequency_w` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `temporal_range_w` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `municipality_w` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `infoMessage_w` text CHARACTER SET latin1 DEFAULT NULL,
  `link_w` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `parameters` text CHARACTER SET latin1 DEFAULT NULL,
  `udm` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `udmPos` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `fontSize` int(3) DEFAULT NULL,
  `fontColor` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `frame_color_w` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `controlsPosition` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `showTitle` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `controlsVisibility` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `zoomFactor` float DEFAULT NULL,
  `defaultTab` int(2) DEFAULT NULL,
  `zoomControlsColor` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `scaleX` double DEFAULT NULL,
  `scaleY` double DEFAULT NULL,
  `headerFontColor` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `styleParameters` text CHARACTER SET latin1 DEFAULT NULL,
  `infoJson` text CHARACTER SET latin1 DEFAULT NULL,
  `serviceUri` varchar(1200) CHARACTER SET latin1 DEFAULT NULL,
  `viewMode` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `hospitalList` text CHARACTER SET latin1 DEFAULT NULL,
  `lastSeries` text CHARACTER SET latin1 DEFAULT NULL,
  `notificatorRegistered` varchar(3) CHARACTER SET latin1 DEFAULT 'no',
  `notificatorEnabled` varchar(3) CHARACTER SET latin1 DEFAULT 'no',
  `oldParameters` text DEFAULT NULL,
  `enableFullscreenTab` varchar(3) DEFAULT 'no',
  `enableFullscreenModal` varchar(3) DEFAULT 'no',
  `fontFamily` varchar(100) NOT NULL DEFAULT 'Auto',
  `entityJson` text DEFAULT NULL,
  `attributeName` varchar(100) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `lastEditor` varchar(100) DEFAULT NULL,
  `canceller` varchar(100) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `lastEditDate` varchar(40) DEFAULT NULL,
  `cancelDate` varchar(40) DEFAULT NULL,
  `actuatorTarget` varchar(45) DEFAULT NULL,
  `actuatorEntity` varchar(45) DEFAULT NULL,
  `actuatorAttribute` varchar(45) DEFAULT NULL,
  `chartColor` varchar(20) DEFAULT NULL,
  `dataLabelsFontSize` int(3) DEFAULT 12,
  `dataLabelsFontColor` varchar(60) DEFAULT '#000000',
  `chartLabelsFontSize` int(3) DEFAULT 12,
  `chartLabelsFontColor` varchar(60) DEFAULT 'rgba(0,0,0,1)',
  `appId` varchar(400) DEFAULT NULL,
  `flowId` varchar(400) DEFAULT NULL,
  `nrMetricType` varchar(400) DEFAULT NULL,
  `nodeId` varchar(400) DEFAULT NULL,
  `borderColor` varchar(45) DEFAULT '#FFFFFF',
  `sm_based` varchar(30) DEFAULT 'no',
  `rowParameters` text DEFAULT NULL,
  `sm_field` text DEFAULT NULL,
  `chartPlaneColor` varchar(60) DEFAULT 'rgba(238, 238, 238, 1)',
  `chartAxesColor` varchar(60) DEFAULT 'rgba(238, 238, 238, 1)',
  `wizardRowIds` text DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `showContent` varchar(3) DEFAULT NULL,
  `collapseAllowed` varchar(3) DEFAULT 'no',
  `scaleFactor` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Config_widget_dashboard_ibfk_1` (`id_dashboard`),
  KEY `idx_Config_widget_dashboard_name_w` (`name_w`),
  CONSTRAINT `Config_widget_dashboard_ibfk_1` FOREIGN KEY (`id_dashboard`) REFERENCES `Config_dashboard` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DashboardTemplates`
--

DROP TABLE IF EXISTS `DashboardTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DashboardTemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `available` varchar(5) NOT NULL DEFAULT 'false',
  `widgetType` varchar(50) DEFAULT NULL,
  `highLevelTypeSelection` text DEFAULT NULL,
  `natureSelection` text DEFAULT NULL,
  `subnatureSelection` text DEFAULT NULL,
  `valueTypeSelection` text DEFAULT NULL,
  `valueNameSelection` text DEFAULT NULL,
  `dataTypeSelection` text DEFAULT NULL,
  `highLevelTypeVisible` varchar(5) DEFAULT 'true',
  `natureVisible` varchar(5) DEFAULT 'true',
  `subnatureVisible` varchar(5) DEFAULT 'true',
  `valueTypeVisible` varchar(5) DEFAULT 'true',
  `valueNameVisible` varchar(5) DEFAULT 'true',
  `dataTypeVisible` varchar(5) DEFAULT 'true',
  `lastDateVisible` varchar(5) DEFAULT 'true',
  `lastValueVisible` varchar(5) DEFAULT 'true',
  `healthinessVisible` varchar(5) DEFAULT 'true',
  `lastCheckVisible` varchar(5) DEFAULT 'true',
  `ownershipVisible` varchar(5) DEFAULT 'true',
  `healthinessSelection` text DEFAULT NULL,
  `ownershipSelection` text DEFAULT NULL,
  `hasActuators` varchar(5) DEFAULT 'false',
  `valueUnitSelection` text DEFAULT NULL,
  `valueUnitVisible` varchar(5) DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DashboardWizard`
--

DROP TABLE IF EXISTS `DashboardWizard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DashboardWizard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(128) DEFAULT NULL,
  `high_level_type` varchar(128) DEFAULT NULL,
  `sub_nature` varchar(128) DEFAULT NULL,
  `low_level_type` varchar(128) DEFAULT NULL,
  `unique_name_id` varchar(128) DEFAULT NULL,
  `instance_uri` varchar(256) DEFAULT NULL,
  `get_instances` varchar(128) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `last_value` varchar(128) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  `metric` varchar(128) DEFAULT NULL,
  `saved_direct` varchar(128) DEFAULT NULL,
  `kb_based` varchar(128) DEFAULT NULL,
  `sm_based` varchar(128) DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `widgets` varchar(128) DEFAULT NULL,
  `parameters` varchar(512) DEFAULT NULL,
  `healthiness` varchar(128) NOT NULL,
  `microAppExtServIcon` varchar(100) DEFAULT NULL,
  `lastCheck` datetime DEFAULT NULL,
  `ownership` varchar(64) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `value_unit` varchar(45) DEFAULT NULL,
  `ownerHash` varchar(128) DEFAULT NULL,
  `delegatedHash` varchar(512) DEFAULT NULL,
  `delegatedGroupHash` varchar(512) DEFAULT NULL,
  `oldEntry` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueKey` (`high_level_type`,`sub_nature`,`low_level_type`,`unique_name_id`,`instance_uri`,`get_instances`),
  KEY `hlt` (`high_level_type`),
  KEY `latlon` (`latitude`,`longitude`),
  KEY `metric` (`metric`),
  KEY `nat` (`nature`),
  KEY `owner` (`ownership`),
  KEY `subnat` (`sub_nature`),
  KEY `type` (`unit`),
  KEY `widget` (`widgets`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DashboardsViewPermissions`
--

DROP TABLE IF EXISTS `DashboardsViewPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DashboardsViewPermissions` (
  `IdDashboard` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_bin NOT NULL,
  KEY `IdDashboard` (`IdDashboard`),
  CONSTRAINT `dashboardsviewpermissions_ibfk_1` FOREIGN KEY (`IdDashboard`) REFERENCES `Config_dashboard` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Data`
--

DROP TABLE IF EXISTS `Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Data` (
  `IdMetric_data` varchar(45) NOT NULL,
  `computationDate` datetime NOT NULL,
  `value_num` double DEFAULT NULL,
  `value_perc1` double DEFAULT NULL,
  `value_perc2` double DEFAULT NULL,
  `value_perc3` double DEFAULT NULL,
  `value_text` varchar(300) DEFAULT NULL,
  `quant_perc1` int(11) DEFAULT NULL,
  `quant_perc2` int(11) DEFAULT NULL,
  `quant_perc3` int(11) DEFAULT NULL,
  `tot_perc1` int(11) DEFAULT NULL,
  `tot_perc2` int(11) DEFAULT NULL,
  `tot_perc3` int(11) DEFAULT NULL,
  `series` text DEFAULT NULL,
  `appId` varchar(400) DEFAULT NULL,
  `flowId` varchar(400) DEFAULT NULL,
  `nrMetricType` varchar(400) DEFAULT NULL,
  `nrUsername` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`IdMetric_data`,`computationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataInspector`
--

DROP TABLE IF EXISTS `DataInspector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataInspector` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name_w` varchar(150) DEFAULT NULL,
  `id_dashboard` int(11) DEFAULT NULL,
  `id_metric` varchar(150) DEFAULT NULL,
  `type_w` varchar(150) DEFAULT NULL,
  `n_row` int(11) DEFAULT NULL,
  `n_column` int(11) DEFAULT NULL,
  `size_rows` int(11) DEFAULT NULL,
  `size_columns` int(11) DEFAULT NULL,
  `title_w` varchar(600) DEFAULT NULL,
  `color_w` varchar(40) DEFAULT NULL,
  `frequency_w` varchar(100) DEFAULT NULL,
  `temporal_range_w` varchar(100) DEFAULT NULL,
  `municipality_w` varchar(100) DEFAULT NULL,
  `infoMessage_w` text DEFAULT NULL,
  `link_w` varchar(1024) DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  `udm` varchar(45) DEFAULT NULL,
  `udmPos` varchar(50) DEFAULT NULL,
  `fontSize` int(3) DEFAULT NULL,
  `fontColor` varchar(40) DEFAULT NULL,
  `frame_color_w` varchar(40) DEFAULT NULL,
  `controlsPosition` varchar(25) DEFAULT NULL,
  `showTitle` varchar(3) DEFAULT NULL,
  `controlsVisibility` varchar(15) DEFAULT NULL,
  `zoomFactor` float DEFAULT NULL,
  `defaultTab` int(2) DEFAULT NULL,
  `zoomControlsColor` varchar(40) DEFAULT NULL,
  `scaleX` double DEFAULT NULL,
  `scaleY` double DEFAULT NULL,
  `headerFontColor` varchar(40) DEFAULT NULL,
  `styleParameters` text DEFAULT NULL,
  `infoJson` text DEFAULT NULL,
  `serviceUri` varchar(600) DEFAULT NULL,
  `viewMode` varchar(50) DEFAULT NULL,
  `hospitalList` text DEFAULT NULL,
  `lastSeries` text DEFAULT NULL,
  `notificatorRegistered` varchar(3) DEFAULT 'no',
  `notificatorEnabled` varchar(3) DEFAULT 'no',
  `oldParameters` text CHARACTER SET utf8 DEFAULT NULL,
  `enableFullscreenTab` varchar(3) CHARACTER SET utf8 DEFAULT 'no',
  `enableFullscreenModal` varchar(3) CHARACTER SET utf8 DEFAULT 'no',
  `fontFamily` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT 'Auto',
  `entityJson` text CHARACTER SET utf8 DEFAULT NULL,
  `attributeName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `creator` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `lastEditor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `canceller` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `creationDate` varchar(40) CHARACTER SET utf8 DEFAULT 'CURRENT_TIMESTAMP',
  `lastEditDate` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `cancelDate` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `actuatorTarget` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `actuatorEntity` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `actuatorAttribute` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `chartColor` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `dataLabelsFontSize` int(3) DEFAULT 12,
  `dataLabelsFontColor` varchar(60) CHARACTER SET utf8 DEFAULT '#000000',
  `chartLabelsFontSize` int(3) DEFAULT 12,
  `chartLabelsFontColor` varchar(60) CHARACTER SET utf8 DEFAULT 'rgba(0,0,0,1)',
  `appId` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `flowId` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `nrMetricType` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `nodeId` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `borderColor` varchar(45) CHARACTER SET utf8 DEFAULT '#FFFFFF',
  `sm_based` varchar(30) CHARACTER SET utf8 DEFAULT 'no',
  `rowParameters` text CHARACTER SET utf8 DEFAULT NULL,
  `sm_field` text CHARACTER SET utf8 DEFAULT NULL,
  `chartPlaneColor` varchar(60) CHARACTER SET utf8 DEFAULT 'rgba(238, 238, 238, 1)',
  `chartAxesColor` varchar(60) CHARACTER SET utf8 DEFAULT 'rgba(238, 238, 238, 1)',
  `wizardRowIds` text CHARACTER SET utf8 DEFAULT NULL,
  `icon` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataSource`
--

DROP TABLE IF EXISTS `DataSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataSource` (
  `intId` int(9) NOT NULL AUTO_INCREMENT,
  `Id` varchar(45) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `database` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `databaseType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`intId`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DefaultNatureColors`
--

DROP TABLE IF EXISTS `DefaultNatureColors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultNatureColors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(128) DEFAULT NULL,
  `sub_nature` varchar(128) DEFAULT NULL,
  `defaultColor` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Descriptions`
--

DROP TABLE IF EXISTS `Descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Descriptions` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `IdMetric` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` longtext CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `query` longtext CHARACTER SET latin1 DEFAULT NULL,
  `query2` longtext CHARACTER SET latin1 DEFAULT NULL,
  `queryType` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `metricType` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `frequency` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `processType` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `area` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `source` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `description_short` longtext CHARACTER SET latin1 DEFAULT NULL,
  `dataSource` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `storingData` int(11) DEFAULT NULL,
  `municipalityOption` int(11) DEFAULT NULL,
  `timeRangeOption` int(11) DEFAULT NULL,
  `field1Desc` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `field2Desc` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `field3Desc` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `oldData` int(1) DEFAULT 0,
  `sameDataAlarmCount` int(11) DEFAULT NULL,
  `oldDataEvalTime` int(11) DEFAULT NULL,
  `hasNegativeValues` int(1) DEFAULT 0,
  `process` varchar(45) DEFAULT 'DashboardProcess',
  `threshold` double DEFAULT NULL,
  `thresholdEval` varchar(45) DEFAULT NULL,
  `boundToMetric` varchar(45) DEFAULT NULL,
  `status_HTTPRetr` varchar(45) DEFAULT 'Non Attivo',
  `username_HTTPRetr` varchar(45) DEFAULT NULL,
  `password_HTTPRetr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdMetric_UNIQUE` (`IdMetric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Domains`
--

DROP TABLE IF EXISTS `Domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domains` mediumtext DEFAULT NULL,
  `claim` mediumtext DEFAULT NULL,
  `landingPageUrl` tinytext DEFAULT NULL,
  `landingPageTitle` tinytext DEFAULT NULL,
  `landingPageLinkId` varchar(50) DEFAULT NULL,
  `landingPageFromSubmenu` varchar(5) DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HeatmapColorLevels`
--

DROP TABLE IF EXISTS `HeatmapColorLevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HeatmapColorLevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(32) NOT NULL,
  `rgbValue` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`,`colorName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HeatmapRanges`
--

DROP TABLE IF EXISTS `HeatmapRanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HeatmapRanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metricName` varchar(150) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `range1Inf` double DEFAULT NULL,
  `range2Inf` double DEFAULT NULL,
  `range3Inf` double DEFAULT NULL,
  `range4Inf` double DEFAULT NULL,
  `range5Inf` double DEFAULT NULL,
  `range6Inf` double DEFAULT NULL,
  `range7Inf` double DEFAULT NULL,
  `range8Inf` double DEFAULT NULL,
  `range9Inf` double DEFAULT NULL,
  `range10Inf` double DEFAULT NULL,
  `positive_negative` varchar(32) DEFAULT NULL,
  `iconPath` varchar(150) DEFAULT NULL,
  `leafletConfigJSON` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IOT_Sensors_for_DashboardWizard`
--

DROP TABLE IF EXISTS `IOT_Sensors_for_DashboardWizard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IOT_Sensors_for_DashboardWizard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(128) DEFAULT NULL,
  `high_level_type` varchar(128) DEFAULT NULL,
  `sub_nature` varchar(128) DEFAULT NULL,
  `low_level_type` varchar(128) DEFAULT NULL,
  `unique_name_id` varchar(128) DEFAULT NULL,
  `instance_uri` varchar(256) DEFAULT NULL,
  `get_instances` varchar(128) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `last_value` varchar(32) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  `metric` varchar(128) DEFAULT NULL,
  `saved_direct` varchar(128) DEFAULT NULL,
  `kb_based` varchar(128) DEFAULT NULL,
  `sm_based` varchar(128) DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `widgets` varchar(128) DEFAULT NULL,
  `parameters` varchar(512) DEFAULT NULL,
  `healthiness` varchar(128) NOT NULL,
  `icon1` varchar(512) DEFAULT NULL,
  `icon2` varchar(512) DEFAULT NULL,
  `icon3` varchar(512) DEFAULT NULL,
  `icon4` varchar(512) DEFAULT NULL,
  `icon5` varchar(512) DEFAULT NULL,
  `icon6` varchar(512) NOT NULL,
  `microAppExtServIcon` varchar(100) DEFAULT NULL,
  `lastCheck` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IP_cam_credentials`
--

DROP TABLE IF EXISTS `IP_cam_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IP_cam_credentials` (
  `IP` varchar(256) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IP_selectorWeb`
--

DROP TABLE IF EXISTS `IP_selectorWeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IP_selectorWeb` (
  `ID` int(11) NOT NULL,
  `IP_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IdDashDailyAccess`
--

DROP TABLE IF EXISTS `IdDashDailyAccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IdDashDailyAccess` (
  `IdDashboard` int(11) NOT NULL,
  `date` date NOT NULL,
  `nAccessPerDay` int(11) NOT NULL,
  `nMinutesPerDay` int(11) NOT NULL,
  UNIQUE KEY `uniqueKey` (`IdDashboard`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IotApplications`
--

DROP TABLE IF EXISTS `IotApplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IotApplications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `icon` varchar(300) NOT NULL,
  `privileges` text NOT NULL,
  `user` varchar(100) NOT NULL DEFAULT 'any',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JobAreas`
--

DROP TABLE IF EXISTS `JobAreas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobAreas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedulerId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulerId` (`schedulerId`),
  CONSTRAINT `jobareas_ibfk_1` FOREIGN KEY (`schedulerId`) REFERENCES `Schedulers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MainMenu`
--

DROP TABLE IF EXISTS `MainMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainMenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkUrl` varchar(300) NOT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `domain` int(2) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MainMenu1`
--

DROP TABLE IF EXISTS `MainMenu1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainMenu1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkUrl` varchar(300) NOT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `domain` int(2) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MainMenuSubmenus`
--

DROP TABLE IF EXISTS `MainMenuSubmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainMenuSubmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) DEFAULT NULL,
  `linkUrl` varchar(300) DEFAULT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MainMenuSubmenus1`
--

DROP TABLE IF EXISTS `MainMenuSubmenus1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainMenuSubmenus1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) DEFAULT NULL,
  `linkUrl` varchar(300) DEFAULT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(200) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MainMenuSubmenusUser`
--

DROP TABLE IF EXISTS `MainMenuSubmenusUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainMenuSubmenusUser` (
  `submenu` int(11) NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`submenu`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MobMainMenu`
--

DROP TABLE IF EXISTS `MobMainMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MobMainMenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkUrl` varchar(300) NOT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `domain` int(2) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MobMainMenuSubmenus`
--

DROP TABLE IF EXISTS `MobMainMenuSubmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MobMainMenuSubmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) DEFAULT NULL,
  `linkUrl` varchar(300) DEFAULT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NodeRedInputs`
--

DROP TABLE IF EXISTS `NodeRedInputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NodeRedInputs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `valueType` varchar(45) NOT NULL,
  `user` varchar(100) NOT NULL,
  `startValue` text NOT NULL,
  `domainType` varchar(100) NOT NULL,
  `minValue` double DEFAULT NULL,
  `maxValue` double DEFAULT NULL,
  `offValue` varchar(200) DEFAULT NULL,
  `onValue` varchar(200) DEFAULT NULL,
  `dataPrecision` int(11) DEFAULT NULL,
  `endPointPort` int(8) DEFAULT NULL,
  `endPointHost` varchar(45) DEFAULT NULL,
  `httpRoot` varchar(45) DEFAULT NULL,
  `appId` varchar(400) DEFAULT NULL,
  `flowId` varchar(400) DEFAULT NULL,
  `flowName` varchar(400) DEFAULT NULL,
  `nodeId` varchar(400) DEFAULT NULL,
  `organization` varchar(100) DEFAULT 'DISIT',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NodeRedMetrics`
--

DROP TABLE IF EXISTS `NodeRedMetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NodeRedMetrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) DEFAULT NULL,
  `metricType` varchar(400) DEFAULT NULL,
  `user` varchar(400) DEFAULT NULL,
  `shortDesc` varchar(400) DEFAULT NULL,
  `fullDesc` varchar(400) DEFAULT NULL,
  `appId` varchar(400) DEFAULT NULL,
  `flowId` varchar(400) DEFAULT NULL,
  `flowName` varchar(400) DEFAULT NULL,
  `nodeId` varchar(400) DEFAULT NULL,
  `httpRoot` varchar(400) DEFAULT NULL,
  `organization` varchar(100) DEFAULT 'DISIT',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PRIMARY2` (`name`,`metricType`,`user`,`appId`,`flowId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OperatorEvents`
--

DROP TABLE IF EXISTS `OperatorEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OperatorEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(45) DEFAULT NULL,
  `personNumber` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `codeColor` varchar(45) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrgMenu`
--

DROP TABLE IF EXISTS `OrgMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrgMenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkUrl` varchar(300) NOT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `domain` int(2) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrgMenuSubmenus`
--

DROP TABLE IF EXISTS `OrgMenuSubmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrgMenuSubmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) DEFAULT NULL,
  `linkUrl` varchar(300) DEFAULT NULL,
  `publicLinkUrl` varchar(200) DEFAULT NULL,
  `linkId` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `privileges` text DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'any',
  `externalApp` varchar(3) DEFAULT 'no',
  `openMode` varchar(45) DEFAULT 'newTab',
  `iconColor` varchar(45) DEFAULT '#FFFFFF',
  `pageTitle` varchar(200) DEFAULT NULL,
  `menuOrder` int(2) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Organizations`
--

DROP TABLE IF EXISTS `Organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationName` tinytext DEFAULT NULL,
  `kbUrl` text DEFAULT NULL,
  `gpsCentreLatLng` varchar(45) DEFAULT NULL,
  `zoomLevel` int(11) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `broker` varchar(45) DEFAULT NULL,
  `orionIP` varchar(45) DEFAULT NULL,
  `orthomapJson` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Schedulers`
--

DROP TABLE IF EXISTS `Schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedulers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `hasJobAreas` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SynopticMappings`
--

DROP TABLE IF EXISTS `SynopticMappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SynopticMappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `synoptic_id` int(11) DEFAULT NULL,
  `tpl_var_name` varchar(255) DEFAULT NULL,
  `tpl_var_role` enum('input','output') NOT NULL DEFAULT 'input',
  `usr_var_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SynopticSrvVars`
--

DROP TABLE IF EXISTS `SynopticSrvVars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SynopticSrvVars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `synoptic` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SynopticTemplates`
--

DROP TABLE IF EXISTS `SynopticTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SynopticTemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(128) DEFAULT NULL,
  `high_level_type` varchar(128) DEFAULT NULL,
  `sub_nature` varchar(128) DEFAULT NULL,
  `low_level_type` varchar(128) DEFAULT NULL,
  `unique_name_id` varchar(128) DEFAULT NULL,
  `instance_uri` varchar(256) DEFAULT NULL,
  `get_instances` varchar(128) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `last_value` varchar(128) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  `metric` varchar(128) DEFAULT NULL,
  `saved_direct` varchar(128) DEFAULT NULL,
  `kb_based` varchar(128) DEFAULT NULL,
  `sm_based` varchar(128) DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `widgets` varchar(128) DEFAULT NULL,
  `parameters` varchar(512) DEFAULT NULL,
  `healthiness` varchar(128) NOT NULL,
  `microAppExtServIcon` varchar(100) DEFAULT NULL,
  `lastCheck` datetime DEFAULT NULL,
  `ownership` varchar(64) DEFAULT NULL,
  `organizations` text DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `value_unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueKey` (`high_level_type`,`sub_nature`,`low_level_type`,`unique_name_id`,`instance_uri`,`get_instances`),
  KEY `hlt` (`high_level_type`),
  KEY `latlon` (`latitude`,`longitude`),
  KEY `metric` (`metric`),
  KEY `nat` (`nature`),
  KEY `owner` (`ownership`),
  KEY `subnat` (`sub_nature`),
  KEY `type` (`unit`),
  KEY `widget` (`widgets`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SynopticVarPresel`
--

DROP TABLE IF EXISTS `SynopticVarPresel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SynopticVarPresel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(128) DEFAULT NULL,
  `sel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
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

--
-- Table structure for table `UsersPools`
--

DROP TABLE IF EXISTS `UsersPools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsersPools` (
  `poolId` int(11) NOT NULL AUTO_INCREMENT,
  `poolName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UsersPoolsRelations`
--

DROP TABLE IF EXISTS `UsersPoolsRelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsersPoolsRelations` (
  `username` varchar(100) NOT NULL,
  `poolId` int(11) NOT NULL,
  `isAdmin` int(11) NOT NULL,
  PRIMARY KEY (`username`,`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Widgets`
--

DROP TABLE IF EXISTS `Widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Widgets` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `id_type_widget` varchar(150) NOT NULL,
  `source_php_widget` varchar(150) DEFAULT NULL,
  `min_row` int(11) DEFAULT NULL,
  `max_row` int(11) DEFAULT NULL,
  `min_col` int(11) DEFAULT NULL,
  `max_col` int(11) DEFAULT NULL,
  `widgetType` varchar(150) DEFAULT NULL,
  `unique_metric` varchar(150) NOT NULL,
  `numeric_rangeOption` int(11) DEFAULT NULL,
  `number_metrics_widget` int(11) DEFAULT NULL,
  `color_widgetOption` int(11) DEFAULT NULL,
  `dimMap` text DEFAULT NULL,
  `widgetCategory` varchar(45) DEFAULT 'dataViewer',
  `isNodeRedSender` varchar(3) DEFAULT 'no',
  `domainType` text DEFAULT NULL,
  `defaultParameters` text DEFAULT NULL,
  `hasTimer` varchar(3) DEFAULT 'yes',
  `hasChartColor` varchar(3) DEFAULT 'no',
  `hasDataLabels` varchar(3) DEFAULT 'no',
  `hasChartLabels` varchar(3) DEFAULT 'no',
  `hasTimeRange` varchar(3) DEFAULT 'no',
  `hasCartesianPlane` varchar(3) DEFAULT 'no',
  `hasChangeMetric` varchar(3) DEFAULT 'yes',
  `hasAddMode` varchar(3) DEFAULT 'no',
  `isCollapsible` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_type_widget_UNIQUE` (`id_type_widget`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WidgetsIconsMap`
--

DROP TABLE IF EXISTS `WidgetsIconsMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WidgetsIconsMap` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `mainWidget` varchar(150) NOT NULL,
  `targetWidget` varchar(150) NOT NULL,
  `snap4CityType` varchar(500) NOT NULL,
  `icon` varchar(150) NOT NULL,
  `mono_multi` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `available` varchar(10) DEFAULT 'false',
  `sm_based` varchar(3) DEFAULT 'no',
  `defaultParametersMainWidget` text DEFAULT NULL,
  `defaultParametersTargetWidget` text DEFAULT NULL,
  `hasMainWidgetFactory` varchar(3) DEFAULT 'no',
  `hasTargetWidgetFactory` text DEFAULT NULL,
  `comboName` varchar(100) DEFAULT NULL,
  `widgetCategory` varchar(45) DEFAULT 'dataViewer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desTest`
--

DROP TABLE IF EXISTS `desTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desTest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origString` varchar(45) DEFAULT NULL,
  `encryptedString` varbinary(256) DEFAULT NULL,
  `decryptedString` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueIdx` (`origString`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lowDetailedGraphDynamic`
--

DROP TABLE IF EXISTS `lowDetailedGraphDynamic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lowDetailedGraphDynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roadSegmentUnit` text DEFAULT NULL,
  `segmentID` text DEFAULT NULL,
  `density` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `dateData` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!50001 DROP VIEW IF EXISTS `mappings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mappings` (
  `id` tinyint NOT NULL,
  `synoptic_id` tinyint NOT NULL,
  `tpl_var_name` tinyint NOT NULL,
  `tpl_var_role` tinyint NOT NULL,
  `usr_var_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `synoptics`
--

DROP TABLE IF EXISTS `synoptics`;
/*!50001 DROP VIEW IF EXISTS `synoptics`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `synoptics` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `template_id` tinyint NOT NULL,
  `owner` tinyint NOT NULL,
  `created` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!50001 DROP VIEW IF EXISTS `templates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `templates` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `path` tinyint NOT NULL,
  `owner` tinyint NOT NULL,
  `created` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `value_types`
--

DROP TABLE IF EXISTS `value_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_types` (
  `value_type` varchar(30) NOT NULL,
  `value_unit_default` varchar(30) NOT NULL,
  PRIMARY KEY (`value_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `Dashboard`
--

USE `Dashboard`;

--
-- Final view structure for view `mappings`
--

/*!50001 DROP TABLE IF EXISTS `mappings`*/;
/*!50001 DROP VIEW IF EXISTS `mappings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mappings` AS select `SynopticMappings`.`id` AS `id`,`SynopticMappings`.`synoptic_id` AS `synoptic_id`,`SynopticMappings`.`tpl_var_name` AS `tpl_var_name`,`SynopticMappings`.`tpl_var_role` AS `tpl_var_role`,`SynopticMappings`.`usr_var_name` AS `usr_var_name` from `SynopticMappings` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `synoptics`
--

/*!50001 DROP TABLE IF EXISTS `synoptics`*/;
/*!50001 DROP VIEW IF EXISTS `synoptics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `synoptics` AS select `d`.`id` AS `id`,`d`.`unique_name_id` AS `name`,`t`.`id` AS `template_id`,`d`.`user` AS `owner`,`d`.`lastCheck` AS `created` from (`DashboardWizard` `d` join `templates` `t`) where `d`.`high_level_type` = 'Synoptic' and `d`.`low_level_type` = `t`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `templates`
--

/*!50001 DROP TABLE IF EXISTS `templates`*/;
/*!50001 DROP VIEW IF EXISTS `templates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `templates` AS select `SynopticTemplates`.`id` AS `id`,`SynopticTemplates`.`unique_name_id` AS `name`,`SynopticTemplates`.`parameters` AS `path`,`SynopticTemplates`.`user` AS `owner`,`SynopticTemplates`.`lastCheck` AS `created` from `SynopticTemplates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 18:34:30
-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: Dashboard
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

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
-- Dumping data for table `DashboardTemplates`
--

LOCK TABLES `DashboardTemplates` WRITE;
/*!40000 ALTER TABLE `DashboardTemplates` DISABLE KEYS */;
INSERT INTO `DashboardTemplates` VALUES (1,'selectorAndPoi','Selector and POI','../img/createDashboardWizard/selector-map.png','true','selector-widget.png','POI','any','any','any','any','any','true','true','true','false','false','true','false','false','true','true','false','any','any','false',NULL,'true'),(7,'fullyCustom','Fully custom','../img/createDashboardWizard/custom-template.png','true','any','any','any','any','any','any','any','true','true','true','true','true','true','true','true','true','true','true','any','any','true',NULL,'true'),(3,'dataAndTrends','Data and trends','../img/createDashboardWizard/values-trends-template.png','true','values-trends-template.png','any','any','any','any','any','integer|float|integer-act|float-act','true','true','true','true','true','true','true','true','true','true','true','any','any','true',NULL,'true'),(2,'selectorAndPoiAndTrend','Selector, POI, trend','../img/createDashboardWizard/selector-map-trends-template.png','true','selector-map-trend.png','POI','any','any','any','any','any','true','true','true','false','false','true','false','false','true','true','false','any','any','false',NULL,'true'),(5,'eventsVsMap','Events vs. map','../img/createDashboardWizard/events-on-map-template.png','true','any','Complex Event','any','any','any','any','any','true','true','true','false','true','true','false','false','true','true','true','any','any','false',NULL,'true'),(6,'microAppAndServices','MicroApp and services','../img/createDashboardWizard/micro-app-template.png','true','selector-web.png','MicroApplication','any','any','any','any','any','true','true','true','false','true','true','false','false','true','true','true','any','any','false',NULL,'true'),(8,'iotDevicesBroker','IOT devices','../img/createDashboardWizard/iot-devices-broker.png','true','any','Sensor|Sensor-Actuator','From Dashboard to IOT Device|From IOT Device to KB','any','any','any','any','true','true','true','true','true','true','false','false','true','true','true','any','any','true',NULL,'true'),(9,'iotApps','IOT applications','../img/createDashboardWizard/iot-apps-nr.png','true','any','Dashboard-IOT App','any','any','any','any','any','true','true','true','true','true','true','false','false','true','true','true','any','any','true',NULL,'true'),(13,'customPrivate','My Personal Data','../img/createDashboardWizard/personal-data.png','true','any','any','any','any','any','any','any','true','true','true','true','true','true','true','true','true','true','true','any','private','true',NULL,'true'),(14,'emptyDashboard','Empty Dashboard','../img/createDashboardWizard/dashboard-vuota.png','true','none','none','none','none','none','none','none','false','false','false','false','false','false','false','false','false','false','false','any','any','true',NULL,'true');
/*!40000 ALTER TABLE `DashboardTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `DataInspector`
--

LOCK TABLES `DataInspector` WRITE;
/*!40000 ALTER TABLE `DataInspector` DISABLE KEYS */;
INSERT INTO `DataInspector` VALUES (6351,'DCTemp1_24_widgetTimeTrend6351',24,'DCTemp1','widgetTimeTrend',11,5,4,10,'Time Trend','#FFFFFF','600','Annuale',NULL,'<p>ddss</p>\n','none',NULL,NULL,NULL,11,'#000000','rgb(87,108,117)',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,'#FFFFFF',NULL,NULL,NULL,NULL,NULL,NULL,'no','no',NULL,'no','no','Auto',NULL,NULL,'usermanager',NULL,NULL,'CURRENT_TIMESTAMP',NULL,NULL,NULL,NULL,NULL,'rgb(51, 204, 255)',11,'#000000',11,'#000000',NULL,NULL,NULL,NULL,'#FFFFFF','no',NULL,NULL,'rgba(238, 238, 238, 1)','rgba(238, 238, 238, 1)','{}','selector-map-trend.png'),(6353,'SensoreViaBolognese_24_widgetSingleContent6353',24,'SensoreViaBolognese','widgetSingleContent',11,2,4,3,'Last Value','#FFFFFF','600',NULL,NULL,NULL,'none',NULL,' ','below',36,'#000000','rgb(87,108,117)',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,'#FFFFFF',NULL,NULL,NULL,NULL,NULL,NULL,'no','no',NULL,'no','no','Auto',NULL,NULL,'usermanager',NULL,NULL,'CURRENT_TIMESTAMP',NULL,NULL,NULL,NULL,NULL,NULL,12,'#000000',12,'rgba(0,0,0,1)',NULL,NULL,NULL,NULL,'rgba(0,0,0,1)','yes','https://servicemap.disit.org/WebAppGrafo/api/v1/?serviceUri=http://www.disit.org/km4city/resource/SensoreViaBolognese&format=json','airTemperature','rgba(238, 238, 238, 1)','rgba(238, 238, 238, 1)','{\"row2288\":{\"high_level_type\":\"Sensor\",\"nature\":\"Environment\",\"sub_nature\":\"Weather_sensor\",\"low_level_type\":\"airTemperature\",\"unique_name_id\":\"SensoreViaBolognese\",\"instance_uri\":\"any + status\",\"unit\":\"float\",\"servicetype\":\"Weather_sensor\",\"sm_based\":\"yes\",\"parameters\":\"https://servicemap.disit.org/WebAppGrafo/api/v1/?serviceUri=http://www.disit.org/km4city/resource/SensoreViaBolognese&format=json\",\"widgetCompatible\":\"true\",\"get_instances\":\"http://www.disit.org/km4city/resource/SensoreViaBolognese\",\"last_value\":\"31.954\"}}','single-content.png');
/*!40000 ALTER TABLE `DataInspector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Descriptions`
--

LOCK TABLES `Descriptions` WRITE;
/*!40000 ALTER TABLE `Descriptions` DISABLE KEYS */;
INSERT INTO `Descriptions` VALUES (1,'Alarms','Alarms','Attivo',NULL,NULL,'none','Testuale','60000','API','MobilitÃ ','Disit','Alarms','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(3,'BikeSharingEd','Fake metric simulating bike sharing data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating bike sharing data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(8,'Button','','Non Attivo',NULL,NULL,'none','Button','60000','API',NULL,'',NULL,'none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Non Attivo',NULL,NULL),(9,'CarSharing','Fake metric simulating car sharing data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating car sharing data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(11,'CitiziensSatisfacion','Fake metric simulating citiziens statisfaction index','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating citiziens statisfaction index','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(12,'Clock','Clock','Non Attivo',NULL,NULL,'none','Testuale','60000','API','MobilitÃ ','Disit','Clock','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Non Attivo',NULL,NULL),(27,'EvacuationPlans','Evacuation plans','Non Attivo',NULL,NULL,'none','Testuale','60000','API','MobilitÃ ','Disit','Evacuation plans','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(28,'EventsOverview','Fake metric simulating an overview over city events','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating an overview over city events','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(30,'ExternalContent','Visualizzazione di contenuti provenienti da siti esterni','Non Attivo',NULL,NULL,'none','Testuale','60000','API','Contenuti esterni','Disit','Visualizzazione contenuti provenienti da siti esterni','none',1,0,0,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Non Attivo',NULL,NULL),(32,'FoodPreferences','Fake metric simulating food preferences','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating food preferences','none',1,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(33,'Healthcare','Fake metric simulating healthcare data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating healthcare  data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(34,'InternetConnections','Fake metric simulating internet connections data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating  internet connections data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(39,'NetworkAnalysis','Network analysis','Non Attivo',NULL,NULL,'none','Testuale','60000','API','MobilitÃ ','Disit','Network Analysis','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(40,'NoDataSeries','Fake metric simulating a no data metric on series','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating a no data metric on series','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(61,'Pollution','Fake metric simulating air pollution','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating air pollution','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(65,'Process','Stato di un processo','Non Attivo',NULL,NULL,'none','Testuale','60000','API','Process status','Disit','Stato di un processo','none',1,0,0,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Non Attivo',NULL,NULL),(70,'Resources','Resources','Non Attivo',NULL,NULL,'none','Testuale','60000','API','MobilitÃ ','Disit','Resources','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(71,'Rivers','Fake metric simulating rivers data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating rivers data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(76,'Selector','Selector query list','Non Attivo',NULL,NULL,'none','Testuale','600000','API','MobilitÃ ','Disit','Selector query list','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Non Attivo',NULL,NULL),(78,'Separator','GUI separator','Non Attivo',NULL,NULL,'none','Separator','600000','API',NULL,'',NULL,'none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Non Attivo',NULL,NULL),(88,'Temperatures','Fake metric simulating temperature statistics','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating temperature statistics','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(89,'Tourists','Fake metric simulating tourists flow','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating tourists flow','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(92,'UrbanFaults','Fake metric simulating urban faults data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating urban faults data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(93,'WeatherStations','Fake metric simulating weather stations data','Non Attivo',NULL,NULL,'none','Series','600000','API','Fake area','Disit','Fake metric simulating weather stations data','none',1,0,0,NULL,NULL,NULL,0,NULL,1200000,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(98,'Wifi_Conn_Day','* Numero di connessioni WiFi al giorno','Non Attivo',NULL,NULL,'SQL','Intero','60000','','Network','Disit',NULL,'none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(164,'SelectorWeb','Selector query list with Web links','Non Attivo',NULL,NULL,'none','Testuale','600000','API','MobilitÃ ','Disit','Selector query list with Web links','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(216,'TrafficLight','Demo semaphore','Non Attivo',NULL,NULL,'none','TrafficLight','60000','API',NULL,NULL,'Demo semaphore','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(218,'SpeedLimit','Demo SpeedLimit','Non Attivo',NULL,NULL,'none','SpeedLimit','60000','API',NULL,NULL,'Demo SpeedLimit','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(242,'OperatorEventsList','OperatorEventsList','Non Attivo',NULL,NULL,'none','Testuale','60000','API','MobilitÃ ','Disit','OperatorEventsList','none',0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(307,'Map','Visualizzazione di contenuti provenienti da siti esterni','Non Attivo',NULL,NULL,'none','Testuale','5000','API','Contenuti esterni','Disit','Visualizzazione contenuti provenienti da siti esterni','none',1,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL),(346,'GisWFS','Visualizzazione di contenuti provenienti da siti esterni.','Non attivo',NULL,NULL,'none','Testuale','60000','API','Contenuti Esterni','Disit','Visualizzazione contenuti provenienti da siti esterni','none',1,0,0,NULL,NULL,NULL,0,NULL,NULL,0,'DashboardProcess',NULL,NULL,NULL,'Non Attivo',NULL,NULL);
/*!40000 ALTER TABLE `Descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Domains`
--

LOCK TABLES `Domains` WRITE;
/*!40000 ALTER TABLE `Domains` DISABLE KEYS */;
INSERT INTO `Domains` VALUES (2,'[\'dashboard\']','Snap4CityDocker','dashboards.php?linkId=dashboardsLink','Snap4City','snap4cityPortalLink','false');
/*!40000 ALTER TABLE `Domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `HeatmapRanges`
--

LOCK TABLES `HeatmapRanges` WRITE;
/*!40000 ALTER TABLE `HeatmapRanges` DISABLE KEYS */;
INSERT INTO `HeatmapRanges` VALUES (1,'LAeq','dBA',0,44,49,54,58,62,67,71,76,80,'negative','../img/heatmapsGradientLegends/noise-LAEQ.png','{\"radius\": 15, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.555\": \"cyan\", \"0.61125\": \"green\", \"0.66875\": \"yellowgreen\", \"0.7225\": \"yellow\", \"0.7775\": \"gold\", \"0.83375\": \"orange\", \"0.88875\": \"red\", \"0.945\": \"darkred\", \"1.0\": \"maroon\"}}'),(2,'LAmax','dBA',0,44,49,54,58,62,67,71,76,80,'negative','../img/heatmapsGradientLegends/noise-LAMAX.png','{\"radius\": 15, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.555\": \"cyan\", \"0.61125\": \"green\", \"0.66875\": \"yellowgreen\", \"0.7225\": \"yellow\", \"0.7775\": \"gold\", \"0.83375\": \"orange\", \"0.88875\": \"red\", \"0.945\": \"darkred\", \"1.0\": \"maroon\"}}'),(3,'airTemperature','Â°C',-280,-20,1,10,16,19,22,26,31,34,'negative','../img/heatmapsGradientLegends/temp.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.8280\": \"cyan\", \"0.8949\": \"green\", \"0.9236\": \"yellowgreen\", \"0.9427\": \"yellow\", \"0.9522\": \"gold\", \"0.9618\": \"orange\", \"0.9745\": \"red\", \"0.9904\": \"darkred\", \"1.0\": \"maroon\"}}'),(4,'minTemperature','Â°C',-280,-20,1,10,16,19,22,26,31,34,'negative','../img/heatmapsGradientLegends/temp.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.8280\": \"cyan\", \"0.8949\": \"green\", \"0.9236\": \"yellowgreen\", \"0.9427\": \"yellow\", \"0.9522\": \"gold\", \"0.9618\": \"orange\", \"0.9745\": \"red\", \"0.9904\": \"darkred\", \"1.0\": \"maroon\"}}'),(5,'maxTemperature','Â°C',-280,-20,1,10,16,19,22,26,31,34,'negative','../img/heatmapsGradientLegends/temp.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.8280\": \"cyan\", \"0.8949\": \"green\", \"0.9236\": \"yellowgreen\", \"0.9427\": \"yellow\", \"0.9522\": \"gold\", \"0.9618\": \"orange\", \"0.9745\": \"red\", \"0.9904\": \"darkred\", \"1.0\": \"maroon\"}}'),(6,'minGroundTemperature','Â°C',-280,-20,1,10,16,19,22,26,31,34,'negative','../img/heatmapsGradientLegends/temp.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.8280\": \"cyan\", \"0.8949\": \"green\", \"0.9236\": \"yellowgreen\", \"0.9427\": \"yellow\", \"0.9522\": \"gold\", \"0.9618\": \"orange\", \"0.9745\": \"red\", \"0.9904\": \"darkred\", \"1.0\": \"maroon\"}}'),(7,'airHumidity','%',0,40,45.6,51.2,56.8,62.3,67.9,74.4,80,84.5,'negative','../img/heatmapsGradientLegends/humidity.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.4734\": \"cyan\", \"0.5396\": \"green\", \"0.6059\": \"yellowgreen\", \"0.6722\": \"yellow\", \"0.7373\": \"gold\", \"0.8035\": \"orange\", \"0.8805\": \"red\", \"0.9467\": \"darkred\", \"1.0\": \"maroon\"}}'),(8,'windSpeed','m/s',0,4,8,12,16,20,24,28,32,36,'negative','../img/heatmapsGradientLegends/wind-speed.png','{\"radius\": 15, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.111\": \"cyan\", \"0.222\": \"green\", \"0.333\": \"yellowgreen\", \"0.444\": \"yellow\", \"0.556\": \"gold\", \"0.667\": \"orange\", \"0.778\": \"red\", \"0.889\": \"darkred\", \"1.0\": \"maroon\"}}'),(9,'windGust','m/s',0,3.33333,6.66667,10,13.33333,16.66667,20,23.33333,26.66667,30,'negative','../img/heatmapsGradientLegends/wind-gust.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.111\": \"cyan\", \"0.2223\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4443\": \"yellow\", \"0.5557\": \"gold\", \"0.6667\": \"orange\", \"0.7777\": \"red\", \"0.889\": \"darkred\", \"1.0\": \"maroon\"}}'),(10,'dewPoint','Â°C',-280,-10,-8,-6,-4,-2,0,2,4,6,'negative','../img/heatmapsGradientLegends/dew-point.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.944\": \"cyan\", \"0.951\": \"green\", \"0.958\": \"yellowgreen\", \"0.965\": \"yellow\", \"0.972\": \"gold\", \"0.979\": \"orange\", \"0.986\": \"red\", \"0.993\": \"darkred\", \"1.0\": \"maroon\"}}'),(11,'accidentDensity','num',0,1,2,3,4,5,6,7,8,9,'negative','../img/heatmapsGradientLegends/accident-density-new.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5555\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(12,'airQualityPM10','Âµg/m3',0,11,21,31,41,51,61,71,81,100,'negative','../img/heatmapsGradientLegends/PM10.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.11\": \"cyan\", \"0.21\": \"green\", \"0.31\": \"yellowgreen\", \"0.41\": \"yellow\", \"0.51\": \"gold\", \"0.61\": \"orange\", \"0.71\": \"red\", \"0.81\": \"darkred\", \"1.0\": \"maroon\"}}'),(13,'airQualityNO2','Âµg/m3',0,21,51,71,121,151,181,201,251,300,'negative','../img/heatmapsGradientLegends/NO2.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": { \"0.0\": \"blue\", \"0.07\": \"cyan\", \"0.17\": \"green\", \"0.2367\": \"yellowgreen\", \"0.4033\": \"yellow\", \"0.5033\": \"gold\", \"0.6033\": \"orange\", \"0.67\": \"red\", \"0.8367\": \"darkred\", \"1.0\": \"maroon\"}}'),(14,'airQualityPM2_5','Âµg/m3',0,6,11,16,26,36,41,51,61,70,'negative','../img/heatmapsGradientLegends/PM25.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.0857\": \"cyan\", \"0.1571\": \"green\", \"0.2286\": \"yellowgreen\", \"0.3714\": \"yellow\", \"0.5143\": \"gold\", \"0.5857\": \"orange\", \"0.7286\": \"red\", \"0.8714\": \"darkred\", \"1.0\": \"maroon\"}}'),(16,'airQualityO3','Âµg/m3',0,26,51,71,121,161,181,241,281,320,'negative','../img/heatmapsGradientLegends/O3.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.08125\": \"cyan\", \"0.159375\": \"green\", \"0.221875\": \"yellowgreen\", \"0.378125\": \"yellow\", \"0.503125\": \"gold\", \"0.565625\": \"orange\", \"0.753125\": \"red\", \"0.878125\": \"darkred\", \"1.0\": \"maroon\"}}'),(17,'pressure','hPa',850,960.1,970.7,981.4,992,1002.6,1013.2,1023.9,1034.5,1044.9,'negative','../img/heatmapsGradientLegends/pressure.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.5649\": \"cyan\", \"0.6193\": \"green\", \"0.6742\": \"yellowgreen\", \"0.7286\": \"yellow\", \"0.7830\": \"gold\", \"0.8373\": \"orange\", \"0.8922\": \"red\", \"0.9466\": \"darkred\", \"1.0\": \"maroon\"}}'),(18,'cloudCoverOkta','okta',0,1,2,3,4,5,6,7,8,9,'negative','../img/heatmapsGradientLegends/cloud-cover-okta.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5555\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(19,'cloudCoverPerc','%',0,10,20,30,40,50,60,70,80,90,'negative','../img/heatmapsGradientLegends/cloud-cover-perc.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5555\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(20,'bikeSafety','num',-10,-4,-3,-2,-1,0,1,2,3,4,'positive','../img/heatmapsGradientLegends/safety-on-bike-density-new.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5555\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(21,'wifiPeopleDensity','num',0,28,56,83,111,139,167,194,222,251,'positive','../img/heatmapsGradientLegends/wifi-people-density.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1115\": \"cyan\", \"0.2231\": \"green\", \"0.3307\": \"yellowgreen\", \"0.4422\": \"yellow\", \"0.5538\": \"gold\", \"0.6653\": \"orange\", \"0.7729\": \"red\", \"0.8845\": \"darkred\", \"1.0\": \"maroon\"}}'),(22,'paxcounterPeopleDensity','num',0,10,20,30,40,50,60,70,80,90,'positive','../img/heatmapsGradientLegends/paxcounter-people-density.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5556\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(23,'visibilityIndex','num',0,1,2,3,4,5,6,7,8,9,'positive','../img/heatmapsGradientLegends/visibility-index.png','{\"radius\": 10, \"maxOpacity\": 0.2, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5555\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(24,'visibility','m',0,50,200,500,1000,2000,4000,10000,20000,50000,'positive','../img/heatmapsGradientLegends/visibility.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.001\": \"cyan\", \"0.004\": \"green\", \"0.01\": \"yellowgreen\", \"0.02\": \"yellow\", \"0.04\": \"gold\", \"0.08\": \"orange\",\"0.2\": \"red\",\"0.4\": \"darkred\", \"1.0\": \"maroon\"}}'),(25,'airQualityAQI','num',0,1,2,3,4,5,6,7,8,9,'negative','../img/heatmapsGradientLegends/helsinki-air-quality.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5556\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(26,'PM10','Âµg/m3',0,11,21,31,41,51,61,71,81,100,'negative','../img/heatmapsGradientLegends/PM10.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.11\": \"cyan\", \"0.21\": \"green\", \"0.31\": \"yellowgreen\", \"0.41\": \"yellow\", \"0.51\": \"gold\", \"0.61\": \"orange\", \"0.71\": \"red\", \"0.81\": \"darkred\", \"1.0\": \"maroon\"}}'),(27,'NO2','Âµg/m3',0,21,51,71,121,151,181,201,251,300,'negative','../img/heatmapsGradientLegends/NO2.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": { \"0.0\": \"blue\", \"0.07\": \"cyan\", \"0.17\": \"green\", \"0.2367\": \"yellowgreen\", \"0.4033\": \"yellow\", \"0.5033\": \"gold\", \"0.6033\": \"orange\", \"0.67\": \"red\", \"0.8367\": \"darkred\", \"1.0\": \"maroon\"}}'),(28,'PM2_5','Âµg/m3',0,6,11,16,26,36,41,51,61,70,'negative','../img/heatmapsGradientLegends/PM25.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.0857\": \"cyan\", \"0.1571\": \"green\", \"0.2286\": \"yellowgreen\", \"0.3714\": \"yellow\", \"0.5143\": \"gold\", \"0.5857\": \"orange\", \"0.7286\": \"red\", \"0.8714\": \"darkred\", \"1.0\": \"maroon\"}}'),(29,'airQualityNOx','Âµg/m3',0,1000,5000,10000,15000,20000,25000,30000,35000,40000,'negative','../img/heatmapsGradientLegends/NOx.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.025\": \"cyan\", \"0.125\": \"green\", \"0.25\": \"yellowgreen\", \"0.375\": \"yellow\", \"0.5\": \"gold\", \"0.625\": \"orange\", \"0.75\": \"red\", \"0.875\": \"darkred\", \"1.0\": \"maroon\"}}'),(30,'CAQI','num',0,NULL,NULL,1,2,3,4,NULL,NULL,5,'negative','../img/heatmapsGradientLegends/CAQI.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"yellowgreen\", \"0.25\": \"yellow\", \"0.5\": \"gold\", \"0.75\": \"orange\", \"1.0\": \"darkred\"}}'),(31,'EAQI','num',0,NULL,NULL,1,2,3,4,NULL,NULL,5,'negative','../img/heatmapsGradientLegends/EAQI.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"green\", \"0.25\": \"yellowgreen\", \"0.5\": \"yellow\", \"0.75\": \"orange\", \"1.0\": \"darkred\"}}'),(32,'CO','mg/m3',NULL,NULL,0,2,4,6,8,10,NULL,NULL,'negative','../img/heatmapsGradientLegends/CO.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0\"	 : \"green\", \"0.2\": \"yellowgreen\", \"0.4\": \"yellow\", \"0.6\": \"gold\", \"0.8\": \"orange\", \"1\" : \"red\"}}'),(33,'Benzene','mg/m3',NULL,NULL,0,1,2,3,4,5,NULL,NULL,'negative','../img/heatmapsGradientLegends/benzene.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0\"	 : \"green\", \"0.2\": \"yellowgreen\", \"0.4\": \"yellow\", \"0.6\": \"gold\", \"0.8\": \"orange\", \"1\" : \"red\"}}'),(34,'EnfuserAirQualityIndex','num',0,1,2,3,4,5,6,7,8,9,'negative','../img/heatmapsGradientLegends/enfuserAQI.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.1111\": \"cyan\", \"0.2222\": \"green\", \"0.3333\": \"yellowgreen\", \"0.4444\": \"yellow\", \"0.5556\": \"gold\", \"0.6667\": \"orange\", \"0.7778\": \"red\", \"0.8889\": \"darkred\", \"1.0\": \"maroon\"}}'),(35,'HighDensityEAQI','num',0,NULL,NULL,1,2,3,4,NULL,NULL,5,'negative','../img/heatmapsGradientLegends/EAQI.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"green\", \"0.25\": \"yellowgreen\", \"0.5\": \"yellow\", \"0.75\": \"orange\", \"1.0\": \"darkred\"}}'),(36,'HighDensityNOx','Âµg/m3',0,1000,5000,10000,15000,20000,25000,30000,35000,40000,'negative','../img/heatmapsGradientLegends/NOx.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.025\": \"cyan\", \"0.125\": \"green\", \"0.25\": \"yellowgreen\", \"0.375\": \"yellow\", \"0.5\": \"gold\", \"0.625\": \"orange\", \"0.75\": \"red\", \"0.875\": \"darkred\", \"1.0\": \"maroon\"}}'),(37,'HighDensityPM10','Âµg/m3',0,11,21,31,41,51,61,71,81,100,'negative','../img/heatmapsGradientLegends/PM10.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.11\": \"cyan\", \"0.21\": \"green\", \"0.31\": \"yellowgreen\", \"0.41\": \"yellow\", \"0.51\": \"gold\", \"0.61\": \"orange\", \"0.71\": \"red\", \"0.81\": \"darkred\", \"1.0\": \"maroon\"}}'),(38,'HighDensityPM25','Âµg/m3',0,6,11,16,26,36,41,51,61,70,'negative','../img/heatmapsGradientLegends/PM25.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"blue\", \"0.0857\": \"cyan\", \"0.1571\": \"green\", \"0.2286\": \"yellowgreen\", \"0.3714\": \"yellow\", \"0.5143\": \"gold\", \"0.5857\": \"orange\", \"0.7286\": \"red\", \"0.8714\": \"darkred\", \"1.0\": \"maroon\"}}'),(39,'clickDensity','num',0,NULL,NULL,NULL,NULL,5,10,15,20,25,'positive','../img/heatmapsGradientLegends/hotplaces.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0\"	 : \"yellowgreen\", \"0.2\": \"yellow\", \"0.4\": \"gold\", \"0.6\": \"orange\", \"0.8\": \"red\", \"1\" : \"darkred\"}}'),(40,'airQualitySO2','Âµg/m3',0,NULL,NULL,50,100,200,275,350,425,500,'negative','../img/heatmapsGradientLegends/SO2.png','{\"radius\": 10, \"maxOpacity\": 0.25, \"scaleRadius\": false, \"useLocalExtrema\": false, \"latField\": \"latitude\", \"lngField\": \"longitude\", \"valueField\": \"value\", \"gradient\": {\"0.0\": \"green\", \"0.1\": \"yellowgreen\", \"0.2\": \"yellow\", \"0.4\": \"gold\", \"0.55\": \"orange\", \"0.7\": \"red\", \"0.85\": \"darkred\", \"1\": \"maroon\"}}');
/*!40000 ALTER TABLE `HeatmapRanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Organizations`
--

LOCK TABLES `Organizations` WRITE;
/*!40000 ALTER TABLE `Organizations` DISABLE KEYS */;
INSERT INTO `Organizations` VALUES (1,'Firenze','https://servicemap.disit.org/WebAppGrafo/api/v1/','43.769710, 11.255751',11,'ita',NULL,NULL,NULL),(4,'DISIT','https://servicemap.disit.org/WebAppGrafo/api/v1/','43.769710, 11.255751',11,'ita',NULL,NULL,NULL),(5,'Toscana','https://servicemap.disit.org/WebAppGrafo/api/v1/','43.769710, 11.255751',11,'ita',NULL,NULL,NULL),(6,'Other','https://servicemap.disit.org/WebAppGrafo/api/v1/','43.769710, 11.255751',11,'ita',NULL,NULL,NULL),(7,'Organization','http://dashboard/ServiceMap/api/v1/','43.769710, 11.255751',11,'eng',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Widgets`
--

LOCK TABLES `Widgets` WRITE;
/*!40000 ALTER TABLE `Widgets` DISABLE KEYS */;
INSERT INTO `Widgets` VALUES (1,'widgetBarContent','widgetBarContent.php',1,50,1,50,'Percentuale','',1,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"#ffcc00\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 6,\n	\"size_rows\" : 3,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','yes','no','no','no','no','no','no','no'),(2,'widgetColumnContent','widgetColumnContent.php',1,50,1,50,'Percentuale','',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"#ffcc00\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','yes','no','no','no','no','no','no','no'),(3,'widgetEvents','widgetEvents.php',1,50,1,50,'Testuale','List_Events_FI_Day',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(4,'widgetGaugeChart','widgetGaugeChart.php',1,50,1,50,'Intero|Percentuale|Float','',1,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"#ffcc00\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','yes','yes','yes','no','no','yes','yes','no'),(5,'widgetRadarSeries','widgetRadarSeries.php',1,50,1,50,'Series','',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(6,'widgetFirstAid','widgetFirstAid.php',1,50,1,50,'Testuale','FirstAid',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(45,'widgetNumericKeyboard','widgetNumericKeyboard.php',1,50,1,50,'[\'Float\', \'Integer\']','',0,0,0,NULL,'actuator','yes','[\'singleNumericValue\']','{}','no','no','no','no','no','no','no','no','no'),(8,'widgetTimeTrendCompare','widgetTimeTrendCompare.php',1,50,1,50,'Intero|Percentuale|Float','',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 11,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 11,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 11,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 8,\n	\"size_rows\" : 4,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : \"Giornaliera\",\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','yes','yes','yes','no','yes','no','no','no'),(9,'widgetPieChart','widgetPieChart.php',1,50,1,50,'Series','',1,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','no','no','no','no','no','no','no','no'),(10,'widgetAlarms','widgetAlarms.php',1,50,1,50,'Testuale','Alarms',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(11,'widgetPrevMeteo','widgetPrevMeteo.php',1,50,1,50,'Testuale','Previ_Meteo',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(44,'widgetOperatorEventsList','widgetOperatorEventsList.php',1,50,1,50,'Testuale','OperatorEventsList',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(13,'widgetSingleContent','widgetSingleContent.php',1,50,1,50,'Intero|Percentuale|Float|Testuale','',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"size_rows\": 6,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": \"\",\n	\"udmPos\": \"below\",\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": null,\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}','yes','no','no','no','no','no','no','no','no'),(14,'widgetSmartDS','widgetSmartDS.php',1,50,1,50,'Percentuale','',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"size_rows\": 2,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": null,\n	\"udmPos\": null,\n	\"fontSize\": 12,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}','yes','no','no','no','no','no','no','no','no'),(15,'widgetSpeedometer','widgetSpeedometer.php',1,50,1,50,'Intero|Percentuale|Float','',1,1,1,NULL,'dataViewer','no',NULL,'{\n	\"size_rows\": 6,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": \"\",\n	\"udmPos\": \"below\",\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\" : \"rgba(51, 204, 255,1)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}','yes','yes','yes','yes','no','no','yes','no','no'),(16,'widgetTimeTrend','widgetTimeTrend.php',1,50,1,50,'Intero|Percentuale|Float|isAlive','',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 11,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 11,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 11,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 8,\n	\"size_rows\" : 4,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : \"Giornaliera\",\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','yes','yes','yes','yes','yes','no','no','no'),(17,'widgetTrendMentions','widgetTrendMentions.php',1,50,1,50,'Testuale','MentionsTrends_FI_Day',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : 0,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 9,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','no','no','no','no','no','no','no','no'),(18,'widgetStateRideAtaf','widgetStateRideAtaf.php',1,50,1,50,'Percentuale','',0,1,1,'{\n	\"dimMap\" : [\n		{\n			\"cols\" : 4,\n			\"rows\" : 4\n		},\n		{\n			\"cols\" : 5,\n			\"rows\" : 5\n		},\n		{\n			\"cols\" : 6,\n			\"rows\" : 6\n		},\n		{\n			\"cols\" : 7,\n			\"rows\" : 7\n		},\n		{\n			\"cols\" : 8,\n			\"rows\" : 8\n		}\n	]\n}','dataViewer','no',NULL,'{\n	\"size_rows\": 4,\n	\"size_columns\": 4,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": \"\",\n	\"udmPos\": \"below\",\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": -1,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}','yes','no','no','no','no','no','no','no','no'),(20,'widgetButton','widgetButton.php',1,50,1,50,'Button','',1,0,1,NULL,'dataViewer','no',NULL,'{}','no','no','no','no','no','no','no','no','no'),(21,'widgetEvacuationPlans','widgetEvacuationPlans.php',1,50,1,50,'Testuale','EvacuationPlans',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(22,'widgetProcess','widgetProcess.php',1,50,1,50,'Testuale','Process',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(23,'widgetProtezioneCivile','widgetProtezioneCivile.php',1,50,1,50,'Testuale','ProtezioneCivile',0,1,1,'','dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : 1,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"genTabFontColor\\\" : \\\"#000000\\\",\\\"genTabFontSize\\\" : \\\"14\\\",\\\"meteoTabFontSize\\\" : \\\"18\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','no','no','no','no','no','no','no','no'),(24,'widgetExternalContent','widgetExternalContent.php',1,50,1,50,'Testuale','ExternalContent',0,1,1,'','dataViewer','no','[\'webContent\']','{}','no','no','no','no','no','no','no','no','no'),(25,'widgetTable','widgetTable.php',1,50,1,50,'Series','',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(26,'widgetLineSeries','widgetLineSeries.php',1,50,1,50,'Series','',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(27,'widgetCurvedLineSeries','widgetCurvedLineSeries.php',1,50,1,50,'Series','',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','yes','yes','yes','yes','no','no','no'),(28,'widgetBarSeries','widgetBarSeries.php',1,50,1,50,'Series','',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(29,'widgetTrafficEvents','widgetTrafficEvents.php',1,50,1,50,'Testuale','TrafficEvents',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(30,'widgetResources','widgetResources.php',1,50,1,50,'Testuale','Resources',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(31,'widgetNetworkAnalysis','widgetNetworkAnalysis.php',1,50,1,50,'Testuale','NetworkAnalysis',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(32,'widgetClock','widgetClock.php',1,50,1,50,'Testuale','Clock',0,1,1,NULL,'dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 24,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : \"{\\\"clockData\\\" : \\\"dateTime\\\",\\\"clockFont\\\" : \\\"normal\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','no','no','no','no','no','no','no','no','no'),(33,'widgetSeparator','widgetSeparator.php',1,50,1,50,'Separator','',1,0,1,NULL,'dataViewer','no',NULL,'{}','no','no','no','no','no','no','no','no','no'),(34,'widgetSelector','widgetSelector.php',1,50,1,50,'Testuale','Selector',0,1,1,NULL,'dataViewer','no',NULL,'{}','no','no','no','no','no','no','no','no','no'),(36,'widgetServerStatus','widgetServerStatus.php',1,50,1,50,'isAlive','',0,1,1,NULL,'dataViewer','no',NULL,'{\"size_rows\": 5, \"size_columns\": 3, \"color_w\": \"rgba(255,255,255,1)\", \"frequency_w\": 600, \"temporal_range_w\": null, \"municipality_w\": null, \"infoMessage_w\": null, \"link_w\": \"none\", \"parameters\": null, \"udm\": \"\", \"udmPos\": \"below\", \"fontSize\": 36, \"fontColor\": \"#000000\", \"frame_color_w\": \"rgb(51, 204, 255)\", \"controlsPosition\": null, \"showTitle\": \"yes\", \"controlsVisibility\": null, \"zoomFactor\": null, \"zoomControlsColor\": null, \"defaultTab\": null, \"scaleX\": null, \"scaleY\": null, \"headerFontColor\": \"rgba(255,255,255,1)\", \"styleParameters\": null, \"infoJson\": null, \"serviceUri\": null, \"viewMode\": null, \"hospitalList\": null, \"lastSeries\": null, \"notificatorRegistered\": \"no\", \"notificatorEnabled\": \"no\", \"oldParameters\": null, \"enableFullscreenTab\": \"no\", \"enableFullscreenModal\": \"no\", \"fontFamily\": \"Auto\", \"entityJson\": null, \"attributeName\": null, \"canceller\": null, \"lastEditDate\": null, \"cancelDate\": null, \"actuatorTarget\": null, \"actuatorEntity\": null, \"actuatorAttribute\": null, \"chartColor\": null, \"dataLabelsFontSize\": 12, \"dataLabelsFontColor\": null, \"chartLabelsFontSize\": 12, \"chartLabelsFontColor\": null}','yes','no','no','no','no','no','no','no','no'),(37,'widgetKnob','widgetKnob.php',1,50,1,50,'[\'Float\', \'Integer\']','',0,0,0,NULL,'actuator','yes','[\'contRange\']','{}','no','no','no','no','no','no','no','no','no'),(38,'widgetSelectorWeb','widgetSelectorWeb.php',1,50,1,50,'Testuale','SelectorWeb',0,1,1,NULL,'dataViewer','no',NULL,'{}','no','no','no','no','no','no','no','no','no'),(39,'widgetOnOffButton','widgetOnOffButton.php',1,50,1,50,'[\'Float\', \'Integer\', \'Boolean\', \'String\']','',0,0,1,NULL,'actuator','yes','[\'onOff\']','{}','no','no','no','no','no','no','no','no','no'),(40,'widgetTrafficLight','widgetTrafficLight.php',1,50,1,50,'TrafficLight','TrafficLight',0,0,0,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(42,'widgetSpeedLimit','widgetSpeedLimit.php',1,50,1,50,'SpeedLimit|Intero','',0,0,0,NULL,'dataViewer','no',NULL,'{\n	\"size_rows\": 6,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": null,\n	\"udmPos\": null,\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}','yes','no','no','no','no','no','no','no','no'),(43,'widgetImpulseButton','widgetImpulseButton.php',1,50,1,50,'[\'Float\', \'Integer\', \'Boolean\', \'String\']','',0,0,0,NULL,'actuator','yes','[\'impulse\']','{}','no','no','no','no','no','no','no','no','no'),(46,'widgetGeolocator','widgetGeolocator.php',1,50,1,50,'Geolocator','',0,0,0,NULL,'actuator','yes','[\'geolocator\']','{}','no','no','no','no','no','no','no','no','no'),(47,'widgetTracker','widgetTracker.php',1,50,1,50,'Testuale','Tracker',0,1,1,'','dataViewer','no','[\'tracker\']','{}','no','no','no','no','no','no','no','no','no'),(57,'widgetCarrierPosition','widgetCarrierPosition.php',1,50,1,50,'Intero|Float|Testuale','',0,1,1,NULL,'dataViewer','no',NULL,NULL,'no','no','no','no','no','no','no','no','no'),(56,'widgetTrafficEventsNew','widgetTrafficEventsNew.php',1,50,1,50,'Testuale','TrafficEvents',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(55,'widgetSelectorNew','widgetSelectorNew.php',1,50,1,50,'Testuale','Selector',0,1,1,NULL,'dataViewer','no',NULL,'{}','no','no','no','no','no','no','no','no','no'),(54,'widgetResourcesNew','widgetResourcesNew.php',1,50,1,50,'Testuale','Resources',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(53,'widgetOperatorEventsListNew','widgetOperatorEventsListNew.php',1,50,1,50,'Testuale','OperatorEventsList',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(52,'widgetEventsNew','widgetEventsNew.php',1,50,1,50,'Testuale','List_Events_FI_Day',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(51,'widgetEvacuationPlansNew','widgetEvacuationPlansNew.php',1,50,1,50,'Testuale','EvacuationPlans',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(50,'widgetAlarmsNew','widgetAlarmsNew.php',1,50,1,50,'Testuale','Alarms',0,1,1,NULL,'dataViewer','no',NULL,'{}','yes','no','no','no','no','no','no','no','no'),(49,'widgetMap','widgetMap.php',1,50,1,50,'Testuale','Map',0,1,1,'','dataViewer','no','[\'webContent\']','{}','no','no','no','no','no','no','no','yes','no'),(58,'widgetProtezioneCivileFirenze','widgetProtezioneCivileFirenze.php',1,50,1,50,'Testuale','ProtezioneCivileFirenze',0,1,1,'','dataViewer','no',NULL,'{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : 1,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"genTabFontColor\\\" : \\\"#000000\\\",\\\"genTabFontSize\\\" : \\\"14\\\",\\\"meteoTabFontSize\\\" : \\\"18\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','yes','no','no','no','no','no','no','no','no'),(59,'widgetGisWFS','widgetGisWFS.php',1,50,1,50,'Testuale','GisWFS',0,1,1,NULL,'dataViewer','no','[\'webContent\']','{}','no','no','no','no','no','no','no','no','no');
/*!40000 ALTER TABLE `Widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `WidgetsIconsMap`
--

LOCK TABLES `WidgetsIconsMap` WRITE;
/*!40000 ALTER TABLE `WidgetsIconsMap` DISABLE KEYS */;
INSERT INTO `WidgetsIconsMap` VALUES (2,'widgetAlarms','widgetExternalContent','selectorcriticalevents','alarm-widget.png','Mono','List of critical events in the city of Florence, ESB Resolute','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','AlarmsAndMap','dataViewer'),(3,'widgetBarContent','','percentage','bar-content-horizontal.png','Mono','Horizontal single bar graph','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"#ffcc00\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 6,\n	\"size_rows\" : 3,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(4,'widgetBarSeries','','series, integer, percentage, float','bar-content.png','Multi','Graph with multiple vertical bars','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 10,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 300,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"barsColors\\\":[],\\\"barsColorsSelect\\\":\\\"auto\\\",\\\"chartType\\\":\\\"vertical\\\",\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"dataLabels\\\":\\\"value\\\",\\\"dataLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"dataLabelsFontSize\\\":\\\"10\\\",\\\"dataLabelsRotation\\\":\\\"horizontal\\\",\\\"legendFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"legendFontSize\\\":\\\"10\\\",\\\"rowsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"rowsLabelsFontSize\\\":\\\"10\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(7,'widgetBarSeries','','series, integer, percentage, float','bar-horizontal-content.png','Multi','Graph with multiple horizontal bars','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 10,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 300,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"barsColors\\\":[],\\\"barsColorsSelect\\\":\\\"auto\\\",\\\"chartType\\\":\\\"horizontal\\\",\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"dataLabels\\\":\\\"value\\\",\\\"dataLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"dataLabelsFontSize\\\":\\\"10\\\",\\\"dataLabelsRotation\\\":\\\"horizontal\\\",\\\"legendFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"legendFontSize\\\":\\\"10\\\",\\\"rowsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"rowsLabelsFontSize\\\":\\\"10\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(8,'widgetButton','','webpage, microapp, webpagebuspos, webpagefiwifi, webpagekmapp, webpagerttv, webpagesm3d, webpagetf, webpagetv, webpagesm','button-widget.png','Mono','Single selection of external service or micro application shown on external Web page','true','no','{  \n   \"size_rows\":6,\n   \"size_columns\":3,\n   \"color_w\":\"rgb(51, 204, 255)\",\n   \"frequency_w\":null,\n   \"temporal_range_w\":null,\n   \"municipality_w\":null,\n   \"infoMessage_w\":null,\n   \"link_w\":\"none\",\n   \"parameters\":\"{\\\"changeMetricTargetsJson\\\":{},\\\"geoTargetsJson\\\":[]}\",\n   \"udm\":null,\n   \"udmPos\":null,\n   \"fontSize\":14,\n   \"fontColor\":\"rgba(0,0,0,1)\",\n   \"frame_color_w\":\"rgb(51, 204, 255)\",\n   \"controlsPosition\":null,\n   \"showTitle\":\"no\",\n   \"controlsVisibility\":null,\n   \"zoomFactor\":null,\n   \"zoomControlsColor\":null,\n   \"defaultTab\":null,\n   \"scaleX\":null,\n   \"scaleY\":null,\n   \"headerFontColor\":\"#FFFFFF\",\n   \"styleParameters\":\"{\\\"borderRadius\\\":\\\"0\\\",\\\"hasImage\\\":\\\"no\\\",\\\"showText\\\":\\\"yes\\\"}\",\n   \"infoJson\":null,\n   \"serviceUri\":null,\n   \"viewMode\":null,\n   \"hospitalList\":null,\n   \"lastSeries\":null,\n   \"notificatorRegistered\":\"no\",\n   \"notificatorEnabled\":\"no\",\n   \"oldParameters\":null,\n   \"enableFullscreenTab\":\"no\",\n   \"enableFullscreenModal\":\"no\",\n   \"fontFamily\":\"Auto\",\n   \"entityJson\":null,\n   \"attributeName\":null,\n   \"canceller\":null,\n   \"lastEditDate\":null,\n   \"cancelDate\":null,\n   \"actuatorTarget\":null,\n   \"actuatorEntity\":null,\n   \"actuatorAttribute\":null,\n   \"chartColor\":null,\n   \"dataLabelsFontSize\":null,\n   \"dataLabelsFontColor\":null,\n   \"chartLabelsFontSize\":null,\n   \"chartLabelsFontColor\":null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(9,'widgetClock','','special current time','clock-widget.png','Mono','Clock or Time','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 24,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : \"{\\\"clockData\\\" : \\\"dateTime\\\",\\\"clockFont\\\" : \\\"normal\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(10,'widgetColumnContent','','percentage','bar-content-vertical.png','Mono','Vertical single bar graph, value of coverage, filling, percentage of filling, etc.','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"#ffcc00\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#FFFFFF\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(13,'widgetEvacuationPlans','widgetExternalContent','selectorevacuation','evacuation-plans.png','Mono','List of suggested plans of evacuation represented in a map','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','EvacuationPlansAndMap','dataViewer'),(15,'widgetEvents','widgetExternalContent','selectorevent','events-widget.png','Mono','List of entertainment events with a map showing the position of the listed events','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','EventsAndMap','dataViewer'),(16,'widgetExternalContent','','webpage, microapp, webpagebuspos, webpagefiwifi, webpagekmapp, webpagerttv, webpagesm, webpagesm3d, webpagetf, webpagetv','external-content.png','Mono','Single embedded webpage showing content coming from external sources, the external service to be shown has to be provided','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(17,'widgetExternalContent','','webpagebuspos','bus-position-rt.png','Mono','Map showing the real time position of busses in Florence','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(18,'widgetExternalContent','','webpagefiwifi','heat-map.png','Mono','map showing in real time the number of people connected to the free wifi in Florence with Heatmap of places','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(19,'widgetExternalContent','','webpagesm3d','service-map-3d.png','Mono','Service Map in 3D','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(20,'widgetExternalContent','','webpagetf','traffic-flow-reconstruction.png','Mono','Traffic flow reconstruction in real time in Florence based on data from traffic sensors','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(21,'widgetExternalContent','','webpagerttv','twitter-vigilance-RT.png','Mono','Twitter social media channels monitoring with sentiment analysis in real time, per channel or per search','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(22,'widgetExternalContent','','webpagetv','twitter-vigilance.png','Mono','Twitter social media channels daily monitoring, per channel or per search','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(23,'widgetFirstAid','','special-first-aid','first-aid.png','Multi','Table representing the real time status of the first aid cues (triage) in hospitals in Tuscany, divided per emergency color code. Multiple names of hospitals have to be provided as parameters','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 18,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 8,\n	\"size_rows\" : 8,\n	\"styleParameters\" : \"{\\\"showTableFirstCell\\\":\\\"yes\\\",\\\"tableFirstCellFontSize\\\":\\\"10\\\",\\\"tableFirstCellFontColor\\\":\\\"#000000\\\",\\\"rowsLabelsFontSize\\\":\\\"10\\\",\\\"rowsLabelsFontColor\\\":\\\"#000000\\\",\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"rowsLabelsBckColor\\\":\\\"#FFFFFF\\\",\\\"colsLabelsBckColor\\\":null,\\\"tableBorders\\\":\\\"no\\\",\\\"tableBordersColor\\\":\\\"rgba(238,238,238,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"hospitalsOverview\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(24,'widgetFirstAid','','special-first-aid','first-aid-simple-data-single-hospital.png','Mono','Total status of the cue to access the first aid per single hospital, the name of the hospital has to be provided','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 24,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 6,\n	\"size_rows\" : 3,\n	\"styleParameters\" : \"{\\\"colsLabelsBckColor\\\":null,\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"rowsLabelsBckColor\\\":\\\"#FFFFFF\\\",\\\"rowsLabelsFontColor\\\":\\\"#000000\\\",\\\"rowsLabelsFontSize\\\":\\\"10\\\",\\\"showTableFirstCell\\\":\\\"yes\\\",\\\"tableBorders\\\":\\\"no\\\",\\\"tableBordersColor\\\":\\\"rgba(238,238,238,1)\\\",\\\"tableFirstCellFontColor\\\":\\\"#000000\\\",\\\"tableFirstCellFontSize\\\":\\\"10\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"singleSummary\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(25,'widgetFirstAid','','special-first-aid','first-aid-multiple-data-single-hospital.png','Mono','Table representing the real time status of the first aid cues in a single hospital in Tuscany, divided per emergency color code. name of t he hospital has to be provided','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 14,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 8,\n	\"styleParameters\" : \"{\\\"showTableFirstCell\\\":null,\\\"tableFirstCellFontSize\\\":null,\\\"tableFirstCellFontColor\\\":null,\\\"rowsLabelsFontSize\\\":null,\\\"rowsLabelsFontColor\\\":null,\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"rowsLabelsBckColor\\\":null,\\\"colsLabelsBckColor\\\":null,\\\"tableBorders\\\":\\\"no\\\",\\\"tableBordersColor\\\":\\\"rgba(238,238,238,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"singleDetails\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(26,'widgetGaugeChart','','float, integer, percentage, degree, gluco','gauge-widget.png','Mono','Gauge graph','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"#ffcc00\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(27,'widgetImpulseButton','','float-act, integer-act, bool-act, status-act, string-act','impulse-button-widget.png','Mono','Impulsive button (actuator)','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 14,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"baseValue\\\":\\\"Red\\\",\\\"impulseMode\\\":\\\"singlePress\\\",\\\"impulseValue\\\":\\\"Green\\\"}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 2,\n	\"size_rows\" : 4,\n	\"styleParameters\" : \"{\\\"buttonRadius\\\":\\\"0\\\",\\\"clickColor\\\":\\\"rgba(214,214,214,1)\\\",\\\"color\\\":\\\"rgba(214,214,214,1)\\\",\\\"displayColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"displayFontClickColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayFontColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayFontSize\\\": \\\"24\\\",\\\"displayHeight\\\":\\\"40\\\",\\\"displayRadius\\\":\\\"0\\\",\\\"displayWidth\\\":\\\"80\\\",\\\"neonEffect\\\":\\\"pressedStatus\\\",\\\"symbolClickColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"symbolColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"textClickColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"textColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"textFontSize\\\":\\\"24\\\",\\\"viewMode\\\":\\\"iconAndText\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'actuator'),(28,'widgetKnob','','float-act, integer-act','actuator-knob.png','Mono','Dimmer (actuator)','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#FFFFFF\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 18,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"continuousRanges\\\":null,\\\"dataPrecision\\\":2,\\\"domainType\\\":\\\"continuous\\\",\\\"maxValue\\\":\\\"100\\\",\\\"minValue\\\":\\\"0\\\"}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : \"{\\\"displayColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"displayRadius\\\":\\\"30\\\",\\\"endAngle\\\":\\\"130\\\",\\\"increaseValue\\\":\\\"10\\\",\\\"indicatorRadius\\\":\\\"15\\\",\\\"labelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"labelsFontSize\\\":\\\"10\\\",\\\"startAngle\\\":\\\"230\\\",\\\"ticksColor\\\":\\\"rgba(191,191,191,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'actuator'),(31,'widgetNetworkAnalysis','widgetExternalContent','selectornetworkanalysis','network-analysis.png','Mono','List showing the critical nodes in the public bus lines in Florence evaluated on the basis of the real time traffic status, it includes a map','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','NetworkAnalysisAndMap','dataViewer'),(32,'widgetNumericKeyboard','','float-act, integer-act','keypad.png','Mono','Numeric keypad (actuator)','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 14,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\":null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 8,\n\"styleParameters\":\"{\\\"btnColor\\\":\\\"rgba(225,225,225,1)\\\",\\\"btnFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"displayColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayFontColor\\\":\\\"rgba(0,0,0,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'actuator'),(33,'widgetOnOffButton','','float-act, integer-act, bool-act, status-act, string-act','switch.png','Mono','On/Off switch (actuator)','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 14,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"offValue\\\":\\\"Off\\\",\\\"onValue\\\":\\\"On\\\"}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 2,\n	\"size_rows\" : 4,\n	\"styleParameters\": \"{\\\"buttonRadius\\\":\\\"0\\\",\\\"displayColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"displayFontSize\\\":\\\"24\\\",\\\"displayHeight\\\":\\\"40\\\",\\\"displayOffColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayOnColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayRadius\\\":\\\"0\\\",\\\"displayWidth\\\":\\\"80\\\",\\\"neonEffect\\\":\\\"never\\\",\\\"offColor\\\":\\\"rgba(255,0,0,1)\\\",\\\"onColor\\\":\\\"rgba(102,255,102,1)\\\",\\\"symbolOffColor\\\":\\\"rgba(37,37,37,1)\\\",\\\"symbolOnColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"textFontSize\\\":\\\"24\\\",\\\"textOffColor\\\":\\\"rgba(37,37,37,1)\\\",\\\"textOnColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"viewMode\\\":\\\"displayAndText\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'actuator'),(34,'widgetOperatorEventsList','widgetExternalContent','selectoroperatorevents','eventlistwithmap.png','Mono','List of events managed by a city operator, a selector targeting a Map','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','OperatorEventsAndMap','dataViewer'),(37,'widgetPrevMeteo','','special weather','meteo-widget-compact.png','Mono','widget showing the meteo forecast for the whole Tuscany Region, compact view','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : \"FIRENZE\",\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"no\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 4,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"today\\\",\\\"todayDim\\\":\\\"50\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(38,'widgetProcess','','status','processstatus.png','Mono','Status of a scheduler process, single process identifier has to be provided','false','no',NULL,NULL,'no','[\"no\"]',NULL,'dataViewer'),(39,'widgetProtezioneCivile','','special civilprotection','civil-protection-alert.png','Mono','Civivl protection alerts and emergency color code','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : 1,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"genTabFontColor\\\" : \\\"#000000\\\",\\\"genTabFontSize\\\" : \\\"14\\\",\\\"meteoTabFontSize\\\" : \\\"18\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(41,'widgetResources','widgetExternalContent','selectortramline','metroposition.png','Mono','Position of the metro line trains in Florence','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','ResourcesAndMap','dataViewer'),(43,'widgetSelector','widgetExternalContent','selector, map, sensor_map, mypoi_map','selector-widget.png','Multi','Widget showing a list of point of interests categories with a map showing the position of the POIs, a set of sources have to be provided','true','yes','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 16,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"queries\\\":[],\\\"targets\\\":[]}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"activeFontColor\\\":\\\"rgba(0,0,0,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"gisTarget\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','yes','[\"yes\"]','SelectorAndMap','dataViewer'),(45,'widgetSelectorWeb','widgetExternalContent','selector, microapp, map, webpagerttv, webpagetv, webpagetf, webpagesm3d, webpagesm, webpagekmapp, webpage, webpagefiwifi, webpagebuspos ','selector-web.png','Multi','Widget showing a list of External Services via URL, a set of links/URLS has to be provided','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 16,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"queries\\\":[],\\\"targets\\\":[]}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"activeFontColor\\\":\\\"rgba(0,0,0,1)\\\", \\\"rectDim\\\":\\\"4\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[\n	{\n		\"actuatorAttribute\" : null,\n		\"actuatorEntity\" : null,\n		\"actuatorTarget\" : null,\n		\"attributeName\" : null,\n		\"cancelDate\" : null,\n		\"canceller\" : null,\n		\"chartColor\" : null,\n		\"chartLabelsFontColor\" : null,\n		\"chartLabelsFontSize\" : null,\n		\"color_w\" : \"#FFFFFF\",\n		\"controlsPosition\" : \"topLeft\",\n		\"controlsVisibility\" : \"alwaysVisible\",\n		\"dataLabelsFontColor\" : null,\n		\"dataLabelsFontSize\" : null,\n		\"defaultTab\" : null,\n		\"enableFullscreenModal\" : \"yes\",\n		\"enableFullscreenTab\" : \"yes\",\n		\"entityJson\" : null,\n		\"fontColor\" : \"#ffffff\",\n		\"fontFamily\" : \"Auto\",\n		\"fontSize\" : null,\n		\"frame_color_w\" : \"rgb(51, 204, 255)\",\n		\"frequency_w\" : null,\n		\"headerFontColor\" : \"#FFFFFF\",\n		\"hospitalList\" : null,\n		\"infoJson\" : null,\n		\"infoMessage_w\" : null,\n		\"lastEditDate\" : null,\n		\"lastSeries\" : null,\n		\"link_w\" : \"{\\\"homepage\\\":\\\"about:blank\\\",\\\"widgetMode\\\":\\\"selectorWebTarget\\\"}\",\n		\"municipality_w\" : null,\n		\"notificatorEnabled\" : \"no\",\n		\"notificatorRegistered\" : \"no\",\n		\"oldParameters\" : null,\n		\"parameters\" : null,\n		\"scaleX\" : 1,\n		\"scaleY\" : 1,\n		\"serviceUri\" : null,\n		\"showTitle\" : \"yes\",\n		\"size_columns\" : 10,\n		\"size_rows\" : 10,\n		\"styleParameters\" : null,\n		\"temporal_range_w\" : null,\n		\"udm\" : null,\n		\"udmPos\" : null,\n		\"viewMode\" : \"map\",\n		\"zoomControlsColor\" : null,\n		\"zoomFactor\" : 1\n	}\n]','yes','[\"yes\"]','SelectorWebAndMap','dataViewer'),(47,'widgetServerStatus','','status','webstatus.png','Mono','Widget representing the status of a website, a target web server has to be selected','false','no','{\"size_rows\": 5, \"size_columns\": 3, \"color_w\": \"rgba(255,255,255,1)\", \"frequency_w\": 600, \"temporal_range_w\": null, \"municipality_w\": null, \"infoMessage_w\": null, \"link_w\": \"none\", \"parameters\": null, \"udm\": \"\", \"udmPos\": \"below\", \"fontSize\": 36, \"fontColor\": \"#000000\", \"frame_color_w\": \"rgb(51, 204, 255)\", \"controlsPosition\": null, \"showTitle\": \"yes\", \"controlsVisibility\": null, \"zoomFactor\": null, \"zoomControlsColor\": null, \"defaultTab\": null, \"scaleX\": null, \"scaleY\": null, \"headerFontColor\": \"rgba(255,255,255,1)\", \"styleParameters\": null, \"infoJson\": null, \"serviceUri\": null, \"viewMode\": null, \"hospitalList\": null, \"lastSeries\": null, \"notificatorRegistered\": \"no\", \"notificatorEnabled\": \"no\", \"oldParameters\": null, \"enableFullscreenTab\": \"no\", \"enableFullscreenModal\": \"no\", \"fontFamily\": \"Auto\", \"entityJson\": null, \"attributeName\": null, \"canceller\": null, \"lastEditDate\": null, \"cancelDate\": null, \"actuatorTarget\": null, \"actuatorEntity\": null, \"actuatorAttribute\": null, \"chartColor\": null, \"dataLabelsFontSize\": 12, \"dataLabelsFontColor\": null, \"chartLabelsFontSize\": 12, \"chartLabelsFontColor\": null}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(49,'widgetSingleContent','','integer, percentage, float, status, bool, string, degree, gluco, integer-mykpi, percentage-mykpi, float-mykpi,  status-mykpi, bool-mykpi, string-mykpi, degree-mykpi, gluco-mykpi','single-content.png','Mono','Widget showing a single content that can be a number or a text','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \" \",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(50,'widgetSmartDS','','special smartds','italian-flag.png','Mono','Widget connected to the Smart Decision Support System represented as an Italian flag, special widget representign a decision process from SmartDS tool, modeling System Thinking decision support graphs','true','no','{\n	\"size_rows\": 2,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": null,\n	\"udmPos\": null,\n	\"fontSize\": 12,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(51,'widgetSpeedLimit','','integer','speed-limit.png','Mono','Widget showing a speed limit plate','false','no','{\n	\"size_rows\": 6,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": null,\n	\"udmPos\": null,\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(52,'widgetSpeedometer','','float, integer, percentage, degree, gluco','speedometer.png','Mono','Speedometer graph, suggested for energy, values, power, workload, etc. ','true','no','{\n	\"size_rows\": 6,\n	\"size_columns\": 3,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": \"\",\n	\"udmPos\": \"below\",\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\" : \"rgba(51, 204, 255,1)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(53,'widgetStateRideAtaf','','special tplquality','TPLqualityofservice.png','Mono','Percentage of busses in time in Florence with respect to the scheduled timetable, quality of service for public transportation KPI','true','no','{\n	\"size_rows\": 4,\n	\"size_columns\": 4,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 600,\n	\"temporal_range_w\": null,\n    \"municipality_w\": null,\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": \"\",\n	\"udmPos\": \"below\",\n	\"fontSize\": 36,\n	\"fontColor\": \"#000000\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"yes\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": -1,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": null,\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(55,'widgetTimeTrend','','float, integer, percentage, status, degree, gluco, integer-mykpi, percentage-mykpi, float-mykpi,  status-mykpi, bool-mykpi, string-mykpi, degree-mykpi, gluco-mykpi','trend.png','Mono','Time trend graph','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 11,\n    \"chartPlaneColor\": \"rgba(238, 238, 238, 1)\",\n    \"chartAxesColor\": \"rgba(238, 238, 238, 1)\",\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 11,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 11,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 8,\n	\"size_rows\" : 4,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : \"Giornaliera\",\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(56,'widgetTimeTrendCompare','','float, integer, percentage','trend-compare.png','Mono','Time trand graph compared with the historical values ','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 11,\n    \"chartPlaneColor\": \"rgba(238, 238, 238, 1)\",\n    \"chartAxesColor\": \"rgba(238, 238, 238, 1)\",\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 11,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 11,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 8,\n	\"size_rows\" : 4,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : \"Giornaliera\",\n	\"udm\" : \"\",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(58,'widgetTrafficEvents','widgetExternalContent','selectortrafficevent','trafficEventfromGestoreMAP.png','Mono','List of traffic events with a map showing the position  of the selected events, selector that automatically includes the map','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 12,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"choosenOption\\\":\\\"events\\\",\\\"defaultCategory\\\":\\\"none\\\",\\\"events\\\":50,\\\"time\\\":90,\\\"timeUdm\\\":\\\"MINUTE\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"map\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"map\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}]','no','[\"yes\"]','TrafficEventsAndMap','dataViewer'),(60,'widgetTrendMentions','','special tvhashtag','twitter-quotes.png','Mono','Widget showing the most cited hastags in the Twitter Vigilance, a Twitter Vigilance Channel or Search has to be specified, such as: Florence channel','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : 0,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 9,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(61,'widgetTrendMentions','','special tvcitation','twitter-trend.png','Mono','Widget showing the most cited users in a Twitter Vigilance channel, a Twitter Vigilance channel has to be specified such as: Firenze','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : 1,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 9,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(62,'widgetExternalContent','','webpagekmapp','webapp.png','Mono','Km4City Web application in HTML5','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(63,'widgetSingleContent','widgetTimeTrend','integer, percentage, float','values-trends-template.png','Mono','Combined Widgets, one single content and one time trend compare set on the same data','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \" \",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[\n	{\n		\"actuatorAttribute\" : null,\n		\"actuatorEntity\" : null,\n		\"actuatorTarget\" : null,\n		\"attributeName\" : null,\n		\"cancelDate\" : null,\n		\"canceller\" : null,\n		\"chartColor\" : \"rgb(51, 204, 255)\",\n		\"chartLabelsFontColor\" : \"#000000\",\n		\"chartLabelsFontSize\" : 11,\n		\"color_w\" : \"#FFFFFF\",\n		\"controlsPosition\" : null,\n		\"controlsVisibility\" : null,\n		\"dataLabelsFontColor\" : \"#000000\",\n		\"dataLabelsFontSize\" : 11,\n		\"defaultTab\" : null,\n		\"enableFullscreenModal\" : \"no\",\n		\"enableFullscreenTab\" : \"no\",\n		\"entityJson\" : null,\n		\"fontColor\" : \"#000000\",\n		\"fontFamily\" : \"Auto\",\n		\"fontSize\" : 11,\n		\"frame_color_w\" : \"rgb(51, 204, 255)\",\n		\"frequency_w\" : 600,\n		\"headerFontColor\" : \"#FFFFFF\",\n		\"hospitalList\" : null,\n		\"infoJson\" : null,\n		\"infoMessage_w\" : null,\n		\"lastEditDate\" : null,\n		\"lastSeries\" : null,\n		\"link_w\" : \"none\",\n		\"municipality_w\" : null,\n		\"notificatorEnabled\" : \"no\",\n		\"notificatorRegistered\" : \"no\",\n		\"oldParameters\" : null,\n		\"parameters\" : null,\n		\"scaleX\" : null,\n		\"scaleY\" : null,\n		\"serviceUri\" : null,\n		\"showTitle\" : \"yes\",\n		\"size_columns\" : 8,\n		\"size_rows\" : 6,\n		\"styleParameters\" : null,\n		\"temporal_range_w\" : \"Giornaliera\",\n		\"udm\" : \"\",\n		\"udmPos\" : \"below\",\n		\"viewMode\" : null,\n		\"zoomControlsColor\" : null,\n		\"zoomFactor\" : null\n	}\n]','no','[\"no\"]',NULL,'dataViewer'),(64,'widgetSelector','widgetExternalContent, widgetTimeTrend','selector, map, sensor_map, mypoi_map','selector-map-trend.png','Multi','Widget showing a list of point of interests categories with a map showing the position of the POIs, and for those that have historical and real time data a trend can be shown, a set of sources have to be provided','true','yes','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 16,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"queries\\\":[],\\\"targets\\\":[]}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"activeFontColor\\\":\\\"rgba(0,0,0,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[\n	{\n		\"actuatorAttribute\" : null,\n		\"actuatorEntity\" : null,\n		\"actuatorTarget\" : null,\n		\"attributeName\" : null,\n		\"cancelDate\" : null,\n		\"canceller\" : null,\n		\"chartColor\" : null,\n		\"chartLabelsFontColor\" : null,\n		\"chartLabelsFontSize\" : null,\n		\"color_w\" : \"#FFFFFF\",\n		\"controlsPosition\" : \"topLeft\",\n		\"controlsVisibility\" : \"alwaysVisible\",\n		\"dataLabelsFontColor\" : null,\n		\"dataLabelsFontSize\" : null,\n		\"defaultTab\" : null,\n		\"enableFullscreenModal\" : \"yes\",\n		\"enableFullscreenTab\" : \"yes\",\n		\"entityJson\" : null,\n		\"fontColor\" : \"#ffffff\",\n		\"fontFamily\" : \"Auto\",\n		\"fontSize\" : null,\n		\"frame_color_w\" : \"rgb(51, 204, 255)\",\n		\"frequency_w\" : null,\n		\"headerFontColor\" : \"#FFFFFF\",\n		\"hospitalList\" : null,\n		\"infoJson\" : null,\n		\"infoMessage_w\" : null,\n		\"lastEditDate\" : null,\n		\"lastSeries\" : null,\n		\"link_w\" : \"gisTarget\",\n		\"municipality_w\" : null,\n		\"notificatorEnabled\" : \"no\",\n		\"notificatorRegistered\" : \"no\",\n		\"oldParameters\" : null,\n		\"parameters\" : null,\n		\"scaleX\" : 1,\n		\"scaleY\" : 1,\n		\"serviceUri\" : null,\n		\"showTitle\" : \"yes\",\n		\"size_columns\" : 10,\n		\"size_rows\" : 10,\n		\"styleParameters\" : null,\n		\"temporal_range_w\" : null,\n		\"udm\" : null,\n		\"udmPos\" : null,\n		\"viewMode\" : \"map\",\n		\"zoomControlsColor\" : null,\n		\"zoomFactor\" : 1\n	},\n	{\n		\"actuatorAttribute\" : null,\n		\"actuatorEntity\" : null,\n		\"actuatorTarget\" : null,\n		\"attributeName\" : null,\n		\"cancelDate\" : null,\n		\"canceller\" : null,\n		\"chartColor\" : \"rgb(51, 204, 255)\",\n		\"chartLabelsFontColor\" : \"#000000\",\n		\"chartLabelsFontSize\" : 11,\n		\"color_w\" : \"#FFFFFF\",\n		\"controlsPosition\" : null,\n		\"controlsVisibility\" : null,\n		\"dataLabelsFontColor\" : \"#000000\",\n		\"dataLabelsFontSize\" : 11,\n		\"defaultTab\" : null,\n		\"enableFullscreenModal\" : \"no\",\n		\"enableFullscreenTab\" : \"no\",\n		\"entityJson\" : null,\n		\"fontColor\" : \"#000000\",\n		\"fontFamily\" : \"Auto\",\n		\"fontSize\" : 11,\n		\"frame_color_w\" : \"rgb(51, 204, 255)\",\n		\"frequency_w\" : 600,\n		\"headerFontColor\" : \"#FFFFFF\",\n		\"hospitalList\" : null,\n		\"infoJson\" : null,\n		\"infoMessage_w\" : null,\n		\"lastEditDate\" : null,\n		\"lastSeries\" : null,\n		\"link_w\" : \"none\",\n		\"municipality_w\" : null,\n		\"notificatorEnabled\" : \"no\",\n		\"notificatorRegistered\" : \"no\",\n		\"oldParameters\" : null,\n		\"parameters\" : null,\n		\"scaleX\" : null,\n		\"scaleY\" : null,\n		\"serviceUri\" : null,\n		\"showTitle\" : \"yes\",\n		\"size_columns\" : 10,\n		\"size_rows\" : 4,\n		\"styleParameters\" : null,\n		\"temporal_range_w\" : \"Giornaliera\",\n		\"udm\" : null,\n		\"udmPos\" : null,\n		\"viewMode\" : null,\n		\"zoomControlsColor\" : null,\n		\"zoomFactor\" : null\n	}\n]','yes','[\"yes\",\"no\"]','SelectorAndMapAndTrend','dataViewer'),(65,'widgetPrevMeteo','','special weather','meteo-widget-horizontal.png','Mono','widget showing the meteo forecast for the whole Tuscany Region, horizontal view','true','no','{\n	\"size_rows\": 6,\n	\"size_columns\": 6,\n    \"color_w\": \"#FFFFFF\",\n	\"frequency_w\": 6000,\n	\"temporal_range_w\": null,\n    \"municipality_w\": \"FIRENZE\",\n	\"infoMessage_w\": null,\n	\"link_w\": \"none\",\n	\"parameters\": null,\n	\"udm\": null,\n	\"udmPos\": null,\n	\"fontSize\": null,\n	\"fontColor\": \"#ffffff\",\n	\"frame_color_w\": \"rgb(51, 204, 255)\",	\n	\"controlsPosition\": null,\n	\"showTitle\": \"no\",\n	\"controlsVisibility\": null,\n	\"zoomFactor\": null,\n	\"zoomControlsColor\": null,\n	\"defaultTab\": null,\n	\"scaleX\": null,\n	\"scaleY\": null,\n	\"headerFontColor\": \"#FFFFFF\",\n	\"styleParameters\": \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"horizontal\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"infoJson\": null,\n	\"serviceUri\": null,\n	\"viewMode\": null,\n	\"hospitalList\": null,\n	\"lastSeries\": null,	\n	\"notificatorRegistered\": \"no\",\n	\"notificatorEnabled\": \"no\",\n	\"oldParameters\": null,\n	\"enableFullscreenTab\": \"no\",\n	\"enableFullscreenModal\": \"no\",\n	\"fontFamily\": \"Auto\",\n	\"entityJson\": null,\n	\"attributeName\": null,\n	\"canceller\": null,\n	\"lastEditDate\": null,\n	\"cancelDate\": null,\n	\"actuatorTarget\": null,\n	\"actuatorEntity\": null,\n	\"actuatorAttribute\": null,\n	\"chartColor\": \"rgb(51, 204, 255)\",\n	\"dataLabelsFontSize\": null,\n	\"dataLabelsFontColor\": null,\n	\"chartLabelsFontSize\": null,\n	\"chartLabelsFontColor\": null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(66,'widgetPrevMeteo','','special weather','meteo-widget-vertical.png','Mono','widget showing the meteo forecast for the whole Tuscany Region, vertical view','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : \"rgb(51, 204, 255)\",\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : \"FIRENZE\",\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"no\",\n	\"size_columns\" : 5,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"backgroundMode\\\":\\\"auto\\\",\\\"iconSet\\\":\\\"multiColor\\\",\\\"language\\\":\\\"english\\\",\\\"orientation\\\":\\\"vertical\\\",\\\"todayDim\\\":\\\"60\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(67,'widgetExternalContent','','map','servicemap.png','Multi','Service Map','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : \"topLeft\",\n	\"controlsVisibility\" : \"alwaysVisible\",\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"yes\",\n	\"enableFullscreenTab\" : \"yes\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 6000,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\": null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(68,'widgetGeolocator','','geolocator','geolocator.png','Mono','Geolocator','false','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 14,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"baseValue\\\":\\\"Off\\\",\\\"impulseValue\\\":\\\"Position\\\",\\\"mode\\\":\\\"press\\\"}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 2,\n	\"size_rows\" : 4,\n	\"styleParameters\" : \"{\\\"buttonRadius\\\" : \\\"0\\\",\\\"clickColor\\\" : \\\"rgba(102,255,102,1)\\\",\\\"color\\\":\\\"rgba(255,0,0,1)\\\",\\\"displayColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"displayFontClickColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayFontColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"displayFontSize\\\":\\\"24\\\",\\\"displayHeight\\\":\\\"40\\\",\\\"displayRadius\\\":\\\"0\\\",\\\"displayWidth\\\":\\\"80\\\",\\\"neonEffect\\\" : \\\"never\\\",\\\"symbolClickColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"symbolColor\\\":\\\"rgba(37,37,37,1)\\\",\\\"textClickColor\\\":\\\"rgba(255,255,255,1)\\\",\\\"textColor\\\":\\\"rgba(37,37,37,1)\\\",\\\"textFontSize\\\":\\\"48\\\",\\\"viewMode\\\":\\\"textOnly\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'actuator'),(69,'widgetTracker','widgetTimeTrend','latitude_longitude, gradi decimali, integer-mykpi, float-mykpi, percentage-mykpi, status-mykpi, degree-mykpi, bool-mykpi, gluco-mykpi','tracker.png','Multi','Widget showing My KPI positions and trajectories on a map and data time trend','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#ffffff\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : null,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : null,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : 1,\n	\"scaleY\" : 1,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : 1\n}','[{ \"actuatorAttribute\" : null, \"actuatorEntity\" : null, \"actuatorTarget\" : null, \"attributeName\" : null, \"cancelDate\" : null, \"canceller\" : null, \"chartColor\" : \"rgb(51, 204, 255)\", \"chartLabelsFontColor\" : \"#000000\", \"chartLabelsFontSize\" : 11, \"color_w\" : \"#FFFFFF\", \"controlsPosition\" : null, \"controlsVisibility\" : null, \"dataLabelsFontColor\" : \"#000000\", \"dataLabelsFontSize\" : 11, \"defaultTab\" : null, \"enableFullscreenModal\" : \"no\", \"enableFullscreenTab\" : \"no\", \"entityJson\" : null, \"fontColor\" : \"#000000\", \"fontFamily\" : \"Auto\", \"fontSize\" : 11, \"frame_color_w\" : \"rgb(51, 204, 255)\", \"frequency_w\" : 600, \"headerFontColor\" : \"#FFFFFF\", \"hospitalList\" : null, \"infoJson\" : null, \"infoMessage_w\" : null, \"lastEditDate\" : null, \"lastSeries\" : null, \"link_w\" : \"none\", \"municipality_w\" : null, \"notificatorEnabled\" : \"no\", \"notificatorRegistered\" : \"no\", \"oldParameters\" : null, \"parameters\" : null, \"scaleX\" : null, \"scaleY\" : null, \"serviceUri\" : null, \"showTitle\" : \"yes\", \"size_columns\" : 8, \"size_rows\" : 6, \"styleParameters\" : null, \"temporal_range_w\" : \"Giornaliera\", \"udm\" : \"\", \"udmPos\" : \"below\", \"viewMode\" : null, \"zoomControlsColor\" : null, \"zoomFactor\" : null}]','yes','[\"no\"]','TrackerAndTrend','dataViewer'),(70,'widgetCurvedLineSeries','','series, integer, percentage, float','curved-lines-graph.png','Multi','Graph with curved lines','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n    \"chartPlaneColor\": \"rgba(238, 238, 238, 1)\",\n    \"chartAxesColor\": \"rgba(238, 238, 238, 1)\",\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 10,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 300,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"alrLook\\\":\\\"lines\\\",\\\"barsColors\\\":[],\\\"barsColorsSelect\\\":\\\"auto\\\",\\\"chartType\\\":\\\"lines\\\",\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"dataLabels\\\":\\\"value\\\",\\\"dataLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"dataLabelsFontSize\\\":\\\"10\\\",\\\"legendFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"legendFontSize\\\":\\\"10\\\",\\\"lineWidth\\\":\\\"2\\\",\\\"rowsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"rowsLabelsFontSize\\\":\\\"10\\\",\\\"xAxisDataset\\\":\\\"\\\"}\",\n	\"temporal_range_w\" : \"4 Ore\",\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(71,'widgetCurvedLineSeries','','series','curved-lines-stacked-graph.png','Multi','Graph with curved lines stacked','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n    \"chartPlaneColor\": \"rgba(238, 238, 238, 1)\",\n    \"chartAxesColor\": \"rgba(238, 238, 238, 1)\",\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 10,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 300,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 10,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"alrLook\\\":\\\"lines\\\",\\\"barsColors\\\":[],\\\"barsColorsSelect\\\":\\\"auto\\\",\\\"chartType\\\":\\\"stacked\\\",\\\"colsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"colsLabelsFontSize\\\":\\\"10\\\",\\\"dataLabels\\\":\\\"value\\\",\\\"dataLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"dataLabelsFontSize\\\":\\\"10\\\",\\\"legendFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"legendFontSize\\\":\\\"10\\\",\\\"lineWidth\\\":\\\"2\\\",\\\"rowsLabelsFontColor\\\":\\\"rgba(0,0,0,1)\\\",\\\"rowsLabelsFontSize\\\":\\\"10\\\",\\\"xAxisDataset\\\":\\\"\\\"}\",\n	\"temporal_range_w\" : \"4 Ore\",\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'yes','[\"no\"]',NULL,'dataViewer'),(73,'widgetCarrierPosition','','float, integer, string','carrier.png','Mono','Carrier position','true','no','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : null,\n	\"chartLabelsFontSize\" : null,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : null,\n	\"dataLabelsFontSize\" : null,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : \"#000000\",\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 36,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 600,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : null,\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 3,\n	\"size_rows\" : 6,\n	\"styleParameters\" : null,\n	\"temporal_range_w\" : null,\n	\"udm\" : \" \",\n	\"udmPos\" : \"below\",\n	\"viewMode\" : null,\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}',NULL,'no','[\"no\"]',NULL,'dataViewer'),(74,'widgetSelector','widgetGisWFS','wfs','selector-widget_WFS.png','Multi','Widget showing a list of point of interests categories with a map showing the position of the POIs, a set of sources have to be provided. Using OpenLayers and ArcGIS WFS.','true','yes','{\r\n	\"actuatorAttribute\" : null,\r\n	\"actuatorEntity\" : null,\r\n	\"actuatorTarget\" : null,\r\n	\"attributeName\" : null,\r\n	\"cancelDate\" : null,\r\n	\"canceller\" : null,\r\n	\"chartColor\" : null,\r\n	\"chartLabelsFontColor\" : \"#000000\",\r\n	\"chartLabelsFontSize\" : 12,\r\n	\"color_w\" : \"#FFFFFF\",\r\n	\"controlsPosition\" : null,\r\n	\"controlsVisibility\" : null,\r\n	\"dataLabelsFontColor\" : \"#000000\",\r\n	\"dataLabelsFontSize\" : 12,\r\n	\"defaultTab\" : null,\r\n	\"enableFullscreenModal\" : \"no\",\r\n	\"enableFullscreenTab\" : \"no\",\r\n	\"entityJson\" : null,\r\n	\"fontColor\" : null,\r\n	\"fontFamily\" : \"Auto\",\r\n	\"fontSize\" : 16,\r\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\r\n	\"frequency_w\" : 1200,\r\n	\"headerFontColor\" : \"#FFFFFF\",\r\n	\"hospitalList\" : null,\r\n	\"infoJson\" : null,\r\n	\"infoMessage_w\" : null,\r\n	\"lastEditDate\" : null,\r\n	\"lastSeries\" : null,\r\n	\"link_w\" : \"none\",\r\n	\"municipality_w\" : null,\r\n	\"notificatorEnabled\" : \"no\",\r\n	\"notificatorRegistered\" : \"no\",\r\n	\"oldParameters\" : null,\r\n	\"parameters\" : \"{\\\"queries\\\":[],\\\"targets\\\":[]}\",\r\n	\"scaleX\" : null,\r\n	\"scaleY\" : null,\r\n	\"serviceUri\" : null,\r\n	\"showTitle\" : \"yes\",\r\n	\"size_columns\" : 4,\r\n	\"size_rows\" : 10,\r\n	\"styleParameters\" : \"{\\\"activeFontColor\\\":\\\"rgba(0,0,0,1)\\\"}\",\r\n	\"temporal_range_w\" : null,\r\n	\"udm\" : null,\r\n	\"udmPos\" : null,\r\n	\"viewMode\" : \"list\",\r\n	\"zoomControlsColor\" : null,\r\n	\"zoomFactor\" : null\r\n}','[{\r\n	\"actuatorAttribute\" : null,\r\n	\"actuatorEntity\" : null,\r\n	\"actuatorTarget\" : null,\r\n	\"attributeName\" : null,\r\n	\"cancelDate\" : null,\r\n	\"canceller\" : null,\r\n	\"chartColor\" : null,\r\n	\"chartLabelsFontColor\" : null,\r\n	\"chartLabelsFontSize\" : null,\r\n	\"color_w\" : \"#FFFFFF\",\r\n	\"controlsPosition\" : \"topLeft\",\r\n	\"controlsVisibility\" : \"alwaysVisible\",\r\n	\"dataLabelsFontColor\" : null,\r\n	\"dataLabelsFontSize\" : null,\r\n	\"defaultTab\" : null,\r\n	\"enableFullscreenModal\" : \"yes\",\r\n	\"enableFullscreenTab\" : \"yes\",\r\n	\"entityJson\" : null,\r\n	\"fontColor\" : \"#ffffff\",\r\n	\"fontFamily\" : \"Auto\",\r\n	\"fontSize\" : null,\r\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\r\n	\"frequency_w\" : null,\r\n	\"headerFontColor\" : \"#FFFFFF\",\r\n	\"hospitalList\" : null,\r\n	\"infoJson\" : null,\r\n	\"infoMessage_w\" : null,\r\n	\"lastEditDate\" : null,\r\n	\"lastSeries\" : null,\r\n	\"link_w\" : \"gisTarget\",\r\n	\"municipality_w\" : null,\r\n	\"notificatorEnabled\" : \"no\",\r\n	\"notificatorRegistered\" : \"no\",\r\n	\"oldParameters\" : null,\r\n	\"parameters\" : null,\r\n	\"scaleX\" : 1,\r\n	\"scaleY\" : 1,\r\n	\"serviceUri\" : null,\r\n	\"showTitle\" : \"yes\",\r\n	\"size_columns\" : 10,\r\n	\"size_rows\" : 10,\r\n	\"styleParameters\" : null,\r\n	\"temporal_range_w\" : null,\r\n	\"udm\" : null,\r\n	\"udmPos\" : null,\r\n	\"viewMode\" : \"map\",\r\n	\"zoomControlsColor\" : null,\r\n	\"zoomFactor\" : 1\r\n}]','yes','[\"yes\"]','SelectorAndGisWFS','dataViewer'),(75,'widgetSelectorNew','widgetMap','selector, map, sensor_map, mypoi_map, heatmap','selector-newmap.png','Multi','Widget showing a multi-data list of point of interests, IOT devices, heatmaps and geometries (e.g.: traffic flows, cycle paths), with a map showing the position of the POIs, a set of sources have to be provided','true','yes','{\n	\"actuatorAttribute\" : null,\n	\"actuatorEntity\" : null,\n	\"actuatorTarget\" : null,\n	\"attributeName\" : null,\n	\"cancelDate\" : null,\n	\"canceller\" : null,\n	\"chartColor\" : null,\n	\"chartLabelsFontColor\" : \"#000000\",\n	\"chartLabelsFontSize\" : 12,\n	\"color_w\" : \"#FFFFFF\",\n	\"controlsPosition\" : null,\n	\"controlsVisibility\" : null,\n	\"dataLabelsFontColor\" : \"#000000\",\n	\"dataLabelsFontSize\" : 12,\n	\"defaultTab\" : null,\n	\"enableFullscreenModal\" : \"no\",\n	\"enableFullscreenTab\" : \"no\",\n	\"entityJson\" : null,\n	\"fontColor\" : null,\n	\"fontFamily\" : \"Auto\",\n	\"fontSize\" : 16,\n	\"frame_color_w\" : \"rgb(51, 204, 255)\",\n	\"frequency_w\" : 1200,\n	\"headerFontColor\" : \"#FFFFFF\",\n	\"hospitalList\" : null,\n	\"infoJson\" : null,\n	\"infoMessage_w\" : null,\n	\"lastEditDate\" : null,\n	\"lastSeries\" : null,\n	\"link_w\" : \"none\",\n	\"municipality_w\" : null,\n	\"notificatorEnabled\" : \"no\",\n	\"notificatorRegistered\" : \"no\",\n	\"oldParameters\" : null,\n	\"parameters\" : \"{\\\"queries\\\":[],\\\"targets\\\":[]}\",\n	\"scaleX\" : null,\n	\"scaleY\" : null,\n	\"serviceUri\" : null,\n	\"showTitle\" : \"yes\",\n	\"size_columns\" : 4,\n	\"size_rows\" : 10,\n	\"styleParameters\" : \"{\\\"activeFontColor\\\":\\\"rgba(0,0,0,1)\\\"}\",\n	\"temporal_range_w\" : null,\n	\"udm\" : null,\n	\"udmPos\" : null,\n	\"viewMode\" : \"list\",\n	\"zoomControlsColor\" : null,\n	\"zoomFactor\" : null\n}','[{\r 	\"actuatorAttribute\" : null,\r 	\"actuatorEntity\" : null,\r 	\"actuatorTarget\" : null,\r 	\"attributeName\" : null,\r 	\"cancelDate\" : null,\r 	\"canceller\" : null,\r 	\"chartColor\" : null,\r 	\"chartLabelsFontColor\" : null,\r 	\"chartLabelsFontSize\" : null,\r 	\"color_w\" : \"#FFFFFF\",\r 	\"controlsPosition\" : null,\r 	\"controlsVisibility\" : null,\r 	\"dataLabelsFontColor\" : null,\r 	\"dataLabelsFontSize\" : null,\r 	\"defaultTab\" : null,\r 	\"enableFullscreenModal\" : \"yes\",\r 	\"enableFullscreenTab\" : \"yes\",\r 	\"entityJson\" : null,\r 	\"fontColor\" : \"#ffffff\",\r 	\"fontFamily\" : \"Auto\",\r 	\"fontSize\" : null,\r 	\"frame_color_w\" : \"rgb(51, 204, 255)\",\r 	\"frequency_w\" : null,\r 	\"headerFontColor\" : \"#FFFFFF\",\r 	\"hospitalList\" : null,\r 	\"infoJson\" : null,\r 	\"infoMessage_w\" : null,\r 	\"lastEditDate\" : null,\r 	\"lastSeries\" : null,\r 	\"link_w\" : null,\r 	\"municipality_w\" : null,\r 	\"notificatorEnabled\" : \"no\",\r 	\"notificatorRegistered\" : \"no\",\r 	\"oldParameters\" : null,\r 	\"parameters\" : null,\r 	\"scaleX\" : 1,\r 	\"scaleY\" : 1,\r 	\"serviceUri\" : null,\r 	\"showTitle\" : \"yes\",\r 	\"size_columns\" : 10,\r 	\"size_rows\" : 10,\r 	\"styleParameters\" : null,\r 	\"temporal_range_w\" : null,\r 	\"udm\" : null,\r 	\"udmPos\" : null,\r 	\"viewMode\" : \"additive\",\r 	\"zoomControlsColor\" : null,\r 	\"zoomFactor\" : 1\r }]','yes','[\"yes\"]','SelectorAndMapNew','dataViewer');
/*!40000 ALTER TABLE `WidgetsIconsMap` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 18:34:30
