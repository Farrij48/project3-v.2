<?php

//membuat koneksi ke database
$koneksi = mysqli_connect("localhost", "root", "", "skincare_app");

//variabel nim yang dikirimkan form.php
$item_id = $_GET['item_id'];

//mengambil data
$query = mysqli_query($koneksi, "select * from items_tb where item_id='$item_id'");
$databarang = mysqli_fetch_array($query);
$data = array(
            'name'      =>  @$databarang['name'],
            'stok'      =>  @$databarang['stok'],);

//tampil data
echo json_encode($data);
?>