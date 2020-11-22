-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 12, 2019 at 12:51 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE IF NOT EXISTS `chat_message` (
  `chat_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`chat_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 2, 1, 'hello spider', '2019-09-20 18:00:28', 2),
(2, 2, 1, 'whats up peter', '2019-09-20 18:02:00', 2),
(3, 1, 2, 'nothing', '2019-09-20 18:02:20', 0),
(4, 2, 1, 'why so', '2019-09-20 18:03:12', 0),
(5, 1, 2, 'sedrftgyhujik', '2019-09-21 12:11:34', 0),
(6, 1, 5, 'ji john', '2019-09-22 07:27:08', 0),
(7, 5, 1, 'ok bye', '2019-09-22 07:27:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `key2` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`, `key2`) VALUES
(1, 'johnsmith', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396', ''),
(2, 'peterParker', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396', ''),
(3, 'davidMoore', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396', ''),
(5, 'agarwalkeshav26', '$2y$10$1iKwIC94S.U64A1wkXYXDuSU88b84oCfMZwQwMOab83CzAtEjfvhm', 'samarsimhareddykeshavsum');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
CREATE TABLE IF NOT EXISTS `login_details` (
  `login_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_type` enum('no','yes') NOT NULL,
  PRIMARY KEY (`login_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 1, '2019-09-20 18:00:28', 'no'),
(2, 2, '2019-09-20 18:18:28', 'no'),
(3, 1, '2019-09-20 18:18:26', 'no'),
(4, 1, '2019-09-21 12:11:08', 'no'),
(5, 2, '2019-09-21 12:11:42', 'no'),
(6, 1, '2019-09-21 13:16:07', 'no'),
(7, 5, '2019-09-22 07:25:55', 'no'),
(8, 1, '2019-09-22 07:51:16', 'no'),
(9, 5, '2019-09-22 08:14:13', 'no'),
(10, 1, '2019-09-22 08:22:20', 'no'),
(11, 1, '2019-10-11 08:47:12', 'no'),
(12, 1, '2019-10-12 06:51:04', 'no'),
(13, 1, '2019-10-12 06:52:06', 'no'),
(14, 5, '2019-10-12 07:10:36', 'no'),
(15, 5, '2019-10-12 08:27:50', 'no');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
