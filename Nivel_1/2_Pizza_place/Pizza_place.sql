-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2025 at 11:06 AM
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
-- Database: `1_2_Pizza_place`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id_city`, `name`, `province_id`) VALUES
(1, 'Barcelona', 9),
(2, 'Alicante', 3),
(3, 'Córdoba', 17),
(4, 'Gijón', 5),
(5, 'L\'Hospitalet de Llobregat', 9),
(6, 'Vitoria', 1),
(7, 'Granada', 20),
(8, 'Mérida', 7),
(9, 'Zafra', 7),
(10, 'Burgos', 10),
(11, 'Briviesca', 10);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `name`, `surname`, `address`, `postal_code`, `city_id`, `phone_number`) VALUES
(1, 'Joel', 'Beltran', 'Carrer Torrents, 7, 08105 Sant Fost de Campsentelles, Barcelona', 8905, 5, 612498700),
(2, 'Marcos', 'Lorenzo', 'Travessia Sant Nicasi, 25-5, 08850 Gavà, Barcelona', 8012, 1, 644709120),
(3, 'Jennifer', 'Moliner', 'Venta de Baños, 34200, Palencia', 3004, 2, 754418962),
(4, 'Miguel', 'Chicote', 'Travessia Sant Nicasi, 25-5, 08850 Gavà, Barcelona', 8942, 1, 647998541),
(5, 'Victoria', 'Vegas', 'C. Francisco Sarmiento, 13, 09006 Burgos', 9070, 10, 631147458),
(6, 'Lidia', 'Ortiz', 'Passeig de Vilanova, 52-58, 08870 Sitges, Barcelona', 8870, 1, 935641004);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order`
--

