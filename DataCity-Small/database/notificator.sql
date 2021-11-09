CREATE SCHEMA `Notificator` DEFAULT CHARACTER SET utf8;
GRANT ALL ON Notificator.* TO 'user'@'%';
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: Notificator
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
-- Current Database: `Notificator`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Notificator` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Notificator`;

--
-- Table structure for table `clientApplications`
--

DROP TABLE IF EXISTS `clientApplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientApplications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `ldapName` varchar(100) DEFAULT NULL,
  `loginApiUrl` mediumtext DEFAULT NULL,
  `containerTitleLabel` varchar(100) DEFAULT NULL,
  `genTitleLabel` varchar(100) DEFAULT NULL,
  `genTypeLabel` varchar(100) DEFAULT NULL,
  `usrLabel` varchar(100) DEFAULT NULL,
  `genLinkLabel` varchar(100) DEFAULT NULL,
  `sessionLifetime` int(9) DEFAULT 30,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientLoggedUsers`
--

DROP TABLE IF EXISTS `clientLoggedUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientLoggedUsers` (
  `usr` varchar(100) NOT NULL,
  `clientApplication` varchar(100) NOT NULL,
  `userIp` varchar(45) NOT NULL,
  `ttl` int(15) NOT NULL,
  PRIMARY KEY (`usr`,`clientApplication`,`userIp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailAddrBook`
--

DROP TABLE IF EXISTS `emailAddrBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailAddrBook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adr` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `lName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `org` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`,`adr`),
  UNIQUE KEY `adr_UNIQUE` (`adr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailBook`
--

DROP TABLE IF EXISTS `emailBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailBook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `txt` longtext CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailNotificationRecipientsRelation`
--

DROP TABLE IF EXISTS `emailNotificationRecipientsRelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailNotificationRecipientsRelation` (
  `notId` int(11) NOT NULL,
  `recId` int(11) NOT NULL,
  KEY `notificationsRecipientsForeignKey_idx` (`notId`),
  CONSTRAINT `notificationsRecipientsForeignKey` FOREIGN KEY (`notId`) REFERENCES `emailNotifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations between notification and receipts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailNotifications`
--

DROP TABLE IF EXISTS `emailNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailNotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `genId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL,
  `msgId` int(11) NOT NULL DEFAULT -1,
  `val` int(11) DEFAULT NULL,
  `valStart` datetime DEFAULT NULL,
  `valEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table holds notifications data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventGenerators`
--

DROP TABLE IF EXISTS `eventGenerators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventGenerators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appName` varchar(100) CHARACTER SET latin1 NOT NULL,
  `generatorOriginalName` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `generatorOriginalType` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `containerName` varchar(100) DEFAULT NULL,
  `appUsr` varchar(100) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `regTime` timestamp NULL DEFAULT current_timestamp(),
  `val` varchar(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genId` int(11) NOT NULL,
  `eventType` varchar(100) NOT NULL,
  `thrCnt` int(11) DEFAULT NULL,
  `val` int(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eventsUnique` (`genId`,`eventType`,`thrCnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventsLog`
--

DROP TABLE IF EXISTS `eventsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) NOT NULL,
  `eventTypeId` varchar(200) NOT NULL,
  `value` varchar(20) DEFAULT NULL,
  `genId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restNotifications`
--

DROP TABLE IF EXISTS `restNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restNotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

-- Dump completed on 2021-11-08 17:28:19
-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.119    Database: Notificator
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
-- Dumping data for table `clientApplications`
--

LOCK TABLES `clientApplications` WRITE;
/*!40000 ALTER TABLE `clientApplications` DISABLE KEYS */;
INSERT INTO `clientApplications` VALUES (1,'Dashboard Manager','Dashboard','http://dashboard/dashboardSmartCity/api/notificatorLogin.php','Dashboard title','Widget title','Metric type','User','Dashboard link',30),(3,'Twitter Vigilance','TwitterVigilance',NULL,'Metric page','Metric name','Metric type','User','Metric page link',30),(4,'Dashboard Data Process','DashboardProcess',NULL,'Generator context','Generator name','Generator type','User','Generator page link',30),(5,'Dashboard Server Status Process','DashboardServerStatusProcess',NULL,'Generator context','Generator name','Generator type','User','Generator page link',30);
/*!40000 ALTER TABLE `clientApplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `emailBook`
--

LOCK TABLES `emailBook` WRITE;
/*!40000 ALTER TABLE `emailBook` DISABLE KEYS */;
INSERT INTO `emailBook` VALUES (85,'[[Auto]]','<p>Dear recipient,<br />\nthe following event has occurred:<br />\n[[EventDetails]]<br />\nRegards.<br />\n<strong>DISIT Notification System</strong></p>\n'),(101,'Platform status notification: [[Auto]]','<p>Dear recipient,<br />\nthe following event has occurred:</p>\n\n<p><br />\n[[EventDetails]]</p>\n\n<p><br />\nRegards.<br />\n<strong>DISIT Notification System</strong></p>\n');
/*!40000 ALTER TABLE `emailBook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `eventGenerators`
--

LOCK TABLES `eventGenerators` WRITE;
/*!40000 ALTER TABLE `eventGenerators` DISABLE KEYS */;
INSERT INTO `eventGenerators` VALUES (68,'Dashboard Data Process','Launcher2','Java object','Process','-','about:blank','2017-08-01 09:53:36','1'),(69,'Dashboard Data Process','Database access object','Database','Process','-','about:blank','2017-08-01 09:54:22','1');
/*!40000 ALTER TABLE `eventGenerators` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 17:28:19
