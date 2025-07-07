-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2025 at 08:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_heram`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `Favorite_ID` int(11) NOT NULL,
  `Movie_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`Favorite_ID`, `Movie_ID`, `User_ID`) VALUES
(36, 25, 25),
(41, 26, 25),
(48, 23, 25),
(52, 26, 52),
(53, 40, 52),
(54, 51, 52),
(55, 60, 25),
(56, 35, 25);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `Membership_ID` int(11) NOT NULL,
  `Membership_Type` varchar(100) NOT NULL,
  `Price` int(11) NOT NULL,
  `Features` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`Membership_ID`, `Membership_Type`, `Price`, `Features`) VALUES
(1, 'Premium Plus+', 1299, '4K Ultra HD + HDR\r\nDollby Atmos Support\r\nWatch on 4 devices\r\nAd-free experience\r\nDownload & watch offline\r\nShare with family\r\nExclusive premieres'),
(2, 'Premium', 999, '4K Ultra HD\r\nBest sound quality\r\nWatch on 2 devices\r\nAd-free experience\r\nDownload & watch offline\r\nShare with a friend'),
(3, 'Standard', 599, 'HD Streaming\r\nGood sound quality\r\nWatch on 1 device\r\nAd-free experience\r\nDownload & watch offline');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Movie_ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Genre` varchar(100) NOT NULL,
  `Type` varchar(150) NOT NULL,
  `Release_Year` int(11) NOT NULL,
  `Thumbnail` varchar(255) NOT NULL,
  `Video` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`Movie_ID`, `Title`, `Genre`, `Type`, `Release_Year`, `Thumbnail`, `Video`) VALUES
(23, 'Mission Impossible', 'Action', 'Movie', 2022, 'mission.jpg', 'Mission Impossible The Final Reckoning.mp4'),
(25, 'Breaking Bad', 'Action', 'Series', 2020, 'bb.jpeg', 'Breaking Bad.mp4'),
(26, 'Stranger Things', 'Drama', 'Series', 2023, 'st.jpeg', 'Stranger Things .mp4'),
(35, 'Cars', 'Comedy', 'Anime', 2022, 'cars.jpeg', 'Cars.mp4'),
(40, 'Jurassic World', 'Sci-Fi', 'Movie', 2022, 'world.jpeg', 'Jurassic World Rebirth.mp4'),
(48, 'Despicable Me 4', 'Drama', 'Anime', 2023, 'me4.jpeg', 'Despicable Me 4.mp4'),
(49, 'Maharaja', 'Action', 'Movie', 2024, 'maharaja.jpeg', 'Maharaja.mp4'),
(51, 'Naruto', 'Action', 'Anime', 2022, 'naruto.jpg', 'naruto.mp4'),
(52, 'Mirzapur', 'Drama', 'Series', 2022, 'mirzapur.webp', 'Mirzapur.mp4'),
(53, 'Peaky Blinders', 'Drama', 'Series', 2023, 'peakyB.jpg', 'peaky.mp4'),
(54, 'Shinchan', 'Comedy', 'Anime', 2024, 'shinchan.jpg', 'Sinchan.mp4'),
(55, 'KGF', 'Action', 'Movie', 2020, 'kgf.jpg', 'KGF - Chapter 1.mp4'),
(56, 'Squid Game', 'Drama', 'Series', 2020, 'squid.jpg', 'squid.mp4'),
(57, 'Avenger Infinity War', 'Action', 'Movie', 2020, 'avenger.jpeg', 'Marvel Studios Avengers Infinity War.mp4'),
(58, 'Final Destination', 'Horror', 'Movie', 2025, 'final destination.jpeg', 'final destination.mp4'),
(59, 'Conjuring', 'Horror', 'Movie', 2025, 'conjuring.jpg', 'Conjuring.mp4'),
(60, 'Tron', 'Sci-Fi', 'Movie', 2020, 'https://m.media-amazon.com/images/M/MV5BMmJiMWE2NTYtZWMyZC00Yzg0LTg0YjItZDM3ODlkYTRhNWNlXkEyXkFqcGc@._V1_.jpg', 'Tron.mp4'),
(61, 'Incredibles', 'Action', 'Anime', 2020, 'incredibles.jpg', 'Incredibles.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `movie_user`
--

CREATE TABLE `movie_user` (
  `Movie_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Is_Admin` tinyint(1) NOT NULL,
  `Membership_ID` int(11) DEFAULT NULL,
  `Created_Date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Name`, `Email`, `Password`, `Image`, `Is_Admin`, `Membership_ID`, `Created_Date`) VALUES
(12, 'admin', 'admin@gmail.com', '4LnQXqBzqLZxvJBBhnwtsRFcEI7rI3Vz8SLNqG/6Pvtse2GsvWn8dtDgcb5IYibeSJg7Kg==', NULL, 1, NULL, NULL),
(25, 'najibb', 'najib@gmail.com', 'Q5QqRK8SnIGE5JR0RDtcjXstm7H+fhE5ZixoEY+VErWWaqU6Z7JPygIEb+VJaQ72nn7tqpE=', 'avatar4.jpeg', 0, 1, '2025-04-20'),
(52, 'ram', 'ram@gmail.com', 'Z1f6e1Luq8nnnYrphDolOvqHjJeR1qLeYMAWCGijOIAUOLqGO8z4EtSso3nKToAzC0mzPA==', 'avatar6.jpeg', 0, 3, '2025-05-20'),
(53, 'Hari', 'hari@gmail.com', 'XNTUK7CMEAPt36bNQrFQTFbaiae4sKpTK3LVHmDalPjNkOd09W7vuZzdxcgnoVpTp6R9Rg==', 'avatar1.png', 0, 2, '2025-05-20'),
(54, 'Reeya', 'reeya@gmail.com', 'CyJwZtPR+O9HwRfrfabpA1AwGjm4bWvYms0p5MsFiw7ikhLWLFvxteuaPpXADzNhsPeNDQ==', 'avatar3.png', 0, 2, '2025-05-20'),
(55, 'Austin', 'austin@gmail.com', 'cKkWLffF5J0/l/0DUNbz7gXZkZTdeu42z4ZYqV5Tkb5sbNPDxq5MQqTNpur/lFj1h7LkNYQ=', 'avatar4.jpeg', 0, 1, '2025-05-20'),
(56, 'Shreya', 'shreya@gmail.com', 'Al+nOjkY3bGOiZkTokfHcoC3FJyJDXMo4ouwcr1oJNJZyMqK1a0KfMYnKtsG3a2NAG0R98Q=', 'avatar5.png', 0, 1, '2025-05-20'),
(60, 'Krish', 'krish@gmail.com', 'eS1UxUb3bBSBbApF8ga20yhJSuUVb/GR8KWYXloMTvEv0+wXq/P/WndSJ2gL3koMe7DQcy0=', 'avatar4.jpeg', 0, 2, '2025-05-21'),
(61, 'Sita', 'sita@gmail.com', 'TQwGG1m4QgMh1y0XvFjjWvlmM4CKwvzXWLkEkkGZSQXU+fvEFuzZJJsPXRsAIaV0xbkKsA==', 'avatar5.png', 0, 3, '2025-05-21'),
(62, 'Raj', 'raj@gmail.com', 'h9hXrKt3iH3e3nI097ZeDIAASfrn0PR6S5f+Evv4pUPMyFA+xcOxQEG4ITuoDMkNFaD7hA==', 'avatar1.png', 0, 3, '2025-05-21'),
(63, 'Rose', 'rose@gmail.com', 'puliUmQAP2noRdRXHibaTmr5O/BOoh/ZJwFg205MKxYsnDdpkTKPlDa5xWpRDN1haRc7mQ==', 'avatar5.png', 0, 1, '2025-05-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`Favorite_ID`),
  ADD KEY `fk_favorite_movie` (`Movie_ID`),
  ADD KEY `fk_favorite_user` (`User_ID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`Membership_ID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`Movie_ID`);

--
-- Indexes for table `movie_user`
--
ALTER TABLE `movie_user`
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `user_membership_fk` (`Membership_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `Favorite_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `Membership_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `Movie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `fk_favorite_movie` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_favorite_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE;

--
-- Constraints for table `movie_user`
--
ALTER TABLE `movie_user`
  ADD CONSTRAINT `movie_user_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `movie_user_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_membership_fk` FOREIGN KEY (`Membership_ID`) REFERENCES `membership` (`Membership_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
