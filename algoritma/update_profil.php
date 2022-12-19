<?php
session_start();

include "../koneksi.php";

//dapatkan data user dari form register
$user = [
	'id' => $_POST['id'],
	'name' => $_POST['name'],
	'username' => $_POST['username'],
	'password' => $_POST['password'],
	
];

//cek jika password tidak kosong, jika kosong jangan di update.
if($_POST['password'] !== ''){

   
}

//check apakah user dengan username tersebut ada di table users yang kecuali user tersebut.
$query = "select * from user_admin where username = ? and id != ? limit 1";
$stmt = $mysqli->stmt_init();
$stmt->prepare($query);
$stmt->bind_param('si', $user['username'], $user['id']);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_array(MYSQLI_ASSOC);

//jika username sudah ada, maka return kembali ke halaman profile.
if($row != null){
	$_SESSION['error'] = 'Username: '.$user['username'].' yang anda masukkan sudah ada di database.';
	$_SESSION['name'] = $_POST['name'];
	$_SESSION['password'] = $_POST['password'];
	header("Location: ../pages/profile.php");
	return;

}else{


	$stmt = $mysqli->stmt_init();

	//username unik. update data user di database.
	$query = "update user_admin set name = ?, username = ? where id = ?";

	//jika password dirubah
    if($_POST['password'] !== ''){
	    $password = password_hash($user['password'],PASSWORD_DEFAULT);
        $query = "update user_admin set name = ?, username = ? , password = ? where id = ?";
    }

	$stmt->prepare($query);

    //jika password dirubah
    if($_POST['password'] !== ''){
	    $stmt->bind_param('sssi', $user['name'],$user['username'],$password, $user['id']);
    }else{
	    $stmt->bind_param('ssi', $user['name'],$user['username'], $user['id']);
    }
	$result = $stmt->execute();
	$result = $stmt->affected_rows;
    if($result){
        $_SESSION['name'] = $_POST['name'];
        $_SESSION['username'] = $_POST['username'];
	    $_SESSION['message']  = 'Berhasil mengupdate data profile di sistem.';
        header("Location: ../pages/profile.php");
    }else{
        $_SESSION['error'] = 'Gagal update data profile.';
        header("Location: ../pages/profile.php");
    }
}

?>
