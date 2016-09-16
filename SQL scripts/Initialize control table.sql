-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for iatischema
CREATE DATABASE IF NOT EXISTS `iatischema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iatischema`;


-- Dumping structure for table iatischema.ctl-publishers
DROP TABLE IF EXISTS `ctl-publishers`;
CREATE TABLE IF NOT EXISTS `ctl-publishers` (
  `publisher` char(21) NOT NULL,
  `publisher-id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'0',
  `force-processing` bit(1) NOT NULL DEFAULT b'0',
  `testfile-location` varchar(256) DEFAULT NULL,
  `is-testfile` bit(1) NOT NULL DEFAULT b'0',
  `publisher-name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`publisher`),
  UNIQUE KEY `publisher_UNIQUE` (`publisher`),
  UNIQUE KEY `publisher-id_UNIQUE` (`publisher-id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table iatischema.ctl-publishers: ~13 rows (approximately)
DELETE FROM `ctl-publishers`;
/*!40000 ALTER TABLE `ctl-publishers` DISABLE KEYS */;
INSERT INTO `ctl-publishers` (`publisher`, `publisher-id`, `active`, `force-processing`, `testfile-location`, `is-testfile`, `publisher-name`) VALUES
	('awepa', 12, b'0', b'1', NULL, b'0', 'AWEPA'),
	('bothends', 6, b'0', b'1', NULL, b'0', 'Both ENDS'),
	('ccc', 7, b'0', b'1', NULL, b'0', 'Clean Clothes Campaign'),
	('foenl', 8, b'0', b'1', NULL, b'0', 'Milieudefensie'),
	('free_press_unlimited', 11, b'1', b'1', NULL, b'0', 'Free Press Unlimited'),
	('minbuza_nl', 1, b'0', b'1', NULL, b'0', 'Netherlands Ministry of Foreign Affairs'),
	('nimd-hq', 16, b'0', b'1', NULL, b'0', 'Netherlands Institute for Multiparty Democracy (NIMD)'),
	('nl-kvk-41207989', 17, b'0', b'1', NULL, b'0', 'Aids Fonds - STOP AIDS NOW! - Soa Aids Nederland'),
	('nlrc', 5, b'0', b'1', 'D:\\Users\\User.Open\\My Documents\\IATI Publishers\\nlrc-activities.xml', b'0', 'Netherlands Red Cross'),
	('rvo', 3, b'0', b'1', 'D:\\Users\\User.Open\\My Documents\\IATI test data NRK\\26042016-RVO-IATI-adjusted.xml', b'0', 'Netherlands Enterprise Agency'),
	('somo', 9, b'0', b'1', NULL, b'0', 'Stichting Onderzoek Multinationale Ondernemingen (SOMO)'),
	('tni', 10, b'0', b'1', NULL, b'0', 'Transnational Institute'),
	('zoa', 2, b'1', b'1', 'D:\\Users\\User.Open\\My Documents\\IATI test data NRK\\duplicate-test.xml', b'0', 'ZOA');
/*!40000 ALTER TABLE `ctl-publishers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
