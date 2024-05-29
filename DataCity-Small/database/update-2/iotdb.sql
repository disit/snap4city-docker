--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE iotdb;

--
-- Create column `req_frequency` on table `contextbroker`
--
ALTER TABLE contextbroker 
  ADD COLUMN req_frequency INT(11) DEFAULT NULL;

--
-- Create column `timestampstatus` on table `contextbroker`
--
ALTER TABLE contextbroker 
  ADD COLUMN timestampstatus TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter column `attributes` on table `model`
--
ALTER TABLE model 
  CHANGE COLUMN attributes attributes LONGTEXT DEFAULT NULL;

--
-- Create table `orionbrokers`
--
CREATE TABLE orionbrokers (
  id_orionbroker INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  organization VARCHAR(45) DEFAULT NULL,
  ipaddr VARCHAR(45) DEFAULT NULL,
  external_port VARCHAR(45) DEFAULT NULL,
  access_port VARCHAR(45) DEFAULT NULL,
  multitenacy VARCHAR(45) DEFAULT NULL,
  urlnificallback VARCHAR(255) DEFAULT NULL,
  orion_image VARCHAR(45) DEFAULT NULL,
  enable_direct_access TINYINT(4) DEFAULT 0,
  status VARCHAR(45) DEFAULT NULL,
  status_timestamp DATETIME DEFAULT NULL,
  status_history MEDIUMTEXT DEFAULT NULL,
  PRIMARY KEY (id_orionbroker)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `EXT_values_rules`
--
CREATE TABLE EXT_values_rules (
  Name VARCHAR(45) NOT NULL,
  If_statement TEXT DEFAULT NULL,
  Then_statement TEXT DEFAULT NULL,
  Organization VARCHAR(45) DEFAULT NULL,
  Timestamp TIMESTAMP NULL DEFAULT NULL,
  mode VARCHAR(8) DEFAULT NULL,
  PRIMARY KEY (Name)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci,
COMMENT = 'Rules to ingestion of external broker';

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;