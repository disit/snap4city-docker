
create database profiledb;
GRANT ALL ON profiledb.* TO 'user'@'%' IDENTIFIED BY 'passwordx';
use profiledb;

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
) ENGINE=InnoDB AUTO_INCREMENT=8927701 DEFAULT CHARSET=latin1;
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
  `stacktrace` blob,
  `app_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=980399 DEFAULT CHARSET=latin1;
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
  `variable_value` varchar(1024) DEFAULT NULL,
  `variable_unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

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
  `delegation_details` text,
  `groupname_delegated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegation`
--

LOCK TABLES `delegation` WRITE;
/*!40000 ALTER TABLE `delegation` DISABLE KEYS */;
INSERT INTO `delegation` VALUES (932,'usermanager','ANONYMOUS',NULL,NULL,'1491','DashboardID','2019-02-18 15:27:45',NULL,NULL,NULL),(933,'userareamanager','usermanager',NULL,NULL,'1492','DashboardID','2019-02-26 12:15:26',NULL,NULL,NULL),(936,'usermanager','userareamanager',NULL,NULL,'1493','DashboardID','2019-05-27 09:41:07',NULL,NULL,NULL),(938,'userrootadmin','userareamanager',NULL,NULL,'17056227','MyPOI','2019-05-28 16:01:16',NULL,NULL,NULL),(939,'userrootadmin','userareamanager',NULL,NULL,'17056226','MyPOI','2019-05-28 16:01:35',NULL,NULL,NULL),(940,'userrootadmin','userareamanager',NULL,NULL,'17056225','MyPOI','2019-05-28 16:01:44',NULL,NULL,NULL),(941,'userrootadmin','userareamanager',NULL,NULL,'17056224','MyPOI','2019-05-28 16:01:59',NULL,NULL,NULL),(942,'userrootadmin','userareamanager',NULL,NULL,'17056232','MyPOI','2019-05-28 16:02:11',NULL,NULL,NULL),(943,'userrootadmin','userareamanager',NULL,NULL,'17056231','MyPOI','2019-05-28 16:02:23',NULL,NULL,NULL),(944,'userrootadmin','userareamanager',NULL,NULL,'17056230','MyPOI','2019-05-28 16:02:30',NULL,NULL,NULL),(945,'userrootadmin','userareamanager',NULL,NULL,'17056229','MyPOI','2019-05-28 16:02:38',NULL,NULL,NULL),(946,'userrootadmin','userareamanager',NULL,NULL,'17056228','MyPOI','2019-05-28 16:02:45',NULL,NULL,NULL),(948,'userrootadmin','ANONYMOUS',NULL,NULL,'1496','DashboardID','2019-06-06 12:21:13',NULL,NULL,NULL),(949,'userrootadmin','ANONYMOUS',NULL,NULL,'1498','DashboardID','2019-06-06 12:21:57',NULL,NULL,NULL),(950,'userareamanager','usertooladmin',NULL,NULL,'1492','DashboardID','2019-06-07 14:18:33',NULL,NULL,NULL),(951,'usertooladmin','ANONYMOUS',NULL,NULL,'1497','DashboardID','2019-06-07 14:19:56',NULL,NULL,NULL),(952,'usermanager','ANONYMOUS',NULL,NULL,'1499','DashboardID','2019-06-07 14:23:39',NULL,NULL,NULL),(953,'userrootadmin','ANONYMOUS',NULL,NULL,'17056232','MyPOI','2019-06-07 14:27:41',NULL,NULL,NULL),(954,'userrootadmin','ANONYMOUS',NULL,NULL,'17056231','MyPOI','2019-06-07 14:27:44',NULL,NULL,NULL),(955,'userrootadmin','ANONYMOUS',NULL,NULL,'17056230','MyPOI','2019-06-07 14:27:45',NULL,NULL,NULL),(956,'userrootadmin','ANONYMOUS',NULL,NULL,'17056229','MyPOI','2019-06-07 14:27:47',NULL,NULL,NULL);
/*!40000 ALTER TABLE `delegation` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6928 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpiactivity`
--

LOCK TABLES `kpiactivity` WRITE;
/*!40000 ALTER TABLE `kpiactivity` DISABLE KEYS */;
INSERT INTO `kpiactivity` VALUES (6673,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 15:34:52',NULL,NULL),(6674,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 15:34:52',NULL,NULL),(6675,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 15:34:52',NULL,NULL),(6676,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 15:34:52',NULL,NULL),(6677,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 15:34:52',NULL,NULL),(6678,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 15:34:52',NULL,NULL),(6679,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:48:58',NULL,NULL),(6680,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:48:58',NULL,NULL),(6681,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 17:48:58',NULL,NULL),(6682,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 17:48:58',NULL,NULL),(6683,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:48:58',NULL,NULL),(6684,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:48:58',NULL,NULL),(6685,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:00',NULL,NULL),(6686,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:00',NULL,NULL),(6687,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 17:49:00',NULL,NULL),(6688,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 17:49:00',NULL,NULL),(6689,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:00',NULL,NULL),(6690,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:00',NULL,NULL),(6691,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:04',NULL,NULL),(6692,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:04',NULL,NULL),(6693,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 17:49:04',NULL,NULL),(6694,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-12 17:49:04',NULL,NULL),(6695,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:04',NULL,NULL),(6696,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-12 17:49:04',NULL,NULL),(6697,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:39:57',NULL,NULL),(6698,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:39:57',NULL,NULL),(6699,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-16 14:39:57',NULL,NULL),(6700,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-16 14:39:57',NULL,NULL),(6701,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:39:57',NULL,NULL),(6702,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:39:58',NULL,NULL),(6703,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-16 14:40:03',NULL,NULL),(6704,'userareamanager',17056248,'dashboardmanager','READ','VALUEDATES','2019-09-16 14:40:03',NULL,NULL),(6705,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-16 14:40:04',NULL,NULL),(6706,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-16 14:40:19',NULL,NULL),(6707,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-16 14:40:34',NULL,NULL),(6708,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-16 14:40:49',NULL,NULL),(6709,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:41:00',NULL,NULL),(6710,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:41:00',NULL,NULL),(6711,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-16 14:41:00',NULL,NULL),(6712,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-16 14:41:00',NULL,NULL),(6713,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:41:00',NULL,NULL),(6714,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-16 14:41:00',NULL,NULL),(6715,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 11:56:50',NULL,NULL),(6716,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 11:56:50',NULL,NULL),(6717,'userrootadmin',NULL,'dashboardwizard','READ','POI','2019-09-17 11:56:50',NULL,NULL),(6718,'userrootadmin',NULL,'dashboardwizard','READ','POI','2019-09-17 11:56:50',NULL,NULL),(6719,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 11:56:50',NULL,NULL),(6720,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 11:56:50',NULL,NULL),(6721,'usermanager',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:00:10',NULL,NULL),(6722,'usermanager',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:00:10',NULL,NULL),(6723,'usermanager',NULL,'dashboardwizard','READ','POI','2019-09-17 15:00:10',NULL,NULL),(6724,'usermanager',NULL,'dashboardwizard','READ','POI','2019-09-17 15:00:10',NULL,NULL),(6725,'usermanager',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:00:10',NULL,NULL),(6726,'usermanager',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:00:10',NULL,NULL),(6727,'usertooladmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:01:52',NULL,NULL),(6728,'usertooladmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:01:52',NULL,NULL),(6729,'usertooladmin',NULL,'dashboardwizard','READ','POI','2019-09-17 15:01:52',NULL,NULL),(6730,'usertooladmin',NULL,'dashboardwizard','READ','POI','2019-09-17 15:01:52',NULL,NULL),(6731,'usertooladmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:01:53',NULL,NULL),(6732,'usertooladmin',NULL,'dashboardwizard','READ','DATA','2019-09-17 15:01:53',NULL,NULL),(6733,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:07',NULL,NULL),(6734,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:07',NULL,NULL),(6735,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 12:54:07',NULL,NULL),(6736,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 12:54:07',NULL,NULL),(6737,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:07',NULL,NULL),(6738,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:07',NULL,NULL),(6739,'userareamanager',17056248,'dashboardmanager','READ','VALUEDATES','2019-09-26 12:54:13',NULL,NULL),(6740,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:13',NULL,NULL),(6741,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:13',NULL,NULL),(6742,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:18',NULL,NULL),(6743,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:18',NULL,NULL),(6744,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:23',NULL,NULL),(6745,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:23',NULL,NULL),(6746,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:26',NULL,NULL),(6747,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:26',NULL,NULL),(6748,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:28',NULL,NULL),(6749,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:28',NULL,NULL),(6750,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:28',NULL,NULL),(6751,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:31',NULL,NULL),(6752,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:31',NULL,NULL),(6753,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:32',NULL,NULL),(6754,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:32',NULL,NULL),(6755,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:44',NULL,NULL),(6756,'userareamanager',17056224,'dashboardmanager','READ','POIVALUE','2019-09-26 12:54:45',NULL,NULL),(6757,'userareamanager',17056224,'dashboardmanager','READ','POIMETADATA','2019-09-26 12:54:45',NULL,NULL),(6758,'userareamanager',17056224,'dashboardmanager','READ','POI','2019-09-26 12:54:45',NULL,NULL),(6759,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:53',NULL,NULL),(6760,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:53',NULL,NULL),(6761,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 12:54:53',NULL,NULL),(6762,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 12:54:53',NULL,NULL),(6763,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:53',NULL,NULL),(6764,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 12:54:53',NULL,NULL),(6765,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:54:58',NULL,NULL),(6766,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:55:13',NULL,NULL),(6767,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:55:28',NULL,NULL),(6768,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:55:37',NULL,NULL),(6769,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:55:39',NULL,NULL),(6770,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:55:43',NULL,NULL),(6771,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:55:58',NULL,NULL),(6772,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:56:13',NULL,NULL),(6773,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:56:28',NULL,NULL),(6774,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:56:43',NULL,NULL),(6775,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:56:58',NULL,NULL),(6776,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:57:13',NULL,NULL),(6777,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:57:28',NULL,NULL),(6778,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:57:43',NULL,NULL),(6779,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:57:58',NULL,NULL),(6780,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:58:13',NULL,NULL),(6781,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:58:28',NULL,NULL),(6782,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:58:43',NULL,NULL),(6783,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:58:58',NULL,NULL),(6784,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:59:13',NULL,NULL),(6785,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:59:28',NULL,NULL),(6786,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:59:43',NULL,NULL),(6787,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 12:59:58',NULL,NULL),(6788,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:00:13',NULL,NULL),(6789,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:00:28',NULL,NULL),(6790,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:00:43',NULL,NULL),(6791,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:00:58',NULL,NULL),(6792,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:01:13',NULL,NULL),(6793,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:01:28',NULL,NULL),(6794,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:01:43',NULL,NULL),(6795,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:01:58',NULL,NULL),(6796,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:02:13',NULL,NULL),(6797,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:02:28',NULL,NULL),(6798,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:02:43',NULL,NULL),(6799,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:02:58',NULL,NULL),(6800,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:03:13',NULL,NULL),(6801,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:03:28',NULL,NULL),(6802,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:03:43',NULL,NULL),(6803,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:03:58',NULL,NULL),(6804,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:04:13',NULL,NULL),(6805,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:04:28',NULL,NULL),(6806,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:04:43',NULL,NULL),(6807,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:04:58',NULL,NULL),(6808,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:05:13',NULL,NULL),(6809,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:05:28',NULL,NULL),(6810,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:05:39',NULL,NULL),(6811,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:05:43',NULL,NULL),(6812,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:05:58',NULL,NULL),(6813,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:06:13',NULL,NULL),(6814,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:06:28',NULL,NULL),(6815,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:07:42',NULL,NULL),(6816,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:07:42',NULL,NULL),(6817,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:07:42',NULL,NULL),(6818,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:07:42',NULL,NULL),(6819,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:07:42',NULL,NULL),(6820,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:07:42',NULL,NULL),(6821,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:09:42',NULL,NULL),(6822,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:09:42',NULL,NULL),(6823,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:09:42',NULL,NULL),(6824,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:09:42',NULL,NULL),(6825,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:09:42',NULL,NULL),(6826,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:09:42',NULL,NULL),(6827,'userareamanager',17056224,'dashboardmanager','READ','POIVALUE','2019-09-26 13:09:57',NULL,NULL),(6828,'userareamanager',17056224,'dashboardmanager','READ','POIMETADATA','2019-09-26 13:09:57',NULL,NULL),(6829,'userareamanager',17056224,'dashboardmanager','READ','POI','2019-09-26 13:09:57',NULL,NULL),(6830,'userareamanager',17056248,'dashboardmanager','READ','VALUEDATES','2019-09-26 13:10:11',NULL,NULL),(6831,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:11',NULL,NULL),(6832,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:12',NULL,NULL),(6833,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:17',NULL,NULL),(6834,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:17',NULL,NULL),(6835,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:24',NULL,NULL),(6836,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:24',NULL,NULL),(6837,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:26',NULL,NULL),(6838,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:40',NULL,NULL),(6839,'userareamanager',17056248,'dashboardmanager','READ','VALUEDATES','2019-09-26 13:10:40',NULL,NULL),(6840,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:10:41',NULL,NULL),(6841,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:11:33',NULL,NULL),(6842,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:11:33',NULL,NULL),(6843,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:11:34',NULL,NULL),(6844,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:12:06',NULL,NULL),(6845,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:12:11',NULL,NULL),(6846,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6847,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6848,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6849,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6850,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:15',NULL,NULL),(6851,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:15',NULL,NULL),(6852,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:15',NULL,NULL),(6853,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:15',NULL,NULL),(6854,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6855,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6856,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6857,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:15',NULL,NULL),(6858,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:24',NULL,NULL),(6859,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:24',NULL,NULL),(6860,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:24',NULL,NULL),(6861,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:24',NULL,NULL),(6862,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:24',NULL,NULL),(6863,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:24',NULL,NULL),(6864,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:12:26',NULL,NULL),(6865,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:27',NULL,NULL),(6866,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:27',NULL,NULL),(6867,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:27',NULL,NULL),(6868,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:27',NULL,NULL),(6869,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:27',NULL,NULL),(6870,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:27',NULL,NULL),(6871,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:28',NULL,NULL),(6872,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:28',NULL,NULL),(6873,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:28',NULL,NULL),(6874,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:28',NULL,NULL),(6875,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:28',NULL,NULL),(6876,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:28',NULL,NULL),(6877,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:33',NULL,NULL),(6878,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:33',NULL,NULL),(6879,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:33',NULL,NULL),(6880,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:33',NULL,NULL),(6881,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:33',NULL,NULL),(6882,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:33',NULL,NULL),(6883,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:34',NULL,NULL),(6884,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:34',NULL,NULL),(6885,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:34',NULL,NULL),(6886,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:34',NULL,NULL),(6887,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:34',NULL,NULL),(6888,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:34',NULL,NULL),(6889,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:41',NULL,NULL),(6890,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:41',NULL,NULL),(6891,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:41',NULL,NULL),(6892,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:41',NULL,NULL),(6893,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:41',NULL,NULL),(6894,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:41',NULL,NULL),(6895,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:12:42',NULL,NULL),(6896,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6897,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6898,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:42',NULL,NULL),(6899,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:42',NULL,NULL),(6900,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6901,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6902,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6903,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6904,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:42',NULL,NULL),(6905,'userareamanager',NULL,'dashboardwizard','READ','POI','2019-09-26 13:12:42',NULL,NULL),(6906,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6907,'userareamanager',NULL,'dashboardwizard','READ','DATA','2019-09-26 13:12:42',NULL,NULL),(6908,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:12:56',NULL,NULL),(6909,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:13:11',NULL,NULL),(6910,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:13:26',NULL,NULL),(6911,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:13:41',NULL,NULL),(6912,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:13:56',NULL,NULL),(6913,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:14:11',NULL,NULL),(6914,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:14:26',NULL,NULL),(6915,'userareamanager',17056248,'dashboardmanager','READ','VALUE','2019-09-26 13:14:41',NULL,NULL),(6916,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:07',NULL,NULL),(6917,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:07',NULL,NULL),(6918,'userrootadmin',NULL,'dashboardwizard','READ','POI','2019-10-03 08:52:07',NULL,NULL),(6919,'userrootadmin',NULL,'dashboardwizard','READ','POI','2019-10-03 08:52:07',NULL,NULL),(6920,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:07',NULL,NULL),(6921,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:07',NULL,NULL),(6922,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:09',NULL,NULL),(6923,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:10',NULL,NULL),(6924,'userrootadmin',NULL,'dashboardwizard','READ','POI','2019-10-03 08:52:10',NULL,NULL),(6925,'userrootadmin',NULL,'dashboardwizard','READ','POI','2019-10-03 08:52:10',NULL,NULL),(6926,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:10',NULL,NULL),(6927,'userrootadmin',NULL,'dashboardwizard','READ','DATA','2019-10-03 08:52:10',NULL,NULL);
/*!40000 ALTER TABLE `kpiactivity` ENABLE KEYS */;
UNLOCK TABLES;

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
  `stacktrace` blob,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpiactivity_violation`
--

LOCK TABLES `kpiactivity_violation` WRITE;
/*!40000 ALTER TABLE `kpiactivity_violation` DISABLE KEYS */;
/*!40000 ALTER TABLE `kpiactivity_violation` ENABLE KEYS */;
UNLOCK TABLES;

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
  `last_value` varchar(128) DEFAULT NULL,
  `last_check` datetime DEFAULT NULL,
  `last_latitude` varchar(45) DEFAULT NULL,
  `last_longitude` varchar(45) DEFAULT NULL,
  `metric` varchar(128) DEFAULT NULL,
  `saved_direct` varchar(128) DEFAULT NULL,
  `kb_based` varchar(128) DEFAULT NULL,
  `sm_based` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `organizations` text,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17056249 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpimetadata`
--

LOCK TABLES `kpimetadata` WRITE;
/*!40000 ALTER TABLE `kpimetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `kpimetadata` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5906 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
INSERT INTO `limits` VALUES ('any','any','any','AppID',0);
INSERT INTO `limits` VALUES ('any','any','any','BrokerID',1);
INSERT INTO `limits` VALUES ('any','any','any','DashboardID',10);
INSERT INTO `limits` VALUES ('any','any','any','IOTID',5);
INSERT INTO `limits` VALUES ('any','any','any','ModelID',1);
INSERT INTO `limits` VALUES ('any','any','AreaManager','AppID',3);
INSERT INTO `limits` VALUES ('any','any','AreaManager','DAAppID',3);
INSERT INTO `limits` VALUES ('any','any','AreaManager','PortiaID',1);
INSERT INTO `limits` VALUES ('any','any','RootAdmin','BrokerID',999);
INSERT INTO `limits` VALUES ('any','any','RootAdmin','DAAppID',10);
INSERT INTO `limits` VALUES ('any','any','RootAdmin','DashboardID',100);
INSERT INTO `limits` VALUES ('any','any','RootAdmin','IOTID',999);
INSERT INTO `limits` VALUES ('any','any','RootAdmin','ModelID',999);
INSERT INTO `limits` VALUES ('any','any','RootAdmin','PortiaID',1);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','AppID',10);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','BrokerID',20);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','DAAppID',3);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','DashboardID',50);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','IOTID',20);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','ModelID',20);
INSERT INTO `limits` VALUES ('any','any','ToolAdmin','PortiaID',1);
/*!40000 ALTER TABLE `limits` ENABLE KEYS */;
UNLOCK TABLES;

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
  `elementDetails` text,
  `publickeySHA1` varchar(40) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_type_name` (`username`,`elementType`,`elementName`(100))
) ENGINE=InnoDB AUTO_INCREMENT=16477 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ownership`
--

LOCK TABLES `ownership` WRITE;
/*!40000 ALTER TABLE `ownership` DISABLE KEYS */;
INSERT INTO `ownership` VALUES (16461,'usermanager','1491','DashboardID','test1',NULL,NULL,NULL,'2019-02-18 14:14:39','2019-02-19 11:49:31','usermanager'),(16462,'userareamanager','1492','DashboardID','gp test 1',NULL,NULL,NULL,'2019-02-18 14:28:40',NULL,NULL),(16463,'usermanager','1493','DashboardID','test2',NULL,NULL,NULL,'2019-02-18 14:29:50',NULL,NULL),(16464,'usermanager','nodered','AppID','nodered','http://iotapp:1880/nodered','{\"edgegateway_type\":\"linux_Linux_4.9.0-8-amd64\"}',NULL,'2019-02-19 09:15:00',NULL,NULL),(16465,'usermanager','1494','DashboardID','Altair',NULL,NULL,NULL,'2019-02-19 11:13:04','2019-02-19 11:53:23','usermanager'),(16466,'usermanager','1495','DashboardID','testiot',NULL,NULL,NULL,'2019-02-19 11:13:54','2019-02-19 11:49:21','usermanager'),(16467,'usermanager','1496','DashboardID','iot-test',NULL,NULL,NULL,'2019-02-19 11:28:41',NULL,NULL),(16468,'usertooladmin','1497','DashboardID','Traffic Sensors Map And Trends',NULL,NULL,NULL,'2019-02-26 11:21:25',NULL,NULL),(16469,'userrootadmin','1498','DashboardID','test 3',NULL,NULL,NULL,'2019-03-13 16:07:03',NULL,NULL),(16470,'usermanager','1500','DashboardID','prova',NULL,NULL,NULL,'2019-06-05 07:28:55',NULL,NULL),(16471,'usermanager','1499','DashboardID','Sensors, Heatmaps and Geometries','',NULL,NULL,'2019-05-23 12:00:28',NULL,NULL),(16472,'userareamanager','1501','DashboardID','My Position Tracking',NULL,NULL,NULL,'2019-06-06 14:10:57',NULL,NULL),(16473,'userrootadmin','1502','DashboardID','prova - Cloned',NULL,NULL,NULL,'2019-06-07 12:17:32','2019-06-07 12:17:45','userrootadmin'),(16474,'userareamanager','1503','DashboardID','gp test 1 - Cloned',NULL,NULL,NULL,'2019-06-07 12:18:06','2019-06-07 12:18:15','userareamanager'),(16475,'usertooladmin','1504','DashboardID','notificator test',NULL,NULL,NULL,'2019-06-12 08:18:23',NULL,NULL),(16476,'userareamanager','1505','DashboardID','test 2',NULL,NULL,NULL,'2019-09-26 11:12:39',NULL,NULL);
/*!40000 ALTER TABLE `ownership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-03 14:23:39
