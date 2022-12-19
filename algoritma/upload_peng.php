<?php
// memanggil file koneksi.php untuk melakukan koneksi database
include '../koneksi.php';

	// membuat variabel untuk menampung data dari form
  $id_pengeluaran   = $_POST['id_pengeluaran'];
  $id_produk     = $_POST['id_produk'];
  $nama_barang    = $_POST['nama_barang'];
  $tanggal    = $_POST['tanggal'];
  $stok = $_POST['stok'];
  $harga_barang = $_POST['harga_barang'];
  $total = $_POST['total'];
  $supplier = $_POST['supplier'];



       
                  // jalankan query INSERT untuk menambah data ke database pastikan sesuai urutan (id tidak perlu karena dibikin otomatis)
                  $query = "INSERT INTO pengeluaran (id_produk, nama_barang, tanggal, stok, total, harga_barang, supplier) VALUES ('$id_produk', '$nama_barang', '$tanggal', '$stok', '$total', '$harga_barang', '$supplier')";
                  $result = mysqli_query($koneksi, $query);
                  // periska query apakah ada error
                  if(!$result){
                      die ("Query gagal dijalankan: ".mysqli_errno($koneksi).
                           " - ".mysqli_error($koneksi));
                  } else {
                    //tampil alert dan akan redirect ke halaman index.php
                    //silahkan ganti index.php sesuai halaman yang akan dituju
                    echo "<script>alert('Data berhasil ditambah.');window.location='../pages/pengeluaran.php';</script>";
                  }

            
                
 

