-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 04:59 PM
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
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`, `categoryId`) VALUES
(1, 'fki@admin', '54f1cc775f3627a6bf86838c5177ce71', '2025-01-04 08:14:26', 1),
(2, 'fkj@admin', 'd2e4ec77e3e36caf02db403f9f7f0688', '', 2),
(3, 'fsmp@admin', '8581eb28c5e0d1eb63c279745378c266', '', 3),
(4, 'fssk@admin', '6c2d1299ac0a6e68608db653a620fddd', '', 4),
(5, 'fpsk@admin', 'c8384ab00e004dd25eee1c9534e26e8d', '', 5),
(6, 'fssa@admin', '1d8266e7d2f769ecf370076699731c3c', '', 6),
(7, 'fpl@admin', 'b306b28ef367e6a4cce2e13bb8e046dd', '', 7),
(8, 'fpt@admin', '6aece5d132ac8c545ee4106639f61205', '', 8),
(9, 'fpep@admin', '36bdd7f46223645067c877638de858d5', '', 9);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'FKI', 'Fakulti Komputeran Dan Informatik', '2023-11-06 19:00:19', '04-01-2025 02:24:46 PM'),
(2, 'FKJ', 'Fakulti Kejuruteraan', '2025-01-04 08:55:15', ''),
(3, 'FSMP', 'Fakulti Sains Makanan Dan Pemakanan', '2025-01-04 08:55:30', ''),
(4, 'FSSK', 'Fakulti Sains Sosial Dan Kemanusiaan', '2025-01-04 08:55:49', ''),
(5, 'FPSK', 'Fakulti Perubatan Dan Sains Kesihatan', '2025-01-04 08:56:15', ''),
(6, 'FSSA', 'Fakulti Sains Dan Sumber Alam', '2025-01-04 08:56:30', ''),
(7, 'FPL', 'Fakulti Pertanian Lestari', '2025-01-04 08:56:41', ''),
(8, 'FPT', 'Fakulti Perhutanan Tropika', '2025-01-04 08:56:54', ''),
(9, 'FPEP', 'Fakulti Perniagaan, Ekonomi Dan Perakaunan', '2025-01-04 08:57:09', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(1, 'Johor', 'Located in the southern part of Peninsular Malaysia.', NOW(), ''),
(2, 'Kedah', 'Known as the "Rice Bowl of Malaysia".', NOW(), ''),
(3, 'Kelantan', 'Famous for its Malay culture and heritage.', NOW(), ''),
(4, 'Melaka', 'A historic state known for its rich colonial history.', NOW(), ''),
(5, 'Negeri Sembilan', 'Famous for Minangkabau culture.', NOW(), ''),
(6, 'Pahang', 'Home to Taman Negara and the highlands of Cameron.', NOW(), ''),
(7, 'Penang', 'Known as the food capital of Malaysia.', NOW(), ''),
(8, 'Perak', 'Famous for its natural caves and colonial heritage.', NOW(), ''),
(9, 'Perlis', 'The smallest state in Malaysia.', NOW(), ''),
(10, 'Sabah', 'Known for Mount Kinabalu and its unique culture.', NOW(), ''),
(11, 'Sarawak', 'Known for its rainforests and indigenous tribes.', NOW(), ''),
(12, 'Selangor', 'The most developed state in Malaysia.', NOW(), ''),
(13, 'Terengganu', 'Famous for its islands and traditional Malay crafts.', NOW(), ''),
(14, 'Kuala Lumpur', 'The capital city of Malaysia.', NOW(), ''),
(15, 'Labuan', 'An offshore financial center.', NOW(), ''),
(16, 'Putrajaya', 'The federal administrative center of Malaysia.', NOW(), '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Software Engineering', NOW(), ''),
(2, 1, 'Data Science', NOW(), ''),
(3, 1, 'Networking', NOW(), ''),

(4, 2, 'Civil Engineering', NOW(), ''),
(5, 2, 'Electrical Engineering', NOW(), ''),
(6, 2, 'Mechanical Engineering', NOW(), ''),

(7, 3, 'Food Science', NOW(), ''),
(8, 3, 'Nutrition', NOW(), ''),
(9, 3, 'Food Technology', NOW(), ''),

(10, 4, 'Anthropology', NOW(), ''),
(11, 4, 'Psychology', NOW(), ''),
(12, 4, 'Sociology', NOW(), ''),

(13, 5, 'Medicine', NOW(), ''),
(14, 5, 'Nursing', NOW(), ''),
(15, 5, 'Pharmacy', NOW(), ''),

(16, 6, 'Biology', NOW(), ''),
(17, 6, 'Environmental Science', NOW(), ''),
(18, 6, 'Geology', NOW(), ''),

(19, 7, 'Agricultural Technology', NOW(), ''),
(20, 7, 'Sustainable Agriculture', NOW(), ''),
(21, 7, 'Crop Science', NOW(), ''),

(22, 8, 'Tropical Forest Ecology', NOW(), ''),
(23, 8, 'Wood Technology', NOW(), ''),
(24, 8, 'Wildlife Management', NOW(), ''),

(25, 9, 'Economics', NOW(), ''),
(26, 9, 'Accounting', NOW(), ''),
(27, 9, 'Business Management', NOW(), '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` varchar(2000) NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
