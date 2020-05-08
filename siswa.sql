-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2020 at 12:24 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `hapus_mahasiswa`
--

CREATE TABLE `hapus_mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `umur` int(3) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `tanggal_hapus` date NOT NULL,
  `user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hapus_mahasiswa`
--

INSERT INTO `hapus_mahasiswa` (`id`, `nama`, `umur`, `tanggal_lahir`, `jenis_kelamin`, `tanggal_hapus`, `user`) VALUES
(16, 'Coba Trigger', 20, '1999-01-01', 'Lelaki', '2020-05-08', 'root@localhost');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `umur` int(3) NOT NULL,
  `tanggal_lahir` datetime DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `umur`, `tanggal_lahir`, `jenis_kelamin`) VALUES
(1, 'Priyo Sigit Pamungkas', 19, '2000-09-12 00:00:00', 'Lelaki'),
(2, 'Amman Fathoni', 20, '1999-06-12 00:00:00', 'Lelaki'),
(3, 'Adib Assegaf', 20, '2000-03-17 00:00:00', 'Lelaki'),
(4, 'Erik Priambodo', 20, '2000-03-20 00:00:00', 'Lelaki'),
(5, 'Timorandi Wisnu P', 23, '1997-04-03 00:00:00', 'Lelaki'),
(6, 'Heru Prasetyo', 21, '1999-02-03 00:00:00', 'Lelaki'),
(7, 'Arvita Listya', 20, '2000-04-13 00:00:00', 'Perempuan'),
(8, 'Meillisa Rahayu', 20, '2000-05-03 00:00:00', 'Perempuan'),
(9, 'Rifai Rejal', 20, '2000-06-01 00:00:00', 'Lelaki'),
(10, 'Onky Happy N', 21, '1999-01-03 00:00:00', 'Lelaki'),
(11, 'Azizul Ramadhan', 21, '1999-02-02 00:00:00', 'Lelaki'),
(12, 'Muhammad Arif', 21, '1999-02-03 00:00:00', 'Lelaki'),
(13, 'Juan Frido', 22, '1998-04-03 00:00:00', 'Lelaki'),
(14, 'Indana Rishi', 21, '1999-01-03 00:00:00', 'Lelaki'),
(15, 'Bachtiar Nur Yogi', 20, '2000-04-10 00:00:00', 'Lelaki');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `hapus_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW BEGIN
INSERT INTO hapus_mahasiswa (id, nama, umur, tanggal_lahir, jenis_kelamin, tanggal_hapus, user) VALUES (old.id, old.nama, old.umur, old.tanggal_lahir, old.jenis_kelamin, sysdate(), CURRENT_USER);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hapus_mahasiswa`
--
ALTER TABLE `hapus_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
