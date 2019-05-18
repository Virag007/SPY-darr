-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2019 at 05:58 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spydarr`
--
CREATE DATABASE IF NOT EXISTS `spydarr` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `spydarr`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` text NOT NULL,
  `lname` text NOT NULL,
  `fname` text NOT NULL,
  `email` text NOT NULL,
  `pass` text NOT NULL,
  `phone` text NOT NULL,
  `location` text NOT NULL,
  `pincode` text NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `uname`, `lname`, `fname`, `email`, `pass`, `phone`, `location`, `pincode`) VALUES
(1, 'virag007', 'Virag', 'Kumar', 'spy-darr_admin@example.com', 'parag9471', '8210256284', 'Aamtala Sukanta Pally, Near Saraitikar More, Golapbag, Burdwan', '713104');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `mmid` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` text NOT NULL,
  `to_user` text NOT NULL,
  `message` text NOT NULL,
  `status` text,
  `reward` text,
  PRIMARY KEY (`mmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`mmid`, `from_user`, `to_user`, `message`, `status`, `reward`) VALUES
(1, 'parag007', 'virag007', 'Hi Admin, There is a major flaw in your homepage while loading.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ministry`
--

CREATE TABLE IF NOT EXISTS `ministry` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` text NOT NULL,
  `email` text NOT NULL,
  `pass` text NOT NULL,
  `phone` text NOT NULL,
  `location` text NOT NULL,
  `pincode` text NOT NULL,
  `dept` text NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ministry`
--

INSERT INTO `ministry` (`mid`, `uname`, `email`, `pass`, `phone`, `location`, `pincode`, `dept`) VALUES
(1, 'ministry007', 'spy-darr_ministry@example.com', 'parag9471', '9437564800', 'Income Tax More, Bailey Road, R-Block, Patna', '800001', 'Income Tax');

-- --------------------------------------------------------

--
-- Table structure for table `police`
--

CREATE TABLE IF NOT EXISTS `police` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` text NOT NULL,
  `email` text NOT NULL,
  `pass` text NOT NULL,
  `phone` text NOT NULL,
  `location` text NOT NULL,
  `pincode` text NOT NULL,
  `dept` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `police`
--

INSERT INTO `police` (`pid`, `uname`, `email`, `pass`, `phone`, `location`, `pincode`, `dept`) VALUES
(1, 'police007', 'spy-darr_police@example.com', 'parag9471', '7070522658', 'E-block 5, Near Reagent, Gandhi Maidan, Patna', '800014', 'Gandhi Maidan Police Station');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `status` text NOT NULL,
  `uname` text NOT NULL,
  `email` text NOT NULL,
  `pass` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`sid`, `status`, `uname`, `email`, `pass`) VALUES
(1, 'admin', 'virag007', 'spy-darr_admin@example.com', 'parag9471'),
(2, 'ministry', 'ministry007', 'spy-darr_ministry@example.com', 'parag9471'),
(3, 'user', 'parag007', 'spy-darr_user@example.com', 'parag9471'),
(4, 'police', 'police007', 'spy-darr_police@example.com', 'parag9471');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` text NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `email` text NOT NULL,
  `pass` text NOT NULL,
  `phone` text NOT NULL,
  `location` text NOT NULL,
  `pincode` text NOT NULL,
  `bitcoin` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `fname`, `lname`, `email`, `pass`, `phone`, `location`, `pincode`, `bitcoin`) VALUES
(1, 'parag007', 'Parag', 'Thakur', 'spy-darr_user@example.com', 'parag9471', '8804520688', 'N.N Colony, South to P.Nagar, P.Sharif, Patna', '801505', '3LDvhXJKECRBYWP68XwW5kQcG5T7oiv8jm');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
