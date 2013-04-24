-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 10, 2013 at 11:04 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.6-1ubuntu1.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `movie_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_actor`
--

CREATE TABLE IF NOT EXISTS `tbl_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(60) NOT NULL,
  `mname` varchar(60) NOT NULL,
  `lname` varchar(60) NOT NULL,
  `dateofbirth` date NOT NULL,
  `dateofdeath` date NOT NULL,
  `birthcountry` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `birthcountry` (`birthcountry`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `tbl_actor`
--

INSERT INTO `tbl_actor` (`id`, `fname`, `mname`, `lname`, `dateofbirth`, `dateofdeath`, `birthcountry`) VALUES
(1, 'Marlon', '', 'Brando', '1924-04-03', '2007-07-01', 227),
(2, 'Alfredo', 'James', 'Pacino', '1940-04-25', '0000-00-00', 227),
(3, 'James', 'Edmund', 'Caan', '1940-03-26', '0000-00-00', 227),
(4, 'Jean-Louis', '', 'Trintignant', '1930-12-11', '0000-00-00', 74),
(5, 'Stefania', '', 'Sandrelli', '1946-06-05', '0000-00-00', 106),
(6, 'Gastone', '', 'Moschin', '1929-06-08', '0000-00-00', 106),
(7, 'Robert', '', 'De Niro', '1943-08-17', '0000-00-00', 227),
(8, 'Robert', 'Selden', 'Duvall', '1931-01-05', '0000-00-00', 227),
(9, 'Estelle', 'Louise', 'Fletcher', '1934-07-22', '0000-00-00', 227),
(10, 'Jack', '', 'Nicholson', '1937-04-22', '0000-00-00', 227),
(11, 'Martin', '', 'Sheen', '1940-08-03', '0000-00-00', 227),
(12, 'Faye', '', 'Dunaway', '1941-01-14', '0000-00-00', 227),
(13, 'John', 'Marcellus', 'Huston', '1906-08-05', '1987-08-28', 227),
(14, 'Malcolm', '', 'McDowell', '1943-06-13', '0000-00-00', 84),
(15, 'Mark', 'Richard', 'Hamill', '1951-09-25', '0000-00-00', 227),
(16, 'Harrison', '', 'Ford', '1942-07-13', '0000-00-00', 227),
(17, 'Carrie', 'Frances', 'Fisher', '1956-10-21', '0000-00-00', 227),
(18, 'Roy', 'Richard', 'Scheider', '1932-11-10', '2008-02-10', 227),
(19, 'Richard', 'Stephen', 'Dreyfuss', '1947-10-29', '0000-00-00', 227),
(20, 'Robert', 'Archibald', 'Shaw', '1927-08-09', '1978-08-28', 84),
(21, 'Harvey', '', 'Keitel', '1939-05-13', '0000-00-00', 227),
(22, 'Jodie', '', 'Foster', '1962-11-19', '0000-00-00', 227),
(23, 'Christopher', '', 'Walken', '1943-03-31', '0000-00-00', 227),
(24, 'John', 'Holland', 'Cazale', '1935-08-12', '1978-03-12', 227),
(25, 'Jaqueline', '', 'Bisset', '1944-09-13', '0000-00-00', 74),
(26, 'Valentina', '', 'Cortese', '1923-01-01', '0000-00-00', 106),
(27, 'Jean-Pierre', '', 'Aumont', '1911-01-05', '2001-01-30', 74),
(28, 'Erland', '', 'Josephson', '1923-06-15', '2012-02-25', 206),
(29, 'Liv', 'Johanne', 'Ullmann', '1938-12-16', '0000-00-00', 206),
(30, 'Harriet', '', 'Andersson', '1932-02-14', '0000-00-00', 206),
(31, 'Johnny', '', 'Dorelli', '1937-02-20', '0000-00-00', 106),
(32, 'Anna', '', 'Karina', '1940-09-22', '0000-00-00', 59),
(33, 'Lino', '', 'Capolicchio', '1943-08-21', '0000-00-00', 106),
(34, 'Dominique', '', 'Sanda', '1951-03-11', '0000-00-00', 74),
(35, 'Helmut', '', 'Berger', '1944-05-29', '0000-00-00', 15),
(36, 'Fernando', 'Casado', 'Arambillet', '1917-08-20', '1994-03-09', 200),
(37, 'Paul', '', 'Frankeur', '1905-06-29', '1974-10-27', 74),
(38, 'Delphine', 'Claire Beltiane', 'Seyrig', '1932-04-10', '1990-11-15', 119),
(39, 'Monique', '', 'van de Ven', '1952-07-28', '0000-00-00', 151),
(40, 'Rutger', 'Oelsen', 'Hauer', '1944-01-23', '0000-00-00', 151),
(41, 'Alexander', '', 'Kaidanovsky', '1946-07-23', '1995-12-03', 178),
(42, 'Anatoly', '', 'Solonitsyn', '1934-08-30', '1982-06-11', 178),
(43, 'Nikolai', 'Grigoryevich', 'Grinko', '1920-05-22', '1989-04-10', 178),
(44, 'Maxim', 'Monguzhukovich', 'Munzuk', '1912-09-15', '1999-07-28', 178),
(45, 'Yury', 'Mefodievich', 'Solomin', '1935-06-18', '0000-00-00', 178),
(46, 'Bruce', '', 'Lee', '1940-11-27', '1973-07-20', 227),
(47, 'Jim', '', 'Kelly', '1946-05-05', '0000-00-00', 227),
(48, 'John', '', 'Saxon', '1935-08-05', '0000-00-00', 227);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_actormovie`
--

