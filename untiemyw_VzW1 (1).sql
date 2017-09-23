-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Sep 23, 2017 at 09:32 AM
-- Server version: 5.6.36-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `untiemyw_VzW1`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkedin`
--

CREATE TABLE IF NOT EXISTS `checkedin` (
  `checkin_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `checkin_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `checkin` varchar(255) NOT NULL DEFAULT 'CHECKED IN',
  `meet_id` int(11) NOT NULL,
  PRIMARY KEY (`checkin_id`),
  KEY `emp_id` (`emp_id`),
  KEY `meet_id` (`meet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `checkedin`
--

INSERT INTO `checkedin` (`checkin_id`, `emp_id`, `checkin_date`, `checkin`, `meet_id`) VALUES
(6, 190236887, '2017-09-23 14:11:24', 'CHECKED IN', 2),
(5, 190236877, '2017-09-23 14:08:46', 'CHECKED IN', 2);

-- --------------------------------------------------------

--
-- Table structure for table `checkedout`
--

CREATE TABLE IF NOT EXISTS `checkedout` (
  `checkout_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `checkout_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `checkout` varchar(255) NOT NULL DEFAULT 'CHECKED OUT',
  `meet_id` int(11) NOT NULL,
  PRIMARY KEY (`checkout_id`),
  KEY `emp_id` (`emp_id`),
  KEY `meet_id` (`meet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `checkedout`
--

INSERT INTO `checkedout` (`checkout_id`, `emp_id`, `checkout_date`, `checkout`, `meet_id`) VALUES
(5, 190236877, '2017-09-23 14:10:51', 'CHECKED OUT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `datausers`
--

CREATE TABLE IF NOT EXISTS `datausers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` char(64) NOT NULL,
  `salt` char(16) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `datausers`
--

INSERT INTO `datausers` (`id`, `username`, `password`, `salt`, `email`) VALUES
(1, 'jdsanders', '92c43364092b049805c3bd90c463e94e491a1b2b7467fab0096a9e4e4280d018', '747bef6d779946d3', 'jdsanders@hpaspartanburg.com'),
(2, 'ptopresident', '6c1ef4112e4bb72f2f2a1ceb09bd8bf76c5f21c51fb11844ce5f67c696a4c855', '799fdae36d13beec', 'ptopresident@hpaspartanburg.com'),
(3, 'ksmason', '36de4871a96df4737636df7892b923fc5815a27076d1eca915b81f7e5718b69c', '372de4f5b047c54', 'ksmason@hpaspartanburg.com'),
(4, 'keithmo', 'cf108f1d8c3d7301f89b1d0adb2c036129711b4dd10eb61612a3f2ee3a009bed', '43aed41d70fda06', 'keithmo@canofworms.com'),
(5, 'dchampion', '717aa6145651a3e17b73f72bfb2e1119db58c09219933f6a6ef85f2feccac823', '2f29a513111642a1', 'dpchampion1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `emp_picture` varchar(255) NOT NULL,
  `emp_email` varchar(32) NOT NULL,
  `emp_idcard` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `first_name`, `last_name`, `emp_picture`, `emp_email`, `emp_idcard`) VALUES
(190236877, 'Jennifer', 'Allison', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jallison@hpaspart.org', 190236877),
(190236887, 'C.', 'Amick', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'bamick@hpaspart.org', 190236887),
(2147483647, 'Darrell', 'Weathers', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'dweathers@hpaspart.org', 2147483647),
(190237927, 'Kenneth', 'Ball', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kball@hpaspart.org', 190237927),
(190237928, 'Patrick', 'Barnette', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'pbarnette@hpaspart.org', 190237928),
(190236902, 'T.', 'Bishop', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'rbishop@hpaspart.org', 190236902),
(190236463, 'Heidi', 'Boyd', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'hboyd@hpaspart.org', 190236463),
(190238051, 'Caroline', 'Broadway', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cbroadway@hpaspart.org', 190238051),
(190236898, 'Melissa', 'Brown', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mbrown@hpaspart.org', 190236898),
(190237895, 'Kelley', 'Campbell', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kcampbell@hpaspart.org', 190237895),
(190236893, 'A.', 'Cargill', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mcargill@hpaspart.org', 190236893),
(190237200, 'M.', 'Carroll', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'rcarroll@hpaspart.org', 190237200),
(190236882, 'April', 'Clayton', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'aclayton@hpaspart.org', 190236882),
(190237562, 'M.', 'Crowe', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'bcrowe@hpaspart.org', 190237562),
(190238053, 'Robyn', 'Davenport', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'rdavenport@hpaspart.org', 190238053),
(190237896, 'Caroline', 'Davis', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cdavis@hpaspart.org', 190237896),
(190237931, 'Tiffany', 'Dean', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'tdean@hpaspart.org', 190237931),
(190237693, 'Dual', 'Enrollment', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'prubenzer@hpaspart.org', 190237693),
(190237531, 'Chelsea', 'Eweje', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ceweje@hpaspart.org', 190237531),
(6035, 'Kelly', 'Farotto', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kfarotto@hpaspart.org', 6035),
(190237932, 'Taylor', 'Fowler', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'tfowler@hpaspart.org', 190237932),
(190237933, 'Caroline', 'Furiate', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cfuriate@hpaspart.org', 190237933),
(190236883, 'Jessica', 'Gault', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jgault@hpaspart.org', 190236883),
(123456, 'Valerie', 'Geen', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'vgeen@hpaspart.org', 123456),
(190237894, 'Candes', 'Gibson', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cgibson@hpaspart.org', 190237894),
(190237037, 'Letha', 'Grandy', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'lgrandy@hpaspart.org', 190237037),
(190236948, 'Andreau', 'Green', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'agreen@hpaspart.org', 190236948),
(190237934, 'Brandy', 'Green', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'bgreen@hpaspart.org', 190237934),
(190236156, 'Tandy', 'Green', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'tgreen@hpaspart.org', 190236156),
(190236960, 'Janet', 'Gubser', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jgubser@hpaspart.org', 190236960),
(190237935, 'Daniel', 'Habermann', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'dhabermann@hpaspart.org', 190237935),
(190236157, 'Amanda', 'Hall', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ahall@hpaspart.org', 190236157),
(190237936, 'Edwin', 'Hall', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ehall@hpaspart.org', 190237936),
(190237937, 'Ericka', 'Hammett', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ehammett@hpaspart.org', 190237937),
(190237893, 'Angela', 'Harris', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'aharris@hpaspart.org', 190237893),
(190236880, 'Hope', 'Harris', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'eharris@hpaspart.org', 190236880),
(190237891, 'Katie', 'Keller', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kkeller@hpaspart.org', 190237891),
(190236884, 'Brandi', 'Huckaby', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'bhuckaby@hpaspart.org', 190236884),
(190237112, 'J.', 'Johnson', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jjohnson@hpaspart.org', 190237112),
(190236879, 'Mary', 'Kimbrell', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mkimbrell@hpaspart.org', 190236879),
(190237062, 'Karissa', 'Krivicich', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kkrivicich@hpaspart.org', 190237062),
(190237889, 'Courtney', 'Leach', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cleach@hpaspart.org', 190237889),
(190237206, 'Chandler', 'Lehman', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'clehman@hpaspart.org', 190237206),
(190237084, 'Lindsey', 'Leonard', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'lleonard@hpaspart.org', 190237084),
(190237938, 'Joline', 'Lewis', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jlewis@hpaspart.org', 190237938),
(190237534, 'Amanda', 'Lowe', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'alowe@hpaspart.org', 190237534),
(190237939, 'Chase', 'McAbee', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cmcabee@hpaspart.org', 190237939),
(190236896, 'George', 'McDaniel', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'gmcdaniel@hpaspart.org', 190236896),
(190237940, 'Shannon', 'McDonald', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'smcdonald@hpaspart.org', 190237940),
(190236881, 'Haley', 'McNamara', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'hmcnamara@hpaspart.org', 190236881),
(190238049, 'Cierra', 'Miller', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cmiller@hpaspart.org', 190238049),
(190236153, 'Jennifer', 'Monroe', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jmonroe@hpaspart.org', 190236153),
(190237892, 'Christine', 'Morales', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cmorales@hpaspart.org', 190237892),
(190237941, 'Hayley', 'Morrison', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'hmorrison@hpaspart.org', 190237941),
(98202, 'Ray', 'Morton', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'rmorton@hpaspart.org', 98202),
(190237831, 'Katie', 'Nestberg', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'knestberg@hpaspart.org', 190237831),
(190237589, 'Donald', 'Nickell', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'tnickell@hpaspart.org', 190237589),
(19801291, 'Kiley', 'Painter', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kpainter@hpaspart.org', 19801291),
(190237897, 'Katie', 'Parris', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kparris@hpaspart.org', 190237897),
(190237537, 'Leah', 'Pettit', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'lpettit@hpaspart.org', 190237537),
(190237944, 'Joel', 'Picher', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jpicher@hpaspart.org', 190237944),
(190236892, 'Molly', 'Plunkett', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mplunkett@hpaspart.org', 190236892),
(190236888, 'Tessa', 'Porter', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'tporter@hpaspart.org', 190236888),
(400039, 'April', 'Purser', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'apurser@hpaspart.org', 400039),
(190237179, 'Katrina', 'Rehm', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'krehm@hpaspart.org', 190237179),
(190237536, 'Terri', 'Reynolds', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'treynolds@hpaspart.org', 190237536),
(190237207, 'Kasey', 'Rice', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'krice@hpaspart.org', 190237207),
(190237945, 'Shamaka', 'Rice', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'srice@hpaspart.org', 190237945),
(190237946, 'Margaret', 'Riedy', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mriedy@hpaspart.org', 190237946),
(190237538, 'Acacia', 'Ritter', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'aritter@hpaspart.org', 190237538),
(190237890, 'Kelsey', 'Robinson', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'krobinson@hpaspart.org', 190237890),
(190237738, 'Jessica', 'Revels', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jrevels@hpaspart.org', 190237738),
(190237733, 'Suzanna', 'Ross', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'sross@hpaspart.org', 190237733),
(190237947, 'Christine', 'Sawyer', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'csawyer@hpaspart.org', 190237947),
(190237948, 'Jeff', 'Sevilla', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jsevilla@hpaspart.org', 190237948),
(190236166, 'Erica', 'Smith', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'esmith@hpaspart.org', 190236166),
(190236886, 'Patricia', 'Smith', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'tsmith@hpaspart.org', 190236886),
(190236155, 'Jason', 'Thornton', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jthornton@hpaspart.org', 190236155),
(190237949, 'Daniel', 'Turner', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'dturner@hpaspart.org', 190237949),
(190237208, 'Marcus', 'Watts', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mwatts@hpaspart.org', 190237208),
(190236904, 'Aubrey', 'Welborn', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'awelborn@hpaspart.org', 190236904),
(190237193, 'Eric', 'Wells', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ewells@hpaspart.org', 190237193),
(190237532, 'Jecoliah', 'Whittaker', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jwhittaker@hpaspart.org', 190237532),
(190237950, 'John', 'Wiebel', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cwiebel@hpaspart.org', 190237950),
(190238057, 'Jeanette', 'Williams', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jwilliams@hpaspart.org', 190238057),
(190236555, 'Katherine', 'Woodard', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kwoodard@hpaspart.org', 190236555),
(190237203, 'Alexandra', 'Zeldenrust', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'azeldenrust@hpaspart.org', 190237203),
(190236866, 'Ada', 'Alimagham', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'finance@hpaspart.org', 190236866),
(190236909, 'Jenna', 'Andrews', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jandrews@hpaspart.org', 190236909),
(999999, 'Watson', 'Armstrong', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'warmstrong@hpaspart.org', 999999),
(190237965, 'Michele', 'Bennett', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'mbennett@bmcchs.org', 190237965),
(190237756, 'Pamela', 'Bolton', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'pbolton@hpaspart.org', 190237756),
(190236910, 'Cassandra', 'Brewton', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cbrewton@hpaspart.org', 190236910),
(190237834, 'Elizabeth', 'Bryans', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ebryans@hpaspart.org', 190237834),
(190236257, 'B.', 'Cohen', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ncohen@hpaspart.org', 190236257),
(190237829, 'Allyson', 'Gilliland', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'agilliland@hpaspart.org', 190237829),
(190237736, 'Krystel', 'Hannon', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'khannon@hpaspart.org', 190237736),
(190237742, 'Stacy', 'Harmon', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'stacy@butterfly-sc.com', 190237742),
(190237321, 'Doris', 'Henderson', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'dhenderson@hpaspart.org', 190237321),
(190237731, 'Ronnie', 'Henderson', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'rhenderson@hpaspart.org', 190237731),
(190236206, 'John', 'Hurley', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jhurley@hpaspart.org', 190236206),
(190237789, 'Curtis', 'Jones', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cjones@hpaspart.org', 190237789),
(190236843, 'Christina', 'Junkins', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cjunkins@hpaspart.org', 190236843),
(190236875, 'Kevin', 'King', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kking@hpaspart.org', 190236875),
(190237563, 'Edward', 'Lancaster', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'glancaster@hpaspart.org', 190237563),
(190237526, 'Kimberly', 'Lilly', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'klilly@hpaspart.org', 190237526),
(190237564, 'Corey', 'Mason', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cmason@hpaspart.org', 190237564),
(190237140, 'Kevin', 'Mason', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kmason@hpaspart.org', 190237140),
(190237798, 'LaSheeba', 'McCollum', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'lmccollum@hpaspart.org', 190237798),
(190236900, 'Kimberly', 'Morais', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'kmorais@hpaspart.org', 190236900),
(190237527, 'Ausundra', 'Norman', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'snorman@hpaspart.org', 190237527),
(190237942, 'Paulette', 'O''Connell', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'poconnell@hpaspart.org', 190237942),
(190237943, 'Christy', 'Papala', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cpapala@hpaspart.org', 190237943),
(190236150, 'Celina', 'Patton', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cpatton@hpaspart.org', 190236150),
(190237159, 'Cindy', 'Pizor', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'cpizor@hpaspart.org', 190237159),
(190237739, 'Brandon', 'Quinn', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'bquinn@hpaspart.org', 190237739),
(6022, 'Patti', 'Rubenzer', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'prubenzer@hpaspart.org', 6022),
(190236163, 'Jordan', 'Ruppe', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jruppe@hpaspart.org', 190236163),
(190236873, 'Joseph', 'Sanders', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jsanders@hpaspart.org', 190236873),
(190237737, 'Janelle', 'Sawyer', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jsawyer@hpaspart.org', 190237737),
(190237735, 'Ashley', 'Shands', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ashands@hpaspart.org', 190237735),
(190237832, 'Nakile', 'Sloan', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'ksloan@hpaspart.org', 190237832),
(190236876, 'Jaci', 'Stalnaker', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'jstalnaker@hpaspart.org', 190236876),
(190236168, 'Ali', 'Strickland', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'astrickland@hpaspart.org', 190236168),
(190237432, 'Beth', 'Thomas', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'bthomas@hpaspart.org', 190237432),
(190236897, 'Brett', 'Tolliver', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'btolliver@hpaspart.org', 190236897),
(190237017, 'Staci', 'Waddell', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'swaddell@hpaspart.org', 190237017),
(190236913, 'Rebecca', 'Wall', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'rwall@hpaspart.org', 190236913),
(190237828, 'Lisa', 'Witzel', 'https://www.aitenterprises.com/verizon/includes/render/assets/img/camerashy.jpg', 'lwitzel@hpaspart.org', 190237828);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`user_id`, `time`) VALUES
(3, '1447127843'),
(3, '1447207279'),
(3, '1455810075');

-- --------------------------------------------------------

--
-- Table structure for table `mainusers`
--

CREATE TABLE IF NOT EXISTS `mainusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` char(64) NOT NULL,
  `salt` char(16) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mainusers`
--

INSERT INTO `mainusers` (`id`, `username`, `password`, `salt`, `email`) VALUES
(1, 'jdsanders', '92c43364092b049805c3bd90c463e94e491a1b2b7467fab0096a9e4e4280d018', '747bef6d779946d3', 'jdsanders@hpaspartanburg.com'),
(3, 'ksmason', '12af7db8aeafa276d3fa18c2dbd9c8a525d537dde82f8372b4c30df1e4d3215e', '3e6432a36d7605c7', 'ksmason@hpaspartanburg.com');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_name`
--

CREATE TABLE IF NOT EXISTS `meeting_name` (
  `meet_date` date NOT NULL,
  `meet_name` varchar(50) NOT NULL,
  `meet_desc` varchar(200) NOT NULL,
  `meet_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`meet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `meeting_name`
--

INSERT INTO `meeting_name` (`meet_date`, `meet_name`, `meet_desc`, `meet_id`) VALUES
('2017-09-21', 'Just A Test', 'Just testing this out to see if I can get it working', 2);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(128) NOT NULL,
  `salt` char(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `email`, `password`, `salt`) VALUES
(3, 'jdsanders', 'jdsanders@hpaspartanburg.com', '413c7e7393dcfb3e704ea887cc33cf4e8cdb79430514076cfeeda95dedd95d477ae64d308cabf435469c1e034dbbc4151e1249ff14d3a528f52ee050e5ee32c6', '9916cc25a8d7ee84b6e2f7716affa848c562be511ca14137ad59be97929877568e77dac3bf77bd1bfc4e41edfc53cb4418186ddd3f61be832a892f98fe6ee703'),
(4, 'knestberg', 'ptopresident@hpaspartanburg.com', '9d529528601bda71c8bb3b441bbf1362ee2d1e45247b9cbf5538d2e894df088b0affb51f6b34468841cdaedc560a6bb8689469ffba1c63f7d76226a7f8df6287', '5b67f5e2df6bc0e1cea223ca0d843b22e39dc447a16c8ce69bd193a986201066a6858d29f4c1796ed13a8fb98ba0903ae0723b77cd0dc9ddba620f6fd4812ba2');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
