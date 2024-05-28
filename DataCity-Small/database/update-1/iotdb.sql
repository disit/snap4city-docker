
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
-- Drop table `new_tableMaiusc`
--
DROP TABLE new_tableMaiusc;

--
-- Drop table `value_types`
--
DROP TABLE value_types;

--
-- Drop foreign key
--
ALTER TABLE deleted_event_values 
   DROP FOREIGN KEY deleted_event_values_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE event_values 
   DROP FOREIGN KEY event_values_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE model 
   DROP FOREIGN KEY model_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE deleted_event_values 
   DROP FOREIGN KEY deleted_event_values_ibfk_3;

--
-- Drop foreign key
--
ALTER TABLE event_values 
   DROP FOREIGN KEY event_values_ibfk_3;

--
-- Drop foreign key
--
ALTER TABLE deleted_devices 
   DROP FOREIGN KEY deleted_devices_ibfk_3;

--
-- Drop foreign key
--
ALTER TABLE devices 
   DROP FOREIGN KEY devices_ibfk_3;

--
-- Drop foreign key
--
ALTER TABLE temporary_event_values 
   DROP FOREIGN KEY temporary_event_values_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE deleted_devices 
   DROP FOREIGN KEY deleted_devices_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE devices 
   DROP FOREIGN KEY devices_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE extractionRules 
   DROP FOREIGN KEY contextbroker_erfk_1;

--
-- Drop foreign key
--
ALTER TABLE services 
   DROP FOREIGN KEY broker_name_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE temporary_devices 
   DROP FOREIGN KEY temporary_devices_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE contextbroker 
   DROP FOREIGN KEY contextbroker_ibfk_1;

--
-- Drop foreign key
--
ALTER TABLE deleted_devices 
   DROP FOREIGN KEY deleted_devices_ibfk_2;

--
-- Drop foreign key
--
ALTER TABLE devices 
   DROP FOREIGN KEY devices_ibfk_2;

--
-- Alter table `protocols`
--
ALTER TABLE protocols 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `contextbroker`
--
ALTER TABLE contextbroker 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE contextbroker 
  ADD CONSTRAINT contextbroker_ibfk_1 FOREIGN KEY (protocol)
    REFERENCES protocols(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `temporary_devices`
--
ALTER TABLE temporary_devices 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE temporary_devices 
  ADD CONSTRAINT temporary_devices_ibfk_1 FOREIGN KEY (contextBroker)
    REFERENCES contextbroker(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `temporary_event_values`
--
ALTER TABLE temporary_event_values 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE temporary_event_values 
  ADD CONSTRAINT temporary_event_values_ibfk_1 FOREIGN KEY (device, cb)
    REFERENCES temporary_devices(id, contextBroker) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `services`
--
ALTER TABLE services 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE services 
  ADD CONSTRAINT broker_name_ibfk_1 FOREIGN KEY (broker_name)
    REFERENCES contextbroker(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Drop index `PRIMARY` from table `extractionRules`
--
ALTER TABLE extractionRules 
   DROP PRIMARY KEY;

--
-- Drop index `contextbroker_erfk_1` from table `extractionRules`
--
ALTER TABLE extractionRules 
   DROP INDEX contextbroker_erfk_1;

--
-- Alter table `extractionRules`
--
ALTER TABLE extractionRules 
ROW_FORMAT = DYNAMIC;

--
-- Alter column `id` on table `extractionRules`
--
ALTER TABLE extractionRules 
  CHANGE COLUMN id id VARCHAR(40) NOT NULL;

--
-- Alter column `contextbroker` on table `extractionRules`
--
ALTER TABLE extractionRules 
  CHANGE COLUMN contextbroker contextbroker VARCHAR(40) NOT NULL;

--
-- Create index `PRIMARY` on table `extractionRules`
--
ALTER TABLE extractionRules 
  ADD PRIMARY KEY (id, contextbroker);

--
-- Create foreign key
--
ALTER TABLE extractionRules 
  ADD CONSTRAINT contextbroker_erfk_1 FOREIGN KEY (contextbroker)
    REFERENCES contextbroker(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `formats`
--
ALTER TABLE formats 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `devices`
--
ALTER TABLE devices 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE devices 
  ADD CONSTRAINT devices_ibfk_2 FOREIGN KEY (protocol)
    REFERENCES protocols(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE devices 
  ADD CONSTRAINT devices_ibfk_3 FOREIGN KEY (format)
    REFERENCES formats(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE devices 
  ADD CONSTRAINT devices_ibfk_1 FOREIGN KEY (contextBroker)
    REFERENCES contextbroker(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `deleted_devices`
--
ALTER TABLE deleted_devices 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE deleted_devices 
  ADD CONSTRAINT deleted_devices_ibfk_2 FOREIGN KEY (protocol)
    REFERENCES protocols(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE deleted_devices 
  ADD CONSTRAINT deleted_devices_ibfk_3 FOREIGN KEY (format)
    REFERENCES formats(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE deleted_devices 
  ADD CONSTRAINT deleted_devices_ibfk_1 FOREIGN KEY (contextBroker)
    REFERENCES contextbroker(name) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `defaultpolicy`
--
ALTER TABLE defaultpolicy 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `model`
--
ALTER TABLE model 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE model 
  ADD CONSTRAINT model_ibfk_1 FOREIGN KEY (policy)
    REFERENCES defaultpolicy(policyname) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `data_types`
--
ALTER TABLE data_types 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `event_values`
--
ALTER TABLE event_values 
ROW_FORMAT = DYNAMIC;

--
-- Alter column `value_refresh_rate` on table `event_values`
--
ALTER TABLE event_values 
  CHANGE COLUMN value_refresh_rate value_refresh_rate INT(11) DEFAULT 0;

--
-- Create foreign key
--
ALTER TABLE event_values 
  ADD CONSTRAINT event_values_ibfk_3 FOREIGN KEY (cb, device)
    REFERENCES devices(contextBroker, id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE event_values 
  ADD CONSTRAINT event_values_ibfk_1 FOREIGN KEY (data_type)
    REFERENCES data_types(data_type) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `deleted_event_values`
--
ALTER TABLE deleted_event_values 
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE deleted_event_values 
  ADD CONSTRAINT deleted_event_values_ibfk_3 FOREIGN KEY (cb, device)
    REFERENCES deleted_devices(contextBroker, id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE deleted_event_values 
  ADD CONSTRAINT deleted_event_values_ibfk_1 FOREIGN KEY (data_type)
    REFERENCES data_types(data_type) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Alter table `users`
--
ALTER TABLE users 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `mainmenu`
--
ALTER TABLE mainmenu 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `functionalities`
--
ALTER TABLE functionalities 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `fieldType`
--
ALTER TABLE fieldType 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `edgegatewaytype`
--
ALTER TABLE edgegatewaytype 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `defaultcontestbrokerpolicy`
--
ALTER TABLE defaultcontestbrokerpolicy 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `bulkload_status`
--
ALTER TABLE bulkload_status 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `association_rules`
--
ALTER TABLE association_rules 
ROW_FORMAT = DYNAMIC;

--
-- Alter table `access_log`
--
ALTER TABLE access_log 
ROW_FORMAT = DYNAMIC;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;