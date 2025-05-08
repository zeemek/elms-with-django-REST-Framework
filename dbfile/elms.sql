-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 07:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elms`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add leave type', 6, 'add_leavetype'),
(22, 'Can change leave type', 6, 'change_leavetype'),
(23, 'Can delete leave type', 6, 'delete_leavetype'),
(24, 'Can view leave type', 6, 'view_leavetype'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add leave request', 8, 'add_leaverequest'),
(30, 'Can change leave request', 8, 'change_leaverequest'),
(31, 'Can delete leave request', 8, 'delete_leaverequest'),
(32, 'Can view leave request', 8, 'view_leaverequest'),
(33, 'Can add leave balance', 9, 'add_leavebalance'),
(34, 'Can change leave balance', 9, 'change_leavebalance'),
(35, 'Can delete leave balance', 9, 'delete_leavebalance'),
(36, 'Can view leave balance', 9, 'view_leavebalance');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'api', 'leavebalance'),
(8, 'api', 'leaverequest'),
(6, 'api', 'leavetype'),
(7, 'api', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-08 04:27:02.402947'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-05-08 04:27:02.427957'),
(3, 'auth', '0001_initial', '2025-05-08 04:27:02.530862'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-05-08 04:27:02.558864'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-05-08 04:27:02.561938'),
(6, 'auth', '0004_alter_user_username_opts', '2025-05-08 04:27:02.565940'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-05-08 04:27:02.569929'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-05-08 04:27:02.570930'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-05-08 04:27:02.574939'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-05-08 04:27:02.578139'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-05-08 04:27:02.583128'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-05-08 04:27:02.591204'),
(13, 'auth', '0011_update_proxy_permissions', '2025-05-08 04:27:02.596208'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-05-08 04:27:02.600206'),
(15, 'api', '0001_initial', '2025-05-08 04:27:02.860667'),
(16, 'admin', '0001_initial', '2025-05-08 04:27:02.913870'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-05-08 04:27:02.920869'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-08 04:27:02.925870'),
(19, 'sessions', '0001_initial', '2025-05-08 04:27:02.938862');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ggo3wyydq35i7fsnvdaqnyuzfkrvwpuq', '.eJxVjEEOwiAQRe_C2hAZoO24dO8ZmoEZpGogKe3KeHdD0oVu_3vvv9VM-5bnvck6L6wuCtTpdwsUn1I64AeVe9Wxlm1dgu6KPmjTt8ryuh7u30Gmlnst0-A9oiGPgew0AiMDcDTC4rwNMqLFZIODcxoogQso0TJEb5JNTn2-6Zs4RA:1uCtCx:uwvQQuAMDStWvnGtBI3R1GSEv_a9w-2xZDD4ozKXExI', '2025-05-22 04:50:07.643985'),
('z4ykkxxqdesx64t4ki7o0ws5truqdfl4', '.eJylUMtymzAU_RevW0ZIYJvubEwInkiEBgNi45GEMC8b1zgDVqf_XtFmOu26i7u599zz-r44svd7dXwf5O1YF4svC7j49PeOM9HKy3woGnY59YboL_dbzY0ZYnxcBwP3hey2H9h_CCo2VPO3XC9t23FMZjucofUKFk4BYSFMWUjLRlyuHOSUiFsQlEtWQos7UqACCtssUWlpUiaEHIbjvdcimlE-9hX3RR3W--CgApPUwRBcvtrCDZZBe80Sd-8YGgQ4vHe8c4DMtl3Q9DVNSZNnRAX1WOdZNerdRFQEiaKINO3jxd1faRbVYeMhsqMw3HmPMNbk5ytgb5q8iWyisEViqogfjfkuMsOY1DT2ANlFI40poEpYebOxZo0iI53onGuujeELMPDrMjmMLosVDijkK95Z59LcPkeut5sge6rlDQE0vdgnT6e-yfImh-r_Y4tzctajmDtHSaz5AccC6CIs0mxsrK2y9An8qaM5Tfh3Hd8Kv9WCgUmhB_L0oAhMauxTEPrkTBvPwn5k5ilGJD0grE5m_stUovJsX7J0rlKbWqXVZ_QAjxDztliWAe_brdx07dS8ro92YY-H9C1_nvLWwosfPwEcqdzr:1uCtau:8_pzb1-oFeF2egQtOPLmEYF56SxIQfYhzqfOyrGz6Fg', '2025-05-22 05:14:52.451956');

-- --------------------------------------------------------

--
-- Table structure for table `leave_balances`
--

CREATE TABLE `leave_balances` (
  `id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `total_days` int(11) NOT NULL,
  `used_days` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `leave_type_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_balances`
