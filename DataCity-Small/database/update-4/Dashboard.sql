
--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE Dashboard;

--
-- Alter view `monthly_usage`
--
CREATE OR REPLACE VIEW monthly_usage
AS
	SELECT
	  `IdDashDailyAccess`.`IdDashboard` AS `id`,
	  SUM(`IdDashDailyAccess`.`nAccessPerDay`) AS `monthly_clicks`,
	  SUM(`IdDashDailyAccess`.`nMinutesPerDay`) AS `monthly_minutes`,
	  (NOW() - INTERVAL 1 MONTH) AS `date_from`,
	  NOW() AS `date_to`
	FROM `IdDashDailyAccess`
	WHERE (`IdDashDailyAccess`.`date` >= (NOW() - INTERVAL 1 MONTH))
	GROUP BY `IdDashDailyAccess`.`IdDashboard`;

--
-- Alter column `synoptic_id` on table `SynopticMappings`
--
ALTER TABLE SynopticMappings 
  CHANGE COLUMN synoptic_id synoptic_id VARCHAR(16) DEFAULT NULL;

--
-- Create column `drawFlowEditor` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  ADD COLUMN drawFlowEditor MEDIUMTEXT DEFAULT NULL;

--
-- Alter column `creation_date` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  MODIFY COLUMN creation_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Create column `connections` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN connections MEDIUMTEXT DEFAULT NULL;

--
-- Alter column `creationDate` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  MODIFY COLUMN creationDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter column `sel` on table `SynopticVarPresel`
--
ALTER TABLE SynopticVarPresel 
  CHANGE COLUMN sel sel VARCHAR(32) DEFAULT NULL;

--
-- Create table `sessions`
--
CREATE TABLE sessions (
  id VARCHAR(32) NOT NULL,
  access INT(10) UNSIGNED DEFAULT NULL,
  data TEXT DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create table `fileextensions`
--
CREATE TABLE fileextensions (
  id INT(11) NOT NULL AUTO_INCREMENT,
  extension VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;


--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;