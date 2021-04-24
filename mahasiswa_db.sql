-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Apr 2021 pada 19.16
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontrak_mk`
--

CREATE TABLE `kontrak_mk` (
  `matakuliah_id` int(11) NOT NULL,
  `mhs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kontrak_mk`
--

INSERT INTO `kontrak_mk` (`matakuliah_id`, `mhs_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id` int(11) NOT NULL,
  `nama_mk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`id`, `nama_mk`) VALUES
(1, 'Pemrograman Internet 2'),
(2, 'Pemrograman Internet 2'),
(3, 'Pemrograman Internet 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_absen`
--

CREATE TABLE `tbl_absen` (
  `id` int(11) NOT NULL,
  `mhs_id` int(20) NOT NULL,
  `matakuliah_id` int(11) NOT NULL,
  `waktu_absen` varchar(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_absen`
--

INSERT INTO `tbl_absen` (`id`, `mhs_id`, `matakuliah_id`, `waktu_absen`, `status`) VALUES
(1, 1, 1, '07.30', 'Hadir'),
(2, 2, 2, '07.15', 'Hadir'),
(3, 3, 3, '08.00', 'Hadir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mhs`
--

CREATE TABLE `tbl_mhs` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `semester` int(11) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mhs`
--

INSERT INTO `tbl_mhs` (`id`, `nama`, `semester`, `alamat`, `no_tlp`, `email`) VALUES
(1, 'Kai', 6, 'Bandung', '0877123456', 'kai@gmail.com'),
(2, 'Salma', 4, 'Jakarta', '0877234567', 'salma@gmail.com'),
(3, 'Rose', 7, 'Tanggerang', '0811234567', 'rose@gmail');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nilai`
--

CREATE TABLE `tbl_nilai` (
  `nim` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `uts` int(11) DEFAULT NULL,
  `uas` int(11) DEFAULT NULL,
  `tugas` int(11) DEFAULT NULL,
  `na` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_nilai`
--

INSERT INTO `tbl_nilai` (`nim`, `nama`, `uts`, `uas`, `tugas`, `na`, `status`) VALUES
(2019115001, 'Kai', 90, 87, 76, 85, 'Lulus'),
(2019115002, 'Salma', 27, 40, 52, 40, 'Tidak Lulus'),
(2019115003, 'Rose', 97, 78, 80, 84, 'Lulus');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kontrak_mk`
--
ALTER TABLE `kontrak_mk`
  ADD KEY `matakuliah_id` (`matakuliah_id`),
  ADD KEY `mhs_id` (`mhs_id`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_absen`
--
ALTER TABLE `tbl_absen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mhs_id` (`mhs_id`),
  ADD KEY `matakuliah_id` (`matakuliah_id`);

--
-- Indeks untuk tabel `tbl_mhs`
--
ALTER TABLE `tbl_mhs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama` (`nama`);

--
-- Indeks untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `nama` (`nama`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_absen`
--
ALTER TABLE `tbl_absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_mhs`
--
ALTER TABLE `tbl_mhs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `nim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2019115004;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kontrak_mk`
--
ALTER TABLE `kontrak_mk`
  ADD CONSTRAINT `kontrak_mk_ibfk_1` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kontrak_mk_ibfk_2` FOREIGN KEY (`mhs_id`) REFERENCES `tbl_mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_absen`
--
ALTER TABLE `tbl_absen`
  ADD CONSTRAINT `tbl_absen_ibfk_1` FOREIGN KEY (`mhs_id`) REFERENCES `tbl_mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_absen_ibfk_2` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD CONSTRAINT `tbl_nilai_ibfk_1` FOREIGN KEY (`nama`) REFERENCES `tbl_mhs` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
