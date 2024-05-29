
--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE processloader_db;


--
-- Create table `healthiness_users`
--
CREATE TABLE healthiness_users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE(id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci;

--
-- Alter column `id` on table `functionalities`
--
ALTER TABLE functionalities 
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT;


--
-- Create table `device_check_table`
--
CREATE TABLE device_check_table (
  ServiceURI VARCHAR(250) BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  Organization VARCHAR(200) DEFAULT NULL,
  Broker VARCHAR(200) DEFAULT NULL,
  DeviceName VARCHAR(100) DEFAULT NULL,
  DeviceModel VARCHAR(100) DEFAULT NULL,
  Nature VARCHAR(45) DEFAULT NULL,
  Subnature VARCHAR(45) DEFAULT NULL,
  VariableName VARCHAR(100) DEFAULT NULL,
  VariableValue VARCHAR(2000) DEFAULT NULL,
  ExpectedDate VARCHAR(45) DEFAULT NULL,
  LastMeasureDate VARCHAR(45) DEFAULT NULL,
  FailuresNumber INT(11) DEFAULT NULL,
  LastNotHealthy INT(11) DEFAULT NULL,
  Delta INT(11) DEFAULT NULL,
  MaxDelta INT(11) DEFAULT NULL,
  Percentage DECIMAL(8, 5) DEFAULT NULL,
  InsertTimestamp DATETIME DEFAULT NULL
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create index `healthiness_index` on table `device_check_table`
--
ALTER TABLE device_check_table 
  ADD INDEX healthiness_index(ServiceURI, VariableName);

--
-- Create index `healthiness_index2` on table `device_check_table`
--
ALTER TABLE device_check_table 
  ADD INDEX healthiness_index2(ServiceURI);

--
-- Create table `bigdatafordevice`
--
CREATE TABLE bigdatafordevice (
  suri VARCHAR(128) NOT NULL,
  dateObserved DATETIME NOT NULL,
  data LONGTEXT BINARY CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (suri, dateObserved)
)
ENGINE = INNODB,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;