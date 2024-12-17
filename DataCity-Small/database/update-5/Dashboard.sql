
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
-- Alter column `subtitle_header` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  CHANGE COLUMN subtitle_header subtitle_header VARCHAR(300) DEFAULT NULL;

--
-- Create column `metaData` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  ADD COLUMN metaData TEXT DEFAULT NULL;

--
-- Alter column `title_w` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  CHANGE COLUMN title_w title_w VARCHAR(600) DEFAULT NULL;

--
-- Create table `TrustedUserGroups`
--
CREATE TABLE TrustedUserGroups (
  id INT(11) NOT NULL,
  username VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci,
ROW_FORMAT = COMPACT;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;