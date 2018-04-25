-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
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
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-activity-country` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`recipient-country-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`recipient-region-code` CHAR(3) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-budget-total
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-budget-total` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`budget-value (EUR)` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-check-totals
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
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-funding-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-implementing-organisations
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-implementing-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-kumu-connections
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-kumu-connections` (
	`From` TEXT NULL COLLATE 'utf8_bin',
	`To` TEXT NULL COLLATE 'utf8_bin',
	`Type` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci',
	`BZ activity` CHAR(100) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-kumu-elements
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-kumu-elements` (
	`Label` TEXT NULL COLLATE 'utf8_bin',
	`Type` VARCHAR(85) NULL COLLATE 'utf8_general_ci',
	`Volume` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-kumu-elements-basic
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-kumu-elements-basic` (
	`Label` TEXT NULL COLLATE 'utf8_bin',
	`Type` VARCHAR(85) NULL COLLATE 'utf8_general_ci',
	`Total flows` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-last-date-published
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
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-publisher-error-log
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-publisher-error-log` (
	`job-number` INT(11) NULL,
	`publisher-id` INT(11) NULL,
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci',
	`url-id` INT(11) NULL,
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8mb4_bin',
	`error-code` VARCHAR(15) NULL COLLATE 'utf8mb4_bin',
	`error-class` VARCHAR(25) NULL COLLATE 'utf8mb4_bin',
	`error-level` VARCHAR(15) NULL COLLATE 'utf8mb4_bin',
	`error-location` VARCHAR(255) NULL COLLATE 'utf8mb4_bin',
	`error-text` VARCHAR(1024) NULL COLLATE 'utf8mb4_bin',
	`url` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`job-start-date-time` DATETIME NULL,
	`job-end-date-time` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-publishers
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-publishers` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-id` INT(11) NOT NULL,
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-timeliness
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-timeliness` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci',
	`publisher-id` BIGINT(20) NULL,
	`start-date` DATE NULL,
	`generated-datetime` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-timeliness-body
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-timeliness-body` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-name` VARCHAR(128) NULL COLLATE 'utf8_general_ci',
	`publisher-id` BIGINT(20) NULL,
	`generated-datetime` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-timeliness-max-start-date
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-timeliness-max-start-date` (
	`publisher-id` BIGINT(20) NULL,
	`start-date` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-total-disbursements
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-total-disbursements` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`total-disbursement-value` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view iatidatamart.iati-view-activity-country
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-activity-country`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-activity-country` AS select `trx`.`iati-identifier` AS `iati-identifier`,`trx`.`recipient-country-code` AS `recipient-country-code`,`trx`.`recipient-region-code` AS `recipient-region-code` from `fct-transactions` `trx` group by `trx`.`iati-identifier`,`trx`.`recipient-country-code`,`trx`.`recipient-region-code`;

-- Dumping structure for view iatidatamart.iati-view-budget-total
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-budget-total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-budget-total` AS select `fct-budgets`.`iati-identifier` AS `iati-identifier`,sum(`fct-budgets`.`budget-value-eur`) AS `budget-value (EUR)` from `fct-budgets` group by `fct-budgets`.`iati-identifier`;

-- Dumping structure for view iatidatamart.iati-view-check-totals
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-check-totals`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-check-totals` AS select `a`.`job-number` AS `job-number`,`a`.`publisher-id` AS `publisher-id`,`a`.`url-id` AS `url-id`,`a`.`subject` AS `subject`,`a`.`step` AS `step-source`,`b`.`step` AS `step-target`,`a`.`check-total` AS `check-total-source`,`b`.`check-total` AS `check-total-target` from (`log-check-totals` `a` join `log-check-totals` `b`) where ((`a`.`job-number` = `b`.`job-number`) and (`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `b`.`url-id`) and (`a`.`subject` = `b`.`subject`) and (`a`.`step` <> `b`.`step`)) group by `a`.`job-number`,`a`.`publisher-id`,`a`.`url-id`,`a`.`subject`;

-- Dumping structure for view iatidatamart.iati-view-funding-organisations
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-funding-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-funding-organisations` AS select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`fct-organisations` `a` join `fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`provider-org-id`)))) where ((`a`.`participating-org-role-code` = 1) and (`t`.`transaction-type-code` = 'IF')) group by `a`.`iati-identifier`,`a`.`participating-org-id`;

