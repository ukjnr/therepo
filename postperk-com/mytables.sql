-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2014 at 02:08 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `blockedusers`
--

CREATE TABLE IF NOT EXISTS `blockedusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blocker` varchar(16) NOT NULL,
  `blockee` varchar(16) NOT NULL,
  `blockdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1` varchar(16) NOT NULL,
  `user2` varchar(16) NOT NULL,
  `datemade` datetime NOT NULL,
  `accepted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user1`, `user2`, `datemade`, `accepted`) VALUES
(10, 'thor', 'spiderman', '2014-05-31 18:59:35', '1'),
(11, 'thor', 'wonderwoman', '2014-05-31 18:59:42', '0'),
(12, 'thor', 'superwoman', '2014-05-31 18:59:48', '0'),
(13, 'thor', 'catwoman', '2014-05-31 18:59:53', '0'),
(14, 'spiderman', 'wonderwoman', '2014-05-31 19:00:30', '0'),
(15, 'spiderman', 'superwoman', '2014-05-31 19:00:37', '0'),
(16, 'batman', 'spiderman', '2014-05-31 19:08:56', '1'),
(17, 'hulk', 'thor', '2014-05-31 19:13:09', '1'),
(18, 'hulk', 'spiderman', '2014-05-31 19:13:23', '1'),
(19, 'batman', 'hulk', '2014-05-31 19:43:32', '1'),
(20, 'batman', 'thor', '2014-05-31 19:43:47', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gmembers`
--

CREATE TABLE IF NOT EXISTS `gmembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) NOT NULL,
  `mname` varchar(16) NOT NULL,
  `approved` enum('0','1') NOT NULL,
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `gmembers`
--

INSERT INTO `gmembers` (`id`, `gname`, `mname`, `approved`, `admin`) VALUES
(5, 'a_bit_of_music', 'thor', '0', '0'),
(6, 'music', 'thor', '1', '1'),
(7, 'music', 'spiderman', '1', '0'),
(8, 'just_a_little_bit', 'batman', '1', '1'),
(9, 'thors_group1', 'thor', '1', '1'),
(10, 'thors_group1', 'hulk', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `grouppost`
--

CREATE TABLE IF NOT EXISTS `grouppost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(16) NOT NULL,
  `gname` varchar(100) NOT NULL,
  `author` varchar(16) NOT NULL,
  `type` enum('0','1') NOT NULL,
  `data` text NOT NULL,
  `pdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `grouppost`
--

INSERT INTO `grouppost` (`id`, `pid`, `gname`, `author`, `type`, `data`, `pdate`) VALUES
(12, '0', 'music', 'thor', '0', 'aaaa', '2014-05-31 19:21:43'),
(13, '12', 'music', 'spiderman', '1', 'aaaaa', '2014-05-31 19:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `creation` datetime NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `invrule` enum('0','1') NOT NULL,
  `creator` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `creation`, `logo`, `invrule`, `creator`) VALUES
(3, 'a_bit_of_music', '2014-05-31 19:18:44', '1084106886.jpg', '0', 'thor'),
(4, 'music', '2014-05-31 19:21:10', '781500581.jpg', '0', 'thor'),
(5, 'just_a_little_bit', '2014-05-31 19:46:58', 'gLogo.jpg', '1', 'batman'),
(6, 'thors_group1', '2014-05-31 19:50:03', '848094130.jpg', '0', 'thor');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `initiator` varchar(16) NOT NULL,
  `app` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `did_read` enum('0','1') NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `username`, `initiator`, `app`, `note`, `did_read`, `date_time`) VALUES
