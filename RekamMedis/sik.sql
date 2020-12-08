-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 16, 2015 at 08:02 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE IF NOT EXISTS `lab` (
  `no_klinik` varchar(5) NOT NULL,
  `nip` varchar(5) NOT NULL,
  `nm_ceklab` enum('Cek Darah','Cek Urin','Lainnya') NOT NULL,
  `hasil_cek` text NOT NULL,
  `ket` text NOT NULL,
  `harga` double NOT NULL,
  `no_laylab` varchar(5) NOT NULL,
  PRIMARY KEY (`no_laylab`),
  KEY `nip` (`nip`),
  KEY `no_klinik` (`no_klinik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`no_klinik`, `nip`, `nm_ceklab`, `hasil_cek`, `ket`, `harga`, `no_laylab`) VALUES
('14101', '12150', 'Cek Darah', 'positif demam berdarah', 'perlu tindakan lanjut', 50000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `kd_obat` varchar(5) NOT NULL,
  `nm_obat` varchar(20) NOT NULL,
  `harga` double NOT NULL,
  PRIMARY KEY (`kd_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kd_obat`, `nm_obat`, `harga`) VALUES
('14001', 'Parasetamol', 10000),
('14002', 'Antibiotik', 15000),
('14003', 'Bodrex', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE IF NOT EXISTS `pasien` (
  `no_klinik` varchar(5) NOT NULL,
  `nm_pasien` varchar(25) NOT NULL,
  `alm_pasien` text NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `umur` int(3) NOT NULL,
  PRIMARY KEY (`no_klinik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`no_klinik`, `nm_pasien`, `alm_pasien`, `jk`, `tgl_lahir`, `no_telp`, `umur`) VALUES
('14101', 'Dian', 'Yogyakarta', 'Perempuan', '1992-05-13', '098765544443', 21),
('14102', 'Ikhsan', 'Nanggulan', 'Laki-laki', '1990-12-12', '091290430908', 24);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `kd_tnd` varchar(10) NOT NULL,
  `kd_obat` varchar(10) NOT NULL,
  `no_klinik` varchar(5) NOT NULL,
  `tgl_byr` date NOT NULL,
  `tambahan` double NOT NULL,
  `tot_biaya` double NOT NULL,
  `nip` varchar(5) NOT NULL,
  `no_nota` varchar(5) NOT NULL,
  PRIMARY KEY (`no_nota`),
  KEY `no_klinik` (`no_klinik`),
  KEY `nip` (`nip`),
  KEY `kd_tnd` (`kd_tnd`),
  KEY `kd_obat` (`kd_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`kd_tnd`, `kd_obat`, `no_klinik`, `tgl_byr`, `tambahan`, `tot_biaya`, `nip`, `no_nota`) VALUES
('20000', '20000', '14102', '2015-03-23', 20000, 60000, '14150', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE IF NOT EXISTS `pemeriksaan` (
  `no_rawat` varchar(8) NOT NULL,
  `no_klinik` varchar(5) NOT NULL,
  `nip` varchar(5) NOT NULL,
  `kd_obat` varchar(5) NOT NULL,
  `diagnosa` text NOT NULL,
  `brt_badan` int(3) NOT NULL,
  `tensi` int(3) NOT NULL,
  `suhu_tubuh` int(2) NOT NULL,
  `ket` text NOT NULL,
  PRIMARY KEY (`no_rawat`),
  KEY `nip` (`nip`),
  KEY `kd_obat` (`kd_obat`),
  KEY `no_reg` (`no_klinik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`no_rawat`, `no_klinik`, `nip`, `kd_obat`, `diagnosa`, `brt_badan`, `tensi`, `suhu_tubuh`, `ket`) VALUES
('1', '14101', '11141', '14002', 'demam berdarah', 45, 120, 35, 'muncul bintik bintik merah'),
('2', '14102', '13150', '14002', 'demam', 60, 110, 37, 'pusing');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE IF NOT EXISTS `petugas` (
  `nip` varchar(5) NOT NULL,
  `nm_ptg` varchar(25) NOT NULL,
  `alm_ptg` text NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jabatan` enum('Dokter','Admin','Perawat','Lab','Farmasi') NOT NULL,
  `no_ijin_praktek` varchar(30) NOT NULL,
  `pass` varchar(10) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`nip`, `nm_ptg`, `alm_ptg`, `jk`, `tgl_lahir`, `no_telp`, `jabatan`, `no_ijin_praktek`, `pass`) VALUES
('11141', 'Fitriana', 'Kulon Progo', 'Perempuan', '1990-05-16', '087678098765', 'Admin', '9876544', '123'),
('12150', 'Dina', 'Jogja', 'Perempuan', '1980-03-10', '087654098765', 'Lab', '123', '123'),
('13150', 'Budiyanto', 'Yogyakarta', 'Laki-laki', '1979-03-11', '081902674365', 'Dokter', '58752874', 'budiyanto'),
('14150', 'Yulia', 'Yogyakarta', 'Perempuan', '1990-03-17', '097739564321', 'Farmasi', '123', '123');

-- --------------------------------------------------------

--
-- Table structure for table `registrasi`
--

CREATE TABLE IF NOT EXISTS `registrasi` (
  `no_reg` varchar(4) NOT NULL,
  `no_klinik` varchar(5) NOT NULL,
  `tgl_reg` date NOT NULL,
  `jam_reg` time NOT NULL,
  PRIMARY KEY (`no_reg`,`tgl_reg`,`jam_reg`),
  KEY `no_klinik` (`no_klinik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrasi`
--

INSERT INTO `registrasi` (`no_reg`, `no_klinik`, `tgl_reg`, `jam_reg`) VALUES
('1', '14101', '2015-03-16', '17:00:00'),
('2', '14102', '2015-04-12', '11:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE IF NOT EXISTS `tindakan` (
  `kd_tnd` varchar(2) NOT NULL,
  `nm_tnd` varchar(20) NOT NULL,
  `harga` double NOT NULL,
  PRIMARY KEY (`kd_tnd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tindakan`
--

INSERT INTO `tindakan` (`kd_tnd`, `nm_tnd`, `harga`) VALUES
('01', 'Pemeriksaan', 20000),
('02', 'Cek Urin', 50000),
('03', 'Cek Darah', 50000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_ibfk_3` FOREIGN KEY (`no_klinik`) REFERENCES `pasien` (`no_klinik`) ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_5` FOREIGN KEY (`no_klinik`) REFERENCES `pasien` (`no_klinik`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_6` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE;

--
-- Constraints for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ibfk_2` FOREIGN KEY (`kd_obat`) REFERENCES `obat` (`kd_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ibfk_3` FOREIGN KEY (`no_klinik`) REFERENCES `pasien` (`no_klinik`) ON UPDATE CASCADE;

--
-- Constraints for table `registrasi`
--
ALTER TABLE `registrasi`
  ADD CONSTRAINT `registrasi_ibfk_1` FOREIGN KEY (`no_klinik`) REFERENCES `pasien` (`no_klinik`) ON DELETE CASCADE ON UPDATE CASCADE;
