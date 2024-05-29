
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
-- Create index `value_name` on table `temporary_event_values`
--
ALTER TABLE temporary_event_values 
  ADD INDEX value_name(value_name);

--
-- Create table `raw_schema_model`
--
CREATE TABLE raw_schema_model (
  domain VARCHAR(50) NOT NULL DEFAULT 'Unset',
  subdomain VARCHAR(50) NOT NULL DEFAULT 'Unset',
  model VARCHAR(50) NOT NULL DEFAULT 'Unset',
  version VARCHAR(10) NOT NULL DEFAULT '0.0.0',
  attributes JSON DEFAULT NULL,
  warnings JSON DEFAULT NULL,
  attributesLog JSON DEFAULT NULL,
  json_schema JSON DEFAULT NULL,
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  unvalidAttributes JSON DEFAULT NULL,
  subnature VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (domain, subdomain, model, version)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create table `map_id`
--
CREATE TABLE map_id (
  model_id INT(11) NOT NULL AUTO_INCREMENT,
  domain VARCHAR(50) NOT NULL DEFAULT 'Unset',
  subdomain VARCHAR(50) NOT NULL DEFAULT 'Unset',
  model VARCHAR(50) NOT NULL DEFAULT 'Unset',
  version VARCHAR(10) NOT NULL DEFAULT '0.0.0',
  PRIMARY KEY (model_id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create column `contextbroker` on table `EXT_values_rules`
--
ALTER TABLE EXT_values_rules 
  ADD COLUMN contextbroker VARCHAR(45) DEFAULT NULL;

--
-- Create column `service` on table `EXT_values_rules`
--
ALTER TABLE EXT_values_rules 
  ADD COLUMN service VARCHAR(25) DEFAULT NULL;

--
-- Create column `servicePath` on table `EXT_values_rules`
--
ALTER TABLE EXT_values_rules 
  ADD COLUMN servicePath VARCHAR(96) DEFAULT NULL;

--
-- Create table `EXT_brokers`
--
CREATE TABLE EXT_brokers (
  organization VARCHAR(50) NOT NULL,
  contextBrokerID VARCHAR(50) NOT NULL,
  accessLink VARCHAR(256) NOT NULL,
  multitenancy TINYINT(1) NOT NULL,
  NGSIvers VARCHAR(50) DEFAULT NULL,
  service VARCHAR(50) NOT NULL,
  servicePath VARCHAR(50) DEFAULT NULL,
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (accessLink, service)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create table `default_versions`
--
CREATE TABLE default_versions (
  domain VARCHAR(50) NOT NULL DEFAULT 'Unset',
  subdomain VARCHAR(50) NOT NULL DEFAULT 'Unset',
  model VARCHAR(50) NOT NULL DEFAULT 'Unset',
  defaultVersion VARCHAR(10) NOT NULL DEFAULT '0.0.0',
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (domain, subdomain, model)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;