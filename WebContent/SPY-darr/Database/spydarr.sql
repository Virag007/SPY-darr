-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2019 at 02:39 PM
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
  `fname` text NOT NULL,
  `lname` text NOT NULL,
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

INSERT INTO `admin` (`aid`, `uname`, `fname`, `lname`, `email`, `pass`, `phone`, `location`, `pincode`) VALUES
(1, 'virag007', 'Virag', 'Kumar', 'spy-darr_admin@example.com', 'parag9471', '8210256284', 'Aamtala Sukanta Pally, Near Saraitikar More, Golapbag, Burdwan', '713104');

-- --------------------------------------------------------

--
-- Table structure for table `bug`
--

CREATE TABLE IF NOT EXISTS `bug` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` text NOT NULL,
  `bug` text NOT NULL,
  `view` text NOT NULL,
  `time` text NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bug`
--

INSERT INTO `bug` (`bid`, `uname`, `bug`, `view`, `time`) VALUES
(3, 'parag007', 'Hi Admin, There is a major flaw in your homepage while loading.', 'Unseen', 'Wed May 22 22:56:30 IST 2019'),
(4, 'parag007', 'fsgsfgsfg', 'Unseen', 'Fri May 31 12:55:32 IST 2019'),
(5, 'parag007', 'rgera', 'Unseen', 'Fri May 31 13:07:34 IST 2019'),
(6, 'parag007', 'hdfwkwf', 'Unseen', 'Sat Jun 08 19:49:59 IST 2019');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `mmid` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` text NOT NULL,
  `to_user` text NOT NULL,
  `message` text NOT NULL,
  `location` text,
  `lat` text,
  `long` text,
  `status` text,
  `reward` text,
  `view` text NOT NULL,
  `time` text NOT NULL,
  `support` text NOT NULL,
  PRIMARY KEY (`mmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`mmid`, `from_user`, `to_user`, `message`, `location`, `lat`, `long`, `status`, `reward`, `view`, `time`, `support`) VALUES
(2, 'parag007', 'police007', '[2019-05-06|16:55] (Kidnapping) I am walking on the road and infront of me a kidnapping happened. I think gangsters were involved in this. 4 people kidnapped a child of 8 years.', 'Patna', '25.5744131725252', '85.083954334686', 'Not Accepted', '0', 'Seen', 'Wed May 22 22:56:30 IST 2019', '7'),
(14, 'varag007', 'police007', '[2019-05-06|16:55] (Robbery) I would like to register my complaint against the incidents of robbery in the city. In the last two weeks there have been three cases of robbery in the city. Such instances question the services provided by the concerned authority. Also, they create an atmosphere of chaos and fear in the mind of the people.  at Patna', 'Patna', '25.0960742', '85.31311939999999', 'Not Accepted', '0', 'Unseen', 'Sun May 26 17:50:30 IST 2019', '7'),
(15, 'carag007', 'police007', '[2019-05-01|13:25] (Embezzlement) We, Hemant Kumar Saini & Smt. Lalita Saini R/o Delhi. This is a complaint against Rajasthan based company named M/s Gupteshwar Colonizers Pvt. Ltd., having its Registered Office at Opp. Dautawala Scheme, Panchait Samiti Road, DAUSA-303303 (Rajasthan). Mr. Trilok Chand Sain is Chairman and Mg. Director. at Patna', 'Patna', '25.0960742', '85.31311939999999', 'Not Accepted', '0', 'Unseen', 'Sun May 26 17:51:31 IST 2019', '5'),
(19, 'police007', 'parag007', 'Accepted@[2019-05-06|16:55] (Kidnapping) I am walking on the road and infront of me a kidnapping happened. I think gangsters were involved in this. 4 people kidnapped a child of 8 years.', 'Patna', '0', '0', 'Accepted', '0.0000345', 'Seen', 'Mon May 27 16:51:36 IST 2019', '0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
  `lat` text NOT NULL,
  `long` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `police`
--

INSERT INTO `police` (`pid`, `uname`, `email`, `pass`, `phone`, `location`, `pincode`, `dept`, `lat`, `long`) VALUES
(1, 'police007', 'spy-darr_police@example.com', 'parag9471', '7070522658', 'E-block 5, Near Reagent, Gandhi Maidan, Patna', '800014', 'Gandhi Maidan Police Station', '26.05482', '86.0045789'),
(2, 'null', 'null', '$2a$10$pDccCs3fh5LDpZA4PN8UyepNAQtf2mbamb384wqOtIR/qYMK4c/aW', 'null', 'null', 'null', 'null', 'null', 'null');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`sid`, `status`, `uname`, `email`, `pass`) VALUES
(1, 'admin', 'virag007', 'spy-darr_admin@example.com', 'parag9471'),
(2, 'ministry', 'ministry007', 'spy-darr_ministry@example.com', 'parag9471'),
(3, 'user', 'parag007', 'spy-darr_user@example.com', 'parag9471'),
(4, 'police', 'police007', 'spy-darr_police@example.com', 'parag9471'),
(5, 'police', 'asfadf', 'idealparag.9471@gmail.com', 'dsfag'),
(6, 'user', 'null', 'null', '$2a$10$H7.dbo2Md5HpEgi0ssl9geblFjAOWzMncMnu1NKLOjEKFWzgh46Wm'),
(7, 'user', 'null', 'null', '$2a$10$NjVRL0DdoTXX/hyzmUYHM.30oq3iVBu58QsWXQcfVoNr//cGzDQmu'),
(8, 'police', 'null', 'null', '$2a$10$pDccCs3fh5LDpZA4PN8UyepNAQtf2mbamb384wqOtIR/qYMK4c/aW');

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
  `wallet` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `fname`, `lname`, `email`, `pass`, `phone`, `location`, `pincode`, `bitcoin`, `wallet`) VALUES
(1, 'parag007', 'Parag', 'Thakur', 'spy-darr_user@example.com', 'parag9471', '8804520688', 'N.N Colony, South to P.Nagar, P.Sharif, Patna', '801505', '3LDvhXJKECRBYWP68XwW5kQcG5T7oiv8jm', '0.0000345');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
