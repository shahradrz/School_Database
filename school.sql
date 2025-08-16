-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2025 at 08:50 PM
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
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `cid` int(11) NOT NULL,
  `cname` varchar(15) NOT NULL,
  `ctype` varchar(15) NOT NULL,
  `cSession` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`cid`, `cname`, `ctype`, `cSession`) VALUES
(1001, 'Farsi', 'teyouri', '5'),
(1002, 'Math', 'T', '10'),
(1003, 'Sport', 'Action', '5'),
(1004, 'Arabi', 'T', '10');

-- --------------------------------------------------------

--
-- Table structure for table `student-course`
--

CREATE TABLE `student-course` (
  `studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `mark` tinyint(4) NOT NULL,
  `year` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student-course`
--

INSERT INTO `student-course` (`studentid`, `courseid`, `mark`, `year`) VALUES
(8001, 1004, 20, 1990),
(8003, 1002, 18, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `stdid` int(11) NOT NULL,
  `stdname` varchar(15) NOT NULL,
  `stdfamily` varchar(15) NOT NULL,
  `stdtell` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`stdid`, `stdname`, `stdfamily`, `stdtell`) VALUES
(8001, 'ali', 'alavi', '91333565'),
(8002, 'taghi', 'taghavi', '0912123165'),
(8003, 'naghi', 'naghavi', '91333565'),
(8004, 'reza', 'razavi', '0912123165');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `student-course`
--
ALTER TABLE `student-course`
  ADD KEY `sc` (`studentid`),
  ADD KEY `student-course_ibfk_1` (`courseid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`stdid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `stdid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8005;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student-course`
--
ALTER TABLE `student-course`
  ADD CONSTRAINT `sc` FOREIGN KEY (`studentid`) REFERENCES `students` (`stdid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student-course_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `courses` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
