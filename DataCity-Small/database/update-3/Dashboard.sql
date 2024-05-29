
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
-- Alter view `monthly_usage`
--
CREATE OR REPLACE
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
-- Create column `theme` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  ADD COLUMN theme VARCHAR(64) DEFAULT NULL;

--
-- Create column `code` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN code MEDIUMTEXT DEFAULT NULL;

--
-- Create index `idx_Config_widget_dashboard_appid` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD INDEX idx_Config_widget_dashboard_appid(appId(255));

--
-- Create table `TrustedUsers`
--
CREATE TABLE TrustedUsers (
  id INT(11) NOT NULL AUTO_INCREMENT,
  userName VARCHAR(128) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci,
ROW_FORMAT = COMPACT;

--
-- Create column `ghRouting` on table `Organizations`
--
ALTER TABLE Organizations 
  ADD COLUMN ghRouting TEXT DEFAULT NULL;

--
-- Create table `camdata`
--
CREATE TABLE camdata (
  name VARCHAR(128) NOT NULL,
  username VARCHAR(128) DEFAULT 'admin',
  password VARCHAR(128) DEFAULT '123456',
  serviceuri VARCHAR(128) DEFAULT NULL,
  PRIMARY KEY (name)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
ROW_FORMAT = COMPACT;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;