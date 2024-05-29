
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
-- Alter column `created` on table `contextbroker`
--
ALTER TABLE contextbroker 
  MODIFY COLUMN created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter column `timestampstatus` on table `contextbroker`
--
ALTER TABLE contextbroker 
  MODIFY COLUMN timestampstatus TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter column `status` on table `temporary_devices`
--
ALTER TABLE temporary_devices 
  CHANGE COLUMN status status SET('new','invalid','valid') DEFAULT 'new';

--
-- Alter column `created` on table `temporary_devices`
--
ALTER TABLE temporary_devices 
  MODIFY COLUMN created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create column `wktGeometry` on table `devices`
--
ALTER TABLE devices 
  ADD COLUMN wktGeometry MEDIUMTEXT DEFAULT NULL;

--
-- Create column `hlt` on table `devices`
--
ALTER TABLE devices 
  ADD COLUMN hlt VARCHAR(30) DEFAULT NULL;

--
-- Alter column `created` on table `devices`
--
ALTER TABLE devices 
  MODIFY COLUMN created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create column `wktGeometry` on table `deleted_devices`
--
ALTER TABLE deleted_devices 
  ADD COLUMN wktGeometry MEDIUMTEXT DEFAULT NULL;

--
-- Create column `hlt` on table `deleted_devices`
--
ALTER TABLE deleted_devices 
  ADD COLUMN hlt VARCHAR(30) DEFAULT NULL;

--
-- Alter column `created` on table `deleted_devices`
--
ALTER TABLE deleted_devices 
  MODIFY COLUMN created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create column `real_time_flag` on table `event_values`
--
ALTER TABLE event_values 
  ADD COLUMN real_time_flag VARCHAR(50) DEFAULT NULL;

--
-- Create column `real_time_flag` on table `deleted_event_values`
--
ALTER TABLE deleted_event_values 
  ADD COLUMN real_time_flag VARCHAR(50) DEFAULT NULL;

--
-- Create column `hlt` on table `model`
--
ALTER TABLE model 
  ADD COLUMN hlt VARCHAR(30) DEFAULT NULL;
  
--
-- Drop index `PRIMARY` from table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
   DROP PRIMARY KEY;

--
-- Alter table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Alter column `domain` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN domain domain VARCHAR(50) NOT NULL DEFAULT 'Unset';

--
-- Alter column `subdomain` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN subdomain subdomain VARCHAR(50) NOT NULL DEFAULT 'Unset';

--
-- Alter column `model` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN model model VARCHAR(50) NOT NULL DEFAULT 'Unset';

--
-- Alter column `version` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN version version VARCHAR(10) NOT NULL DEFAULT '0.0.0';

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
-- Alter column `subnature` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  CHANGE COLUMN subnature subnature VARCHAR(50) DEFAULT NULL;

--
-- Alter column `timestamp` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  MODIFY COLUMN timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create index `PRIMARY` on table `raw_schema_model`
--
ALTER TABLE raw_schema_model 
  ADD PRIMARY KEY (domain, subdomain, model, version);

--
-- Alter column `timestamp` on table `EXT_brokers`
--
ALTER TABLE EXT_brokers 
  MODIFY COLUMN timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter column `timestamp` on table `default_versions`
--
ALTER TABLE default_versions 
  MODIFY COLUMN timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter column `time` on table `access_log`
--
ALTER TABLE access_log 
  MODIFY COLUMN time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;