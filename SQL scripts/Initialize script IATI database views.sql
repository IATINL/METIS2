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


-- Dumping database structure for iatidatamart
CREATE DATABASE IF NOT EXISTS `iatidatamart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `iatidatamart`;

-- Dumping structure for view iatidatamart.iati-view-activity-country
DROP VIEW IF EXISTS `iati-view-activity-country`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-activity-country` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`recipient-country-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`recipient-region-code` CHAR(3) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-budget-total
DROP VIEW IF EXISTS `iati-view-budget-total`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-budget-total` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`budget-value (EUR)` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-check-totals
DROP VIEW IF EXISTS `iati-view-check-totals`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-check-totals` (
	`job-number` INT(11) NULL,
	`publisher-id` INT(11) NULL,
	`url-id` INT(11) NULL,
	`subject` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`step-source` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`step-target` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`check-total-source` DOUBLE NULL,
	`check-total-target` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-funding-organisations
DROP VIEW IF EXISTS `iati-view-funding-organisations`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-funding-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` TINYTEXT NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-implementing-organisations
DROP VIEW IF EXISTS `iati-view-implementing-organisations`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-implementing-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` TINYTEXT NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-last-date-published
DROP VIEW IF EXISTS `iati-view-last-date-published`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-last-date-published` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci',
	`url` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-id` BIGINT(20) NULL,
	`url-id` BIGINT(20) NULL,
	`start-date` DATETIME NULL,
	`generated-datetime` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-organisations
DROP VIEW IF EXISTS `iati-view-organisations`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` TINYTEXT NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;

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

-- Dumping structure for view iatidatamart.iati-view-total-disbursements
DROP VIEW IF EXISTS `iati-view-total-disbursements`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-total-disbursements` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` TINYTEXT NULL COLLATE 'utf8_general_ci',
	`total-disbursement-value` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-activity-country
DROP VIEW IF EXISTS `iati-view-activity-country`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-activity-country`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-activity-country` AS select `trx`.`iati-identifier` AS `iati-identifier`,`trx`.`recipient-country-code` AS `recipient-country-code`,`trx`.`recipient-region-code` AS `recipient-region-code` from `iatidatamart`.`fct-transactions` `trx` group by `trx`.`iati-identifier`,`trx`.`recipient-country-code`,`trx`.`recipient-region-code`;

-- Dumping structure for view iatidatamart.iati-view-budget-total
DROP VIEW IF EXISTS `iati-view-budget-total`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-budget-total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-budget-total` AS select `iatidatamart`.`fct-budgets`.`iati-identifier` AS `iati-identifier`,sum(`iatidatamart`.`fct-budgets`.`budget-value-eur`) AS `budget-value (EUR)` from `iatidatamart`.`fct-budgets` group by `iatidatamart`.`fct-budgets`.`iati-identifier`;

-- Dumping structure for view iatidatamart.iati-view-check-totals
DROP VIEW IF EXISTS `iati-view-check-totals`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-check-totals`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-check-totals` AS select `a`.`job-number` AS `job-number`,`a`.`publisher-id` AS `publisher-id`,`a`.`url-id` AS `url-id`,`a`.`subject` AS `subject`,`a`.`step` AS `step-source`,`b`.`step` AS `step-target`,`a`.`check-total` AS `check-total-source`,`b`.`check-total` AS `check-total-target` from (`iatidatamart`.`log-check-totals` `a` join `iatidatamart`.`log-check-totals` `b`) where ((`a`.`job-number` = `b`.`job-number`) and (`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `b`.`url-id`) and (`a`.`subject` = `b`.`subject`) and (`a`.`step` <> `b`.`step`)) group by `a`.`job-number`,`a`.`publisher-id`,`a`.`url-id`,`a`.`subject`;

-- Dumping structure for view iatidatamart.iati-view-funding-organisations
DROP VIEW IF EXISTS `iati-view-funding-organisations`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-funding-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-funding-organisations` AS select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`iatidatamart`.`fct-organisations` `a` join `iatidatamart`.`fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`provider-org-id`)))) where ((`a`.`participating-org-role-code` = 1) and (`t`.`transaction-type-code` = 'IF')) group by `a`.`iati-identifier`,`a`.`participating-org-id`;

-- Dumping structure for view iatidatamart.iati-view-implementing-organisations
DROP VIEW IF EXISTS `iati-view-implementing-organisations`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-implementing-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-implementing-organisations` AS select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`iatidatamart`.`fct-organisations` `a` join `iatidatamart`.`fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`receiver-org-id`)))) where ((`a`.`participating-org-role-code` = '4') and ((`t`.`transaction-type-code` = 'D') or (`t`.`transaction-type-code` = 'E'))) group by `a`.`iati-identifier`,`a`.`participating-org-id`;

-- Dumping structure for view iatidatamart.iati-view-last-date-published
DROP VIEW IF EXISTS `iati-view-last-date-published`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-last-date-published`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-last-date-published` AS select `b`.`publisher` AS `publisher`,`b`.`publisher-name` AS `publisher-name`,`u`.`url` AS `url`,`a`.`publisher-id` AS `publisher-id`,`a`.`url-id` AS `url-id`,max(`a`.`publisher-job-url-start-date-time`) AS `start-date`,max(cast(`a`.`generated-datetime` as datetime)) AS `generated-datetime` from ((`iatidatamart`.`log-publisher-job-url` `a` join `iatischema`.`ctl-publishers` `b`) join `iatidatamart`.`dim-url` `u`) where ((`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `u`.`url-id`) and (`a`.`generated-datetime` <> 'Not defined')) group by `a`.`publisher-id`,`u`.`url`;

-- Dumping structure for view iatidatamart.iati-view-organisations
DROP VIEW IF EXISTS `iati-view-organisations`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-organisations` AS (select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`iatidatamart`.`fct-organisations` `a` join `iatidatamart`.`fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`receiver-org-id`)))) where ((`a`.`participating-org-role-code` = '4') and ((`t`.`transaction-type-code` = 'D') or (`t`.`transaction-type-code` = 'E'))) group by `a`.`iati-identifier`,`a`.`participating-org-id`) union (select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`iatidatamart`.`fct-organisations` `a` join `iatidatamart`.`fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`provider-org-id`)))) where ((`a`.`participating-org-role-code` = 1) and (`t`.`transaction-type-code` = 'IF')) group by `a`.`iati-identifier`,`a`.`participating-org-id`);

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

-- Dumping structure for view iatidatamart.iati-view-total-disbursements
DROP VIEW IF EXISTS `iati-view-total-disbursements`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-total-disbursements`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iatidatamart`.`iati-view-total-disbursements` AS select `iatidatamart`.`fct-transactions`.`iati-identifier` AS `iati-identifier`,`iatidatamart`.`fct-transactions`.`transaction-type-code` AS `transaction-type-code`,sum(`iatidatamart`.`fct-transactions`.`transaction-value-eur`) AS `total-disbursement-value` from `iatidatamart`.`fct-transactions` where (`iatidatamart`.`fct-transactions`.`transaction-type-code` = 'D') group by `iatidatamart`.`fct-transactions`.`iati-identifier`,`iatidatamart`.`fct-transactions`.`transaction-type-code`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
