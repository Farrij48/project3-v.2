<?php
// memanggil file koneksi.php untuk melakukan koneksi database
include '../koneksi.php';

	// membuat variabel untuk menampung data dari form

  $name             = $_POST['name'];
  $username         = $_POST['username'];
  $email            = $_POST['email'];
  $password         = $_POST['password'];
  
  
 
                      
                    // jalankan query UPDATE berdasarkan ID yang produknya kita edit
                   $query  = "UPDATE user_admin SET name = '$name', username = '$username', email = '$email', password = 'password'";
                    $query .= "WHERE username = '$username'";
                    $result = mysqli_query($koneksi, $query);
                    // periska query apakah ada error
                    if(!$result){
                        die ("Query gagal dijalankan: ".mysqli_errno($koneksi).
                             " - ".mysqli_error($koneksi));
                    } else {
                      //tampil alert dan akan redirect ke halaman index.php
                      //silahkan ganti index.php sesuai halaman yang akan dituju
                      echo "<script>alert('Data berhasil diubah.');window.location='../pages/profile.php';</script>";
                    }
      // jalankan query UPDATE berdasarkan ID yang produknya kita edit
      $query  = "UPDATE user_admin SET name = '$name', username = '$username', email = '$email', password = 'password'";
      $query .= "WHERE username = '$username'";
      $result = mysqli_query($koneksi, $query);
      // periska query apakah ada error
      if(!$result){
            die ("Query gagal dijalankan: ".mysqli_errno($koneksi).
                             " - ".mysqli_error($koneksi));
      } else {
        //tampil alert dan akan redirect ke halaman index.php
        //silahkan ganti index.php sesuai halaman yang akan dituju
          echo "<script>alert('Data berhasil diubah.');window.location='../pages/profile.php';</script>";
      }
    

 
