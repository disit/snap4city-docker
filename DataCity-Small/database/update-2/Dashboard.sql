
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
-- Create column `value_name` on table `DashboardWizard`
--
ALTER TABLE DashboardWizard 
  ADD COLUMN value_name VARCHAR(256) DEFAULT NULL;

--
-- Create column `value_type` on table `DashboardWizard`
--
ALTER TABLE DashboardWizard 
  ADD COLUMN value_type VARCHAR(256) DEFAULT NULL;

--
-- Create column `device_model_name` on table `DashboardWizard`
--
ALTER TABLE DashboardWizard 
  ADD COLUMN device_model_name VARCHAR(256) DEFAULT NULL;

--
-- Create column `broker_name` on table `DashboardWizard`
--
ALTER TABLE DashboardWizard 
  ADD COLUMN broker_name VARCHAR(128) DEFAULT NULL;

--
-- Alter view `synoptics`
--
CREATE OR REPLACE
VIEW synoptics
AS
SELECT
  `d`.`id` AS `id`,
  `d`.`unique_name_id` AS `name`,
  `t`.`id` AS `template_id`,
  `d`.`user` AS `owner`,
  `d`.`lastCheck` AS `created`
FROM (`DashboardWizard` `d`
  JOIN `templates` `t`)
WHERE ((`d`.`high_level_type` = 'Synoptic')
AND (`d`.`low_level_type` = `t`.`name`));

--
-- Create view `monthly_usage`
--
CREATE
VIEW monthly_usage
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
-- Alter column `rowParameters` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  CHANGE COLUMN rowParameters rowParameters MEDIUMTEXT DEFAULT NULL;

--
-- Create column `drupalUrl` on table `Organizations`
--
ALTER TABLE Organizations 
  ADD COLUMN drupalUrl TEXT DEFAULT NULL;

--
-- Create column `orgUrl` on table `Organizations`
--
ALTER TABLE Organizations 
  ADD COLUMN orgUrl TEXT DEFAULT NULL;

--
-- Create column `welcomeUrl` on table `Organizations`
--
ALTER TABLE Organizations 
  ADD COLUMN welcomeUrl TEXT DEFAULT NULL;

--
-- Create column `users` on table `Organizations`
--
ALTER TABLE Organizations 
  ADD COLUMN users TEXT DEFAULT NULL;

--
-- Create table `BIMProjects`
--
CREATE TABLE BIMProjects (
  id INT(11) NOT NULL AUTO_INCREMENT,
  poid INT(11) NOT NULL,
  project_name VARCHAR(128) DEFAULT NULL,
  nature VARCHAR(128) DEFAULT NULL,
  sub_nature VARCHAR(128) DEFAULT NULL,
  organizations TEXT DEFAULT NULL,
  PRIMARY KEY (id, poid)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
ROW_FORMAT = COMPACT;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;