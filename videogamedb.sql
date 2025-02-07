-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 09:34 AM
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
-- Database: `videogamedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `arcademachine`
--

CREATE TABLE `arcademachine` (
  `MACHINE_NUMBER` int(11) NOT NULL,
  `GAME` varchar(50) NOT NULL,
  `GAME_YEAR` int(11) NOT NULL,
  `FLOOR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arcademachine`
--

INSERT INTO `arcademachine` (`MACHINE_NUMBER`, `GAME`, `GAME_YEAR`, `FLOOR_ID`) VALUES
(23, 'COC', 2010, 1),
(45, 'SPIDERMAN', 2016, 2),
(1234, 'PUBG', 2004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BOOKING_ID` int(11) NOT NULL,
  `SESSION_NUMBER` int(11) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `BOOKING_DATE` date NOT NULL,
  `MEMBER` char(1) DEFAULT NULL CHECK (`MEMBER` in ('Y','N')),
  `FEE` int(11) DEFAULT NULL,
  `PRE_PAID` char(1) DEFAULT NULL CHECK (`PRE_PAID` in ('Y','N'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BOOKING_ID`, `SESSION_NUMBER`, `CUSTOMER_ID`, `BOOKING_DATE`, `MEMBER`, `FEE`, `PRE_PAID`) VALUES
(1, 1, 1, '2024-07-22', 'Y', NULL, NULL),
(2, 1, 2, '2024-07-22', 'N', 1500, 'N'),
(3, 1, 3, '2024-07-22', 'Y', 1000, 'Y'),
(4, 1, 4, '2024-08-25', 'N', 1500, 'N'),
(5, 2, 4, '2024-07-22', 'Y', 1000, 'N'),
(6, 4, 3, '2024-07-05', 'Y', 1000, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `console`
--

CREATE TABLE `console` (
  `CONSOLE_ID` int(11) NOT NULL,
  `CONSOLE_NAME` varchar(50) NOT NULL,
  `PEGI_RATING` varchar(10) NOT NULL,
  `CONSOLE_QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `console`
--

INSERT INTO `console` (`CONSOLE_ID`, `CONSOLE_NAME`, `PEGI_RATING`, `CONSOLE_QTY`) VALUES
(1, 'XBOX 360', 'PG', 3),
(2, 'PS3', 'PG', 2),
(3, 'PS2', 'PG', 3),
(4, 'Nintendo 64', 'PG', 2),
(5, 'Nintendo Switch', '15', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `SURNAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `MEMBER_TYPE` varchar(20) DEFAULT NULL,
  `JOIN_DATE` date DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `FIRST_NAME`, `SURNAME`, `ADDRESS`, `MEMBER_TYPE`, `JOIN_DATE`, `DATE_OF_BIRTH`) VALUES
(1, 'Saanvi', 'Bhatta', 'Baneshwor, Kathmandu', 'STANDARD', '2024-01-01', '2015-03-01'),
(2, 'Bill', 'Gates', 'Maitidevi, Kathmandu', 'PREMIUM', '2024-07-06', '2001-10-12'),
(3, 'Elon', 'Musk', 'Putalisadak, Kathmandu', 'PREMIUM', '2024-03-28', '2003-07-20'),
(4, 'Kamala', 'Harris', 'Kapan, Kathmandu', 'STANDARD', '2024-01-05', '1973-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `FLOOR_ID` int(11) NOT NULL,
  `FLOOR_NUMBER` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`FLOOR_ID`, `FLOOR_NUMBER`, `PRICE`) VALUES
(1, 1, 1500),
(2, 2, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `MEMBER_TYPE` varchar(20) NOT NULL,
  `MEMBERSHIP_FEE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`MEMBER_TYPE`, `MEMBERSHIP_FEE`) VALUES
('PREMIUM', 20000),
('STANDARD', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `SESSION_NUMBER` int(11) NOT NULL,
  `SESSION_DAY` varchar(20) NOT NULL,
  `START_TIME` time NOT NULL,
  `END_TIME` time NOT NULL,
  `SESSION_TYPE` varchar(20) NOT NULL,
  `FLOOR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`SESSION_NUMBER`, `SESSION_DAY`, `START_TIME`, `END_TIME`, `SESSION_TYPE`, `FLOOR_ID`) VALUES
(1, 'SUNDAY', '09:00:00', '21:00:00', 'FREE', 1),
(2, 'SUNDAY', '09:00:00', '21:00:00', 'FREE', 2),
(3, 'SATURDAY', '09:00:00', '21:00:00', 'FREE', 1),
(4, 'FRIDAY', '18:00:00', '22:00:00', 'SPECIAL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `session_consoles`
--

CREATE TABLE `session_consoles` (
  `SESSION_NUMBER` int(11) NOT NULL,
  `CONSOLE_ID` int(11) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_staff_duty`
--

CREATE TABLE `session_staff_duty` (
  `SESSION_NUMBER` int(11) NOT NULL,
  `STAFF_ID` int(11) NOT NULL,
  `SESSION_ROLE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_staff_duty`
--

INSERT INTO `session_staff_duty` (`SESSION_NUMBER`, `STAFF_ID`, `SESSION_ROLE`) VALUES
(1, 1, 'CAFE'),
(1, 2, 'MAINTENANCE'),
(1, 3, 'COUNTER'),
(2, 4, 'COUNTER'),
(2, 5, 'MAINTENANCE'),
(2, 6, 'CAFE');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `STAFF_ID` int(11) NOT NULL,
  `STAFF_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STAFF_ID`, `STAFF_NAME`) VALUES
(1, 'Sagar Aryal'),
(2, 'Bikesh Khagdi'),
(3, 'Saroj Sapkota'),
(4, 'Jonathan Shrestha'),
(5, 'Rohan Chaudhary'),
(6, 'Rajeev Karmacharya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arcademachine`
--
ALTER TABLE `arcademachine`
  ADD PRIMARY KEY (`MACHINE_NUMBER`),
  ADD KEY `FLOOR_ID` (`FLOOR_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD KEY `SESSION_NUMBER` (`SESSION_NUMBER`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `console`
--
ALTER TABLE `console`
  ADD PRIMARY KEY (`CONSOLE_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`),
  ADD KEY `MEMBER_TYPE` (`MEMBER_TYPE`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`FLOOR_ID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`MEMBER_TYPE`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`SESSION_NUMBER`),
  ADD KEY `FLOOR_ID` (`FLOOR_ID`);

--
-- Indexes for table `session_consoles`
--
ALTER TABLE `session_consoles`
  ADD PRIMARY KEY (`SESSION_NUMBER`,`CONSOLE_ID`),
  ADD KEY `CONSOLE_ID` (`CONSOLE_ID`);

--
-- Indexes for table `session_staff_duty`
--
ALTER TABLE `session_staff_duty`
  ADD PRIMARY KEY (`SESSION_NUMBER`,`STAFF_ID`),
  ADD KEY `STAFF_ID` (`STAFF_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFF_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BOOKING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `console`
--
ALTER TABLE `console`
  MODIFY `CONSOLE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `FLOOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `STAFF_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arcademachine`
--
ALTER TABLE `arcademachine`
  ADD CONSTRAINT `arcademachine_ibfk_1` FOREIGN KEY (`FLOOR_ID`) REFERENCES `floor` (`FLOOR_ID`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`SESSION_NUMBER`) REFERENCES `session` (`SESSION_NUMBER`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`MEMBER_TYPE`) REFERENCES `membership` (`MEMBER_TYPE`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`FLOOR_ID`) REFERENCES `floor` (`FLOOR_ID`);

--
-- Constraints for table `session_consoles`
--
ALTER TABLE `session_consoles`
  ADD CONSTRAINT `session_consoles_ibfk_1` FOREIGN KEY (`SESSION_NUMBER`) REFERENCES `session` (`SESSION_NUMBER`),
  ADD CONSTRAINT `session_consoles_ibfk_2` FOREIGN KEY (`CONSOLE_ID`) REFERENCES `console` (`CONSOLE_ID`);

--
-- Constraints for table `session_staff_duty`
--
ALTER TABLE `session_staff_duty`
  ADD CONSTRAINT `session_staff_duty_ibfk_1` FOREIGN KEY (`SESSION_NUMBER`) REFERENCES `session` (`SESSION_NUMBER`),
  ADD CONSTRAINT `session_staff_duty_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
