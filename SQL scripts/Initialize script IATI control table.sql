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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
