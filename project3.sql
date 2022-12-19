-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2022 at 07:57 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project3`
--

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `no_pemesan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `variasi` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `total` int(11) NOT NULL,
  `status_pem` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `stok` int(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  `harga_barang` varchar(10) NOT NULL,
  `supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `id_produk`, `nama_barang`, `tanggal`, `stok`, `total`, `harga_barang`, `supplier`) VALUES
(122222222, 1, 'Azarine mana Serum', '2022-12-06', 10, '1000000', '100000', 'PT Syukur');

--
-- Triggers `pengeluaran`
--
DELIMITER $$
CREATE TRIGGER `update_stok` AFTER INSERT ON `pengeluaran` FOR EACH ROW BEGIN

INSERT INTO tb_upload_barang SET 
id_produk = NEW.id_produk,
stok = NEW.stok
ON DUPLICATE KEY UPDATE stok = stok + NEW.stok;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_upload_barang`
--

CREATE TABLE `tb_upload_barang` (
  `id_produk` int(11) NOT NULL,
  `nama_prod` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` double NOT NULL,
  `status_prod` varchar(10) NOT NULL,
  `kategori` varchar(15) NOT NULL,
  `variasi` varchar(255) NOT NULL,
  `gambar_produk` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_upload_barang`
--

INSERT INTO `tb_upload_barang` (`id_produk`, `nama_prod`, `deskripsi`, `stok`, `harga`, `status_prod`, `kategori`, `variasi`, `gambar_produk`) VALUES
(1, 'Azarine Serum', 'serum', 20, 20000, 'public', 'serum', 'Acne Serum', '992-products.png'),
(2, 'Serum', 'ini serum', 10, 15000, 'selesai', 'seum', 'acnes', '307-NIACINAMIDE-WEBSITE.png'),
(3, 'Serum Wardah', 'ini serum lohh', 15, 20000, 'private', 'serum', 'serum 10ml', '853-3-rekomendasi-serum-wardah-yang-sesuai-dengan-kebutuhan-kulitmu_169.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `id_tracking` int(11) NOT NULL,
  `no_pemesan` int(11) NOT NULL,
  `nama_pemesan` varchar(255) NOT NULL,
  `tgl_masuk` int(11) NOT NULL,
  `tgl_selesai` date NOT NULL,
  `status_track` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `resi_pengiriman` varchar(255) NOT NULL,
  `jasa_pengiriman` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE `user_admin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`no_pemesan`),
  ADD UNIQUE KEY `id_produk` (`id_produk`),
  ADD UNIQUE KEY `nama_pemesan` (`nama_pelanggan`,`alamat`),
  ADD UNIQUE KEY `alamat` (`alamat`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD UNIQUE KEY `id_produk` (`id_produk`);

--
-- Indexes for table `tb_upload_barang`
--
ALTER TABLE `tb_upload_barang`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`id_tracking`),
  ADD UNIQUE KEY `no_pemesan` (`no_pemesan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `alamat` (`alamat`),
  ADD KEY `nama_pelanggan` (`nama_pelanggan`,`alamat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `no_pemesan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122222224;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `id_tracking` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `tb_upload_barang` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`nama_pelanggan`) REFERENCES `users` (`nama_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`alamat`) REFERENCES `users` (`alamat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `tb_upload_barang` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`no_pemesan`) REFERENCES `pemesanan` (`no_pemesan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
