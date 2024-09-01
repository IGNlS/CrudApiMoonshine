-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para crud
CREATE DATABASE IF NOT EXISTS `crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crud`;

-- Volcando estructura para tabla crud.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;

-- Volcando estructura para tabla crud.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.migrations: ~10 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2020_10_04_115514_create_moonshine_roles_table', 2),
	(6, '2020_10_05_173148_create_moonshine_tables', 2),
	(7, '2022_12_19_115549_create_moonshine_socialites_table', 2),
	(8, '9999_12_20_173629_create_notifications_table', 2),
	(9, '2024_08_24_143204_create_teams_table', 3),
	(10, '2024_08_24_143237_create_players_table', 3);

-- Volcando estructura para tabla crud.moonshine_socialites
CREATE TABLE IF NOT EXISTS `moonshine_socialites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `moonshine_user_id` bigint unsigned NOT NULL,
  `driver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moonshine_socialites_driver_identity_unique` (`driver`,`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.moonshine_socialites: ~0 rows (aproximadamente)
DELETE FROM `moonshine_socialites`;

-- Volcando estructura para tabla crud.moonshine_users
CREATE TABLE IF NOT EXISTS `moonshine_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `moonshine_user_role_id` bigint unsigned NOT NULL DEFAULT '1',
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moonshine_users_email_unique` (`email`),
  KEY `moonshine_users_moonshine_user_role_id_foreign` (`moonshine_user_role_id`),
  CONSTRAINT `moonshine_users_moonshine_user_role_id_foreign` FOREIGN KEY (`moonshine_user_role_id`) REFERENCES `moonshine_user_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.moonshine_users: ~3 rows (aproximadamente)
DELETE FROM `moonshine_users`;
INSERT INTO `moonshine_users` (`id`, `moonshine_user_role_id`, `email`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ignisblb@gmail.com', '$2y$12$oRAMU8b94gjXQjQ8PTGcmu5pMEoPnckc8yjrmnuo5E3JJeoiBMbmS', 'ignis', NULL, 'TdY5A3bvL1aV7dSIvn0kbkhm8j1FRvfbD2kXTmD5G1TXsOqVDzUUpKtcU3of', '2024-08-24 19:19:30', '2024-08-24 19:19:30'),
	(2, 2, 'jperez@gmail.com', '$2y$12$8U3oNBEHQO60Vlb2vBgbBOmONX5HL0f8feqhhV5vmgJNtOK0jNMG6', 'Juan Pérez', NULL, NULL, '2024-08-24 21:18:26', '2024-08-24 21:18:26'),
	(3, 1, 'admin@gmail.com', '$2y$12$/Pb.K.qfmVpT1qJsm44TPuamAe.BOKQzTAykPzqorIBcNpXHc22ii', 'admin@gmail.com', NULL, NULL, '2024-09-02 00:58:41', '2024-09-02 00:58:41');

-- Volcando estructura para tabla crud.moonshine_user_roles
CREATE TABLE IF NOT EXISTS `moonshine_user_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.moonshine_user_roles: ~2 rows (aproximadamente)
DELETE FROM `moonshine_user_roles`;
INSERT INTO `moonshine_user_roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', '2024-08-24 19:17:46', '2024-08-24 19:17:46'),
	(2, 'Guest', '2024-08-24 21:13:07', '2024-08-24 21:13:07');

-- Volcando estructura para tabla crud.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.notifications: ~0 rows (aproximadamente)
DELETE FROM `notifications`;

-- Volcando estructura para tabla crud.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.password_reset_tokens: ~0 rows (aproximadamente)
DELETE FROM `password_reset_tokens`;

-- Volcando estructura para tabla crud.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;

-- Volcando estructura para tabla crud.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_team` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `players_id_team_foreign` (`id_team`),
  CONSTRAINT `players_id_team_foreign` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.players: ~2 rows (aproximadamente)
DELETE FROM `players`;
INSERT INTO `players` (`id`, `name`, `position`, `id_team`, `created_at`, `updated_at`) VALUES
	(1, 'Niko', 'Entry fragger', 1, '2024-08-24 20:52:59', '2024-08-24 20:52:59'),
	(2, 'Karrigan', 'IGL', 2, '2024-08-24 20:53:24', '2024-08-24 21:01:42');

-- Volcando estructura para tabla crud.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.teams: ~5 rows (aproximadamente)
DELETE FROM `teams`;
INSERT INTO `teams` (`id`, `name`, `country`, `created_at`, `updated_at`) VALUES
	(1, 'G2', 'Europa', '2024-08-24 20:28:34', '2024-08-24 20:28:34'),
	(2, 'Faze', 'Europa', '2024-08-24 20:29:40', '2024-08-24 20:29:40'),
	(3, '9z', 'Argentina', '2024-08-24 20:30:04', '2024-08-24 20:30:04'),
	(4, 'Movistar KOi', 'Europa', '2024-08-24 20:30:22', '2024-08-24 20:30:22'),
	(5, 'Fnatic', 'Europa', '2024-08-24 20:31:05', '2024-08-24 20:31:05');

-- Volcando estructura para tabla crud.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla crud.users: ~0 rows (aproximadamente)
DELETE FROM `users`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
