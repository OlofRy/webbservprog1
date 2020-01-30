-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 30 jan 2020 kl 18:20
-- Serverversion: 10.4.11-MariaDB
-- PHP-version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `bokhandel`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `beställning`
--

CREATE TABLE `beställning` (
  `beställningsnr` int(11) NOT NULL,
  `kundid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `beställning`
--

INSERT INTO `beställning` (`beställningsnr`, `kundid`) VALUES
(1, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Tabellstruktur `bok`
--

CREATE TABLE `bok` (
  `boknr` int(11) NOT NULL,
  `titel` varchar(100) NOT NULL,
  `författare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `bok`
--

INSERT INTO `bok` (`boknr`, `titel`, `författare`) VALUES
(1, 'Klubben', 'Gustavsson, Matilda'),
(2, 'Innan ni tog oss', 'Wingate, Lisa'),
(3, 'Kodnamn Alice', 'Quinn, Kate'),
(4, 'Arv och miljö', 'Hjorth, Vigdis'),
(5, 'Burn After Writing', 'Jones, Sharon'),
(20, 'Handbok i svenska språket', 'Jansson, Ulf'),
(23, 'The Practice of Statistics for Business and Economics', 'Alwan, Layth'),
(24, 'Akutsjukvård', 'Stenlund, Anna-Lena'),
(25, 'Straflinge / Ein Sonntagmorgen', 'Auerbach, Berthold'),
(26, 'Water Resource Economics', 'Jordan, Jeffrey L.'),
(27, 'Rapporter och uppsatser', 'Backman, Jarl');

-- --------------------------------------------------------

--
-- Tabellstruktur `exemplar`
--

CREATE TABLE `exemplar` (
  `exemplarid` int(11) NOT NULL,
  `boknr` int(11) NOT NULL,
  `skick` text NOT NULL,
  `pris` int(11) NOT NULL,
  `beställningsnr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `exemplar`
--

INSERT INTO `exemplar` (`exemplarid`, `boknr`, `skick`, `pris`, `beställningsnr`) VALUES
(1, 1, 'Gott', 149, NULL),
(2, 3, 'Begagnad', 49, NULL),
(3, 2, 'Nyskick', 229, 1),
(4, 1, 'Begagnad', 109, NULL),
(5, 1, 'Gott', 149, NULL),
(6, 5, 'Nyskick', 279, NULL),
(7, 5, 'Begagnad', 49, 2),
(8, 2, 'Begagnad', 89, NULL),
(11, 23, 'Nyskick', 809, NULL),
(12, 24, 'Begagnad', 709, NULL),
(13, 25, 'Gott', 709, NULL),
(14, 26, 'Nyskick', 429, NULL),
(15, 27, 'Gott', 969, NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `kund`
--

CREATE TABLE `kund` (
  `kundid` int(11) NOT NULL,
  `förnamn` varchar(255) NOT NULL,
  `efternamn` varchar(255) NOT NULL,
  `epost` varchar(255) NOT NULL,
  `telefonnr` varchar(20) NOT NULL,
  `postnr` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `kund`
--

INSERT INTO `kund` (`kundid`, `förnamn`, `efternamn`, `epost`, `telefonnr`, `postnr`, `password`) VALUES
(1, 'Åsa', 'Lundqvist', 'asa.lundqvist@telia.se', '0701414131', 90332, NULL),
(2, 'Sten', 'Petersson', 'stenp@yahoo.com', '0705381593', 90531, NULL),
(3, 'Ola', 'Borg', 'ola.borg@gmail.com', '0731572937', 13518, NULL),
(4, 'Alex', 'Gunnarsson', 'alex@carlslid.se', '0727483647', 90750, NULL),
(5, 'Walter', 'Feldt', 'walterfeldt@hotmail.com', '0766318234', 93742, NULL),
(10, 'Olof', 'Rydh', 'olle@carlslid.se', '0722002088', 90750, '$2y$10$OLKKt29vnnRyQ07D/gBFr.I6/bpo90suqrDDR.ahyu6VKUqrSy9je'),
(16, 'Abby', 'Faust', 'abby.faust@gmail.com', '03410286239', 58349, '$2y$10$g9aGnKeIxKXjxUPXDh468.19wilfj.FZ1clfLMRFwe4dEjLa.tWru');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `beställning`
--
ALTER TABLE `beställning`
  ADD PRIMARY KEY (`beställningsnr`);

--
-- Index för tabell `bok`
--
ALTER TABLE `bok`
  ADD PRIMARY KEY (`boknr`);

--
-- Index för tabell `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`exemplarid`),
  ADD KEY `bokexemplar` (`boknr`);

--
-- Index för tabell `kund`
--
ALTER TABLE `kund`
  ADD PRIMARY KEY (`kundid`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `beställning`
--
ALTER TABLE `beställning`
  MODIFY `beställningsnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT för tabell `bok`
--
ALTER TABLE `bok`
  MODIFY `boknr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT för tabell `exemplar`
--
ALTER TABLE `exemplar`
  MODIFY `exemplarid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT för tabell `kund`
--
ALTER TABLE `kund`
  MODIFY `kundid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `bokexemplar` FOREIGN KEY (`boknr`) REFERENCES `bok` (`boknr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
