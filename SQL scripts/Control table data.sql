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

-- Dumping structure for table iatischema.ctl-publishers
DROP TABLE IF EXISTS `ctl-publishers`;
CREATE TABLE IF NOT EXISTS `ctl-publishers` (
  `publisher` char(21) NOT NULL,
  `publisher-id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'0',
  `force-processing` bit(1) NOT NULL DEFAULT b'0',
  `testfile-location` varchar(256) DEFAULT NULL,
  `is-testfile` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`publisher`),
  UNIQUE KEY `publisher_UNIQUE` (`publisher`),
  UNIQUE KEY `publisher-id_UNIQUE` (`publisher-id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table iatischema.ctl-publishers: ~10 rows (approximately)
DELETE FROM `ctl-publishers`;
/*!40000 ALTER TABLE `ctl-publishers` DISABLE KEYS */;
INSERT INTO `ctl-publishers` (`publisher`, `publisher-id`, `active`, `force-processing`, `testfile-location`, `is-testfile`) VALUES
	('bothends', 6, b'1', b'1', NULL, b'0'),
	('ccc', 7, b'1', b'1', NULL, b'0'),
	('foenl', 8, b'1', b'1', NULL, b'0'),
	('free_press_unlimited', 11, b'1', b'1', NULL, b'0'),
	('minbuza_nl', 1, b'1', b'1', NULL, b'0'),
	('nlrc', 5, b'1', b'1', NULL, b'0'),
	('rvo', 3, b'1', b'1', 'D:\\Users\\User.Open\\My Documents\\IATI test data NRK\\26042016-RVO-IATI-adjusted.xml', b'0'),
	('somo', 9, b'1', b'1', NULL, b'0'),
	('tni', 10, b'1', b'1', NULL, b'0'),
	('zoa', 2, b'1', b'1', 'D:\\Users\\User.Open\\My Documents\\IATI test data NRK\\duplicate-test.xml', b'0');
/*!40000 ALTER TABLE `ctl-publishers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
