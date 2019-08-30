-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2019 at 09:10 AM
-- Server version: 8.0.16
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RideBuddies`
--

-- --------------------------------------------------------

--
-- Table structure for table `CompletedRide`
--

CREATE TABLE `CompletedRide` (
  `Creater` varchar(10) NOT NULL,
  `Requester` varchar(10) NOT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Request`
--

CREATE TABLE `Request` (
  `Status` varchar(10) NOT NULL,
  `Creater` varchar(10) NOT NULL,
  `Requester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Ride`
--

CREATE TABLE `Ride` (
  `startLoc` varchar(500) NOT NULL,
  `endLoc` varchar(500) NOT NULL,
  `vehType` varchar(5) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `startTime` int(2) NOT NULL,
  `endTime` int(2) NOT NULL,
  `people` int(1) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `price` int(8) NOT NULL,
  `startLat` double DEFAULT NULL,
  `startLng` double DEFAULT NULL,
  `endLat` double DEFAULT NULL,
  `endLng` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Ride`
--

INSERT INTO `Ride` (`startLoc`, `endLoc`, `vehType`, `mobile`, `startTime`, `endTime`, `people`, `phone`, `price`, `startLat`, `startLng`, `endLat`, `endLng`) VALUES
('Piplani', 'LNCT', 'bike', '8987045110', 1, 2, 2, '8987045110', 200, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `ReqRat` int(1) DEFAULT '0',
  `RideRat` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`Name`, `Email`, `Phone`, `Password`, `Gender`, `ReqRat`, `RideRat`) VALUES
('Guddu Sharma', 'guddu@gmail.com', '8319395305', 'guddu', 'Male', 3, 5),
('Neha', 'neha@gmail.com', '8651805210', 'neha', 'Female', 3, 0),
('Sanjeet Anand', 'sanjeet@gmail.com', '8987045110', 'sanjeet', 'Male', 0, 0),
('Ashita', 'ashita@gmail.com', '9174733553', 'ashita', 'Female', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ride`
--
ALTER TABLE `Ride`
  ADD PRIMARY KEY (`phone`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Phone`),
  ADD UNIQUE KEY `Phone_UNIQUE` (`Phone`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
