-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2018 at 08:35 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idea`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uname`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `approved` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comp_comm`
--

CREATE TABLE `comp_comm` (
  `com_id` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `uni_id` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comp_event`
--

CREATE TABLE `comp_event` (
  `eid` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `cnum` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `startdate` varchar(100) NOT NULL,
  `starttime` varchar(100) NOT NULL,
  `enddate` varchar(100) NOT NULL,
  `endtime` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `calstart` varchar(100) NOT NULL,
  `calend` varchar(100) NOT NULL,
  `savepath` varchar(1000) DEFAULT NULL,
  `uid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comp_uni_event_comment`
--

CREATE TABLE `comp_uni_event_comment` (
  `com_id` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `uni_id` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `pid` varchar(50) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` text,
  `user_id` varchar(50) NOT NULL,
  `sponsored` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_has_company`
--

CREATE TABLE `projects_has_company` (
  `projects_pid` varchar(50) NOT NULL,
  `company_cid` varchar(50) NOT NULL,
  `money` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cnum` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `approved` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uni_comm`
--

CREATE TABLE `uni_comm` (
  `com_id` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `uni_id` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uni_com_eve_com`
--

CREATE TABLE `uni_com_eve_com` (
  `com_id` varchar(50) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `uni_id` varchar(50) DEFAULT NULL,
  `eid` varchar(50) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uni_event`
--

CREATE TABLE `uni_event` (
  `eid` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `cnum` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `startdate` varchar(100) NOT NULL,
  `starttime` varchar(100) NOT NULL,
  `enddate` varchar(100) NOT NULL,
  `endtime` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `calstart` varchar(100) NOT NULL,
  `calend` varchar(100) NOT NULL,
  `savepath` varchar(1000) DEFAULT NULL,
  `uid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `un` varchar(50) NOT NULL,
  `ps` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_comp_event_comment`
--

CREATE TABLE `user_comp_event_comment` (
  `com_id` varchar(50) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `uni_id` varchar(50) DEFAULT NULL,
  `eid` varchar(50) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_uni_event_comment`
--

CREATE TABLE `user_uni_event_comment` (
  `com_id` varchar(50) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `uni_id` varchar(50) DEFAULT NULL,
  `eid` varchar(50) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uname_UNIQUE` (`uname`);

--
-- Indexes for table `comp_comm`
--
ALTER TABLE `comp_comm`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `comp_event`
--
ALTER TABLE `comp_event`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `comp_uni_event_comment`
--
ALTER TABLE `comp_uni_event_comment`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `fk_projects_user_idx` (`user_id`);

--
-- Indexes for table `projects_has_company`
--
ALTER TABLE `projects_has_company`
  ADD PRIMARY KEY (`projects_pid`,`company_cid`),
  ADD KEY `fk_projects_has_company_company1_idx` (`company_cid`),
  ADD KEY `fk_projects_has_company_projects1_idx` (`projects_pid`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `uname` (`uname`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `uni_comm`
--
ALTER TABLE `uni_comm`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `uni_com_eve_com`
--
ALTER TABLE `uni_com_eve_com`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `uni_event`
--
ALTER TABLE `uni_event`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_comp_event_comment`
--
ALTER TABLE `user_comp_event_comment`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `user_uni_event_comment`
--
ALTER TABLE `user_uni_event_comment`
  ADD PRIMARY KEY (`com_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects_has_company`
--
ALTER TABLE `projects_has_company`
  ADD CONSTRAINT `fk_projects_has_company_company1` FOREIGN KEY (`company_cid`) REFERENCES `company` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_projects_has_company_projects1` FOREIGN KEY (`projects_pid`) REFERENCES `projects` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
