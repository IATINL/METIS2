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

-- Dumping structure for table iatireference.ref-country-classification
DROP TABLE IF EXISTS `ref-country-classification`;
CREATE TABLE IF NOT EXISTS `ref-country-classification` (
  `ISOA2` char(2) DEFAULT NULL,
  `ISOA3` char(3) DEFAULT NULL,
  `UNCountry` varchar(50) DEFAULT NULL,
  `UNLDC` char(3) DEFAULT NULL,
  `Income` varchar(25) DEFAULT NULL,
  `Region` varchar(35) DEFAULT NULL,
  `FragileState` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table iatireference.ref-currency-rates
DROP TABLE IF EXISTS `ref-currency-rates`;
CREATE TABLE IF NOT EXISTS `ref-currency-rates` (
  `Jaar` int(11) NOT NULL DEFAULT '0',
  `Valuta` char(3) NOT NULL DEFAULT '',
  `Bron` char(20) NOT NULL,
  `Koers` double DEFAULT NULL,
  PRIMARY KEY (`Jaar`,`Valuta`,`Bron`),
  KEY `idx_currency-rates_lookup` (`Valuta`,`Jaar`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table iatireference.ref-menu-lines
DROP TABLE IF EXISTS `ref-menu-lines`;
CREATE TABLE IF NOT EXISTS `ref-menu-lines` (
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table iatireference.ref-parameters
DROP TABLE IF EXISTS `ref-parameters`;
CREATE TABLE IF NOT EXISTS `ref-parameters` (
  `key` char(10) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
