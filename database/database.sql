-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2024 at 04:12 AM
-- Server version: 10.6.16-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `innue`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(120) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(120) NOT NULL,
  `owner` varchar(120) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `label_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(120) DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Closed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_session_histories`
--

CREATE TABLE `chat_session_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_session_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `msg_type` varchar(20) DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(120) DEFAULT NULL,
  `ip_address` varchar(120) DEFAULT NULL,
  `device_info` text DEFAULT NULL,
  `from_url` text DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `timezone` varchar(120) DEFAULT NULL,
  `latitude` varchar(120) DEFAULT NULL,
  `longitude` varchar(120) DEFAULT NULL,
  `visit_timestamp` timestamp NULL DEFAULT NULL,
  `type` enum('customer','lead','general') NOT NULL DEFAULT 'general' COMMENT ' customer, lead and  general',
  `is_online` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(120) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(120) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Inactive , 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(2, 'Bangla', 'bn', 1, '2024-03-17 22:12:02', '2024-03-17 22:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `mail_reports`
--

CREATE TABLE `mail_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`mails`)),
  `subject` varchar(120) NOT NULL,
  `body` longtext NOT NULL,
  `attachment` varchar(120) DEFAULT NULL,
  `status` enum('pending','sent','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `body` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(120) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_03_01_042503_create_cache_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2021_12_25_124522_create_settings_table', 1),