CREATE TABLE IF NOT EXISTS `tbl_actormovie` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`actor_id`),
  KEY `actor_id` (`actor_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_actormovie`
--

INSERT INTO `tbl_actormovie` (`actor_id`, `movie_id`) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(4, 2),
(5, 2),
(6, 2),
(7, 1),
(7, 3),
(7, 9),
(7, 10),
(8, 1),
(8, 3),
(8, 5),
(9, 4),
(10, 4),
(10, 11),
(11, 5),
(12, 11),
(13, 11),
(14, 6),
(15, 7),
(16, 7),
(17, 7),
(18, 8),
(19, 8),
(20, 8),
(21, 9),
(22, 9),
(23, 10),
(24, 1),
(24, 3),
(24, 10),
(25, 12),
(26, 12),
(27, 12),
(28, 13),
(29, 13),
(30, 13),
(31, 14),
(32, 14),
(33, 15),
(34, 15),
(35, 15),
(36, 16),
(37, 16),
(38, 16),
(39, 17),
(40, 17),
(41, 18),
(42, 18),
(43, 18),
(44, 19),
(45, 19),
(46, 20),
(47, 20),
(48, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE IF NOT EXISTS `tbl_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso3` char(3) DEFAULT NULL,
  `name_en` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=242 ;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`id`, `iso3`, `name_en`) VALUES
(1, 'AFG', 'Afghanistan'),
(2, 'ALA', 'Åland Islands'),
(3, 'ALB', 'Albania'),
(4, 'DZA', 'Algeria (El Djazaïr)'),
(5, 'ASM', 'American Samoa'),
(6, 'AND', 'Andorra'),
(7, 'AGO', 'Angola'),
(8, 'AIA', 'Anguilla'),
(9, 'ATA', 'Antarctica'),
(10, 'ATG', 'Antigua and Barbuda'),
(11, 'ARG', 'Argentina'),
(12, 'ARM', 'Armenia'),
(13, 'ABW', 'Aruba'),
(14, 'AUS', 'Australia'),
(15, 'AUT', 'Austria'),
(16, 'AZE', 'Azerbaijan'),
(17, 'BHS', 'Bahamas'),
(18, 'BHR', 'Bahrain'),
(19, 'BGD', 'Bangladesh'),
(20, 'BRB', 'Barbados'),
(21, 'BLR', 'Belarus'),
(22, 'BEL', 'Belgium'),
(23, 'BLZ', 'Belize'),
(24, 'BEN', 'Benin'),
(25, 'BMU', 'Bermuda'),
(26, 'BTN', 'Bhutan'),
(27, 'BOL', 'Bolivia'),
(28, 'BIH', 'Bosnia and Herzegovina'),
(29, 'BWA', 'Botswana'),
(30, 'BVT', 'Bouvet Island'),
(31, 'BRA', 'Brazil'),
(32, 'IOT', 'British Indian Ocean Territory'),
(33, 'BRN', 'Brunei Darussalam'),
(34, 'BGR', 'Bulgaria'),
(35, 'BFA', 'Burkina Faso'),
(36, 'BDI', 'Burundi'),
(37, 'KHM', 'Cambodia'),
(38, 'CMR', 'Cameroon'),
(39, 'CAN', 'Canada'),
(40, 'CPV', 'Cape Verde'),
(41, 'CYM', 'Cayman Islands'),
(42, 'CAF', 'Central African Republic'),
(43, 'TCD', 'Chad (T''Chad)'),
(44, 'CHL', 'Chile'),
(45, 'CHN', 'China'),
(46, 'CXR', 'Christmas Island'),
(47, 'CCK', 'Cocos (Keeling) Islands'),
(48, 'COL', 'Colombia'),
(49, 'COM', 'Comoros'),
(50, 'COG', 'Congo, Republic Of'),
(51, 'COD', 'Congo, The Democratic Republic of the (formerly Zaire)'),
(52, 'COK', 'Cook Islands'),
(53, 'CRI', 'Costa Rica'),
(54, 'CIV', 'CÔte D''Ivoire (Ivory Coast)'),
(55, 'HRV', 'Croatia (hrvatska)'),
(56, 'CUB', 'Cuba'),
(57, 'CYP', 'Cyprus'),
(58, 'CZE', 'Czech Republic'),
(59, 'DNK', 'Denmark'),
(60, 'DJI', 'Djibouti'),
(61, 'DMA', 'Dominica'),
(62, 'DOM', 'Dominican Republic'),
(63, 'ECU', 'Ecuador'),
(64, 'EGY', 'Egypt'),
(65, 'SLV', 'El Salvador'),
(66, 'GNQ', 'Equatorial Guinea'),
(67, 'ERI', 'Eritrea'),
(68, 'EST', 'Estonia'),
(69, 'ETH', 'Ethiopia'),
(70, 'FRO', 'Faeroe Islands'),
(71, 'FLK', 'Falkland Islands (Malvinas)'),
(72, 'FJI', 'Fiji'),
(73, 'FIN', 'Finland'),
(74, 'FRA', 'France'),
(75, 'GUF', 'French Guiana'),
(76, 'PYF', 'French Polynesia'),
(77, 'ATF', 'French Southern Territories'),
(78, 'GAB', 'Gabon'),
(79, 'GMB', 'Gambia, The'),
(80, 'GEO', 'Georgia'),
(81, 'DEU', 'Germany (Deutschland)'),
(82, 'GHA', 'Ghana'),
(83, 'GIB', 'Gibraltar'),
(84, 'GBR', 'Great Britain'),
(85, 'GRC', 'Greece'),
(86, 'GRL', 'Greenland'),
(87, 'GRD', 'Grenada'),
(88, 'GLP', 'Guadeloupe'),
(89, 'GUM', 'Guam'),
(90, 'GTM', 'Guatemala'),
(91, 'GIN', 'Guinea'),
(92, 'GNB', 'Guinea-bissau'),
(93, 'GUY', 'Guyana'),
(94, 'HTI', 'Haiti'),
(95, 'HMD', 'Heard Island and Mcdonald Islands'),
(96, 'HND', 'Honduras'),
(97, 'HKG', 'Hong Kong (Special Administrative Region of China)'),
(98, 'HUN', 'Hungary'),
(99, 'ISL', 'Iceland'),
(100, 'IND', 'India'),
(101, 'IDN', 'Indonesia'),
(102, 'IRN', 'Iran (Islamic Republic of Iran)'),
(103, 'IRQ', 'Iraq'),
(104, 'IRL', 'Ireland'),
(105, 'ISR', 'Israel'),
(106, 'ITA', 'Italy'),
(107, 'JAM', 'Jamaica'),
(108, 'JPN', 'Japan'),
(109, 'JOR', 'Jordan (Hashemite Kingdom of Jordan)'),
(110, 'KAZ', 'Kazakhstan'),
(111, 'KEN', 'Kenya'),
(112, 'KIR', 'Kiribati'),
(113, 'PRK', 'Korea (Democratic Peoples Republic pf [North] Korea)'),
(114, 'KOR', 'Korea (Republic of [South] Korea)'),
(115, 'KWT', 'Kuwait'),
(116, 'KGZ', 'Kyrgyzstan'),
(117, 'LAO', 'Lao People''s Democratic Republic'),
(118, 'LVA', 'Latvia'),
(119, 'LBN', 'Lebanon'),
(120, 'LSO', 'Lesotho'),
(121, 'LBR', 'Liberia'),
(122, 'LBY', 'Libya (Libyan Arab Jamahirya)'),
(123, 'LIE', 'Liechtenstein (Fürstentum Liechtenstein)'),
(124, 'LTU', 'Lithuania'),
(125, 'LUX', 'Luxembourg'),
(126, 'MAC', 'Macao (Special Administrative Region of China)'),
(127, 'MKD', 'Macedonia (Former Yugoslav Republic of Macedonia)'),
(128, 'MDG', 'Madagascar'),
(129, 'MWI', 'Malawi'),
(130, 'MYS', 'Malaysia'),
(131, 'MDV', 'Maldives'),
(132, 'MLI', 'Mali'),
(133, 'MLT', 'Malta'),
(134, 'MHL', 'Marshall Islands'),
(135, 'MTQ', 'Martinique'),
(136, 'MRT', 'Mauritania'),
(137, 'MUS', 'Mauritius'),
(138, 'MYT', 'Mayotte'),
(139, 'MEX', 'Mexico'),
(140, 'FSM', 'Micronesia (Federated States of Micronesia)'),
(141, 'MDA', 'Moldova'),
(142, 'MCO', 'Monaco'),
(143, 'MNG', 'Mongolia'),
(144, 'MSR', 'Montserrat'),
(145, 'MAR', 'Morocco'),
(146, 'MOZ', 'Mozambique (Moçambique)'),
(147, 'MMR', 'Myanmar (formerly Burma)'),
(148, 'NAM', 'Namibia'),
(149, 'NRU', 'Nauru'),
(150, 'NPL', 'Nepal'),
(151, 'NLD', 'Netherlands'),
(152, 'ANT', 'Netherlands Antilles'),
(153, 'NCL', 'New Caledonia'),
(154, 'NZL', 'New Zealand'),
(155, 'NIC', 'Nicaragua'),
(156, 'NER', 'Niger'),
(157, 'NGA', 'Nigeria'),
(158, 'NIU', 'Niue'),
(159, 'NFK', 'Norfolk Island'),
(160, 'MNP', 'Northern Mariana Islands'),
(161, 'NOR', 'Norway'),
(162, 'OMN', 'Oman'),
(163, 'PAK', 'Pakistan'),
(164, 'PLW', 'Palau'),
(165, 'PSE', 'Palestinian Territories'),
(166, 'PAN', 'Panama'),
(167, 'PNG', 'Papua New Guinea'),
(168, 'PRY', 'Paraguay'),
(169, 'PER', 'Peru'),
(170, 'PHL', 'Philippines'),
(171, 'PCN', 'Pitcairn'),
(172, 'POL', 'Poland'),
(173, 'PRT', 'Portugal'),
(174, 'PRI', 'Puerto Rico'),
(175, 'QAT', 'Qatar'),
(176, 'REU', 'RÉunion'),
(177, 'ROU', 'Romania'),
(178, 'RUS', 'Russian Federation'),
(179, 'RWA', 'Rwanda'),
(180, 'SHN', 'Saint Helena'),
(181, 'KNA', 'Saint Kitts and Nevis'),
(182, 'LCA', 'Saint Lucia'),
(183, 'SPM', 'Saint Pierre and Miquelon'),
(184, 'VCT', 'Saint Vincent and the Grenadines'),
(185, 'WSM', 'Samoa (formerly Western Samoa)'),
(186, 'SMR', 'San Marino (Republic of)'),
(187, 'STP', 'Sao Tome and Principe'),
(188, 'SAU', 'Saudi Arabia (Kingdom of Saudi Arabia)'),
(189, 'SEN', 'Senegal'),
(190, 'SCG', 'Serbia and Montenegro (formerly Yugoslavia)'),
(191, 'SYC', 'Seychelles'),
(192, 'SLE', 'Sierra Leone'),
(193, 'SGP', 'Singapore'),
(194, 'SVK', 'Slovakia (Slovak Republic)'),
(195, 'SVN', 'Slovenia'),
(196, 'SLB', 'Solomon Islands'),
(197, 'SOM', 'Somalia'),
(198, 'ZAF', 'South Africa (zuid Afrika)'),
(199, 'SGS', 'South Georgia and the South Sandwich Islands'),
(200, 'ESP', 'Spain (españa)'),
(201, 'LKA', 'Sri Lanka'),
(202, 'SDN', 'Sudan'),
(203, 'SUR', 'Suriname'),
(204, 'SJM', 'Svalbard and Jan Mayen'),
(205, 'SWZ', 'Swaziland'),
(206, 'SWE', 'Sweden'),
(207, 'CHE', 'Switzerland (Confederation of Helvetia)'),
(208, 'SYR', 'Syrian Arab Republic'),
(209, 'TWN', 'Taiwan ("Chinese Taipei" for IOC)'),
(210, 'TJK', 'Tajikistan'),
(211, 'TZA', 'Tanzania'),
(212, 'THA', 'Thailand'),
(213, 'TLS', 'Timor-Leste (formerly East Timor)'),
(214, 'TGO', 'Togo'),
(215, 'TKL', 'Tokelau'),
(216, 'TON', 'Tonga'),
(217, 'TTO', 'Trinidad and Tobago'),
(218, 'TUN', 'Tunisia'),
(219, 'TUR', 'Turkey'),
(220, 'TKM', 'Turkmenistan'),
(221, 'TCA', 'Turks and Caicos Islands'),
(222, 'TUV', 'Tuvalu'),
(223, 'UGA', 'Uganda'),
(224, 'UKR', 'Ukraine'),
(225, 'ARE', 'United Arab Emirates'),
(226, 'GBR', 'United Kingdom (Great Britain)'),
(227, 'USA', 'United States'),
(228, 'UMI', 'United States Minor Outlying Islands'),
(229, 'URY', 'Uruguay'),
(230, 'UZB', 'Uzbekistan'),
(231, 'VUT', 'Vanuatu'),
(232, 'VAT', 'Vatican City (Holy See)'),
(233, 'VEN', 'Venezuela'),
(234, 'VNM', 'Viet Nam'),
(235, 'VGB', 'Virgin Islands, British'),
(236, 'VIR', 'Virgin Islands, U.S.'),
(237, 'WLF', 'Wallis and Futuna'),
(238, 'ESH', 'Western Sahara (formerly Spanish Sahara)'),
(239, 'YEM', 'Yemen (Arab Republic)'),
(240, 'ZMB', 'Zambia'),
(241, 'ZWE', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_director`
--

CREATE TABLE IF NOT EXISTS `tbl_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(60) NOT NULL,
  `mname` varchar(60) NOT NULL,
  `lname` varchar(60) NOT NULL,
  `dateofbirth` date NOT NULL,
  `dateofdeath` date NOT NULL,
  `birthcountry` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `birthcountry` (`birthcountry`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_director`
--

INSERT INTO `tbl_director` (`id`, `fname`, `mname`, `lname`, `dateofbirth`, `dateofdeath`, `birthcountry`) VALUES
(1, 'Francis', 'Ford', 'Coppola', '1939-04-07', '0000-00-00', 227),
(2, 'Bernardo', '', 'Bertolucci', '1940-03-16', '0000-00-00', 106),
(3, 'Miloš', '', 'Forman', '1932-02-08', '0000-00-00', 58),
(4, 'Roman', '', 'Polanski', '1933-08-18', '0000-00-00', 74),
(5, 'Stanley', '', 'Kubrick', '1928-07-26', '1999-03-07', 227),
(6, 'George', '', 'Lucas', '1944-05-14', '0000-00-00', 227),
(7, 'Stephen', 'Allan', 'Spielberg', '1946-12-18', '0000-00-00', 227),
(8, 'Martin', 'Charles', 'Scorcese', '1942-11-17', '0000-00-00', 227),
(9, 'Michael', '', 'Cimino', '1939-02-03', '0000-00-00', 227),
(10, 'François', 'Roland', 'Truffaut', '1932-02-06', '1984-10-21', 74),
(11, 'Ingmar', '', 'Bergman', '1918-07-14', '2007-07-30', 206),
(12, 'Franco', '', 'Brusati', '1922-08-04', '1993-02-28', 106),
(13, 'Vittorio', '', 'De Sica', '1901-07-07', '1974-11-13', 106),
(14, 'Luis', '', ' Buñuel', '1900-02-22', '1983-07-29', 200),
(15, 'Paul', '', 'Verhoeven', '1938-07-18', '0000-00-00', 151),
(16, 'Andrei', '', 'Tarkovsky', '1932-04-04', '1986-12-29', 178),
(17, 'Akira', '', 'Kurosawa', '1910-03-23', '1998-09-06', 108),
(18, 'Robert', '', 'Clouse', '1928-03-06', '1997-02-04', 227);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_directormovie`
--

CREATE TABLE IF NOT EXISTS `tbl_directormovie` (
  `director_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`director_id`),
  KEY `director_id` (`director_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_directormovie`
--

INSERT INTO `tbl_directormovie` (`director_id`, `movie_id`) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 2),
(3, 4),
(4, 11),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 12),
(11, 13),
(12, 14),
(13, 15),
(14, 16),
(15, 17),
(16, 18),
(17, 19),
(18, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

CREATE TABLE IF NOT EXISTS `tbl_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_title` varchar(40) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id` (`genre_id`),
  UNIQUE KEY `genre_title` (`genre_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_title`) VALUES
(1, 'Action'),
(8, 'Adventure'),
(15, 'Animation'),
(21, 'Biography'),
(2, 'Comedy'),
(9, 'Crime'),
(16, 'Documentary'),
(22, 'Drama'),
(3, 'Family'),
(10, 'Fantasy'),
(17, 'Film-Noir'),
(23, 'Game-Show'),
(4, 'History'),
(11, 'Horror'),
(18, 'Music'),
(24, 'Musical'),
(5, 'Mystery'),
(12, 'News'),
(19, 'Reality-TV'),
(25, 'Romance'),
(6, 'Sci-Fi'),
(13, 'Sport'),
(20, 'Talk-Show'),
(26, 'Thriller'),
(7, 'War'),
(14, 'Western');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE IF NOT EXISTS `tbl_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso3` varchar(3) NOT NULL,
  `language_en` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` (`id`, `iso3`, `language_en`) VALUES
(1, 'eng', 'English'),
(2, 'fre', 'French'),
(3, 'ger', 'German'),
(4, 'rus', 'Russian'),
(5, 'chi', 'Chinese'),
(6, 'esp', 'Spanish'),
(7, 'ita', 'Italian'),
(8, 'jpn', 'Japanese'),
(9, 'swe', 'Swedish'),
(10, 'por', 'Portuguese'),
(11, 'vie', 'Vietnamese'),
(12, 'khm', 'Central Khmer'),
(13, 'dut', 'Dutch');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lucolor`
--

CREATE TABLE IF NOT EXISTS `tbl_lucolor` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `color_format` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_lucolor`
--

INSERT INTO `tbl_lucolor` (`id`, `color_format`) VALUES
(1, 'Black And White'),
(2, 'Color/Black And White'),
(3, 'Color');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lusound`
--

CREATE TABLE IF NOT EXISTS `tbl_lusound` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `sound_format` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_lusound`
--

INSERT INTO `tbl_lusound` (`id`, `sound_format`) VALUES
(1, 'Silent'),
(2, 'Spoken');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movie`
--

CREATE TABLE IF NOT EXISTS `tbl_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_en` varchar(150) NOT NULL,
  `title_alt` varchar(150) CHARACTER SET utf16 COLLATE utf16_unicode_ci DEFAULT NULL,
  `year` int(4) unsigned NOT NULL,
  `runtime` int(4) unsigned NOT NULL,
  `plot` varchar(750) DEFAULT NULL,
  `color` tinyint(4) NOT NULL,
  `silent` tinyint(4) NOT NULL,
  `rating_rt` int(4) unsigned DEFAULT NULL,
  `rating_imdb` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `color` (`color`),
  KEY `silent` (`silent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tbl_movie`
--

INSERT INTO `tbl_movie` (`id`, `title_en`, `title_alt`, `year`, `runtime`, `plot`, `color`, `silent`, `rating_rt`, `rating_imdb`) VALUES
(1, 'The Godfather', NULL, 1972, 178, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 3, 2, 100, 9.20),
(2, 'The Conformist', 'Il Conformista', 1970, 111, 'A weak-willed Italian man becomes a fascist flunky who goes abroad to arrange the assassination of his old teacher, now a political dissident.', 3, 2, 100, 8.00),
(3, 'The Godfather Part 2', NULL, 1974, 200, 'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.', 3, 2, 98, 9.10),
(4, 'One Flew Over The Cuckoo''s Nest', NULL, 1975, 133, 'Upon arriving at a mental institution, a brash rebel rallies the patients to take on the oppressive Nurse Ratched, a woman more dictator than nurse.', 3, 2, 96, 8.80),
(5, 'Apocalypse Now', NULL, 1979, 153, 'During the U.S. Vietnam War, Captain Willard is sent on a dangerous mission into Cambodia to assassinate a renegade colonel who has set himself up as a god among a local tribe.', 3, 2, 99, 8.60),
(6, 'A Clockwork Orange', NULL, 1974, 136, 'In future Britain, charismatic delinquent Alex DeLarge is jailed and volunteers for an experimental aversion therapy developed by the government in an effort to solve society''s crime problem... but not all goes to plan.', 3, 2, 89, 8.50),
(7, 'Star Wars - Episode IV - A New Hope', NULL, 1977, 125, 'Luke Skywalker, a spirited farm boy, joins rebel forces to save Princess Leia from the evil Darth Vader, and the galaxy from the Empire''s planet-destroying Death Star.', 3, 2, 93, 8.80),
(8, 'Jaws', NULL, 1975, 124, 'When a gigantic great white shark begins to menace the small island community of Amity, a police chief, a marine scientist and grizzled fisherman set out to stop it.', 3, 2, 100, 8.20),
(9, 'Taxi Driver', NULL, 1976, 113, 'A mentally unstable Vietnam war veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feeds his urge to violently lash out, attempting to save a teenage prostitute in the process.', 3, 2, 98, 8.50),
(10, 'The Deer Hunter', NULL, 1978, 182, 'An in-depth examination of the way that the Vietnam war affects the lives of people in a small industrial town in the USA.', 3, 2, 92, 8.20),
(11, 'Chinatown', NULL, 1974, 130, 'A private detective investigating an adultery case stumbles on to a scheme of murder that has something to do with water.', 3, 2, 98, 8.40),
(12, 'Day For Night', 'La Nuit Américaine', 1973, 115, 'A committed film director struggles to complete his movie while coping with a myriad of crises, personal and professional, among the cast and crew.', 3, 2, 100, 8.00),
(13, 'Cries and Whispers', 'Viskningar och rop', 1972, 91, 'When a woman dying of cancer in turn-of-the century Sweden is visited by her two sisters, long repressed feelings between the siblings rise to the surface.', 3, 2, 89, 8.00),
(14, 'Bread and Chocolate', 'Pane e cioccolata', 1974, 111, 'Italian immigrant tries to become a member of Swiss society but fails as a waiter and even as a chicken plucker. He then becomes involved with shady wealthy character and tries to hide his Italian identity. He refuses to give up no matter how awful his situation.', 3, 2, 72, 7.20),
(15, 'The Garden Of Finzi-Continis', ' Il giardino dei Finzi-Contini', 1971, 94, 'In the late 1930s, in Ferrara, Italy, the Finzi-Contini are one of the leading families, wealthy, aristocratic, urbane; they are also Jewish. Their adult children, Micol and Alberto, gather a circle of friends for constant rounds of tennis and parties at their villa with its lovely grounds, keeping the rest of the world at bay. Into the circle steps Giorgio, a Jew from the middle class who falls in love with Micol. She seems to toy with him, and even makes love to one of his friends while she knows Giorgio is watching. While his love cannot seem to break through to her to draw her out of her garden idyll, the forces of politics close in.', 3, 2, 100, 7.40),
(16, 'The Discreet Charm of the Bourgeoisie ', 'Le charme discret de la bourgeoisie', 1972, 102, 'A surreal, virtually plotless series of dreams centered around six middle-class people and their consistently interrupted attempts to have a meal together.', 3, 2, 98, 7.90),
(17, 'Turkish Delight', 'Turks fruit', 1973, 112, 'Sort of a cross between "Love Story" and an earthy Rembrandt painting, this movie stars Rutger Hauer as a gifted Dutch sculptor who has a stormy, erotic, and star-crossed romance with a beautiful young girl. The story follows the arc of their relationship and his interaction with her family.', 3, 2, 78, 7.10),
(18, 'Stalker', ' Сталкер', 1979, 163, 'A guide leads two men through an area known as the Zone to find a room that grants wishes.', 2, 2, 100, 8.10),
(19, 'Dersu Uzala', ' Дерсу Узала', 1975, 141, 'The Russian army sends an explorer on an expedition to the snowy Siberian wilderness where he makes friends with a seasoned local hunter.', 3, 2, 75, 8.20),
(20, 'Enter The Dragon', NULL, 1973, 98, 'A martial artist agrees to spy on a reclusive crime lord using his invitation to a tournament there as cover.', 3, 2, 95, 7.60);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_moviecountry`
--

CREATE TABLE IF NOT EXISTS `tbl_moviecountry` (
  `movie_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`country_id`),
  KEY `movie_id` (`movie_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_moviecountry`
--

INSERT INTO `tbl_moviecountry` (`movie_id`, `country_id`) VALUES
(1, 106),
(1, 227),
(2, 106),
(3, 106),
(3, 227),
(4, 227);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_moviegenre`
--

CREATE TABLE IF NOT EXISTS `tbl_moviegenre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `movie_id` (`movie_id`),
  KEY `genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_moviegenre`
--

INSERT INTO `tbl_moviegenre` (`movie_id`, `genre_id`) VALUES
(1, 9),
(1, 22),
(2, 22),
(3, 9),
(3, 22),
(4, 22),
(5, 7),
(5, 22),
(6, 6),
(6, 9),
(6, 22),
(7, 1),
(7, 8),
(7, 10),
(8, 8),
(8, 11),
(8, 26),
(9, 9),
(9, 22),
(10, 7),
(10, 22),
(11, 5),
(11, 9),
(11, 22),
(12, 2),
(12, 22),
(12, 25),
(13, 22),
(13, 25),
(14, 2),
(14, 22),
(15, 4),
(15, 7),
(15, 22),
(16, 2),
(16, 10),
(16, 22),
(17, 22),
(17, 25),
(18, 8),
(18, 10),
(18, 22),
(19, 8),
(19, 21),
(19, 22),
(20, 1),
(20, 9),
(20, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movielanguage`
--

CREATE TABLE IF NOT EXISTS `tbl_movielanguage` (
  `movie_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`language_id`),
  KEY `movie_id` (`movie_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_movielanguage`
--

INSERT INTO `tbl_movielanguage` (`movie_id`, `language_id`) VALUES
(1, 1),
(1, 7),
(2, 7),
(3, 1),
(3, 7),
(4, 1),
(5, 1),
(5, 2),
(5, 11),
(5, 12),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 6),
(10, 1),
(10, 2),
(10, 4),
(10, 11),
(11, 1),
(12, 2),
(13, 9),
(14, 7),
(15, 3),
(15, 7),
(16, 2),
(16, 6),
(17, 13),
(18, 4),
(19, 4),
(20, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_actor`
--
ALTER TABLE `tbl_actor`
  ADD CONSTRAINT `tbl_actor_ibfk_1` FOREIGN KEY (`birthcountry`) REFERENCES `tbl_country` (`id`);

--
-- Constraints for table `tbl_actormovie`
--
ALTER TABLE `tbl_actormovie`
  ADD CONSTRAINT `tbl_actormovie_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `tbl_actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_actormovie_ibfk_4` FOREIGN KEY (`movie_id`) REFERENCES `tbl_movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_director`
--
ALTER TABLE `tbl_director`
  ADD CONSTRAINT `tbl_director_ibfk_1` FOREIGN KEY (`birthcountry`) REFERENCES `tbl_country` (`id`);

--
-- Constraints for table `tbl_directormovie`
--
ALTER TABLE `tbl_directormovie`
  ADD CONSTRAINT `tbl_directormovie_ibfk_3` FOREIGN KEY (`director_id`) REFERENCES `tbl_director` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_directormovie_ibfk_4` FOREIGN KEY (`movie_id`) REFERENCES `tbl_movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_movie`
--
ALTER TABLE `tbl_movie`
  ADD CONSTRAINT `tbl_movie_ibfk_1` FOREIGN KEY (`color`) REFERENCES `tbl_lucolor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_movie_ibfk_2` FOREIGN KEY (`silent`) REFERENCES `tbl_lusound` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_moviecountry`
--
ALTER TABLE `tbl_moviecountry`
  ADD CONSTRAINT `tbl_moviecountry_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `tbl_movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_moviecountry_ibfk_4` FOREIGN KEY (`country_id`) REFERENCES `tbl_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_moviegenre`
--
ALTER TABLE `tbl_moviegenre`
  ADD CONSTRAINT `tbl_moviegenre_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `tbl_movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_moviegenre_ibfk_4` FOREIGN KEY (`genre_id`) REFERENCES `tbl_genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_movielanguage`
--
ALTER TABLE `tbl_movielanguage`
  ADD CONSTRAINT `tbl_movielanguage_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `tbl_movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_movielanguage_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `tbl_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