--

INSERT INTO `leave_balances` (`id`, `year`, `total_days`, `used_days`, `created_at`, `updated_at`, `leave_type_id`, `user_id`) VALUES
(1, 2025, 12, 0, '2025-05-08 04:29:03.895773', '2025-05-08 04:29:03.895773', 1, 1),
(2, 2025, 30, 0, '2025-05-08 04:29:03.897157', '2025-05-08 04:29:03.898163', 2, 1),
(3, 2025, 12, 0, '2025-05-08 04:48:10.052878', '2025-05-08 04:48:10.052878', 1, 2),
(4, 2025, 30, 0, '2025-05-08 04:48:10.055737', '2025-05-08 04:48:10.055737', 2, 2),
(5, 2025, 12, 0, '2025-05-08 05:08:29.049546', '2025-05-08 05:08:29.049546', 1, 3),
(6, 2025, 30, 0, '2025-05-08 05:08:29.054182', '2025-05-08 05:08:29.054182', 2, 3),
(7, 2025, 12, 0, '2025-05-08 05:14:03.268246', '2025-05-08 05:14:03.268246', 1, 4),
(8, 2025, 30, 0, '2025-05-08 05:14:03.273119', '2025-05-08 05:14:03.273119', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `leave_type_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `maximum_days_per_year` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `description`, `maximum_days_per_year`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Casual Leave', 'Regular paid time off for personal reasons', 12, 1, '2025-05-08 04:27:07.501781', '2025-05-08 04:27:07.501781'),
(2, 'Earned Leave', 'Accumulated leave based on service period', 30, 1, '2025-05-08 04:27:07.503780', '2025-05-08 04:27:07.503780');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `date_joined`, `is_active`, `is_admin`) VALUES
(1, 'pbkdf2_sha256$720000$sgryBrcFbzfp55gUlNV477$bl6l9jz5zjHdlcy4FYmziJbtfMiEsiFE4NvZutiXtZU=', '2025-05-08 05:06:03.958648', 1, 'test2', '', '', 'test2@gmail.com', 1, '2025-05-08 04:29:03.608301', 1, 0),
(2, 'pbkdf2_sha256$720000$lS9CBzUU4uXtmjx29Auhtw$3iQyEfQpVVEJV/YcN91wvVEnSRuNUl6aMPxOC6jb7j8=', '2025-05-08 05:14:52.439770', 1, 'test', 'test', 'test', 'test@gmail.com', 1, '2025-05-08 04:48:08.637979', 1, 1),
(3, 'pbkdf2_sha256$720000$VYXbpCPHQN5LQCydGdJUDg$ccx5oLZzvw2kWBiCM7de4XnxnlSXh9uBoBYNyj4nHts=', '2025-05-08 05:08:29.068527', 0, 'test3', 'test3', 'test3', 'test3@gmail.com', 0, '2025-05-08 05:08:27.870594', 0, 0),
(4, 'pbkdf2_sha256$720000$LL3uy1J1XYuu9YNh9eHrSg$7YXTTxOBG5aJl00IC4EgWehOMfGAzUtABBuKKPTKpQE=', '2025-05-08 05:14:03.286583', 0, 'test4', 'test4', 'test4', 'test4@gmail.com', 0, '2025-05-08 05:14:01.746322', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_user_permissions`
--

CREATE TABLE `users_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_balances_user_id_leave_type_id_year_2342d52b_uniq` (`user_id`,`leave_type_id`,`year`),
  ADD KEY `leave_balances_leave_type_id_a8915386_fk_leave_types_id` (`leave_type_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_requests_leave_type_id_aa91b26f_fk_leave_types_id` (`leave_type_id`),
  ADD KEY `leave_requests_user_id_bc82ee5c_fk_users_id` (`user_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  ADD KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `leave_balances`
--
ALTER TABLE `leave_balances`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD CONSTRAINT `leave_balances_leave_type_id_a8915386_fk_leave_types_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`),
  ADD CONSTRAINT `leave_balances_user_id_ae11f6b4_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_leave_type_id_aa91b26f_fk_leave_types_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`),
  ADD CONSTRAINT `leave_requests_user_id_bc82ee5c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
