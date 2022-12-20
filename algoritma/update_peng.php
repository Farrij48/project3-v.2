<?php
// memanggil file koneksi.php untuk melakukan koneksi database
include '../koneksi.php';

	// membuat variabel untuk menampung data dari form
  $id_pengeluaran   = $_POST['id_pengeluaran'];
  $item_id          = $_POST['item_id'];
  $name             = $_POST['name'];
  $tanggal          = $_POST['tanggal'];
  $stok             = $_POST['stok'];
  $harga_barang     = $_POST['harga_barang'];
  $total            = $_POST['total'];
  $supplier         = $_POST['supplier'];
  
  //cek dulu jika merubah gambar produk jalankan coding ini
  if($image != "") {
    $ekstensi_diperbolehkan = array('png','jpg'); //ekstensi file gambar yang bisa diupload 
    $x = explode('.', $image); //memisahkan nama file dengan ekstensi yang diupload
    $ekstensi = strtolower(end($x));
    $file_tmp = $_FILES['image']['tmp_name'];   
    $angka_acak     = rand(1,999);
    $nama_gambar_baru = $angka_acak.'-'.$image; //menggabungkan angka acak dengan nama file sebenarnya
    if(in_array($ekstensi, $ekstensi_diperbolehkan) === true)  {
                  move_uploaded_file($file_tmp, '../gambar/'.$nama_gambar_baru); //memindah file gambar ke folder gambar
                      
                    // jalankan query UPDATE berdasarkan ID yang produknya kita edit
                   $query  = "UPDATE pengeluaran SET id_pengeluaran = '$id_pengeluaran', item_id = '$item_id', name = '$name', tanggal = '$tanggal', stok = '$stok', harga_barang = '$harga_barang', supplier = '$supplier', image = '$nama_gambar_baru'";
                    $query .= "WHERE id_pengeluaran = '$id_pengeluaran'";
                    $result = mysqli_query($koneksi, $query);
                    // periska query apakah ada error
                    if(!$result){
                        die ("Query gagal dijalankan: ".mysqli_errno($koneksi).
                             " - ".mysqli_error($koneksi));
                    } else {
                      //tampil alert dan akan redirect ke halaman index.php
                      //silahkan ganti index.php sesuai halaman yang akan dituju
                      echo "<script>alert('Data berhasil diubah.');window.location='../pages/pengeluaran.php';</script>";
                    }
              } else {     
               //jika file ekstensi tidak jpg dan png maka alert ini yang tampil
                  echo "<script>alert('Ekstensi gambar yang boleh hanya jpg atau png.');window.location='../pop/edit_pengeluaran.php';</script>";
              }
    } else {
      // jalankan query UPDATE berdasarkan ID yang produknya kita edit
      $query  = "UPDATE pengeluaran SET id_pengeluaran = '$id_pengeluaran', item_id = '$item_id', name = '$name', tanggal = '$tanggal', stok = '$stok', harga_barang = '$harga_barang', supplier = '$supplier'";
      $query .= "WHERE id_pengeluaran = '$id_pengeluaran'";
      $result = mysqli_query($koneksi, $query);
      // periska query apakah ada error
      if(!$result){
            die ("Query gagal dijalankan: ".mysqli_errno($koneksi).
                             " - ".mysqli_error($koneksi));
      } else {
        //tampil alert dan akan redirect ke halaman index.php
        //silahkan ganti index.php sesuai halaman yang akan dituju
          echo "<script>alert('Data berhasil diubah.');window.location='../pages/pengeluaran.php';</script>";
      }
    }

 
