-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for view iatidatamart.iati-view-organisations
DROP VIEW IF EXISTS `iati-view-organisations`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-organisations` (
	`iati-identifier` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`participating-org-id` BIGINT(20) NULL,
	`participating-org-role-code` INT(11) NULL,
	`participating-org-type-code` CHAR(2) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` TINYTEXT NULL COLLATE 'utf8_general_ci',
	`publisher` CHAR(21) NULL COLLATE 'utf8_general_ci',
	`transaction-value` DOUBLE NULL,
	`transaction-value-eur` DOUBLE NULL
) ENGINE=MyISAM;


-- Dumping structure for view iatidatamart.iati-view-organisations
DROP VIEW IF EXISTS `iati-view-organisations`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-organisations` AS (select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`fct-organisations` `a` join `fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`receiver-org-id`)))) where ((`a`.`participating-org-role-code` = '4') and ((`t`.`transaction-type-code` = 'D') or (`t`.`transaction-type-code` = 'E'))) group by `a`.`iati-identifier`,`a`.`participating-org-id`) union (select `a`.`iati-identifier` AS `iati-identifier`,`a`.`participating-org-id` AS `participating-org-id`,`a`.`participating-org-role-code` AS `participating-org-role-code`,`a`.`participating-org-type-code` AS `participating-org-type-code`,`t`.`transaction-type-code` AS `transaction-type-code`,`t`.`publisher` AS `publisher`,sum(`t`.`transaction-value`) AS `transaction-value`,sum(`t`.`transaction-value-eur`) AS `transaction-value-eur` from (`fct-organisations` `a` join `fct-transactions` `t` on(((`a`.`iati-identifier` = `t`.`iati-identifier`) and (`a`.`participating-org-id` = `t`.`provider-org-id`)))) where ((`a`.`participating-org-role-code` = 1) and (`t`.`transaction-type-code` = 'IF')) group by `a`.`iati-identifier`,`a`.`participating-org-id`);
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
