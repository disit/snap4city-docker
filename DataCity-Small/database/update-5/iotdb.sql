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
-- Create column `is_in_kb` on table `devices`
--
ALTER TABLE devices 
  ADD COLUMN is_in_kb VARCHAR(45) DEFAULT NULL;

--
-- Create column `is_in_db` on table `devices`
--
ALTER TABLE devices 
  ADD COLUMN is_in_db VARCHAR(45) DEFAULT NULL;

--
-- Create column `is_in_broker` on table `devices`
--
ALTER TABLE devices 
  ADD COLUMN is_in_broker VARCHAR(45) DEFAULT NULL;

--
-- Create column `is_in_kb` on table `deleted_devices`
--
ALTER TABLE deleted_devices 
  ADD COLUMN is_in_kb VARCHAR(45) DEFAULT NULL;

--
-- Create column `is_in_db` on table `deleted_devices`
--
ALTER TABLE deleted_devices 
  ADD COLUMN is_in_db VARCHAR(45) DEFAULT NULL;

--
-- Create column `is_in_broker` on table `deleted_devices`
--
ALTER TABLE deleted_devices 
  ADD COLUMN is_in_broker VARCHAR(45) DEFAULT NULL;

--
-- Alter column `attributes` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN attributes attributes JSON DEFAULT NULL;

--
-- Alter column `warnings` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN warnings warnings JSON DEFAULT NULL;

--
-- Alter column `attributesLog` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN attributesLog attributesLog JSON DEFAULT NULL;

--
-- Alter column `json_schema` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN json_schema json_schema JSON DEFAULT NULL;

--
-- Alter column `unvalidAttributes` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN unvalidAttributes unvalidAttributes JSON DEFAULT NULL;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;