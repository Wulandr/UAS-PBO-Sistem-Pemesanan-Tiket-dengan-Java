-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2021 pada 13.25
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_ka`
--

CREATE TABLE `data_ka` (
  `id_KA` int(11) NOT NULL,
  `nama_KA` varchar(30) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `status` text NOT NULL,
  `jumlahkursi` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_ka`
--

INSERT INTO `data_ka` (`id_KA`, `nama_KA`, `kelas`, `status`, `jumlahkursi`, `keterangan`) VALUES
(57, 'Prameks 2', 'Eksekutif', 'Tidak Aktif', 97, 'Beroperasi semenjak tahun 1999');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `nama_ka` varchar(50) NOT NULL,
  `asal` text NOT NULL,
  `tujuan` text NOT NULL,
  `jamberangkat` time NOT NULL,
  `jamdatang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `nama_ka`, `asal`, `tujuan`, `jamberangkat`, `jamdatang`) VALUES
(28, 'Hayam Wuruk', 'Eksekutif', 'Aktif', '00:02:31', '00:00:00'),
(29, 'Munawarman', 'Surakarta', 'Jogjakarta', '00:06:00', '00:05:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesan` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_ka` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pesan`, `nik`, `nama`, `email`, `alamat`, `tanggal`, `nama_ka`) VALUES
(114, '', 'Tri Wulandari', '', 'Surakarta', '0000-00-00', 'Prameks'),
(115, '111', 'wulan', 'wulan@gmail.com', 'Surakarta', '2021-05-27', 'Prameks'),
(116, '123', 'Tri Wulandari', 'wdari0161@gmail.com', 'Jl Ir.Sutami', '2021-08-23', 'Argo Lawu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `nik` varchar(16) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL DEFAULT current_timestamp(),
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nik`, `username`, `password`, `role`, `nama`, `email`, `tanggal_lahir`, `alamat`) VALUES
('', 'Tri', '$2y$10$wkaJwWRZBceQs2HyzgDDxuicGBM3kVAxvxvUYxL4iWMnSHKMse7Fa', 'user', 'Tri Wulandari', '', '0000-00-00', 'Surakarta'),
('0000000000000000', 'admin', '$2y$10$dUwG0KX0uSLiqJqiUZH7SeHcGKEKDMZCRdn21qZHcklCNarmh3Hey', 'admin', 'Admin', 'admin@admin.admin', '9999-09-09', 'Admin'),
('111', 'wulan', '$2y$10$Wz4sHqTxzEp2YITC85VwJOwygxjCSt51jN3AZhm95q4UpfUDUbbOC', 'user', 'wulan', 'wulan@gmail.com', '2021-05-19', 'Surakarta');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_ka`
--
ALTER TABLE `data_ka`
  ADD PRIMARY KEY (`id_KA`),
  ADD UNIQUE KEY `nama_KA` (`nama_KA`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nik`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_ka`
--
ALTER TABLE `data_ka`
  MODIFY `id_KA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
