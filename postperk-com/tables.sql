-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2014 at 10:53 PM
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
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `website` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `userlevel` enum('a','b','c','d') NOT NULL DEFAULT 'a',
  `avatar` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `signup` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `notescheck` datetime NOT NULL,
  `activated` enum('0','1') NOT NULL DEFAULT '1',
  `latlon` varchar(255) NOT NULL DEFAULT '52.486242999999995,-1.8904010000000002',
  `identifier` varchar(255) NOT NULL,
  `profileURL` varchar(255) NOT NULL,
  `webSiteURL` varchar(255) NOT NULL,
  `photoURL` varchar(255) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `birthDay` int(11) NOT NULL,
  `birthMonth` int(11) NOT NULL,
  `birthYear` int(11) NOT NULL,
  `emailVerified` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `gender`, `website`, `country`, `userlevel`, `avatar`, `ip`, `signup`, `lastlogin`, `notescheck`, `activated`, `latlon`, `identifier`, `profileURL`, `webSiteURL`, `photoURL`, `displayName`, `description`, `firstName`, `lastName`, `language`, `age`, `birthDay`, `birthMonth`, `birthYear`, `emailVerified`, `phone`, `address`, `zip`, `region`, `city`) VALUES
(14, 'spiderman', 'spiderman', '9f05aa4202e4ce8d6a72511dc735cce9', 'm', '', 'BE', 'a', '988159992.jpg', '127.0.0.1', '2014-05-31 18:49:15', '2014-05-31 19:00:15', '2014-05-31 19:15:00', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(16, 'wonderwoman', 'wonderwoman', '03e5bf83eef4b1d1dbb3c566bdef703f', 'f', '', 'AM', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 18:50:05', '2014-05-31 18:50:05', '2014-05-31 18:50:05', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(17, 'superwoman', 'superwoman', '20538cdb76bba4ea7c7f7cc49270b0e2', 'f', '', 'AU', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 18:50:40', '2014-05-31 18:50:40', '2014-05-31 18:50:40', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(18, 'catwoman', 'catwoman', 'e99d7ed5580193f36a51f597bc2c0210', 'm', '', 'US', 'a', 'avatardefault.jpg', '127.0.0.1', '2014-05-31 18:52:11', '2014-05-31 18:52:11', '2014-05-31 18:52:11', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(19, 'thor', 'thor', '575e22bc356137a41abdef379b776dba', 'm', '', 'US', 'a', '-43417372.jpg', '127.0.0.1', '2014-05-31 18:52:38', '2014-05-31 19:15:46', '2014-05-31 19:43:55', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(20, 'batman', 'batman', 'ec0e2603172c73a8b644bb9456c1ff6e', 'm', '', 'US', 'a', '295598942.jpg', '127.0.0.1', '2014-05-31 19:07:52', '2014-06-01 21:18:24', '2014-05-31 19:45:37', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(21, 'hulk', 'hulk', '76254239879f7ed7d73979f1f7543a7e', 'm', '', 'US', 'a', '200838041.jpg', '127.0.0.1', '2014-05-31 19:11:53', '2014-06-01 06:55:47', '2014-05-31 19:52:54', '1', '52.486242999999995,-1.8904010000000002', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, '0', 0, '0', '0', '0', '0'),
(50, 'IvanIvan27199', 'i.jnr@hotmail.com', '596059d266f32a63144d67628a53db89', 'm', '', 'US', 'a', 'avatardefault.jpg', '', '2014-06-01 21:29:21', '2014-06-01 21:48:59', '2014-06-01 21:29:21', '1', '52.486242999999995,-1.8904010000000002', '100004635097496', 'https://www.facebook.com/ivan.martin.1675275', 'http://example.com', 'https://graph.facebook.com/100004635097496/picture?width=150&height=150', 'Ivan Martin', 'i fight vcrime against all criminals like the joker , iceman and penguin', 'Ivan', 'Martin', '', 0, 1, 3, 1982, 'i.jnr@hotmail.com', 0, '', '', 'Gotham, Nottingham, United Kingdom', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
