-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2025 at 11:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1_1_Opticians`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id_brand`, `name`, `supplier_id`) VALUES
(1, 'Rayban', 3),
(2, 'Persol', 4),
(3, 'Gucci', 4),
(4, 'Hawkers', 6),
(5, 'Oakley', 7),
(6, 'Tom Ford', 3),
(7, 'Prada', 3),
(8, 'Randolph', 7),
(9, 'Polaroid', 5);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(300) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `referred_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `name`, `address`, `phone_number`, `email`, `registration_date`, `referred_by`) VALUES
(9, 'Lupe Sancho L', 'C/del huerto 10', 600145278, 'lupe@mail.com', '2025-01-17 07:54:56', NULL),
(28, 'Guillem Amorós', 'Carrer Torrents, 7, 08105 Sant Fost de Campsentelles, Barcelona', 600147523, 'guillem@mail.com', '2025-04-04 09:11:52', NULL),
(29, 'Laura Molina', 'Travessia Sant Nicasi, 25-5, 08850 Gavà, Barcelona', 600147523, 'laura@mail.com', '2025-04-04 09:11:52', NULL),
(30, 'Ángeles Serrano', 'Venta de Baños, 34200, Palencia', 665422647, 'angeles@mail.com', '2025-04-04 09:11:52', NULL),
(31, 'Manuela Ruiz', 'Travessia Sant Nicasi, 25-5, 08850 Gavà, Barcelona', 686843402, 'manuela@mail.com', '2025-04-04 09:11:52', 9),
(32, 'Belén Lozano', 'C. Francisco Sarmiento, 13, 09006 Burgos', 620741740, 'belen@mail.com', '2025-04-04 09:11:52', NULL),
(33, 'Ángeles Navarro', 'Passeig de Vilanova, 52-58, 08870 Sitges, Barcelona', 797548912, 'angeles@mail.com', '2025-04-04 06:54:56', NULL),
(34, 'Ricardo Cortés', 'Av. de Joaquin Fernandez Vallejo, 29, 39300 Torrelavega, Cantabria', 666401780, 'ricardo@mail.com', '2025-04-04 09:11:52', NULL),
(35, 'Manuel Gil', 'C. Poeta José Luis Hidalgo, 5, 39300 Torrelavega, Cantabria', 639078363, 'manu@mail.com', '2025-01-06 07:54:56', 9);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id_employee` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id_employee`, `name`, `phone_number`, `email`) VALUES
(112, 'Alejandra Ramos', 936458413, 'ale@mail.com'),
(118, 'Esmeralda Romero', 652144700, 'esme@mail.com'),
(119, 'Rafa Soto', 936441012, 'rafa@mail.com'),
(120, 'Laura García', 954478401, 'laura@mail.com'),
(121, 'Tomas P G', 915521000, 'tomas@mail.com'),
(122, 'Pablo Gómez', 612244756, 'pablo@mail.com'),
(123, 'Remedios Casa', 678994551, 'remedios@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(7) NOT NULL COMMENT 'This is the reference of the product. So it does not have auto increment',
  `brand_id` int(11) NOT NULL,
  `lens_prescription_left` decimal(4,2) NOT NULL,
  `lens_prescription_right` decimal(4,2) NOT NULL,
  `frame_type` varchar(30) NOT NULL,
  `frame_color` varchar(20) NOT NULL,
  `price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `brand_id`, `lens_prescription_left`, `lens_prescription_right`, `frame_type`, `frame_color`, `price`) VALUES
(14578, 1, 0.25, 0.75, 'Aviator', 'Red', 139.99),
(44518, 4, 4.75, 4.50, 'Full frame', 'Camouflage', 189.99),
(114778, 4, 0.25, 0.75, 'Clubmaster', 'Black', 147.00),
(218600, 3, 0.00, 0.00, 'Cat-eye', 'Pink', 245.00),
(220042, 5, 1.25, 1.00, 'Wayfarer', 'Black', 99.00),
(241145, 2, 1.25, 1.25, 'Semi-rimless', 'Grey', 125.00),
(331808, 9, 0.00, 0.25, 'Rimless', 'Multicolor', 148.99),
(417161, 8, 0.00, 0.00, 'Sport', 'Dark blue', 149.00),
(791006, 7, 0.00, 0.00, 'Round', 'Dark green', 247.00),
(1240078, 1, 2.50, 2.50, 'Cat-eye', 'Blue', 225.00);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_sale` int(10) NOT NULL,
  `client_id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(5,2) NOT NULL,
  `employee_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id_sale`, `client_id`, `sale_date`, `price`, `employee_id`) VALUES
(19, 9, '2025-04-04 06:57:41', 389.00, 112),
(20, 9, '2025-04-01 09:12:25', 299.00, 122),
(21, 33, '2025-03-02 10:12:25', 245.50, 123),
(22, 33, '2025-04-03 09:12:53', 299.00, 118),
(23, 35, '2025-02-02 10:12:53', 99.99, 118);

-- --------------------------------------------------------

--
-- Table structure for table `order_glasses`
--

CREATE TABLE `order_glasses` (
  `id_sales_glasses` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `glasses_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_glasses`
--

INSERT INTO `order_glasses` (`id_sales_glasses`, `sale_id`, `glasses_id`, `quantity`) VALUES
(1, 19, 14578, 1),
(2, 19, 1240078, 2),
(3, 20, 218600, 2),
(4, 21, 241145, 1),
(5, 22, 114778, 2),
(6, 23, 44518, 1),
(7, 23, 417161, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(300) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `fax` int(15) NOT NULL,
  `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `name`, `address`, `phone_number`, `fax`, `nif`) VALUES
(3, 'Gafas SA', 'C/ Torrents, 7, 08105 Sant Fost de Campsentelles, Barcelona\n', 936455147, 915815252, 'A08001851'),
(4, 'A la vista', 'C/de la Máquina, 53, 08850, Gavá, Barcelona', 936417888, 123000001, '12345678-L'),
(5, 'Looking Fly', 'C. Grimaldo, 10829 Grimaldo, Cáceres', 779347007, 923023000, '23456789-Ñ'),
(6, 'AMJ sl', 'Travessia Sant Nicasi, 25-5, 08850 Gavà, Barcelona', 600147523, 921123743, '34567890-T'),
(7, 'AWW group', 'C. Francisco Sarmiento, 13, 09006 Burgos', 665422647, 317753742, '45678901-U');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `referred_by` (`referred_by`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_sale`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `price` (`price`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `order_glasses`
--
ALTER TABLE `order_glasses`
  ADD PRIMARY KEY (`id_sales_glasses`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `glasses_id` (`glasses_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `NIF` (`nif`),
  ADD KEY `address_id` (`address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_sale` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_glasses`
--
ALTER TABLE `order_glasses`
  MODIFY `id_sales_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`referred_by`) REFERENCES `clients` (`id_client`);

--
-- Constraints for table `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id_brand`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`);

--
-- Constraints for table `order_glasses`
--
ALTER TABLE `order_glasses`
  ADD CONSTRAINT `order_glasses_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `order` (`id_sale`),
  ADD CONSTRAINT `order_glasses_ibfk_2` FOREIGN KEY (`glasses_id`) REFERENCES `glasses` (`id_glasses`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
