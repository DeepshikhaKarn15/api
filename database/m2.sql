-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for api
CREATE DATABASE IF NOT EXISTS `api` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `api`;

-- Dumping structure for table api.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) NOT NULL,
  `description` varchar(225) NOT NULL,
  `userid` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table api.items: ~3 rows (approximately)
INSERT INTO `items` (`id`, `productname`, `description`, `userid`, `created_at`, `updated_at`) VALUES
	(5, 'p_test_1', '206522', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, 'p_test_2', '206522', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(7, 'p_test_3', '206522', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(8, 'p_test_4', '206522', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(9, 'p_test_5', '206522', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(10, 'p_test_6', '206522', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- Dumping structure for table api.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(233) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `items` (`id`),
  CONSTRAINT `order_status_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table api.order_status: ~1 rows (approximately)
INSERT INTO `order_status` (`order_id`, `user_id`, `status`, `created_at`, `updated_at`, `id`) VALUES
	(5, 1, 'pendding', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
	(6, 1, 'pendding', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3),
	(7, 2, 'pendding', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4),
	(8, 2, 'pendding', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
	(9, 3, 'pendding', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6),
	(10, 3, 'pendding', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7);

-- Dumping structure for table api.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(225) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table api.user: ~3 rows (approximately)
INSERT INTO `user` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'testing_1', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'testing_2', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'testing_3', '12345', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
