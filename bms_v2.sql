-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 17, 2018 at 07:12 AM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bms_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` smallint(6) NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` smallint(6) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `type`, `name`, `email`, `address`, `phone`, `note`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, -1, 'Nguyễn Hùng', 'hades@trueplus.vn', 'PHU DO MY DINH TU LIEM HA NOI', '1665937926', NULL, 1, '1', '2018-08-14 08:11:37', '2018-08-14 08:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(92, '2014_10_12_000000_create_users_table', 1),
(93, '2014_10_12_100000_create_password_resets_table', 1),
(94, '2018_07_25_163438_create_product_table', 1),
(95, '2018_07_25_163515_create_customer_table', 1),
(96, '2018_07_25_163537_create_order_table', 1),
(97, '2018_07_25_163553_create_order_attribute_table', 1),
(98, '2018_07_25_163610_create_order_product_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `total_item_ordered` decimal(16,2) NOT NULL,
  `total_item_refund` decimal(16,2) NOT NULL,
  `total_amount_ordered` decimal(16,2) NOT NULL,
  `total_amount_refund` decimal(16,2) NOT NULL,
  `total_fee_need_pay` decimal(16,2) NOT NULL,
  `total_fee` decimal(16,2) NOT NULL,
  `total_paid` decimal(16,2) NOT NULL,
  `subtotal` decimal(16,2) NOT NULL,
  `grand_total` decimal(16,2) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `increment_id`, `type`, `order_date`, `customer_id`, `customer_name`, `customer_email`, `customer_phone`, `note`, `total_item_ordered`, `total_item_refund`, `total_amount_ordered`, `total_amount_refund`, `total_fee_need_pay`, `total_fee`, `total_paid`, `subtotal`, `grand_total`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'NH0000001', 1, '2018-04-12', 1, 'Nguyễn Hùng', 'hades@trueplus.vn', '1665937926', NULL, '1.00', '1.00', '20000.00', '50000.00', '0.00', '100000.00', '10000000.00', '-30000.00', '-9930000.00', '1', '2018-08-15 10:09:51', '2018-08-15 10:09:51'),
(2, 'NH0000002', 1, '2018-04-12', 1, 'Nguyễn Hùng', 'hades@trueplus.vn', '1665937926', NULL, '1.00', '1.00', '20000.00', '50000.00', '0.00', '100000.00', '10000000.00', '-30000.00', '-9930000.00', '1', '2018-08-15 10:10:35', '2018-08-15 10:10:35'),
(3, 'NH0000003', 1, '2018-04-12', 1, 'Nguyễn Hùng', 'hades@trueplus.vn', '1665937926', NULL, '1.00', '1.00', '20000.00', '50000.00', '0.00', '100000.00', '10000000.00', '-30000.00', '-9930000.00', '1', '2018-08-15 10:11:21', '2018-08-15 10:11:21'),
(4, 'NH0000004', 1, '2018-04-12', 1, 'Nguyễn Hùng', 'hades@trueplus.vn', '1665937926', NULL, '1.00', '1.00', '20000.00', '50000.00', '0.00', '100000.00', '10000000.00', '-30000.00', '-9930000.00', '1', '2018-08-15 10:12:22', '2018-08-15 10:12:22'),
(5, 'NH0000005', 1, '2018-04-12', 1, 'Nguyễn Hùng', 'hades@trueplus.vn', '1665937926', NULL, '1.00', '0.00', '20000.00', '0.00', '0.00', '100000.00', '10000000.00', '20000.00', '-9880000.00', '1', '2018-08-16 07:58:18', '2018-08-16 07:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_attribute`
--

CREATE TABLE `order_attribute` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_attribute`
--

INSERT INTO `order_attribute` (`id`, `order_id`, `title`, `value`, `created_at`, `updated_at`) VALUES
(1, 3, 'xe', '100000.00', '2018-08-15 10:11:21', '2018-08-15 10:11:21'),
(2, 4, 'xe', '100000.00', '2018-08-15 10:12:22', '2018-08-15 10:12:22'),
(3, 5, 'xe', '100000.00', '2018-08-16 07:58:18', '2018-08-16 07:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `row_total` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `sku`, `product_name`, `type`, `price`, `qty`, `row_total`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'HT1-TB', 'HT1-TB', 0, '20000.00', '1.00', '20000.00', '2018-08-15 10:10:35', '2018-08-15 10:10:35'),
(2, 2, 1, 'BC15', 'BC15', 1, '50000.00', '1.00', '50000.00', '2018-08-15 10:10:35', '2018-08-15 10:10:35'),
(3, 3, 2, 'HT1-TB', 'HT1-TB', 0, '20000.00', '1.00', '20000.00', '2018-08-15 10:11:21', '2018-08-15 10:11:21'),
(4, 3, 1, 'BC15', 'BC15', 1, '50000.00', '1.00', '50000.00', '2018-08-15 10:11:21', '2018-08-15 10:11:21'),
(5, 4, 2, 'HT1-TB', 'HT1-TB', 0, '20000.00', '1.00', '20000.00', '2018-08-15 10:12:22', '2018-08-15 10:12:22'),
(6, 4, 1, 'BC15', 'BC15', 1, '50000.00', '1.00', '50000.00', '2018-08-15 10:12:22', '2018-08-15 10:12:22'),
(7, 5, 2, 'HT1-TB', 'HT1-TB', 0, '20000.00', '1.00', '20000.00', '2018-08-16 07:58:18', '2018-08-16 07:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` smallint(6) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `sku`, `name`, `customer_id`, `description`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'BC15', 'BC15', NULL, NULL, 1, '1', '2018-08-14 08:11:44', '2018-08-14 08:11:44'),
(2, 'HT1-TB', 'HT1-TB', NULL, NULL, 1, '1', '2018-08-14 08:45:15', '2018-08-14 08:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hùng Nguyễn', 'hung02061994@gmail.com', '$2y$10$IrlLfdiuljqDdzw5LTQrO./scQrZqj7p52sWLUQOhfL.jwXamrNHa', NULL, '2018-08-13 09:05:37', '2018-08-13 09:05:37'),
(2, 'admin', 'admin@example.com', '$2y$10$zHv1Hio1wH2EYOckbx4Qou9GgikY9gkYFPvqVHwy8DmEQfuoQrJ5O', NULL, '2018-08-13 09:05:37', '2018-08-13 09:05:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_attribute`
--
ALTER TABLE `order_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_attribute_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_sku_unique` (`sku`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order_attribute`
--
ALTER TABLE `order_attribute`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_attribute`
--
ALTER TABLE `order_attribute`
  ADD CONSTRAINT `order_attribute_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