-- Dumping structure for view iatidatamart.iati-view-implementing-organisations
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-implementing-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-implementing-organisations` AS select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`fct-organisations` `a` join `fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`receiver-org-id`)))) where ((`a`.`participating-org-role-code` = '4') and ((`t`.`transaction-type-code` = 'D') or (`t`.`transaction-type-code` = 'E'))) group by `a`.`iati-identifier`,`a`.`participating-org-id`;

-- Dumping structure for view iatidatamart.iati-view-kumu-connections
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-kumu-connections`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-kumu-connections` AS select `prov-org`.`organisation-name` AS `From`,`act`.`reporting-org-name` AS `To`,'In' AS `Type`,`trx`.`buza-ancestor-activity-id` AS `BZ activity` from ((`fct-transactions` `trx` join `dim-organisation` `prov-org` on((`prov-org`.`organisation-id` = `trx`.`provider-org-id`))) join `dim-activity` `act` on((`act`.`iati-identifier` = `trx`.`iati-identifier`))) where ((`trx`.`buza-descendant-yn` = 'Y') and (`prov-org`.`organisation-name` <> `act`.`reporting-org-name`) and ((`trx`.`transaction-type-code` = 'IC') or (`trx`.`transaction-type-code` = 'IF'))) group by `prov-org`.`organisation-name`,`act`.`reporting-org-name`,'In' union select `act`.`reporting-org-name` AS `From`,`rec-org`.`organisation-name` AS `To`,'Out' AS `Type`,`trx`.`buza-ancestor-activity-id` AS `BZ activity` from ((`fct-transactions` `trx` join `dim-organisation` `rec-org` on((`rec-org`.`organisation-id` = `trx`.`receiver-org-id`))) join `dim-activity` `act` on((`act`.`iati-identifier` = `trx`.`iati-identifier`))) where ((`trx`.`buza-descendant-yn` = 'Y') and (`rec-org`.`organisation-name` <> `act`.`reporting-org-name`) and ((`trx`.`transaction-type-code` = 'D') or (`trx`.`transaction-type-code` = 'E'))) group by `act`.`reporting-org-name`,`rec-org`.`organisation-name`,'Out';

-- Dumping structure for view iatidatamart.iati-view-kumu-elements
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-kumu-elements`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-kumu-elements` AS select `iati-view-kumu-elements-basic`.`Label` AS `Label`,max(`iati-view-kumu-elements-basic`.`Type`) AS `Type`,sum(`iati-view-kumu-elements-basic`.`Total flows`) AS `Volume` from `iati-view-kumu-elements-basic` group by `iati-view-kumu-elements-basic`.`Label`;

-- Dumping structure for view iatidatamart.iati-view-kumu-elements-basic
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-kumu-elements-basic`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-kumu-elements-basic` AS select `org`.`organisation-name` AS `Label`,`org`.`organisation-type-name` AS `Type`,sum(`trx`.`transaction-value-eur`) AS `Total flows` from (`fct-transactions` `trx` join `dim-organisation` `org` on((`trx`.`provider-org-id` = `org`.`organisation-id`))) where ((`trx`.`buza-descendant-yn` = 'Y') or (left(`trx`.`iati-identifier`,8) = 'XM-DAC-7-PPR')) group by `org`.`organisation-name`,`org`.`organisation-type-name` union select `org`.`organisation-name` AS `Label`,`org`.`organisation-type-name` AS `Type`,sum(`trx`.`transaction-value-eur`) AS `Total flows` from (`fct-transactions` `trx` join `dim-organisation` `org` on((`trx`.`receiver-org-id` = `org`.`organisation-id`))) where ((`trx`.`buza-descendant-yn` = 'Y') or (left(`trx`.`iati-identifier`,8) = 'XM-DAC-7-PPR')) group by `org`.`organisation-name`,`org`.`organisation-type-name`;

-- Dumping structure for view iatidatamart.iati-view-last-date-published
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-last-date-published`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-last-date-published` AS select `b`.`publisher` AS `publisher`,`b`.`publisher-name` AS `publisher-name`,`u`.`url` AS `url`,`a`.`publisher-id` AS `publisher-id`,`a`.`url-id` AS `url-id`,max(`a`.`publisher-job-url-start-date-time`) AS `start-date`,max(cast(`a`.`generated-datetime` as datetime)) AS `generated-datetime` from ((`iatidatamart`.`log-publisher-job-url` `a` join `iatischema`.`ctl-publishers` `b`) join `iatidatamart`.`dim-url` `u`) where ((`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `u`.`url-id`) and (`a`.`generated-datetime` <> 'Not defined')) group by `a`.`publisher-id`,`u`.`url`;

-- Dumping structure for view iatidatamart.iati-view-organisations
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-organisations` AS (select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`fct-organisations` `a` join `fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`receiver-org-id`)))) where ((`a`.`participating-org-role-code` = '4') and ((`t`.`transaction-type-code` = 'D') or (`t`.`transaction-type-code` = 'E'))) group by `a`.`iati-identifier`,`a`.`participating-org-id`) union (select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`fct-organisations` `a` join `fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`provider-org-id`)))) where ((`a`.`participating-org-role-code` = 1) and (`t`.`transaction-type-code` = 'IF')) group by `a`.`iati-identifier`,`a`.`participating-org-id`);

