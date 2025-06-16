-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 16 Haz 2025, 20:29:50
-- Sunucu sürümü: 10.5.26-MariaDB
-- PHP Sürümü: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `trimecha`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@trimecha.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '2025-06-15 21:39:38');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'ASUS'),
(2, 'MSI'),
(3, 'Gigabyte'),
(4, 'Intel'),
(5, 'AMD'),
(6, 'Samsung');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(45, 2, 1, 1, '2025-06-16 09:21:07'),
(46, 2, 2, 1, '2025-06-16 09:21:12'),
(50, 1, 1, 1, '2025-06-16 09:57:46'),
(51, 1, 2, 1, '2025-06-16 09:57:50'),
(52, 1, 2, 1, '2025-06-16 17:12:19'),
(53, 1, 2, 1, '2025-06-16 17:12:22'),
(60, 4, 1, 1, '2025-06-16 17:25:53'),
(61, 4, 2, 1, '2025-06-16 17:25:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Anakart'),
(2, 'Ekran Kartı'),
(3, 'İşlemci'),
(4, 'SSD'),
(5, 'Laptop');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `added_at`) VALUES
(1, 1, 1, '2025-06-15 21:47:10'),
(2, 2, 1, '2025-06-15 21:48:21'),
(3, 1, 2, '2025-06-15 22:03:57'),
(4, 2, 2, '2025-06-16 01:11:44'),
(5, 4, 1, '2025-06-16 17:26:43'),
(6, 4, 2, '2025-06-16 17:27:01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `created_at`) VALUES
(1, 1, 7000.00, '2025-06-15 22:04:19'),
(2, 3, 4000.00, '2025-06-15 22:08:30'),
(3, 3, 8500.00, '2025-06-15 22:08:51'),
(4, 3, 12500.00, '2025-06-15 22:10:00'),
(5, 2, 1500.00, '2025-06-15 22:12:55'),
(6, 3, 12500.00, '2025-06-15 22:13:02'),
(7, 2, 3000.00, '2025-06-15 22:13:04'),
(8, 3, 4000.00, '2025-06-15 22:13:24'),
(9, 3, 2500.00, '2025-06-15 22:14:26'),
(10, 2, 24000.00, '2025-06-16 01:12:17'),
(11, 1, 9500.00, '2025-06-16 01:47:34'),
(12, 4, 11500.00, '2025-06-16 17:25:32');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 5, 1, 1, 1500.00),
(2, 6, 1, 1, 1500.00),
(3, 6, 2, 1, 2500.00),
(4, 6, 1, 1, 1500.00),
(5, 6, 1, 1, 1500.00),
(6, 6, 1, 1, 1500.00),
(7, 6, 1, 1, 1500.00),
(8, 6, 2, 1, 2500.00),
(9, 7, 1, 1, 1500.00),
(10, 7, 1, 1, 1500.00),
(11, 8, 1, 1, 1500.00),
(12, 8, 2, 1, 2500.00),
(13, 9, 2, 1, 2500.00),
(14, 10, 1, 6, 1500.00),
(15, 10, 2, 6, 2500.00),
(16, 11, 1, 1, 1500.00),
(17, 11, 1, 1, 1500.00),
(18, 11, 1, 1, 1500.00),
(19, 11, 2, 2, 2500.00),
(20, 12, 1, 2, 1500.00),
(21, 12, 1, 2, 1500.00),
(22, 12, 1, 2, 1500.00),
(23, 12, 2, 1, 2500.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `brand_id`, `image`) VALUES
(1, 'ASUS Anakart B450', 'Ryzen uyumlu performans anakartı', 1500.00, 1, 1, 'images/asus_b450.jpg'),
(2, 'MSI GTX 1660', 'Orta seviye oyun ekran kartı', 2500.00, 2, 2, 'images/msi_gtx1660.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`) VALUES
(1, 'Laptop Tamiri', 'Donanımsal ve yazılımsal tamir hizmeti', 500.00),
(2, 'Termal Macun Değişimi', 'Isı iletimini artırmak için termal macun değişimi', 150.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'hakan', 'aybey.hakan16@gmail.com', '$2y$10$fpY5yX/IziVSir61IejLee9l7cDwFGgz7L7458eO0Njm/MZfSrTE2', '2025-06-15 21:46:52'),
(2, 'admin', 'mete.mete.1m@icloud.com', '$2y$10$B9XPcyZg5UTZiEAQs/X72OW7Ihzw954mt0tK/2sUPhnRy6djpoWPy', '2025-06-15 21:48:07'),
(3, 'testhesabi', 'testhesabi@gmail.com', '$2y$10$53Hy.iYslkUbQPN8azr2LOXsYtyoYJ3Gi3L5tF77vsTDCWai7Qen6', '2025-06-15 22:06:36'),
(4, 'trimecha test', 'trimecha@gmail.com', '$2y$10$TYXwwjt4fnzRINppuyV/bOgYCbhKJ.Xmtc7kCOfxrYyQp960yYUqC', '2025-06-16 17:17:40'),
(5, 'test hesabı 16', 'testt@gmail.com', '$2y$10$FZpCjotUHiurNzfJrJWsMu.fFaW1vpmdT06QhnYmoSFxQig1bG9b2', '2025-06-16 17:20:51');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Tablo kısıtlamaları `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Tablo kısıtlamaları `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
