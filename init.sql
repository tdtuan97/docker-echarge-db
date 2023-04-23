-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.2-dmr - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for echarge
CREATE DATABASE IF NOT EXISTS `echarge` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `echarge`;

-- Dumping structure for table echarge.sys_config
CREATE TABLE IF NOT EXISTS `sys_config` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `key` varchar(50) NOT NULL,
    `name` varchar(50) NOT NULL,
    `value` varchar(255) DEFAULT NULL,
    `remark` varchar(255) DEFAULT NULL,
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (`id`),
    UNIQUE KEY `IDX_2c363c25cf99bcaab3a7f389ba` (`key`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.sys_login_log
CREATE TABLE IF NOT EXISTS `sys_login_log` (
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) DEFAULT NULL,
    `ip` varchar(255) DEFAULT NULL,
    `time` datetime DEFAULT NULL,
    `ua` varchar(500) DEFAULT NULL,
    `login_location` varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.sys_req_log
CREATE TABLE IF NOT EXISTS `sys_req_log` (
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `ip` varchar(255) DEFAULT NULL,
    `user_id` int(11) DEFAULT NULL,
    `params` text,
    `action` varchar(100) DEFAULT NULL,
    `method` varchar(15) DEFAULT NULL,
    `status` int(11) DEFAULT NULL,
    `consume_time` int(11) DEFAULT '0',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.sys_task
CREATE TABLE IF NOT EXISTS `sys_task` (
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `service` varchar(255) NOT NULL,
    `type` tinyint(4) NOT NULL DEFAULT '0',
    `status` tinyint(4) NOT NULL DEFAULT '1',
    `start_time` datetime DEFAULT NULL,
    `end_time` datetime DEFAULT NULL,
    `limit` int(11) DEFAULT '0',
    `cron` varchar(255) DEFAULT NULL,
    `every` int(11) DEFAULT NULL,
    `data` text,
    `job_opts` text,
    `remark` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `IDX_ef8e5ab5ef2fe0ddb1428439ef` (`name`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.sys_task_log
CREATE TABLE IF NOT EXISTS `sys_task_log` (
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `task_id` int(11) NOT NULL,
    `status` tinyint(4) NOT NULL DEFAULT '0',
    `detail` text,
    `consume_time` int(11) DEFAULT '0',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.sys_user
CREATE TABLE IF NOT EXISTS `sys_user` (
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `department_id` int(11) NOT NULL,
    `name` varchar(255) NOT NULL,
    `username` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `nick_name` varchar(255) DEFAULT NULL,
    `head_img` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT '',
    `phone` varchar(255) DEFAULT '',
    `remark` varchar(255) DEFAULT '',
    `psalt` varchar(32) NOT NULL,
    `status` tinyint(4) DEFAULT '1',
    PRIMARY KEY (`id`),
    UNIQUE KEY `IDX_9e7164b2f1ea1348bc0eb0a7da` (`username`)
    ) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.sys_user_role
CREATE TABLE IF NOT EXISTS `sys_user_role` (
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `role_id` int(11) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table echarge.tbl_admin
CREATE TABLE IF NOT EXISTS `tbl_admin` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `salt` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `is_active` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `phone_number` (`phone_number`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table echarge.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `salt` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `avatar` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `is_active` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table echarge.tbl_user_access_log
CREATE TABLE IF NOT EXISTS `tbl_user_access_log` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `platform` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `location` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
    `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `mac_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `last_login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
    `user_agent` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;