
--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Set default database
--
USE profiledb;

--
-- Alter column `created` on table `ownership`
--
ALTER TABLE ownership 
  MODIFY COLUMN created TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

--
-- Alter view `iot_data_relation`
--
CREATE OR REPLACE VIEW iot_data_relation
AS
	SELECT
	  `l`.`element_id` AS `id`,
	  `l`.`element_type` AS `type`,
	  `o1`.`elementName` AS `name`,
	  `o`.`elementId` AS `sourceId`,
	  `o`.`elementType` AS `sourceType`,
	  `o`.`elementName` AS `sourceName`
	FROM ((`lightactivity` `l`
	  LEFT JOIN `ownership` `o`
	    ON ((`o`.`elementId` = CONVERT(`l`.`source_id` USING utf8mb4))))
	  LEFT JOIN `ownership` `o1`
	    ON (((CONVERT(`l`.`element_id` USING utf8mb4) = `o1`.`elementId`)
	    AND ISNULL(`o`.`deleted`))));

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;