(8, '2022_05_25_072926_create_languages_table', 1),
(9, '2023_02_09_051208_create_permission_tables', 1),
(10, '2023_02_12_070616_create_sessions_table', 1),
(11, '2023_02_28_082321_add_group_column_in_permissions_table', 1),
(12, '2024_02_05_081444_create_customers_table', 1),
(13, '2024_02_05_093626_create_chat_sessions_table', 1),
(14, '2024_02_05_093640_create_chat_session_histories_table', 1),
(15, '2024_02_13_045919_create_subscriptions_table', 1),
(16, '2024_02_15_032942_create_mail_reports_table', 1),
(17, '2024_02_15_033259_create_mail_templates_table', 1),
(18, '2024_02_20_102726_create_sms_reports_table', 1),
(19, '2024_02_20_103213_create_sms_templates_table', 1),
(20, '2024_02_22_062559_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(120) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(120) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(120) NOT NULL,
  `token` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `group` varchar(120) NOT NULL DEFAULT 'General',
  `guard_name` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `group`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user_management', 'User', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(2, 'role_management', 'User', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(3, 'permission_management', 'User', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(4, 'setting_management', 'Setting', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(5, 'mail_setting_management', 'Setting', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(6, 'sms_setting_management', 'Setting', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(7, 'socket_setting_management', 'Setting', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(8, 'env_setting_management', 'Setting', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(9, 'language_setting_management', 'Setting', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(10, 'backup_management', 'Backup', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(11, 'chat_read', 'chat', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(12, 'chat_read_all', 'chat', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(13, 'chat_init_widget', 'chat', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(14, 'chat_setting', 'chat', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(15, 'customer_read', 'Customer', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(16, 'customer_update', 'Customer', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(17, 'customer_delete', 'Customer', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(18, 'customer_conversion', 'Customer', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(19, 'subscription_create', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(20, 'subscription_read', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(21, 'subscription_update', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(22, 'subscription_delete', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(23, 'subscription_init_widget', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(24, 'mail_template_management', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(25, 'mail_create', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(26, 'mail_report_read', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(27, 'mail_report_delete', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(28, 'mail_report_show', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(29, 'sms_create', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(30, 'sms_template_management', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(31, 'sms_report_read', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(32, 'sms_report_delete', 'Marketing', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(33, 'sms_report_show', 'Marketing', 'web', '2024-03-17 22:12:03', '2024-03-17 22:12:03'),
(34, 'chat_report', 'Marketing', 'web', '2024-03-17 22:12:03', '2024-03-17 22:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(120) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `guard_name` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'web', '2024-03-17 22:12:02', '2024-03-17 22:12:02'),
(2, 'User', 'web', '2024-03-17 22:12:03', '2024-03-17 22:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(120) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(120) NOT NULL,
  `key` varchar(120) NOT NULL,
  `display_name` varchar(120) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(120) NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `note` text DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `key`, `display_name`, `value`, `type`, `details`, `note`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Site', 'site.name', 'Name', 'Bdtask', 'text', NULL, NULL, 1, '2023-03-21 06:00:12', '2023-03-21 06:00:12'),
(2, 'Site', 'site.description', 'Description', 'Want to study abroad ? Get free expert advice and information on colleges, courses, exams, admission, student visa, and application process to study overseas.', 'text_area', NULL, NULL, 2, '2023-03-21 06:00:12', '2023-03-21 06:00:12'),
(3, 'Site', 'site.url', 'Site Url', 'https://www.bdtask.com', 'text', NULL, NULL, 3, '2023-03-21 06:00:12', '2023-03-21 06:00:12'),
(4, 'Site', 'site.logo_light', 'Logo White', NULL, 'image', NULL, 'Default image size 205x60', 4, '2023-03-21 06:00:12', '2023-03-21 06:00:12'),
(5, 'Site', 'site.logo_black', 'Logo Black', NULL, 'image', NULL, 'Default image size 205x60', 4, '2023-03-21 06:00:12', '2023-03-21 06:00:12'),
(6, 'Site', 'site.favicon', 'Favicon', NULL, 'image', NULL, 'Default image size 68x68', 8, '2023-03-21 06:00:12', '2023-03-21 06:00:12'),
(16, 'Appearance', 'appearance.auth_img', 'Authentication image', NULL, 'image', '[]', NULL, 1, '2023-03-23 04:45:32', '2023-03-23 04:49:34'),
(17, 'Appearance', 'appearance.auth_quote_title', 'Authentication Page Quote Title', 'Top Notch Stock Resources', 'text', '[]', NULL, 2, '2023-03-23 04:51:08', '2023-03-23 04:54:13'),
(18, 'Appearance', 'appearance.auth_quote', 'Authentication Page Quote', 'Today, we create innovative solutions to the challenges that consumers face in both their everyday lives and events.', 'text_area', '[]', NULL, 3, '2023-03-23 04:55:02', '2023-03-23 04:55:18'),
(19, 'Site', 'site.header_tagline', 'Site Header Tag Line', '<p>Welcome to <span class=\"fw-bold\">Innue Dashboard</span></p><p>Empowering your Chating with <b>Innue.</b></p> <p>Discover the potential of AI with <b>Innue.</b></p> <p>Unlock the power of AI with <b>Innue.</b></p> <p>Your guide to mastering AI - <b>Innue.</b></p> <p> Experience the future of learning with <b>Innue.</b></p> <p>Transform your skills with <b>Innue.</b></p> <p>Empower your career with <b>Innue.</b></p> <p>Learn the skills of tomorrow with <b>Innue.</b></p> <p>Your personal AI tutor - <b>Innue.</b></p> <p>AI made easy with <b>Innue.</b></p>', 'code_editor', '{\"theme\": \"dark\", \"language\": \"html\"}', NULL, 9, '2023-03-29 00:07:40', '2023-03-29 00:11:13'),
(20, 'Subscription', 'subscription.title', 'Title', 'Subscribe to the <span style=\"box-sizing: border-box; color: rgb(4, 139, 98);\">Newslatter</span>', 'text', '[]', NULL, 1, '2024-02-29 03:21:42', '2024-02-29 03:39:53'),
(21, 'Subscription', 'subscription.description', 'Description', 'Stay up to date on the latest in web, mobile and game development.Plus receive exclusive content by subscribing to our newsletter.', 'text_area', '[]', NULL, 2, '2024-02-29 03:23:38', '2024-02-29 03:39:53'),
(22, 'Subscription', 'subscription.footer', 'Footer', 'Your email is safe with us. We wont spam.', 'text', '[]', NULL, 3, '2024-02-29 03:24:30', '2024-02-29 03:39:53'),
(23, 'Subscription', 'subscription.footer_close', 'Footer Close Text', 'No thanks, I don\'t want to subscribe', 'text', '[]', NULL, 4, '2024-02-29 03:24:30', '2024-02-29 03:39:53'),
(24, 'Subscription', 'subscription.striped_border_top', 'Striped Border Top', '#4caf50', 'color', '[]', NULL, 5, '2024-02-29 03:28:23', '2024-02-29 03:39:53'),
(25, 'Subscription', 'subscription.striped_border_bottom', 'Striped Border Bottom', '#4caf50', 'color', '[]', NULL, 6, '2024-02-29 03:28:58', '2024-02-29 03:39:53'),
(26, 'Subscription', 'subscription.striped_background', 'Striped Background', '#007b5e', 'color', '[]', NULL, 7, '2024-02-29 03:29:39', '2024-02-29 03:39:53'),
(27, 'Subscription', 'subscription.button_background', 'Button Color', '#4caf50', 'color', '[]', NULL, 8, '2024-02-29 03:30:14', '2024-02-29 03:39:53'),
(28, 'Chat', 'chat.notification_sound', 'Chat Notification Sound', NULL, 'file', '{\"accept\": \".mp3\"}', 'Default sound file format should be \".mp3\"', 1, '2024-02-29 03:30:14', '2024-02-29 03:39:53'),
(29, 'Chat', 'chat.instant_reply', 'Chat Instant Reply', 'Hey there! We apologize for the inconvenience. All our agents are currently busy assisting other customers. Please wait a moment as your query is important to us. Thank you for your patience.', 'text_area', '[]', NULL, 2, '2024-02-29 03:30:14', '2024-02-29 03:39:53'),
(30, 'Chat', 'chat.primary_color', 'Chat Primary Color', '#37a000', 'color', '[]', NULL, 3, '2024-02-29 03:30:14', '2024-02-29 03:39:53'),
(31, 'Chat', 'chat.secondary_color', 'Chat Secondary Color', '#37a000', 'color', '[]', NULL, 3, '2024-02-29 03:30:14', '2024-02-29 03:39:53'),
(32, 'Chat', 'chat.tertiary_color', 'Chat Tertiary Color', '#37a000', 'color', '[]', NULL, 3, '2024-02-29 03:30:14', '2024-02-29 03:39:53'),
(33, 'Chat', 'chat.position', 'Chat Position', 'right', 'select_dropdown', '{\"Left\": \"left\", \"Right\": \"right\"}', NULL, 4, '2024-03-09 04:55:30', '2024-03-09 04:55:40'),
(34, 'Chat', 'chat.chat_box_background_image', 'Chat Box Background Image', NULL, 'image', '{\"accept\": \"image/*\"}', 'Default image size 550x990', 5, '2024-03-10 03:30:14', '2024-03-10 03:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `sms_reports`
--

CREATE TABLE `sms_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contacts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contacts`)),
  `message` text NOT NULL,
  `status` enum('pending','sent','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `message` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `origin` varchar(120) DEFAULT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: subscribed 0: unsubscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(120) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(120) NOT NULL DEFAULT 'Others' COMMENT 'Male,Female,Others',
  `age` varchar(120) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `status` varchar(120) NOT NULL DEFAULT 'Pending' COMMENT 'Pending, Active, Suspended',
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_session_histories`
--
ALTER TABLE `chat_session_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `mail_reports`
--
ALTER TABLE `mail_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_templates_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `sms_reports`
--
ALTER TABLE `sms_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `subscriptions_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_session_histories`
--
ALTER TABLE `chat_session_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mail_reports`
--
ALTER TABLE `mail_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sms_reports`
--
ALTER TABLE `sms_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
