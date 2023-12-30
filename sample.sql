-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2023 at 06:44 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `facultydetails`
--
create Database sample;
use sample;
CREATE TABLE `facultydetails` (
  `empcode` varchar(25) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `departmentid` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `teaching` varchar(20) NOT NULL DEFAULT '0',
  `mobile` varchar(25) NOT NULL,
  `address` varchar(25) NOT NULL,
  `mailid` varchar(25) NOT NULL,
  `age` int(11) NOT NULL,
  `experience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facultydetails`
--

INSERT INTO `facultydetails` (`empcode`, `name`, `departmentid`, `status`, `teaching`, `mobile`, `address`, `mailid`, `age`, `experience`) VALUES
('02207', 'Dr.Baiju Krishnan', 2, 1, 'teaching', '9014280561', 'guntur', 'vig@gmai.com', 25, 14),
('30330', 'Nanda', 35, 0, 'non teaching', '9014280525', 'vadlamudi', 'vadn@gmail.com', 25, 2),
('30537', 'Gullapalli Sai Eswar', 2, 1, 'nonteaching', '9014280562', 'vadlamudi', 'sia@gmail.com', 32, 12),
('30538', 'N Uday', 42, 0, 'non teaching', '9014280575', 'tenali', 'g@gmail.com', 21, 1),
('30539', 'E Sri Hari', 19, 0, 'teaching', '9014280555', 'vadlamudi', 'mail@gmail.com', 23, 1),
('30540', 'K Nandalal', 40, 1, 'non teaching', '9014280444', 'guntur', 'nanda@gmail.com', 52, 25),
('30541', 'K Kittu', 31, 2, 'teaching', '9014280124', 'vijayawada', 'vij@gmail.com', 25, 3),
('30543', 'D Vinay', 11, 5, 'teaching', '9014280568', 'vadlamudi', 'vad@gmail.com', 24, 2),
('30544', 'Tej Pavan', 50, 2, 'teaching', '9014280560', 'tenali', 'ten@gmail.com', 30, 8),
('30550', 'G Sai', 39, 1, 'teaching', '9014280565', 'ponnour', 'eswar@gmail.com', 45, 13),
('306', 'Dr.Allamaneni Sharada', 2, 1, 'teaching', '9014280568', 'tenali', 'one@gmail.com', 29, 5),
('52142', 'Eswar', 39, 0, 'teaching', '9014280535', 'bapatla', 'bap@gmail.com', 23, 0),
('56124', 'Chand', 20, 3, 'non teaching', '9014280575', 'vijayawada', 'ma@gmail.com', 32, 4),
('servicerequest', 'sri hari', 30, 1, 'nonteaching', '9014280565', 'tenali', 'two@gmail.com', 25, 3);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('vignan', 'vignan123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facultydetails`
--
ALTER TABLE `facultydetails`
  ADD PRIMARY KEY (`empcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
