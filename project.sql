-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 11:25 AM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `baners`
--

CREATE TABLE `baners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `btn_name` varchar(255) NOT NULL,
  `btn_color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baners`
--

INSERT INTO `baners` (`id`, `image`, `title`, `body`, `color`, `url`, `btn_name`, `btn_color`, `created_at`, `updated_at`) VALUES
(9, '1737812724.jpg', 'خرید انلاین', 'با خرید انلاین تخفیف بگیرید', '#000000', 'http://127.0.0.1:8000/Admin/Baner/BanersCreate', 'بزن بریم', '#a6d7a2', '2025-01-25 10:15:24', '2025-01-25 10:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL DEFAULT 1,
  `size` text DEFAULT NULL,
  `color` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `baner` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` text NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `baner`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'پوشاک', '1737733929.webp', '1737733929.jpg', '1', '2025-01-09 13:40:22', '2025-01-24 12:22:09'),
(19, 'اکسسوری', '1737733053.webp', '1737733052.jpg', '0', '2025-01-24 12:07:33', '2025-01-24 12:07:33'),
(20, 'کفش', '1737734056.jpg', '1737734056.jpg', '0', '2025-01-24 12:09:20', '2025-01-24 12:24:17'),
(21, 'کلاه', '1737736218.webp', '1737736217.jpg', '0', '2025-01-24 13:00:18', '2025-01-24 13:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` text NOT NULL,
  `discount` bigint(20) NOT NULL,
  `max` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_users`
--

CREATE TABLE `discount_users` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_01_221208_create_categories_table', 1),
(6, '2023_10_01_221901_create_products_table', 1),
(7, '2023_10_01_222629_create_sliders_table', 1),
(8, '2023_10_01_223124_create_baners_table', 1),
(9, '2023_10_01_223613_create_cart_items_table', 1),
(10, '2023_10_01_224056_create_orders_table', 1),
(11, '2023_10_01_224710_create_order_items_table', 1),
(12, '2023_10_01_225214_create_text_baners_table', 1),
(13, '2023_10_01_225411_create_product_colors_table', 1),
(14, '2023_10_01_225604_create_product_sizes_table', 1),
(15, '2023_10_01_225659_create_product_images_table', 1),
(16, '2023_10_01_225826_create_discounts_table', 1),
(17, '2023_10_01_230108_create_discount_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `national_code` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `national_code`, `name`, `mobile`, `price`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'قم خیابان دورشهر کوچه5', 555555555, 'فاطمه نوری', 910772898, 925000, 0, '2025-01-28 14:27:16', '2025-01-28 14:27:16'),
(17, 1, 'تهران / بیمارستان امام خمینی', 77777, 'فاطمه نوری', 9396897351, 925000, 0, '2025-01-28 14:32:06', '2025-01-28 14:32:06'),
(22, 1, 'قم خیابان دورشهر کوچه5', 9999, 'فاطمه نوری', 9396897351, 1800000, 0, '2025-01-28 15:13:02', '2025-01-28 15:13:02'),
(23, 1, 'قم خیابان دورشهر کوچه5', 9999, 'فاطمه نوری', 9396897351, 1800000, 4, '2025-01-28 15:16:18', '2025-01-28 15:16:18'),
(24, 1, 'قم خیابان دورشهر کوچه5', 9999, 'فاطمه نوری', 9396897351, 1800000, 4, '2025-01-28 15:16:59', '2025-01-28 15:16:59'),
(28, 1, 'قم خیابان دورشهر کوچه5', 9999, 'فاطمه نوری', 9396897351, 700000, 0, '2025-01-28 15:27:09', '2025-01-28 15:27:09'),
(36, 1, 'قم خیابان دورشهر کوچه5', 4444444, 'نوری', 9396891111, 50000, 0, '2025-01-28 15:47:32', '2025-01-28 15:47:32'),
(38, 1, 'قم خیابان دورشهر کوچه5', 88888, 'فاطمه نوری', 9396897351, 500000, 0, '2025-01-28 15:56:56', '2025-01-28 15:56:56'),
(40, 1, 'قم خیابان دورشهر کوچه5', 77777, 'فاطمه نوری', 9396897351, 500000, 0, '2025-01-28 15:59:48', '2025-01-28 15:59:48'),
(58, 1, 'قم خیابان دورشهر کوچه5', 444, 'فاطمه نوری', 9396897351, 700000, 0, '2025-01-28 17:08:12', '2025-01-28 17:08:12'),
(59, 1, 'قم خیابان دورشهر کوچه5', 66666, 'فاطمه نوری', 9396897351, 900000, 0, '2025-01-28 17:17:51', '2025-01-28 17:17:51'),
(60, 1, 'قم خیابان دورشهر کوچه5', 123456789, 'فاطمه نوری', 2926830, 150000, 3, '2025-01-29 05:26:10', '2025-01-29 05:26:10'),
(65, 1, 'قم خیابان دورشهر کوچه5', 7878787878, 'فاطمه نوری', 89898989, 500000, 0, '2025-01-29 05:35:12', '2025-01-29 05:35:12'),
(66, 1, 'قم خیابان دورشهر کوچه5', 9090909, 'فاطمه نوری', 9999999, 150000, 0, '2025-01-29 05:37:45', '2025-01-29 05:37:45'),
(67, 1, 'قم خیابان دورشهر کوچه5', 99999, 'فاطمه نوری', 9396897351, 50000, 0, '2025-01-29 05:47:34', '2025-01-29 05:47:34'),
(68, 1, 'قم خیابان دورشهر کوچه7', 98, 'فاطمه نوری', 9396897351, 700000, 0, '2025-01-29 05:53:50', '2025-01-29 05:53:50'),
(71, 1, 'قم خیابان دورشهر کوچه5', 90, 'فاطمه نوری', 9396897351, 500000, 0, '2025-01-29 06:19:05', '2025-01-29 06:19:05'),
(81, 1, 'قم خیابان دورشهر کوچه5', 8888, 'فاطمه نوری', 956, 700000, 0, '2025-01-29 06:58:38', '2025-01-29 06:58:38'),
(84, 1, 'قم خیابان دورشهر کوچه78', 888, 'فاطمه نوری', 9396897351, 900000, 0, '2025-01-29 07:15:48', '2025-01-29 07:15:48'),
(86, 1, 'قم خیابان دورشهر کوچه23', 77, 'فاطمه نوری', 99999, 700000, 0, '2025-01-29 09:21:39', '2025-01-29 09:21:39'),
(92, 1, 'قم خیابان دورشهر کوچه89', 66, 'فاطمه نوری', 9396897351, 700000, 0, '2025-01-30 06:13:28', '2025-01-30 06:13:28'),
(93, 1, 'قم خیابان دورشهر کوچه12', 66, 'فاطمه نوری', 9396897351, 1800000, 0, '2025-01-30 06:15:31', '2025-01-30 06:15:31'),
(94, 1, 'قم خیابان دورشهر کوچه22', 55, 'فاطمه نوری', 9396897351, 500000, 0, '2025-01-30 06:17:12', '2025-01-30 06:17:12'),
(96, 1, 'قم خیابان دورشهر کوچه67', 88888888, 'فاطمه نوری', 93968973510, 700000, 0, '2025-01-30 06:24:30', '2025-01-30 06:24:30'),
(99, 1, 'قم خیابان دورشهر کوچه43', 33, 'فاطمه نوری', 9396897351, 900000, 0, '2025-01-30 06:57:34', '2025-01-30 06:57:34'),
(107, 1, 'قم خیابان دورشهر کوچه43', 33, 'فاطمه نوری', 9396897351, 900000, 0, '2025-01-30 07:17:43', '2025-01-30 07:17:43'),
(109, 1, 'قم خیابان دورشهر کوچه45', 910, 'فاطمه نوری', 9396897352, 500000, 0, '2025-01-30 13:07:52', '2025-01-30 13:07:52'),
(121, 1, 'قم خیابان دورشهر کوچه67', 555, 'فاطمه نوری', 9396897352, 900000, 0, '2025-01-30 13:47:40', '2025-01-30 13:47:40'),
(128, 1, 'قم خیابان دورشهر کوچه44', 767676767, 'فاطمه نوری', 9396897353, 500000, 0, '2025-01-31 05:32:51', '2025-01-31 05:32:51'),
(131, 1, 'قم خیابان دورشهر کوچه55', 1238, 'فاطمه نوری', 9396897351, 1800000, 0, '2025-01-31 05:38:46', '2025-01-31 05:38:46'),
(147, 1, 'قم خیابان دورشهر کوچه4', 44, 'فاطمه نوری', 9396897351, 900000, 0, '2025-01-31 07:06:46', '2025-01-31 07:06:46'),
(152, 1, 'قم خیابان دورشهر کوچه9', 777, 'فاطمه نوری', 9396897351, 800000, 0, '2025-01-31 08:55:15', '2025-01-31 08:55:15'),
(154, 1, 'قم خیابان دورشهر کوچه8', 898989889, 'فاطمه نوری', 9107727789, 500000, 0, '2025-01-31 09:51:29', '2025-01-31 09:51:29'),
(162, 1, 'تهران پارس فرعی 2 پلاک90', 999, 'فاطمه نوری', 2926830, 1400000, 0, '2025-01-31 13:50:58', '2025-01-31 13:50:58'),
(167, 2, 'تهران جنب پارک چیتگر ساختمان لاله پلاک 12', 78787878, 'سارا کریمی', 9396897322, 100000, 0, '2025-02-02 06:49:20', '2025-02-02 06:49:20'),
(168, 2, 'قم خیابان دورشهر کوچه 33', 9898989, 'سارا کریمی', 9396897351, 4200000, 0, '2025-02-02 11:11:04', '2025-02-02 11:11:04'),
(169, 1, 'تبریز خیابا افتاب کوچه 30 پلاک 9', 8787878, 'فاطمه نوری', 9396897351, 50000, 0, '2025-02-02 14:37:15', '2025-02-02 14:37:15'),
(170, 1, 'قم خیابان دورشهر کوچه9', 878787, 'فاطمه نوری', 9396897351, 1400000, 0, '2025-02-04 03:45:54', '2025-02-04 03:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL DEFAULT 1,
  `size` text DEFAULT NULL,
  `color` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `product_id`, `order_id`, `number`, `size`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 16, 1, 3, NULL, 'ابی روشن', '2025-01-28 14:32:06', '2025-01-28 14:32:06'),
(2, 1, 13, 17, 1, 'بزرگ', 'ابی تیره', '2025-01-28 14:32:06', '2025-01-28 14:32:06'),
(3, 1, 14, 23, 2, '38', NULL, '2025-01-28 15:16:18', '2025-01-28 15:16:18'),
(4, 1, 14, 24, 2, '38', NULL, '2025-01-28 15:16:59', '2025-01-28 15:16:59'),
(5, 1, 13, 28, 1, 'بزرگ', 'ابی روشن(یخی)', '2025-01-28 15:27:09', '2025-01-28 15:27:09'),
(6, 1, 15, 36, 1, NULL, 'قهوه ای تیره', '2025-01-28 15:47:32', '2025-01-28 15:47:32'),
(7, 1, 17, 38, 1, 'فری سایز', NULL, '2025-01-28 15:56:56', '2025-01-28 15:56:56'),
(8, 1, 5, 40, 1, 'فری سایز', 'مشکی', '2025-01-28 15:59:48', '2025-01-28 15:59:48'),
(9, 1, 13, 58, 1, 'کوچک', 'ابی تیره', '2025-01-28 17:08:12', '2025-01-28 17:08:12'),
(10, 1, 14, 59, 1, NULL, NULL, '2025-01-28 17:17:51', '2025-01-28 17:17:51'),
(11, 1, 16, 60, 2, NULL, 'صورتی', '2025-01-29 05:26:10', '2025-01-29 05:26:10'),
(12, 1, 17, 65, 1, NULL, NULL, '2025-01-29 05:35:12', '2025-01-29 05:35:12'),
(13, 1, 16, 66, 2, NULL, 'سفید', '2025-01-29 05:37:45', '2025-01-29 05:37:45'),
(14, 1, 15, 67, 1, NULL, 'قهوه ای روشن', '2025-01-29 05:47:34', '2025-01-29 05:47:34'),
(15, 1, 13, 68, 1, 'متوسط', 'ابی روشن(یخی)', '2025-01-29 05:53:50', '2025-01-29 05:53:50'),
(16, 1, 5, 71, 1, 'فری سایز', 'مشکی', '2025-01-29 06:19:05', '2025-01-29 06:19:05'),
(17, 1, 13, 81, 1, 'متوسط', 'ابی تیره', '2025-01-29 06:58:38', '2025-01-29 06:58:38'),
(18, 1, 14, 84, 1, '40', NULL, '2025-01-29 07:15:48', '2025-01-29 07:15:48'),
(19, 1, 13, 86, 1, 'بزرگ', 'ابی روشن(یخی)', '2025-01-29 09:21:39', '2025-01-29 09:21:39'),
(20, 1, 13, 92, 1, 'کوچک', 'ابی تیره', '2025-01-30 06:13:28', '2025-01-30 06:13:28'),
(21, 1, 14, 93, 2, '36', NULL, '2025-01-30 06:15:31', '2025-01-30 06:15:31'),
(22, 1, 5, 94, 1, 'فری سایز', NULL, '2025-01-30 06:17:12', '2025-01-30 06:17:12'),
(23, 1, 13, 96, 1, NULL, NULL, '2025-01-30 06:24:30', '2025-01-30 06:24:30'),
(24, 1, 14, 99, 1, '40', NULL, '2025-01-30 06:57:34', '2025-01-30 06:57:34'),
(25, 1, 14, 107, 1, '36', NULL, '2025-01-30 07:17:44', '2025-01-30 07:17:44'),
(26, 1, 5, 109, 1, 'فری سایز', 'مشکی', '2025-01-30 13:07:52', '2025-01-30 13:07:52'),
(27, 1, 14, 121, 1, '38', NULL, '2025-01-30 13:47:40', '2025-01-30 13:47:40'),
(28, 1, 5, 128, 1, 'فری سایز', 'مشکی', '2025-01-31 05:32:51', '2025-01-31 05:32:51'),
(29, 1, 14, 131, 2, '38', NULL, '2025-01-31 05:38:46', '2025-01-31 05:38:46'),
(30, 1, 14, 147, 1, '38', NULL, '2025-01-31 07:06:46', '2025-01-31 07:06:46'),
(31, 1, 19, 152, 1, NULL, NULL, '2025-01-31 08:55:15', '2025-01-31 08:55:15'),
(32, 1, 5, 154, 1, 'فری سایز', 'مشکی', '2025-01-31 09:51:29', '2025-01-31 09:51:29'),
(33, 1, 13, 162, 2, 'متوسط', 'ابی روشن(یخی)', '2025-01-31 13:50:58', '2025-01-31 13:50:58'),
(34, 2, 15, 167, 2, NULL, 'قهوه ای روشن', '2025-02-02 06:49:20', '2025-02-02 06:49:20'),
(35, 2, 18, 168, 6, NULL, NULL, '2025-02-02 11:11:04', '2025-02-02 11:11:04'),
(36, 1, 15, 169, 1, NULL, 'قهوه ای روشن', '2025-02-02 14:37:15', '2025-02-02 14:37:15'),
(37, 1, 13, 170, 2, 'متوسط', 'ابی تیره', '2025-02-04 03:45:54', '2025-02-04 03:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `inventory` int(11) DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` text NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `title`, `description`, `inventory`, `cat_id`, `image`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'هودی', 'هودی مردانه', 'در اب ولرم شسته شود / پودر لباس مشکی', 0, 2, '1737836310.jpg', 500000, '1', '2025-01-11 18:23:54', '2025-01-25 16:48:32'),
(13, 'شلوار', 'شلوار بیرونی', 'جنس جین', 28, 2, '1737733321.jpg', 700000, '0', '2025-01-24 12:00:42', '2025-02-04 03:45:54'),
(14, 'کتونی', 'برند نایک', 'برند نایک برای کشور تایوان', 22, 20, '1737733255.jpg', 900000, '0', '2025-01-24 12:10:55', '2025-01-24 12:10:55'),
(15, 'کش مو', 'مدل پارچه ای', 'جنس پارچه ای', 99, 19, '1737733367.jpg', 50000, '0', '2025-01-24 12:12:47', '2025-02-02 14:37:15'),
(16, 'کش مو', 'مدل پلاستیکی', 'جنس پلاستیکی', 100, 19, '1737733415.jpg', 75000, '0', '2025-01-24 12:13:36', '2025-01-24 12:13:36'),
(17, 'هودی', 'هودی زنانه', 'با اب ولرم شسته شود', 45, 2, '1737733462.jpg', 500000, '0', '2025-01-24 12:14:22', '2025-01-24 12:14:22'),
(18, 'کتونی', 'کتونی زنانه', 'جنس مناسب / قابل شست و شو در ماشین لباسشویی', 3, 20, '1737734083.jpg', 700000, '0', '2025-01-24 12:16:44', '2025-02-02 11:11:04'),
(19, 'کلاه', 'کلاه زمستانی', 'در 5 رنگ مختلف', 4, 21, '1737736267.jpg', 800000, '0', '2025-01-24 13:01:08', '2025-01-24 13:01:08'),
(20, 'کلاه', 'کلاه افتابی', 'مناسب برای روزهای گرم', 0, 21, '1737736317.jpg', 800000, '0', '2025-01-24 13:01:57', '2025-01-24 13:01:57'),
(21, 'گوشواره مروارید', 'گوشواره', 'گوشواره استیل مروارید دار', 25, 19, '1738663268.jpg', 150000, '0', '2025-02-04 06:31:10', '2025-02-04 06:31:10'),
(22, 'گردنبند مروارید', 'گردنبند', 'گردنبند مروارید از جنس استیل', 20, 19, '1738663372.jpg', 200000, '0', '2025-02-04 06:32:52', '2025-02-04 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `color` text NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `name`, `color`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 'مشکی', '#000', 5, NULL, NULL),
(4, 'ابی تیره', '#051c61', 13, '2025-01-26 06:09:01', '2025-01-26 06:09:01'),
(5, 'ابی روشن(یخی)', '#72b8cf', 13, '2025-01-26 06:09:35', '2025-01-26 06:09:35'),
(6, 'سفید', '#ffffff', 17, '2025-01-26 06:16:21', '2025-01-26 06:16:21'),
(7, 'قهوه ای روشن', '#b08e54', 15, '2025-01-26 06:17:13', '2025-01-26 06:17:13'),
(8, 'قهوه ای تیره', '#633918', 15, '2025-01-26 06:17:38', '2025-01-26 06:17:38'),
(9, 'صورتی', '#e486dc', 16, '2025-01-26 06:18:16', '2025-01-26 06:18:16'),
(10, 'سفید', '#ffffff', 16, '2025-01-26 06:18:31', '2025-01-26 06:18:31'),
(11, 'ابی روشن', '#a9e7f4', 16, '2025-01-26 06:18:50', '2025-01-26 06:18:50'),
(12, 'سیاه', '#000000', 19, '2025-01-26 06:19:46', '2025-01-26 06:19:46'),
(13, 'سفید', '#ffffff', 19, '2025-01-26 06:20:02', '2025-01-26 06:20:02'),
(14, 'قهوه ای روشن', '#625327', 19, '2025-01-26 06:20:26', '2025-01-26 06:20:26'),
(15, 'سبز لجنی', '#2f6808', 19, '2025-01-26 06:20:45', '2025-01-26 06:20:45'),
(16, 'کرمی', '#d1c46b', 20, '2025-01-26 06:21:45', '2025-01-26 06:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(8, '1737883943.jpg', 13, '2025-01-26 06:02:24', '2025-01-26 06:02:24'),
(11, '1737884439.jpg', 5, '2025-01-26 06:10:39', '2025-01-26 06:10:39'),
(12, '1737884647.jpg', 5, '2025-01-26 06:14:08', '2025-01-26 06:14:08'),
(13, '1737887965.jpg', 13, '2025-01-26 07:09:27', '2025-01-26 07:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` text NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `size`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 'کوچک', 13, '2025-01-26 06:07:58', '2025-01-26 06:07:58'),
(4, 'متوسط', 13, '2025-01-26 06:08:09', '2025-01-26 06:08:09'),
(5, 'بزرگ', 13, '2025-01-26 06:08:21', '2025-01-26 06:08:21'),
(7, 'فری سایز', 5, '2025-01-26 06:14:55', '2025-01-26 06:14:55'),
(8, 'فری سایز', 17, '2025-01-26 06:15:54', '2025-01-26 06:15:54'),
(9, 'فری سایز', 19, '2025-01-26 06:19:19', '2025-01-26 06:19:19'),
(10, 'فری سایز', 20, '2025-01-26 06:21:18', '2025-01-26 06:21:18'),
(11, '36', 18, '2025-01-26 06:22:15', '2025-01-26 06:22:15'),
(12, '38', 18, '2025-01-26 06:22:26', '2025-01-26 06:22:26'),
(13, '37', 18, '2025-01-26 06:22:37', '2025-01-26 06:22:37'),
(14, '40', 18, '2025-01-26 06:22:49', '2025-01-26 06:22:49'),
(15, '36', 14, '2025-01-26 06:23:09', '2025-01-26 06:23:09'),
(16, '38', 14, '2025-01-26 06:23:21', '2025-01-26 06:23:21'),
(17, '39', 14, '2025-01-26 06:23:33', '2025-01-26 06:23:33'),
(18, '40', 14, '2025-01-26 06:23:44', '2025-01-26 06:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `color` text NOT NULL,
  `url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `body`, `color`, `url`, `created_at`, `updated_at`) VALUES
(2, '1737733711.webp', 'لباس های مناسب فصل', 'لباس مناسب / قیمت مناسب', '#000000', 'http://127.0.0.1:8000/Admin/Slider/Create', '2025-01-24 12:18:31', '2025-01-24 12:18:31'),
(4, '1737733784.webp', 'اکسسوری', 'چون جزییات مهم است', '#000000', 'http://127.0.0.1:8000/Admin/Slider/Create', '2025-01-24 12:19:45', '2025-01-24 12:19:45'),
(5, '1737735953.jpg', 'کفش', 'کفش خوب ضامن سلامتی', '#000000', 'http://127.0.0.1:8000/Admin/Slider/Create', '2025-01-24 12:55:54', '2025-01-24 12:55:54'),
(7, '1737736372.webp', 'کلاه', 'کلاه خوب بخر که یه وقت سرت کلاه نره', '#000000', 'http://127.0.0.1:8000/Admin/Slider/Create', '2025-01-24 13:02:52', '2025-01-24 13:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `text_baners`
--

CREATE TABLE `text_baners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `banner` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `text_baners`
--

INSERT INTO `text_baners` (`id`, `title`, `banner`, `created_at`, `updated_at`) VALUES
(2, 'تخفیف های جدید', 'فصل جدید / تخفیات جدید', '2025-01-25 11:51:10', '2025-01-25 11:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'فاطمه نوری', 'faezehhhnoori83@gmail', '1234', 0, '2025-01-26 09:17:54', '2025-01-26 09:17:54'),
(2, 'سارا نوری', 'faezehhhnoori@gmail', '1234', 0, '2025-02-02 06:47:56', '2025-02-02 06:47:56'),
(3, 'فایزه نوری', 'faezehhhnoori84@gmail', '12345', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baners`
--
ALTER TABLE `baners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_user_id_foreign` (`user_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_users`
--
ALTER TABLE `discount_users`
  ADD PRIMARY KEY (`discount_id`,`user_id`),
  ADD KEY `discount_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_user_id_foreign` (`user_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_baners`
--
ALTER TABLE `text_baners`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `baners`
--
ALTER TABLE `baners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `text_baners`
--
ALTER TABLE `text_baners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `discount_users`
--
ALTER TABLE `discount_users`
  ADD CONSTRAINT `discount_users_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `discount_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