-- Dumping structure for view iatidatamart.iati-view-publisher-error-log
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-publisher-error-log`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-publisher-error-log` AS select `err`.`job-number` AS `job-number`,`err`.`publisher-id` AS `publisher-id`,`pbl`.`publisher` AS `publisher`,`pbl`.`publisher-name` AS `publisher-name`,`err`.`url-id` AS `url-id`,`err`.`iati-identifier` AS `iati-identifier`,`err`.`error-code` AS `error-code`,`err`.`error-class` AS `error-class`,`err`.`error-level` AS `error-level`,`err`.`error-location` AS `error-location`,`err`.`error-text` AS `error-text`,`url`.`url` AS `url`,`job`.`job-start-date-time` AS `job-start-date-time`,`job`.`job-end-date-time` AS `job-end-date-time` from (((`iatidatamart`.`log-publisher-errors` `err` join `iatischema`.`ctl-publishers` `pbl` on((`err`.`publisher-id` = `pbl`.`publisher-id`))) join `iatidatamart`.`dim-url` `url` on((`url`.`url-id` = `err`.`url-id`))) join `iatidatamart`.`log-iati-job` `job` on((`job`.`job-number` = `err`.`job-number`)));

-- Dumping structure for view iatidatamart.iati-view-publishers
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-publishers`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-publishers` AS select `iatischema`.`ctl-publishers`.`publisher` AS `publisher`,`iatischema`.`ctl-publishers`.`publisher-id` AS `publisher-id`,`iatischema`.`ctl-publishers`.`publisher-name` AS `publisher-name` from `iatischema`.`ctl-publishers`;

-- Dumping structure for view iatidatamart.iati-view-timeliness
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-timeliness`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-timeliness` AS select `a`.`publisher` AS `publisher`,`a`.`publisher-name` AS `publisher-name`,`a`.`publisher-id` AS `publisher-id`,`b`.`start-date` AS `start-date`,`a`.`generated-datetime` AS `generated-datetime` from (`iatidatamart`.`iati-view-timeliness-body` `a` join `iatidatamart`.`iati-view-timeliness-max-start-date` `b` on((`a`.`publisher-id` = `b`.`publisher-id`)));

-- Dumping structure for view iatidatamart.iati-view-timeliness-body
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-timeliness-body`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-timeliness-body` AS select `b`.`publisher` AS `publisher`,`b`.`publisher-name` AS `publisher-name`,`a`.`publisher-id` AS `publisher-id`,max(cast(`a`.`generated-datetime` as date)) AS `generated-datetime` from ((`iatidatamart`.`log-publisher-job-url` `a` join `iatischema`.`ctl-publishers` `b`) join `iatidatamart`.`dim-url` `u`) where ((`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `u`.`url-id`) and (`a`.`generated-datetime` <> 'Not defined') and (`a`.`log-status` = 'Ok')) group by `a`.`publisher-id`;

-- Dumping structure for view iatidatamart.iati-view-timeliness-max-start-date
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-timeliness-max-start-date`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-timeliness-max-start-date` AS select `a`.`publisher-id` AS `publisher-id`,max(cast(`a`.`publisher-job-url-start-date-time` as date)) AS `start-date` from `log-publisher-job-url` `a` group by `a`.`publisher-id`;

-- Dumping structure for view iatidatamart.iati-view-total-disbursements
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-total-disbursements`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-total-disbursements` AS select `fct-transactions`.`iati-identifier` AS `iati-identifier`,`fct-transactions`.`transaction-type-code` AS `transaction-type-code`,sum(`fct-transactions`.`transaction-value-eur`) AS `total-disbursement-value` from `fct-transactions` where (`fct-transactions`.`transaction-type-code` = 'D') group by `fct-transactions`.`iati-identifier`,`fct-transactions`.`transaction-type-code`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