(38, 'thor', 'spiderman', 'Status Post', 'spiderman posted on: <br /><a href="user.php?u=thor#status_40">thor&#39;s Profile</a>', '0', '2014-05-31 19:06:00'),
(39, 'thor', 'spiderman', 'Status Post', 'spiderman posted on: <br /><a href="user.php?u=batman#status_41">batman&#39;s Profile</a>', '0', '2014-05-31 19:09:44'),
(40, 'batman', 'spiderman', 'Status Post', 'spiderman posted on: <br /><a href="user.php?u=batman#status_41">batman&#39;s Profile</a>', '0', '2014-05-31 19:09:44'),
(41, 'thor', 'spiderman', 'Status Post', 'spiderman posted on: <br /><a href="user.php?u=spiderman#status_42">spiderman&#39;s Profile</a>', '0', '2014-05-31 19:15:26'),
(42, 'batman', 'spiderman', 'Status Post', 'spiderman posted on: <br /><a href="user.php?u=spiderman#status_42">spiderman&#39;s Profile</a>', '0', '2014-05-31 19:15:26'),
(43, 'hulk', 'spiderman', 'Status Post', 'spiderman posted on: <br /><a href="user.php?u=spiderman#status_42">spiderman&#39;s Profile</a>', '0', '2014-05-31 19:15:26'),
(44, 'spiderman', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:16:00'),
(45, 'spiderman', 'hulk', 'Status Reply', 'hulk commented here:<br /><a href="user.php?u=hulk#status_42">Click here to view the conversation</a>', '0', '2014-05-31 19:42:30'),
(46, 'spiderman', 'hulk', 'Status Reply', 'hulk commented here:<br /><a href="user.php?u=hulk#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:42:39'),
(47, 'thor', 'hulk', 'Status Reply', 'hulk commented here:<br /><a href="user.php?u=hulk#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:42:39'),
(48, 'spiderman', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_41">Click here to view the conversation</a>', '0', '2014-05-31 19:44:28'),
(49, 'hulk', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:44:48'),
(50, 'spiderman', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:44:48'),
(51, 'hulk', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_42">Click here to view the conversation</a>', '0', '2014-05-31 19:45:48'),
(52, 'spiderman', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_42">Click here to view the conversation</a>', '0', '2014-05-31 19:45:48'),
(53, 'hulk', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:45:54'),
(54, 'spiderman', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:45:54'),
(55, 'thor', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:45:54'),
(56, 'batman', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:49:30'),
(57, 'hulk', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:49:30'),
(58, 'spiderman', 'thor', 'Status Reply', 'thor commented here:<br /><a href="user.php?u=thor#status_40">Click here to view the conversation</a>', '0', '2014-05-31 19:49:31'),
(59, 'hulk', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_42">Click here to view the conversation</a>', '0', '2014-05-31 19:56:37'),
(60, 'spiderman', 'batman', 'Status Reply', 'batman commented here:<br /><a href="user.php?u=batman#status_42">Click here to view the conversation</a>', '0', '2014-05-31 19:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) NOT NULL,
  `gallery` varchar(16) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uploaddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `user`, `gallery`, `filename`, `description`, `uploaddate`) VALUES
(3, 'thor', 'Random', 'SatMay3119580820145307.jpg', NULL, '2014-05-31 18:58:08'),
(4, 'thor', 'Random', 'SatMay3119582420144357.jpg', NULL, '2014-05-31 18:58:24'),
(5, 'thor', 'Random', 'SatMay3119584420148181.jpg', NULL, '2014-05-31 18:58:44'),
(6, 'thor', 'Myself', 'SatMay3119590820147125.jpg', NULL, '2014-05-31 18:59:08'),
(7, 'spiderman', 'Myself', 'SatMay3120042120149322.jpg', NULL, '2014-05-31 19:04:21'),
(8, 'spiderman', 'Myself', 'SatMay3120044020141622.jpg', NULL, '2014-05-31 19:04:40'),
(9, 'batman', 'Random', 'SatMay3120083620146981.jpg', NULL, '2014-05-31 19:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `pm`
--

CREATE TABLE IF NOT EXISTS `pm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` varchar(111) NOT NULL,
  `senttime` datetime NOT NULL,
  `subject` varchar(2555) NOT NULL,
  `message` text NOT NULL,
  `sdelete` enum('0','1') NOT NULL,
  `rdelete` enum('0','1') NOT NULL,
  `parent` varchar(255) NOT NULL,
  `hasreplies` enum('0','1') NOT NULL,
  `rread` enum('0','1') NOT NULL,
  `sread` enum('0','1') NOT NULL,
  `sender` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `pm`
--

INSERT INTO `pm` (`id`, `receiver`, `senttime`, `subject`, `message`, `sdelete`, `rdelete`, `parent`, `hasreplies`, `rread`, `sread`, `sender`) VALUES
(9, 'thor', '2014-05-31 19:05:35', 'just chating', 'hey thor whats goin on', '0', '1', 'x', '0', '1', '0', 'spiderman'),
(10, 'batman', '2014-05-31 19:10:28', 'lets talk', 'whats hapening battyman', '0', '1', 'x', '1', '1', '0', 'spiderman'),
(11, 'x', '2014-05-31 19:45:21', 'x', 'wwww', '0', '0', '10', '0', '0', '0', 'batman'),
(12, 'spiderman', '2014-05-31 19:53:15', 'hey', 'twat', '0', '0', 'x', '0', '0', '0', 'hulk');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osid` int(11) NOT NULL,
  `account_name` varchar(16) NOT NULL,
  `author` varchar(16) NOT NULL,
  `type` enum('a','b','c') NOT NULL,
  `data` text NOT NULL,
  `postdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `osid`, `account_name`, `author`, `type`, `data`, `postdate`) VALUES
(40, 40, 'thor', 'spiderman', 'c', 'thor your a dick', '2014-05-31 19:06:00'),
(41, 41, 'batman', 'spiderman', 'c', 'hey batman i think your a twat', '2014-05-31 19:09:44'),
(42, 42, 'spiderman', 'spiderman', 'a', 'im just chiling cause i got spiders in my pants', '2014-05-31 19:15:26'),
(43, 40, 'thor', 'thor', 'b', 'your twat dude', '2014-05-31 19:16:00'),
(44, 42, 'hulk', 'hulk', 'b', 'dickhead', '2014-05-31 19:42:30'),
(45, 40, 'hulk', 'hulk', 'b', 'thor yo chat shit aswel', '2014-05-31 19:42:39'),
(46, 41, 'thor', 'thor', 'b', 'yolo', '2014-05-31 19:44:28'),
(47, 40, 'thor', 'thor', 'b', 'fuck yo green bogie', '2014-05-31 19:44:48'),
(48, 42, 'batman', 'batman', 'b', 'hahhaa', '2014-05-31 19:45:47'),
(49, 40, 'batman', 'batman', 'b', 'yhyh h', '2014-05-31 19:45:54'),
(50, 40, 'thor', 'thor', 'b', 'get of my page \n', '2014-05-31 19:49:30'),
(51, 42, 'batman', 'batman', 'b', 'ha ho', '2014-05-31 19:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `useroptions`
--

CREATE TABLE IF NOT EXISTS `useroptions` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `background` varchar(255) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `temp_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useroptions`
--

INSERT INTO `useroptions` (`id`, `username`, `background`, `question`, `answer`, `temp_pass`) VALUES
(14, 'spiderman', 'original', NULL, NULL, ''),
(16, 'wonderwoman', 'original', NULL, NULL, ''),
(17, 'superwoman', 'original', NULL, NULL, ''),
(18, 'catwoman', 'original', NULL, NULL, ''),
(19, 'thor', 'original', NULL, NULL, ''),
(20, 'batman', 'original', NULL, NULL, ''),
(21, 'hulk', 'original', NULL, NULL, ''),
(22, 'aaa', 'original', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `userlevel` enum('a','b','c','d') NOT NULL DEFAULT 'a',
  `avatar` varchar(255) DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `signup` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `notescheck` datetime NOT NULL,
  `activated` enum('0','1') NOT NULL DEFAULT '1',
  `latlon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `gender`, `website`, `country`, `userlevel`, `avatar`, `ip`, `signup`, `lastlogin`, `notescheck`, `activated`, `latlon`) VALUES
(14, 'spiderman', 'spiderman', '9f05aa4202e4ce8d6a72511dc735cce9', 'm', NULL, 'BE', 'a', '988159992.jpg', '127.0.0.1', '2014-05-31 18:49:15', '2014-05-31 19:00:15', '2014-05-31 19:15:00', '1', '52.486242999999995,-1.8904010000000002'),
(16, 'wonderwoman', 'wonderwoman', '03e5bf83eef4b1d1dbb3c566bdef703f', 'f', NULL, 'AM', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 18:50:05', '2014-05-31 18:50:05', '2014-05-31 18:50:05', '1', '52.486242999999995,-1.8904010000000002'),
(17, 'superwoman', 'superwoman', '20538cdb76bba4ea7c7f7cc49270b0e2', 'f', NULL, 'AU', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 18:50:40', '2014-05-31 18:50:40', '2014-05-31 18:50:40', '1', '52.486242999999995,-1.8904010000000002'),
(18, 'catwoman', 'catwoman', 'e99d7ed5580193f36a51f597bc2c0210', 'm', NULL, 'US', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 18:52:11', '2014-05-31 18:52:11', '2014-05-31 18:52:11', '1', '52.486242999999995,-1.8904010000000002'),
(19, 'thor', 'thor', '575e22bc356137a41abdef379b776dba', 'm', NULL, 'US', 'a', '-43417372.jpg', '127.0.0.1', '2014-05-31 18:52:38', '2014-05-31 19:15:46', '2014-05-31 19:43:55', '1', '52.486242999999995,-1.8904010000000002'),
(20, 'batman', 'batman', 'ec0e2603172c73a8b644bb9456c1ff6e', 'm', NULL, 'US', 'a', '295598942.jpg', '127.0.0.1', '2014-05-31 19:07:52', '2014-05-31 19:43:25', '2014-05-31 19:45:37', '1', '52.486242999999995,-1.8904010000000002'),
(21, 'hulk', 'hulk', '76254239879f7ed7d73979f1f7543a7e', 'm', NULL, 'US', 'a', '200838041.jpg', '127.0.0.1', '2014-05-31 19:11:53', '2014-05-31 19:42:16', '2014-05-31 19:52:54', '1', '52.486242999999995,-1.8904010000000002'),
(22, 'aaa', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', 'm', NULL, 'CA', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 19:41:49', '2014-05-31 19:41:59', '2014-05-31 19:41:49', '1', '52.486242999999995,-1.8904010000000002');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
