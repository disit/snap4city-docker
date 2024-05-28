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
-- Create column `singleReadVariable` on table `SynopticTemplates`
--
ALTER TABLE SynopticTemplates 
  ADD COLUMN singleReadVariable VARCHAR(255) DEFAULT NULL;

--
-- Alter column `title_header` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  CHANGE COLUMN title_header title_header VARCHAR(300) DEFAULT NULL;

--
-- Create column `infoMsgPopup` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  ADD COLUMN infoMsgPopup VARCHAR(8) DEFAULT NULL;

--
-- Create column `infoMsgText` on table `Config_dashboard`
--
ALTER TABLE Config_dashboard 
  ADD COLUMN infoMsgText VARCHAR(300) DEFAULT NULL;

--
-- Create column `temporal_compare_w` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN temporal_compare_w VARCHAR(60) DEFAULT NULL;

--
-- Create column `TypicalTimeTrend` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN TypicalTimeTrend VARCHAR(3) DEFAULT NULL;

--
-- Create column `TrendType` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN TrendType VARCHAR(20) DEFAULT NULL;

--
-- Create column `ReferenceDate` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN ReferenceDate DATE DEFAULT NULL;

--
-- Create column `TTTDate` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN TTTDate VARCHAR(40) DEFAULT NULL;

--
-- Create column `computationType` on table `Config_widget_dashboard`
--
ALTER TABLE Config_widget_dashboard 
  ADD COLUMN computationType VARCHAR(40) DEFAULT NULL;

--
-- Create table `ToursSteps`
--
CREATE TABLE ToursSteps (
  id INT(11) NOT NULL AUTO_INCREMENT,
  tourName VARCHAR(50) NOT NULL,
  stepId VARCHAR(50) NOT NULL,
  title VARCHAR(100) DEFAULT NULL,
  text TEXT NOT NULL,
  attachToElementSelector VARCHAR(150) DEFAULT NULL,
  nextStepId VARCHAR(50) DEFAULT NULL,
  isFirstStep TINYINT(1) NOT NULL DEFAULT 0,
  nextBtnText VARCHAR(150) DEFAULT NULL,
  urlToOpenOnNext VARCHAR(250) DEFAULT NULL,
  urlOpenMode VARCHAR(20) DEFAULT NULL,
  withCancelBtn TINYINT(1) NOT NULL DEFAULT 0,
  cancelBtnText VARCHAR(150) DEFAULT NULL,
  withPreviousStepBtn TINYINT(1) NOT NULL DEFAULT 0,
  previousStepBtnText VARCHAR(150) DEFAULT NULL,
  menuToOpenOnShow VARCHAR(150) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `ToursSteps_step_key` on table `ToursSteps`
--
ALTER TABLE ToursSteps 
  ADD UNIQUE INDEX ToursSteps_step_key(tourName, stepId);

--
-- Create index `ToursSteps_stepsOrder_uq` on table `ToursSteps`
--
ALTER TABLE ToursSteps 
  ADD UNIQUE INDEX ToursSteps_stepsOrder_uq(tourName, nextStepId);

--
-- Create table `SynopticVarPresel`
--
CREATE TABLE SynopticVarPresel (
  id INT(11) NOT NULL AUTO_INCREMENT,
  usr VARCHAR(128) DEFAULT NULL,
  sel INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Alter table `Organizations`
--
ALTER TABLE Organizations 
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Alter column `organizationName` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN organizationName organizationName TINYTEXT DEFAULT NULL;

--
-- Alter column `kbUrl` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN kbUrl kbUrl TEXT DEFAULT NULL;

--
-- Alter column `gpsCentreLatLng` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN gpsCentreLatLng gpsCentreLatLng VARCHAR(45) DEFAULT NULL;

--
-- Alter column `lang` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN lang lang VARCHAR(16) DEFAULT NULL;

--
-- Alter column `broker` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN broker broker VARCHAR(45) DEFAULT NULL;

--
-- Alter column `orionIP` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN orionIP orionIP VARCHAR(45) DEFAULT NULL;

--
-- Alter column `orthomapJson` on table `Organizations`
--
ALTER TABLE Organizations 
  CHANGE COLUMN orthomapJson orthomapJson TEXT DEFAULT NULL;

--
-- Create column `kbIP` on table `Organizations`
--
ALTER TABLE Organizations 
  ADD COLUMN kbIP VARCHAR(45) DEFAULT NULL;

--
-- Alter column `personNumber` on table `OperatorEvents`
--
ALTER TABLE OperatorEvents 
  CHANGE COLUMN personNumber personNumber BIGINT(16) DEFAULT NULL;

--
-- Alter column `startValue` on table `NodeRedInputs`
--
ALTER TABLE NodeRedInputs 
  CHANGE COLUMN startValue startValue TEXT DEFAULT NULL;

--
-- Drop index `PRIMARY` from table `HeatmapColorLevels`
--
ALTER TABLE HeatmapColorLevels 
   DROP PRIMARY KEY;

--
-- Alter table `HeatmapColorLevels`
--
ALTER TABLE HeatmapColorLevels 
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Alter column `colorName` on table `HeatmapColorLevels`
--
ALTER TABLE HeatmapColorLevels 
  CHANGE COLUMN colorName colorName VARCHAR(32) NOT NULL;

--
-- Alter column `rgbValue` on table `HeatmapColorLevels`
--
ALTER TABLE HeatmapColorLevels 
  CHANGE COLUMN rgbValue rgbValue VARCHAR(64) DEFAULT NULL;

--
-- Create index `PRIMARY` on table `HeatmapColorLevels`
--
ALTER TABLE HeatmapColorLevels 
  ADD PRIMARY KEY (id, colorName);

--
-- Create column `publicLandingPageUrl` on table `Domains`
--
ALTER TABLE Domains 
  ADD COLUMN publicLandingPageUrl TINYTEXT DEFAULT NULL;

--
-- Create table `desTest`
--
CREATE TABLE desTest (
  id INT(11) NOT NULL AUTO_INCREMENT,
  origString VARCHAR(45) DEFAULT NULL,
  encryptedString VARBINARY(256) DEFAULT NULL,
  decryptedString VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create index `uniqueIdx` on table `desTest`
--
ALTER TABLE desTest 
  ADD UNIQUE INDEX uniqueIdx(origString);

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;