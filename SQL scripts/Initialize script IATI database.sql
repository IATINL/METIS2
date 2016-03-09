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

-- Dumping database structure for iatidatamart
DROP DATABASE IF EXISTS `iatidatamart`;
CREATE DATABASE IF NOT EXISTS `iatidatamart` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iatidatamart`;


-- Dumping structure for table iatidatamart.dim-activity
DROP TABLE IF EXISTS `dim-activity`;
CREATE TABLE IF NOT EXISTS `dim-activity` (
  `iati-identifier` char(100) DEFAULT NULL,
  `activity-status` tinytext,
  `contact-organisation` tinytext,
  `contact-person-name` tinytext,
  `contact-telephone` tinytext,
  `contact-email` tinytext,
  `contact-mailing-address` mediumtext,
  `activity-website` tinytext,
  `default-finance-type` tinytext,
  `default-tied-status` tinytext,
  `reporting-org-name` tinytext,
  `activity-title` mediumtext,
  `reporting-org-ref` tinytext,
  `reporting-org-type` tinytext,
  `reporting-org-type-name` tinytext,
  `end-actual` datetime DEFAULT NULL,
  `end-planned` datetime DEFAULT NULL,
  `start-actual` datetime DEFAULT NULL,
  `start-planned` datetime DEFAULT NULL,
  `marker-gender` int(11) DEFAULT NULL,
  `marker-environment` int(11) DEFAULT NULL,
  `marker-pdgg` int(11) DEFAULT NULL,
  `marker-trade` int(11) DEFAULT NULL,
  `marker-biodiv` int(11) DEFAULT NULL,
  `marker-climate-mitigation` int(11) DEFAULT NULL,
  `marker-climate-adaptation` int(11) DEFAULT NULL,
  `marker-desertification` int(11) DEFAULT NULL,
  `marker-rmnch` int(11) DEFAULT NULL,
  `org-accountable` mediumtext,
  `org-implementing` mediumtext,
  `org-funding` mediumtext,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `related-activity-id` char(100) DEFAULT NULL,
  `Is-parent` char(1) DEFAULT NULL,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx_dim-activity_lookup` (`iati-identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-budget-type
DROP TABLE IF EXISTS `dim-budget-type`;
CREATE TABLE IF NOT EXISTS `dim-budget-type` (
  `budget-type` int(11) NOT NULL,
  `budget-type-name` tinytext,
  PRIMARY KEY (`budget-type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-country
DROP TABLE IF EXISTS `dim-country`;
CREATE TABLE IF NOT EXISTS `dim-country` (
  `recipient-country-code` varchar(2) NOT NULL,
  `recipient-country-name` tinytext,
  PRIMARY KEY (`recipient-country-code`),
  KEY `idx_dim-country_lookup` (`recipient-country-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-description-type
DROP TABLE IF EXISTS `dim-description-type`;
CREATE TABLE IF NOT EXISTS `dim-description-type` (
  `description-type-name` tinytext,
  `description-type-narrative` tinytext,
  `description-type-code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-document-type
DROP TABLE IF EXISTS `dim-document-type`;
CREATE TABLE IF NOT EXISTS `dim-document-type` (
  `document-type-code` char(3) NOT NULL,
  `document-type-name` tinytext,
  `document-type-description` tinytext,
  `category-code` char(1) DEFAULT NULL,
  `category-name` tinytext,
  `category-description` tinytext,
  PRIMARY KEY (`document-type-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-indicator-measure
DROP TABLE IF EXISTS `dim-indicator-measure`;
CREATE TABLE IF NOT EXISTS `dim-indicator-measure` (
  `indicator-measure-code` int(11) DEFAULT NULL,
  `indicator-measure-name` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-location-type
DROP TABLE IF EXISTS `dim-location-type`;
CREATE TABLE IF NOT EXISTS `dim-location-type` (
  `location-type-code` char(6) DEFAULT NULL,
  `location-type-name` tinytext,
  `location-type-description` tinytext,
  `location-type-category-code` char(1) DEFAULT NULL,
  `location-type-category-name` tinytext,
  KEY `idx_dim-location-type_lookup` (`location-type-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-organisation
DROP TABLE IF EXISTS `dim-organisation`;
CREATE TABLE IF NOT EXISTS `dim-organisation` (
  `organisation-id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organisation-ref` varchar(45) DEFAULT NULL,
  `organisation-name` varchar(255) DEFAULT NULL,
  `organisation-type-code` char(2) DEFAULT NULL,
  `organisation-type-name` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`organisation-id`),
  KEY `idx-organisation-ref` (`organisation-ref`),
  KEY `idx-organisation-name` (`organisation-name`),
  KEY `idx-organisation-ref-name` (`organisation-ref`,`organisation-name`),
  KEY `idx-organisation-type` (`organisation-type-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-organisation-role
DROP TABLE IF EXISTS `dim-organisation-role`;
CREATE TABLE IF NOT EXISTS `dim-organisation-role` (
  `participating-org-role-code` int(11) DEFAULT NULL,
  `participating-org-role-name` varchar(20) DEFAULT NULL,
  `participating-org-role-description` tinytext,
  KEY `idx_dim-organisation-role_lookup` (`participating-org-role-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-region
DROP TABLE IF EXISTS `dim-region`;
CREATE TABLE IF NOT EXISTS `dim-region` (
  `recipient-region-code` char(11) NOT NULL,
  `recipient-region-name` tinytext,
  PRIMARY KEY (`recipient-region-code`),
  KEY `idx_dim-region_lookup` (`recipient-region-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-result-type
DROP TABLE IF EXISTS `dim-result-type`;
CREATE TABLE IF NOT EXISTS `dim-result-type` (
  `result-type-code` int(11) DEFAULT NULL,
  `result-type-name` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-sector
DROP TABLE IF EXISTS `dim-sector`;
CREATE TABLE IF NOT EXISTS `dim-sector` (
  `sector-code` char(5) NOT NULL,
  `sector-name` tinytext,
  `sector-description` mediumtext,
  `sector-category-code` char(3) DEFAULT NULL,
  `sector-category-name` tinytext,
  `sector-category-description` mediumtext,
  PRIMARY KEY (`sector-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-transaction-type
DROP TABLE IF EXISTS `dim-transaction-type`;
CREATE TABLE IF NOT EXISTS `dim-transaction-type` (
  `transaction-type-code` char(2) DEFAULT NULL,
  `transaction-type-name` tinytext,
  `transaction-type-description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.dim-url
DROP TABLE IF EXISTS `dim-url`;
CREATE TABLE IF NOT EXISTS `dim-url` (
  `url-id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `publisher` char(21) NOT NULL,
  `load-time` datetime DEFAULT NULL,
  PRIMARY KEY (`url-id`),
  KEY `idx_dim-url_lookup` (`url`,`publisher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-budgets
DROP TABLE IF EXISTS `fct-budgets`;
CREATE TABLE IF NOT EXISTS `fct-budgets` (
  `iati-identifier` char(100) DEFAULT NULL,
  `recipient-country-code` varchar(2) DEFAULT NULL,
  `recipient-region-code` char(3) DEFAULT NULL,
  `country-region-percentage` int(11) DEFAULT NULL,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-vocabulary` varchar(85) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `budget-type` int(11) DEFAULT NULL,
  `budget-period-start` datetime DEFAULT NULL,
  `budget-period-end` datetime DEFAULT NULL,
  `budget-value-date` datetime DEFAULT NULL,
  `budget-value-year` int(11) DEFAULT NULL,
  `budget-value` double DEFAULT NULL,
  `budget-value-currency` tinytext,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-percentage` double DEFAULT NULL,
  `budget-value-eur` double DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-provider-act-id` (`provider-org-activity-id`),
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-descriptions
DROP TABLE IF EXISTS `fct-descriptions`;
CREATE TABLE IF NOT EXISTS `fct-descriptions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `description` longtext,
  `description-type-code` int(11) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`),
  KEY `idx-url-id` (`url-id`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`),
  KEY `idx-description-type-code` (`description-type-code`),
  KEY `idx-provider-act-id` (`provider-org-activity-id`),
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-documents
DROP TABLE IF EXISTS `fct-documents`;
CREATE TABLE IF NOT EXISTS `fct-documents` (
  `iati-identifier` char(100) DEFAULT NULL,
  `document-title` mediumtext,
  `document-language` varchar(10) DEFAULT NULL,
  `document-url` mediumtext,
  `document-format` varchar(25) DEFAULT NULL,
  `document-type-code` char(3) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-provider-act-id` (`provider-org-activity-id`),
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-locations
DROP TABLE IF EXISTS `fct-locations`;
CREATE TABLE IF NOT EXISTS `fct-locations` (
  `iati-identifier` char(100) DEFAULT NULL,
  `location-type-code` tinytext,
  `location-name` tinytext,
  `location-coordinates-longitude` double DEFAULT NULL,
  `location-coordinates-latitude` double DEFAULT NULL,
  `location-seqnr` bigint(20) DEFAULT NULL,
  `location-percentage` double DEFAULT NULL,
  `location-administrative-country-code` varchar(85) DEFAULT NULL,
  `location-coordinates-precision` varchar(3) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-provider-act-id` (`provider-org-activity-id`) USING BTREE,
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-organisations
DROP TABLE IF EXISTS `fct-organisations`;
CREATE TABLE IF NOT EXISTS `fct-organisations` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `participating-org-id` bigint(20) DEFAULT NULL,
  `participating-org-type-code` char(2) DEFAULT NULL,
  `participating-org-role-code` int(11) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`),
  KEY `idx-url-id` (`url-id`),
  KEY `idx-publisher-id` (`publisher-id`),
  KEY `idx-organisation-type` (`participating-org-type-code`),
  KEY `idx-participating-org-id` (`participating-org-id`),
  KEY `idx-provider-act-id` (`provider-org-activity-id`) USING BTREE,
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-parent-activities
DROP TABLE IF EXISTS `fct-parent-activities`;
CREATE TABLE IF NOT EXISTS `fct-parent-activities` (
  `iati-identifier-child` varchar(100) DEFAULT NULL,
  `iati-identifier-parent` varchar(100) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-percentage` double DEFAULT NULL,
  `transaction-value-eur` double DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-activity-parent` (`iati-identifier-parent`),
  KEY `idx-iati-activity-child` (`iati-identifier-child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-results
DROP TABLE IF EXISTS `fct-results`;
CREATE TABLE IF NOT EXISTS `fct-results` (
  `iati-identifier` char(100) DEFAULT NULL,
  `recipient-country-code` varchar(85) DEFAULT NULL,
  `recipient-region-code` varchar(85) DEFAULT NULL,
  `country-region-percentage` double DEFAULT NULL,
  `result-type-code` int(11) DEFAULT NULL,
  `result-title` tinytext,
  `indicator-measure-code` tinytext,
  `indicator-title` tinytext,
  `indicator-description` tinytext,
  `baseline-year` int(11) DEFAULT NULL,
  `baseline-value` double DEFAULT NULL,
  `period-start` datetime DEFAULT NULL,
  `period-end` datetime DEFAULT NULL,
  `actual-value` double DEFAULT NULL,
  `actual-comment` text,
  `target-value` double DEFAULT NULL,
  `target-comment` text,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-provider-act-id` (`provider-org-activity-id`) USING BTREE,
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.fct-transactions
DROP TABLE IF EXISTS `fct-transactions`;
CREATE TABLE IF NOT EXISTS `fct-transactions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `provider-percentage` double DEFAULT NULL,
  `receiver-org-id` bigint(20) DEFAULT NULL,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `recipient-country-code` char(2) DEFAULT NULL,
  `recipient-region-code` char(3) DEFAULT NULL,
  `country-region-percentage` double DEFAULT NULL,
  `transaction-iso-date` date DEFAULT NULL,
  `transaction-type-code` tinytext,
  `transaction-value` double DEFAULT NULL,
  `transaction-value-eur` double DEFAULT NULL,
  `currency` tinytext,
  `publisher` char(21) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `buza-descendant-yn` char(1) DEFAULT NULL,
  `buza-descendant-level` int(11) DEFAULT NULL,
  `buza-descendant-without-childs` char(1) DEFAULT NULL,
  `buza-ancestor-activity-id` varchar(100) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`),
  KEY `idx-transaction-iso-date` (`transaction-iso-date`),
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-provider-act-id` (`provider-org-activity-id`) USING BTREE,
  KEY `idx-buza-ancestor-activity-id` (`buza-ancestor-activity-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


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
	`publisher-id` VARCHAR(24) NULL COLLATE 'utf8_general_ci',
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
	`org-funding` MEDIUMTEXT NULL COLLATE 'utf8_general_ci',
	`total-funded` DOUBLE NULL,
	`total-funded (EUR)` DOUBLE NULL
) ENGINE=MyISAM;


-- Dumping structure for view iatidatamart.iati-view-implementing-organisations
DROP VIEW IF EXISTS `iati-view-implementing-organisations`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-implementing-organisations` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`org-implementing` MEDIUMTEXT NULL COLLATE 'utf8_general_ci',
	`total-funded` DOUBLE NULL,
	`total-funded (EUR)` DOUBLE NULL
) ENGINE=MyISAM;


-- Dumping structure for view iatidatamart.iati-view-last-date-published
DROP VIEW IF EXISTS `iati-view-last-date-published`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-last-date-published` (
	`publisher` CHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`url` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`publisher-id` BIGINT(20) NULL,
	`url-id` BIGINT(20) NULL,
	`start-date` DATETIME NULL,
	`end-date` DATETIME NULL,
	`generated-datetime` VARCHAR(25) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view iatidatamart.iati-view-total-disbursements
DROP VIEW IF EXISTS `iati-view-total-disbursements`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `iati-view-total-disbursements` (
	`iati-identifier` CHAR(100) NULL COLLATE 'utf8_general_ci',
	`transaction-type-code` TINYTEXT NULL COLLATE 'utf8_general_ci',
	`total-disbursement-value` DOUBLE NULL
) ENGINE=MyISAM;


-- Dumping structure for table iatidatamart.log-check-totals
DROP TABLE IF EXISTS `log-check-totals`;
CREATE TABLE IF NOT EXISTS `log-check-totals` (
  `job-number` int(11) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `step` varchar(50) DEFAULT NULL,
  `check-total` double DEFAULT NULL,
  KEY `idx_log-check-totals_lookup` (`publisher-id`,`url-id`,`subject`,`step`,`job-number`),
  KEY `idx_log-check-totals_lookup2` (`job-number`,`publisher-id`,`url-id`,`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.log-iati-job
DROP TABLE IF EXISTS `log-iati-job`;
CREATE TABLE IF NOT EXISTS `log-iati-job` (
  `job-number` bigint(20) NOT NULL,
  `job-start-date-time` datetime DEFAULT NULL,
  `job-end-date-time` datetime DEFAULT NULL,
  `log-message` varchar(255) DEFAULT NULL,
  `log-status` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`job-number`),
  KEY `idx_log-iati-job_lookup` (`job-number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.log-publisher-job
DROP TABLE IF EXISTS `log-publisher-job`;
CREATE TABLE IF NOT EXISTS `log-publisher-job` (
  `job-number` int(11) NOT NULL,
  `publisher-id` int(11) NOT NULL,
  `publisher-job-start-date-time` datetime DEFAULT NULL,
  `publisher-job-end-date-time` datetime DEFAULT NULL,
  `Action` tinytext,
  PRIMARY KEY (`job-number`,`publisher-id`),
  KEY `idx_log-publisher-job_lookup` (`job-number`,`publisher-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatidatamart.log-publisher-job-url
DROP TABLE IF EXISTS `log-publisher-job-url`;
CREATE TABLE IF NOT EXISTS `log-publisher-job-url` (
  `job-number` bigint(20) DEFAULT NULL,
  `publisher-id` bigint(20) DEFAULT NULL,
  `url-id` bigint(20) DEFAULT NULL,
  `publisher-job-url-start-date-time` datetime DEFAULT NULL,
  `publisher-job-url-end-date-time` datetime DEFAULT NULL,
  `generated-datetime` varchar(25) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `archive-path` varchar(255) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `http-status` varchar(10) DEFAULT NULL,
  `log-message` varchar(255) DEFAULT NULL,
  `log-status` varchar(20) DEFAULT NULL,
  KEY `idx_log-publisher-job-url_lookup` (`job-number`,`publisher-id`,`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for view iatidatamart.iati-view-budget-total
DROP VIEW IF EXISTS `iati-view-budget-total`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-budget-total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-budget-total` AS select `fct-budgets`.`iati-identifier` AS `iati-identifier`,sum(`fct-budgets`.`budget-value-eur`) AS `budget-value (EUR)` from `fct-budgets` group by `fct-budgets`.`iati-identifier`;


-- Dumping structure for view iatidatamart.iati-view-check-totals
DROP VIEW IF EXISTS `iati-view-check-totals`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-check-totals`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-check-totals` AS select `a`.`job-number` AS `job-number`,`a`.`publisher-id` AS `publisher-id`,`a`.`url-id` AS `url-id`,`a`.`subject` AS `subject`,`a`.`step` AS `step-source`,`b`.`step` AS `step-target`,`a`.`check-total` AS `check-total-source`,`b`.`check-total` AS `check-total-target` from (`log-check-totals` `a` join `log-check-totals` `b`) where ((`a`.`job-number` = `b`.`job-number`) and (`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `b`.`url-id`) and (`a`.`subject` = `b`.`subject`) and (`a`.`step` <> `b`.`step`)) group by `a`.`job-number`,`a`.`publisher-id`,`a`.`url-id`,`a`.`subject`;


-- Dumping structure for view iatidatamart.iati-view-funding-organisations
DROP VIEW IF EXISTS `iati-view-funding-organisations`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-funding-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-funding-organisations` AS select `a`.`iati-identifier` AS `iati-identifier`,`a`.`org-funding` AS `org-funding`,sum(`t`.`transaction-value`) AS `total-funded`,sum(`t`.`transaction-value-eur`) AS `total-funded (EUR)` from (`dim-activity` `a` join `fct-transactions` `t` on((`a`.`iati-identifier` = `t`.`iati-identifier`))) group by `a`.`iati-identifier`;


-- Dumping structure for view iatidatamart.iati-view-implementing-organisations
DROP VIEW IF EXISTS `iati-view-implementing-organisations`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-implementing-organisations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-implementing-organisations` AS select `a`.`iati-identifier` AS `iati-identifier`,`a`.`org-implementing` AS `org-implementing`,sum(`t`.`transaction-value`) AS `total-funded`,sum(`t`.`transaction-value-eur`) AS `total-funded (EUR)` from (`dim-activity` `a` join `fct-transactions` `t` on((`a`.`iati-identifier` = `t`.`iati-identifier`))) group by `a`.`iati-identifier`;


-- Dumping structure for view iatidatamart.iati-view-last-date-published
DROP VIEW IF EXISTS `iati-view-last-date-published`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-last-date-published`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-last-date-published` AS select `b`.`publisher` AS `publisher`,`u`.`url` AS `url`,`a`.`publisher-id` AS `publisher-id`,`a`.`url-id` AS `url-id`,max(`a`.`publisher-job-url-start-date-time`) AS `start-date`,max(`a`.`publisher-job-url-end-date-time`) AS `end-date`,max(`a`.`generated-datetime`) AS `generated-datetime` from ((`iatidatamart`.`log-publisher-job-url` `a` join `iatischema`.`ctl-publishers` `b`) join `iatidatamart`.`dim-url` `u`) where ((`a`.`publisher-id` = `b`.`publisher-id`) and (`a`.`url-id` = `u`.`url-id`)) group by `a`.`publisher-id`,`u`.`url`;


-- Dumping structure for view iatidatamart.iati-view-total-disbursements
DROP VIEW IF EXISTS `iati-view-total-disbursements`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `iati-view-total-disbursements`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iati-view-total-disbursements` AS select `fct-transactions`.`iati-identifier` AS `iati-identifier`,`fct-transactions`.`transaction-type-code` AS `transaction-type-code`,sum(`fct-transactions`.`transaction-value-eur`) AS `total-disbursement-value` from `fct-transactions` where (`fct-transactions`.`transaction-type-code` = 'D') group by `fct-transactions`.`iati-identifier`,`fct-transactions`.`transaction-type-code`;


-- Dumping database structure for iatilogging
DROP DATABASE IF EXISTS `iatilogging`;
CREATE DATABASE IF NOT EXISTS `iatilogging` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iatilogging`;


-- Dumping structure for table iatilogging.log-pdi-etl
DROP TABLE IF EXISTS `log-pdi-etl`;
CREATE TABLE IF NOT EXISTS `log-pdi-etl` (
  `ID_JOB` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `JOBNAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `LINES_READ` bigint(20) DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) DEFAULT NULL,
  `LINES_UPDATED` bigint(20) DEFAULT NULL,
  `LINES_INPUT` bigint(20) DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) DEFAULT NULL,
  `LINES_REJECTED` bigint(20) DEFAULT NULL,
  `ERRORS` bigint(20) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `LOGDATE` datetime DEFAULT NULL,
  `DEPDATE` datetime DEFAULT NULL,
  `REPLAYDATE` datetime DEFAULT NULL,
  `LOG_FIELD` mediumtext,
  `EXECUTING_SERVER` varchar(255) DEFAULT NULL,
  `EXECUTING_USER` varchar(255) DEFAULT NULL,
  `START_JOB_ENTRY` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(255) DEFAULT NULL,
  KEY `IDX_log-pdi-etl_1` (`ID_JOB`),
  KEY `IDX_log-pdi-etl_2` (`ERRORS`,`STATUS`,`JOBNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatilogging.log-pdi-etl-channel
DROP TABLE IF EXISTS `log-pdi-etl-channel`;
CREATE TABLE IF NOT EXISTS `log-pdi-etl-channel` (
  `ID_BATCH` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `LOG_DATE` datetime DEFAULT NULL,
  `LOGGING_OBJECT_TYPE` varchar(255) DEFAULT NULL,
  `OBJECT_NAME` varchar(255) DEFAULT NULL,
  `OBJECT_COPY` varchar(255) DEFAULT NULL,
  `REPOSITORY_DIRECTORY` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `OBJECT_ID` varchar(255) DEFAULT NULL,
  `OBJECT_REVISION` varchar(255) DEFAULT NULL,
  `PARENT_CHANNEL_ID` varchar(255) DEFAULT NULL,
  `ROOT_CHANNEL_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatilogging.log-pdi-etl-job-entry
DROP TABLE IF EXISTS `log-pdi-etl-job-entry`;
CREATE TABLE IF NOT EXISTS `log-pdi-etl-job-entry` (
  `ID_BATCH` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `LOG_DATE` datetime DEFAULT NULL,
  `TRANSNAME` varchar(255) DEFAULT NULL,
  `STEPNAME` varchar(255) DEFAULT NULL,
  `LINES_READ` bigint(20) DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) DEFAULT NULL,
  `LINES_UPDATED` bigint(20) DEFAULT NULL,
  `LINES_INPUT` bigint(20) DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) DEFAULT NULL,
  `LINES_REJECTED` bigint(20) DEFAULT NULL,
  `ERRORS` bigint(20) DEFAULT NULL,
  `RESULT` tinyint(1) DEFAULT NULL,
  `NR_RESULT_ROWS` bigint(20) DEFAULT NULL,
  `NR_RESULT_FILES` bigint(20) DEFAULT NULL,
  `LOG_FIELD` mediumtext,
  `COPY_NR` int(11) DEFAULT NULL,
  KEY `IDX_log-pdi-etl-job-entry_1` (`ID_BATCH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping database structure for iatireference
DROP DATABASE IF EXISTS `iatireference`;
CREATE DATABASE IF NOT EXISTS `iatireference` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iatireference`;


-- Dumping structure for table iatireference.codelist-date-type
DROP TABLE IF EXISTS `codelist-date-type`;
CREATE TABLE IF NOT EXISTS `codelist-date-type` (
  `code1x` varchar(13) DEFAULT NULL,
  `name` tinytext,
  `description` tinytext,
  `code2x` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-gazetteer-agency
DROP TABLE IF EXISTS `codelist-gazetteer-agency`;
CREATE TABLE IF NOT EXISTS `codelist-gazetteer-agency` (
  `code` int(11) DEFAULT NULL,
  `name` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-geographic-exactness
DROP TABLE IF EXISTS `codelist-geographic-exactness`;
CREATE TABLE IF NOT EXISTS `codelist-geographic-exactness` (
  `code` int(11) DEFAULT NULL,
  `name` tinytext,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-geographic-location-class
DROP TABLE IF EXISTS `codelist-geographic-location-class`;
CREATE TABLE IF NOT EXISTS `codelist-geographic-location-class` (
  `code` int(11) DEFAULT NULL,
  `name` tinytext,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-geographic-location-reach
DROP TABLE IF EXISTS `codelist-geographic-location-reach`;
CREATE TABLE IF NOT EXISTS `codelist-geographic-location-reach` (
  `code` int(11) DEFAULT NULL,
  `name` tinytext,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-geographic-precision
DROP TABLE IF EXISTS `codelist-geographic-precision`;
CREATE TABLE IF NOT EXISTS `codelist-geographic-precision` (
  `code` int(11) DEFAULT NULL,
  `name` tinytext,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-geographic-vocabulary
DROP TABLE IF EXISTS `codelist-geographic-vocabulary`;
CREATE TABLE IF NOT EXISTS `codelist-geographic-vocabulary` (
  `code` tinytext,
  `name` tinytext,
  `url` tinytext,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-organisation-type
DROP TABLE IF EXISTS `codelist-organisation-type`;
CREATE TABLE IF NOT EXISTS `codelist-organisation-type` (
  `org-type-code` tinytext,
  `org-type-name` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatireference.codelist-policy-marker
DROP TABLE IF EXISTS `codelist-policy-marker`;
CREATE TABLE IF NOT EXISTS `codelist-policy-marker` (
  `code` int(11) DEFAULT NULL,
  `name` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping database structure for iatischema
DROP DATABASE IF EXISTS `iatischema`;
CREATE DATABASE IF NOT EXISTS `iatischema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iatischema`;


-- Dumping structure for table iatischema.ctl-publishers
DROP TABLE IF EXISTS `ctl-publishers`;
CREATE TABLE IF NOT EXISTS `ctl-publishers` (
  `publisher` char(21) NOT NULL,
  `publisher-id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `force-processing` bit(1) DEFAULT b'0',
  `testfile-location` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`publisher`),
  UNIQUE KEY `publisher_UNIQUE` (`publisher`),
  UNIQUE KEY `publisher-id_UNIQUE` (`publisher-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.currency-rates
DROP TABLE IF EXISTS `currency-rates`;
CREATE TABLE IF NOT EXISTS `currency-rates` (
  `Jaar` int(11) NOT NULL DEFAULT '0',
  `Koers` double DEFAULT NULL,
  `Valuta` varchar(3) NOT NULL DEFAULT '',
  `Bron` char(20) NOT NULL,
  PRIMARY KEY (`Jaar`,`Valuta`,`Bron`),
  KEY `idx_currency-rates_lookup` (`Valuta`,`Jaar`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-budgets
DROP TABLE IF EXISTS `dwh-budgets`;
CREATE TABLE IF NOT EXISTS `dwh-budgets` (
  `iati-identifier` char(100) DEFAULT NULL,
  `recipient-country-code` varchar(2) DEFAULT NULL,
  `recipient-region-code` char(3) DEFAULT NULL,
  `country-region-percentage` int(11) DEFAULT NULL,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-vocabulary` varchar(85) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `budget-type` int(11) DEFAULT NULL,
  `budget-period-start` datetime DEFAULT NULL,
  `budget-period-end` datetime DEFAULT NULL,
  `budget-value-date` datetime DEFAULT NULL,
  `budget-value-year` int(11) DEFAULT NULL,
  `budget-value` double DEFAULT NULL,
  `budget-value-currency` tinytext,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `budget-value-eur` double DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-descriptions
DROP TABLE IF EXISTS `dwh-descriptions`;
CREATE TABLE IF NOT EXISTS `dwh-descriptions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `description` longtext,
  `description-type-code` int(11) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`),
  KEY `idx-url-id` (`url-id`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`),
  KEY `idx-description-type-code` (`description-type-code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-documents
DROP TABLE IF EXISTS `dwh-documents`;
CREATE TABLE IF NOT EXISTS `dwh-documents` (
  `iati-identifier` char(100) DEFAULT NULL,
  `document-title` mediumtext,
  `document-language` varchar(10) DEFAULT NULL,
  `document-url` mediumtext,
  `document-format` varchar(25) DEFAULT NULL,
  `document-type-code` char(3) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-url-id` (`url-id`),
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-locations
DROP TABLE IF EXISTS `dwh-locations`;
CREATE TABLE IF NOT EXISTS `dwh-locations` (
  `iati-identifier` char(100) DEFAULT NULL,
  `location-type-code` tinytext,
  `location-name` tinytext,
  `location-coordinates-longitude` double DEFAULT NULL,
  `location-coordinates-latitude` double DEFAULT NULL,
  `location-seqnr` bigint(20) DEFAULT NULL,
  `location-percentage` double DEFAULT NULL,
  `location-administrative-country-code` varchar(85) DEFAULT NULL,
  `location-coordinates-precision` varchar(3) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-organisations
DROP TABLE IF EXISTS `dwh-organisations`;
CREATE TABLE IF NOT EXISTS `dwh-organisations` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `participating-org-id` bigint(20) DEFAULT NULL,
  `participating-org-type-code` char(2) DEFAULT NULL,
  `participating-org-role-code` int(11) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`),
  KEY `idx-url-id` (`url-id`),
  KEY `idx-publisher-id` (`publisher-id`),
  KEY `idx-organisation-type` (`participating-org-type-code`),
  KEY `idx-participating-org-id` (`participating-org-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-results
DROP TABLE IF EXISTS `dwh-results`;
CREATE TABLE IF NOT EXISTS `dwh-results` (
  `iati-identifier` char(100) DEFAULT NULL,
  `recipient-country-code` varchar(85) DEFAULT NULL,
  `recipient-region-code` varchar(85) DEFAULT NULL,
  `country-region-percentage` double DEFAULT NULL,
  `result-type-code` int(11) DEFAULT NULL,
  `result-title` tinytext,
  `indicator-measure-code` tinytext,
  `indicator-title` tinytext,
  `indicator-description` tinytext,
  `baseline-year` int(11) DEFAULT NULL,
  `baseline-value` double DEFAULT NULL,
  `period-start` datetime DEFAULT NULL,
  `period-end` datetime DEFAULT NULL,
  `actual-value` double DEFAULT NULL,
  `actual-comment` text,
  `target-value` double DEFAULT NULL,
  `target-comment` text,
  `publisher` char(21) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`) USING BTREE,
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.dwh-transactions
DROP TABLE IF EXISTS `dwh-transactions`;
CREATE TABLE IF NOT EXISTS `dwh-transactions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `receiver-org-id` bigint(20) DEFAULT NULL,
  `transaction-iso-date` date DEFAULT NULL,
  `transaction-type-code` tinytext,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `recipient-country-code` char(2) DEFAULT NULL,
  `recipient-region-code` char(3) DEFAULT NULL,
  `country-region-percentage` double DEFAULT NULL,
  `currency` tinytext,
  `transaction-value` double DEFAULT NULL,
  `publisher` char(21) DEFAULT NULL,
  `generated-datetime` varchar(50) DEFAULT NULL,
  `publisher-id` int(11) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  `transaction-value-eur` double DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`),
  KEY `idx-transaction-iso-date` (`transaction-iso-date`),
  KEY `idx-publisher-id` (`publisher-id`) USING BTREE,
  KEY `idx-url-id` (`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (`publisher-id`)
(PARTITION minbuza_nl VALUES IN (1) ENGINE = InnoDB,
 PARTITION cordaid VALUES IN (2) ENGINE = InnoDB,
 PARTITION dfid VALUES IN (3) ENGINE = InnoDB,
 PARTITION afdb VALUES IN (4) ENGINE = InnoDB,
 PARTITION afd VALUES IN (5) ENGINE = InnoDB,
 PARTITION test VALUES IN (6) ENGINE = InnoDB,
 PARTITION gavi VALUES IN (7) ENGINE = InnoDB) */;

-- Data exporting was unselected.


-- Dumping structure for table iatischema.stg-parent-activities
DROP TABLE IF EXISTS `stg-parent-activities`;
CREATE TABLE IF NOT EXISTS `stg-parent-activities` (
  `iati-identifier-child` varchar(100) DEFAULT NULL,
  `iati-identifier-parent` varchar(100) DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `provider-percentage` double DEFAULT NULL,
  `transaction-value-eur` double DEFAULT NULL,
  KEY `idx-iati-activity-parent` (`iati-identifier-parent`),
  KEY `idx-iati-activity-child` (`iati-identifier-child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping database structure for iatistaging
DROP DATABASE IF EXISTS `iatistaging`;
CREATE DATABASE IF NOT EXISTS `iatistaging` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iatistaging`;


-- Dumping structure for table iatistaging.src-act-budgets
DROP TABLE IF EXISTS `src-act-budgets`;
CREATE TABLE IF NOT EXISTS `src-act-budgets` (
  `iati-identifier` tinytext,
  `budget-type` int(11) DEFAULT NULL,
  `budget-period-start` datetime DEFAULT NULL,
  `budget-period-end` datetime DEFAULT NULL,
  `budget-value` double DEFAULT NULL,
  `budget-value-date` datetime DEFAULT NULL,
  `budget-value-currency` tinytext,
  `default-currency` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-countries
DROP TABLE IF EXISTS `src-act-countries`;
CREATE TABLE IF NOT EXISTS `src-act-countries` (
  `iati-identifier-countries` varchar(100) DEFAULT NULL,
  `recipient-country-code` tinytext,
  `recipient-country-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-data
DROP TABLE IF EXISTS `src-act-data`;
CREATE TABLE IF NOT EXISTS `src-act-data` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `activity-title` mediumtext,
  `activity-status` tinytext,
  `contact-organisation` tinytext,
  `contact-person-name` tinytext,
  `contact-telephone` tinytext,
  `contact-email` tinytext,
  `contact-mailing-address` mediumtext,
  `activity-website` tinytext,
  `reporting-org-name` tinytext,
  `reporting-org-ref` tinytext,
  `reporting-org-type` tinytext,
  `default-finance-type` tinytext,
  `default-tied-status` tinytext,
  `contact-job-title` tinytext,
  `contact-website` mediumtext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL,
  KEY `idx_src-act-data_lookup` (`iati-identifier`,`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-dates
DROP TABLE IF EXISTS `src-act-dates`;
CREATE TABLE IF NOT EXISTS `src-act-dates` (
  `activity-iso-date` tinytext,
  `iati-identifier` varchar(100) DEFAULT NULL,
  `activity-date-type-2x` tinytext,
  `activity-date-type-1x` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-descriptions
DROP TABLE IF EXISTS `src-act-descriptions`;
CREATE TABLE IF NOT EXISTS `src-act-descriptions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `description` mediumtext,
  `description-type-code` int(11) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-documents
DROP TABLE IF EXISTS `src-act-documents`;
CREATE TABLE IF NOT EXISTS `src-act-documents` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `document-type-code` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `document-url` varchar(512) DEFAULT NULL,
  `document-title` tinytext,
  `document-language` tinytext,
  `document-format` tinytext,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-locations
DROP TABLE IF EXISTS `src-act-locations`;
CREATE TABLE IF NOT EXISTS `src-act-locations` (
  `iati-identifier-locations` varchar(100) DEFAULT NULL,
  `location-name` tinytext,
  `location-coordinates-latitude` double DEFAULT NULL,
  `location-coordinates-longitude` double DEFAULT NULL,
  `location-type-code` tinytext,
  `location-administrative-country-code` tinytext,
  `location-coordinates-precision` tinytext,
  `location-coordinates-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-organisations
DROP TABLE IF EXISTS `src-act-organisations`;
CREATE TABLE IF NOT EXISTS `src-act-organisations` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `participating-org` mediumtext,
  `participating-org-role` tinytext,
  `participating-org-ref` tinytext,
  `participating-org-type-code` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-policy-markers
DROP TABLE IF EXISTS `src-act-policy-markers`;
CREATE TABLE IF NOT EXISTS `src-act-policy-markers` (
  `iati-identifier` tinytext,
  `vocabulary` tinytext,
  `code` tinytext,
  `significance` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-regions
DROP TABLE IF EXISTS `src-act-regions`;
CREATE TABLE IF NOT EXISTS `src-act-regions` (
  `iati-identifier-regions` varchar(100) DEFAULT NULL,
  `recipient-region-code` tinytext,
  `recipient-region-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-related
DROP TABLE IF EXISTS `src-act-related`;
CREATE TABLE IF NOT EXISTS `src-act-related` (
  `iati-identifier` char(100) DEFAULT NULL,
  `related-activity-ref` char(100) DEFAULT NULL,
  `related-activity-type` int(11) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-results
DROP TABLE IF EXISTS `src-act-results`;
CREATE TABLE IF NOT EXISTS `src-act-results` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `result-type-code` int(11) DEFAULT NULL,
  `result-title` tinytext,
  `indicator-measure-code` tinytext,
  `indicator-title` tinytext,
  `indicator-description` tinytext,
  `period-start` datetime DEFAULT NULL,
  `period-end` datetime DEFAULT NULL,
  `actual-comment` text,
  `target-comment` text,
  `baseline-year` int(11) DEFAULT NULL,
  `baseline-value` double DEFAULT NULL,
  `actual-value` double DEFAULT NULL,
  `target-value` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-sectors
DROP TABLE IF EXISTS `src-act-sectors`;
CREATE TABLE IF NOT EXISTS `src-act-sectors` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `sector-vocabulary` varchar(10) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL,
  KEY `idx_src-act-sectors_lookup` (`iati-identifier`,`sector-code`,`sector-vocabulary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.src-act-transactions
DROP TABLE IF EXISTS `src-act-transactions`;
CREATE TABLE IF NOT EXISTS `src-act-transactions` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `transaction-type-code` tinytext,
  `provider-org` tinytext,
  `provider-org-reference` tinytext,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `receiver-org` tinytext,
  `receiver-org-reference` tinytext,
  `value` tinytext,
  `transaction-iso-date` tinytext,
  `default-currency` tinytext,
  `transaction-currency` tinytext,
  `transaction-description` tinytext,
  `transaction-flow-type-code` tinytext,
  `transaction-finance-type-code` tinytext,
  `transaction-aid-type-code` tinytext,
  `transaction-tied-status-code` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.stg-act-country-region
DROP TABLE IF EXISTS `stg-act-country-region`;
CREATE TABLE IF NOT EXISTS `stg-act-country-region` (
  `iati-identifier` tinytext,
  `recipient-country-code` char(2) DEFAULT NULL,
  `recipient-region-code` varchar(3) DEFAULT NULL,
  `country-region-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.stg-act-sectors
DROP TABLE IF EXISTS `stg-act-sectors`;
CREATE TABLE IF NOT EXISTS `stg-act-sectors` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `sector-vocabulary` tinytext,
  `sector-seqnr` bigint(20) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL,
  KEY `idx-iati-identifier` (`iati-identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.stg-act-transactions
DROP TABLE IF EXISTS `stg-act-transactions`;
CREATE TABLE IF NOT EXISTS `stg-act-transactions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `provider-org` tinytext,
  `provider-org-reference` varchar(85) DEFAULT NULL,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `receiver-org` tinytext,
  `receiver-org-reference` varchar(85) DEFAULT NULL,
  `transaction-value` double DEFAULT NULL,
  `transaction-iso-date` datetime DEFAULT NULL,
  `currency` tinytext,
  `transaction-type-code` varchar(2) DEFAULT NULL,
  `default-currency` char(3) DEFAULT NULL,
  `transaction-currency` char(3) DEFAULT NULL,
  `exchange-rate` double DEFAULT NULL,
  `provider-org-id` bigint(20) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-budgets
DROP TABLE IF EXISTS `xml-act-budgets`;
CREATE TABLE IF NOT EXISTS `xml-act-budgets` (
  `iati-identifier` tinytext,
  `budget-type` int(11) DEFAULT NULL,
  `budget-period-start` datetime DEFAULT NULL,
  `budget-period-end` datetime DEFAULT NULL,
  `budget-value` double DEFAULT NULL,
  `budget-value-date` datetime DEFAULT NULL,
  `budget-value-currency` tinytext,
  `default-currency` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-countries
DROP TABLE IF EXISTS `xml-act-countries`;
CREATE TABLE IF NOT EXISTS `xml-act-countries` (
  `iati-identifier-countries` varchar(100) DEFAULT NULL,
  `recipient-country-code` tinytext,
  `recipient-country-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-data
DROP TABLE IF EXISTS `xml-act-data`;
CREATE TABLE IF NOT EXISTS `xml-act-data` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `activity-title` mediumtext,
  `activity-status` tinytext,
  `contact-organisation` tinytext,
  `contact-person-name` tinytext,
  `contact-telephone` tinytext,
  `contact-email` tinytext,
  `contact-mailing-address` mediumtext,
  `activity-website` tinytext,
  `reporting-org-name` tinytext,
  `reporting-org-ref` tinytext,
  `reporting-org-type` tinytext,
  `default-finance-type` tinytext,
  `default-tied-status` tinytext,
  `contact-job-title` tinytext,
  `contact-website` mediumtext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  KEY `idx_src-act-data_lookup` (`iati-identifier`,`url-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-dates
DROP TABLE IF EXISTS `xml-act-dates`;
CREATE TABLE IF NOT EXISTS `xml-act-dates` (
  `activity-iso-date` tinytext,
  `iati-identifier` varchar(100) DEFAULT NULL,
  `activity-date-type-2x` tinytext,
  `activity-date-type-1x` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-descriptions
DROP TABLE IF EXISTS `xml-act-descriptions`;
CREATE TABLE IF NOT EXISTS `xml-act-descriptions` (
  `iati-identifier` char(100) DEFAULT NULL,
  `description` mediumtext,
  `description-type-code` int(11) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-documents
DROP TABLE IF EXISTS `xml-act-documents`;
CREATE TABLE IF NOT EXISTS `xml-act-documents` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `document-type-code` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  `document-url` varchar(512) DEFAULT NULL,
  `document-title` tinytext,
  `document-language` tinytext,
  `document-format` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-locations
DROP TABLE IF EXISTS `xml-act-locations`;
CREATE TABLE IF NOT EXISTS `xml-act-locations` (
  `iati-identifier-locations` varchar(100) DEFAULT NULL,
  `location-name` tinytext,
  `location-coordinates-latitude` double DEFAULT NULL,
  `location-coordinates-longitude` double DEFAULT NULL,
  `location-type-code` tinytext,
  `location-administrative-country-code` tinytext,
  `location-coordinates-precision` tinytext,
  `location-coordinates-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-organisations
DROP TABLE IF EXISTS `xml-act-organisations`;
CREATE TABLE IF NOT EXISTS `xml-act-organisations` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `participating-org` mediumtext,
  `participating-org-role` tinytext,
  `participating-org-ref` tinytext,
  `participating-org-type-code` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-policy-markers
DROP TABLE IF EXISTS `xml-act-policy-markers`;
CREATE TABLE IF NOT EXISTS `xml-act-policy-markers` (
  `iati-identifier` tinytext,
  `vocabulary` tinytext,
  `code` tinytext,
  `significance` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-regions
DROP TABLE IF EXISTS `xml-act-regions`;
CREATE TABLE IF NOT EXISTS `xml-act-regions` (
  `iati-identifier-regions` varchar(100) DEFAULT NULL,
  `recipient-region-code` tinytext,
  `recipient-region-percentage` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-related
DROP TABLE IF EXISTS `xml-act-related`;
CREATE TABLE IF NOT EXISTS `xml-act-related` (
  `iati-identifier` char(100) DEFAULT NULL,
  `related-activity-ref` char(100) DEFAULT NULL,
  `related-activity-type` int(11) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-results
DROP TABLE IF EXISTS `xml-act-results`;
CREATE TABLE IF NOT EXISTS `xml-act-results` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `result-type-code` int(11) DEFAULT NULL,
  `result-title` tinytext,
  `indicator-measure-code` tinytext,
  `indicator-title` tinytext,
  `indicator-description` tinytext,
  `period-start` datetime DEFAULT NULL,
  `period-end` datetime DEFAULT NULL,
  `actual-comment` text,
  `target-comment` text,
  `baseline-year` int(11) DEFAULT NULL,
  `baseline-value` double DEFAULT NULL,
  `actual-value` double DEFAULT NULL,
  `target-value` double DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-sectors
DROP TABLE IF EXISTS `xml-act-sectors`;
CREATE TABLE IF NOT EXISTS `xml-act-sectors` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `sector-code` varchar(5) DEFAULT NULL,
  `sector-percentage` double DEFAULT NULL,
  `sector-vocabulary` varchar(10) DEFAULT NULL,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL,
  KEY `idx_src-act-sectors_lookup` (`iati-identifier`,`sector-code`,`sector-vocabulary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table iatistaging.xml-act-transactions
DROP TABLE IF EXISTS `xml-act-transactions`;
CREATE TABLE IF NOT EXISTS `xml-act-transactions` (
  `iati-identifier` varchar(100) DEFAULT NULL,
  `transaction-type-code` tinytext,
  `provider-org` tinytext,
  `provider-org-reference` tinytext,
  `provider-org-activity-id` varchar(100) DEFAULT NULL,
  `receiver-org` tinytext,
  `receiver-org-reference` tinytext,
  `value` tinytext,
  `transaction-iso-date` tinytext,
  `default-currency` tinytext,
  `transaction-currency` tinytext,
  `transaction-description` tinytext,
  `transaction-flow-type-code` tinytext,
  `transaction-finance-type-code` tinytext,
  `transaction-aid-type-code` tinytext,
  `transaction-tied-status-code` tinytext,
  `publisher` varchar(24) DEFAULT NULL,
  `publisher-id` varchar(24) DEFAULT NULL,
  `generated-datetime` varchar(24) DEFAULT NULL,
  `url-id` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;