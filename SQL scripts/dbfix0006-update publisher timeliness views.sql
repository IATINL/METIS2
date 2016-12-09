-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for view iatidatamart.iati-view-timeliness
DROP VIEW IF EXISTS `iati-view-timeliness`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-timeliness` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci',
	`publisher-id` BIGINT(20) NULL,
	`start-date` DATE NULL,
	`generated-datetime` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-timeliness-body
DROP VIEW IF EXISTS `iati-view-timeliness-body`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-timeliness-body` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci',
	`publisher-id` BIGINT(20) NULL,
	`generated-datetime` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-timeliness-max-start-date
DROP VIEW IF EXISTS `iati-view-timeliness-max-start-date`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-timeliness-max-start-date` (
	`publisher-id` BIGINT(20) NULL,
	`start-date` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-timeliness
DROP VIEW IF EXISTS `iati-view-timeliness`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-timeliness`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-timeliness` AS select `a`.`publisher` AS `publisher`,`a`.`publisher-name` AS `publisher-name`,`a`.`publisher-id` AS `publisher-id`,`b`.`start-date` AS `start-date`,`a`.`generated-datetime` AS `generated-datetime` from (`iatidatamart`.`iati-view-timeliness-body` `a` join `iatidatamart`.`iati-view-timeliness-max-start-date` `b` on((`a`.`publisher-id` = `b`.`publisher-id`)));

-- Dumping structure for view iatidatamart.iati-view-timeliness-body
DROP VIEW IF EXISTS `iati-view-timeliness-body`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-timeliness-body`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-timeliness-body` AS select `b`.`publisher` AS `publisher`,`b`.`publisher-name` AS `publisher-name`,`a`.`publisher-id` AS `publisher-id`,max(cast(`a`.`generated-datetime` as date)) AS `generated-datetime` from ((`iatidatamart`.`log-publisher-job-url` `a` join `iatischema`.`ctl-publishers` `b`) join `iatidatamart`.`dim-url` `u`) where ((`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `u`.`url-id`) and (`a`.`generated-datetime` <> 'Not defined') and (`a`.`log-status` = 'Ok')) group by `a`.`publisher-id`;

-- Dumping structure for view iatidatamart.iati-view-timeliness-max-start-date
DROP VIEW IF EXISTS `iati-view-timeliness-max-start-date`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-timeliness-max-start-date`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-timeliness-max-start-date` AS select `a`.`publisher-id` AS `publisher-id`,max(cast(`a`.`publisher-job-url-start-date-time` as date)) AS `start-date` from `iatidatamart`.`log-publisher-job-url` `a` group by `a`.`publisher-id`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