CREATE TABLE `delivery_order` (
  `id_delivery_order` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `delivery_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_order`
--

INSERT INTO `delivery_order` (`id_delivery_order`, `order_id`, `employee_id`, `delivery_date`) VALUES
(1, 8, 3, '2025-04-07 11:03:50'),
(2, 10, 5, '2025-04-07 11:03:50'),
(3, 11, 6, '2025-04-07 11:03:50'),
(4, 12, 5, '2025-04-07 11:03:50'),
(5, 9, 6, '2025-04-07 11:03:50'),
(6, 13, 3, '2025-04-07 11:03:50'),
(7, 14, 3, '2025-04-07 11:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id_employee` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `phone_number` int(15) NOT NULL,
  `position` enum('cook','deliveryman') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id_employee`, `local_id`, `name`, `surname`, `nif`, `phone_number`, `position`) VALUES
(1, 1, 'Carlos', 'Martínez', '41178456W', 633210547, 'cook'),
(2, 1, 'Eulalia', 'García', '54416987L', 644789100, 'cook'),
(3, 4, 'Alejandro', 'Sanchez', '66461000K', 601121447, 'deliveryman'),
(4, 3, 'Judith', 'Ortega', '97456610A', 663254874, 'cook'),
(5, 2, 'Elisabeth', 'Carrasco', '31110245S', 641141007, 'deliveryman'),
(6, 2, 'David', 'Veras', '44890147M', 724889566, 'deliveryman');

-- --------------------------------------------------------

--
-- Table structure for table `food_item`
--

CREATE TABLE `food_item` (
  `id_food_item` int(11) NOT NULL,
  `type` enum('pizza','hamburguer','drink','') NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `photo` varchar(200) NOT NULL COMMENT 'es un varchar porque se añade la ruta de la foto',
  `price` decimal(4,2) NOT NULL,
  `pizza_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_item`
--

INSERT INTO `food_item` (`id_food_item`, `type`, `name`, `description`, `photo`, `price`, `pizza_category_id`) VALUES
(1, 'pizza', '4 cheeses', 'This pizza is topped with a blend of four different types of cheese, such as mozzarella, gorgonzola, parmesan, and provolone. It\'s a great option for cheese lovers', '/home/user/Pictures/photo1.png', 14.99, 1),
(2, 'hamburguer', 'BBQ delight', 'The BBQ Delight burger features a juicy beef patty topped with smoky barbecue sauce, crispy bacon, and tangy coleslaw, all nestled in a toasted brioche bun. This mouthwatering combination offers a perfect blend of sweet, savory, and smoky flavors in every bite.', '/home/user/Pictures/photo2.png', 13.00, NULL),
(3, 'pizza', 'Pepperoni', 'This pizza is topped with pepperoni slices, mozzarella cheese, and tomato sauce. It\'s a popular choice for those who enjoy a bit of spice.', '/home/user/Pictures/photo3.png', 15.65, 5),
(4, 'pizza', 'Hawaiian', 'Topped with ham, pineapple, and mozzarella cheese. The combination of sweet and savory flavors makes it unique.', '/home/user/Pictures/photo4.png', 19.00, 1),
(5, 'drink', 'Water', 'This is your mother. Stop drinking so much soda >:(', '/home/user/Pictures/photo5.png', 17.25, NULL),
(6, 'drink', 'Beer', ':D', '/home/user/Pictures/photo6.png', 14.99, NULL),
(7, 'hamburguer', 'Classic Blue Cheese Burger', 'The Classic Blue Cheese Burger combines a succulent, perfectly grilled beef patty with the bold, tangy flavor of blue cheese. Topped with crisp lettuce, juicy tomato slices, and red onion, all nestled in a toasted sesame seed bun, this burger offers a delightful mix of creamy, crunchy, and savory elements.', '/home/user/Pictures/photo7.png', 16.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `local`
--

CREATE TABLE `local` (
  `id_local` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `postal_code` int(5) UNSIGNED ZEROFILL NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `local`
--

INSERT INTO `local` (`id_local`, `name`, `postal_code`, `city_id`) VALUES
(1, 'Pizza Alicante 1', 03004, 2),
(2, 'Pizza Alicante 2', 03008, 2),
(3, 'Pizzeria Aragó', 08012, 1),
(4, 'Pizza Burgos', 09080, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `delivery_method` enum('delivery','pickup') NOT NULL,
  `total_price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_order`, `client_id`, `local_id`, `date_time`, `delivery_method`, `total_price`) VALUES
(8, 3, 1, '2025-04-01 10:54:21', 'delivery', 19.50),
(9, 3, 1, '2025-04-07 10:54:21', 'pickup', 36.00),
(10, 1, 2, '2025-03-23 10:54:39', 'delivery', 46.00),
(11, 5, 3, '2025-04-06 10:54:39', 'delivery', 36.00),
(12, 5, 3, '2025-04-01 10:54:39', 'delivery', 15.99),
(13, 4, 4, '2025-04-07 10:54:21', 'pickup', 260.00),
(14, 2, 2, '2025-04-06 10:54:39', 'pickup', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id_order_details` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id_order_details`, `order_id`, `food_item_id`, `amount`) VALUES
(1, 8, 5, 2),
(2, 8, 2, 1),
(3, 10, 1, 3),
(4, 11, 1, 4),
(5, 12, 7, 1),
(6, 9, 2, 2),
(7, 9, 6, 3),
(8, 13, 4, 1),
(9, 13, 3, 2),
(10, 14, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pizza_categories`
--

CREATE TABLE `pizza_categories` (
  `id_pizza_category` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza_categories`
--

INSERT INTO `pizza_categories` (`id_pizza_category`, `name`) VALUES
(1, 'New york style pizza'),
(2, 'Greek pizza'),
(3, 'Sicilian pizza'),
(4, 'Margherita pizza'),
(5, 'Roman pizza');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id_province` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id_province`, `name`) VALUES
(1, 'Álava'),
(2, 'Albacete'),
(3, 'Alicante'),
(4, 'Almería'),
(5, 'Asturias'),
(6, 'Ávila'),
(7, 'Badajoz'),
(8, 'Baleares'),
(9, 'Barcelona'),
(10, 'Burgos'),
(11, 'Cáceres'),
(12, 'Cádiz'),
(13, 'Cantabria'),
(14, 'Castellón'),
(15, 'Ceuta'),
(16, 'Ciudad Real'),
(17, 'Córdoba'),
(18, 'Cuenca'),
(19, 'Girona'),
(20, 'Granada'),
(21, 'Guadalajara'),
(22, 'Guipúzcoa'),
(23, 'Huelva'),
(24, 'Huesca'),
(25, 'Jaén'),
(26, 'Las Palmas'),
(27, 'León'),
(28, 'Lleida'),
(29, 'Lugo'),
(30, 'Madrid'),
(31, 'Málaga'),
(32, 'Melilla'),
(33, 'Murcia'),
(34, 'Navarra'),
(35, 'Ourense'),
(36, 'Palencia'),
(37, 'Pontevedra'),
(38, 'La Rioja'),
(39, 'Salamanca'),
(40, 'Santa Cruz de Tenerife'),
(41, 'Segovia'),
(42, 'Sevilla'),
(43, 'Soria'),
(44, 'Tarragona'),
(45, 'Teruel'),
(46, 'Toledo'),
(47, 'Valencia'),
(48, 'Valladolid'),
(49, 'Vizcaya'),
(50, 'Zamora'),
(51, 'Zaragoza');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `delivery_order`
--
ALTER TABLE `delivery_order`
  ADD PRIMARY KEY (`id_delivery_order`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`),
  ADD KEY `local_id` (`local_id`);

--
-- Indexes for table `food_item`
--
ALTER TABLE `food_item`
  ADD PRIMARY KEY (`id_food_item`),
  ADD KEY `pizza_category_id` (`pizza_category_id`);

--
-- Indexes for table `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id_local`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `local_id` (`local_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_order_details`),
  ADD KEY `food_item_id` (`food_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pizza_categories`
--
ALTER TABLE `pizza_categories`
  ADD PRIMARY KEY (`id_pizza_category`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id_province`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_order`
--
ALTER TABLE `delivery_order`
  MODIFY `id_delivery_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food_item`
--
ALTER TABLE `food_item`
  MODIFY `id_food_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `local`
--
ALTER TABLE `local`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_order_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pizza_categories`
--
ALTER TABLE `pizza_categories`
  MODIFY `id_pizza_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id_province` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id_province`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_city`);

--
-- Constraints for table `delivery_order`
--
ALTER TABLE `delivery_order`
  ADD CONSTRAINT `delivery_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`),
  ADD CONSTRAINT `delivery_order_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`local_id`) REFERENCES `local` (`id_local`);

--
-- Constraints for table `food_item`
--
ALTER TABLE `food_item`
  ADD CONSTRAINT `food_item_ibfk_1` FOREIGN KEY (`pizza_category_id`) REFERENCES `pizza_categories` (`id_pizza_category`);

--
-- Constraints for table `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `local_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_city`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`local_id`) REFERENCES `local` (`id_local`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`food_item_id`) REFERENCES `food_item` (`id_food_item`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
