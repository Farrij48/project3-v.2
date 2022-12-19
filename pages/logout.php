<?php
    session_start(); //inisialisasi session
    if(session_destroy()) {//menghapus session
        echo "<script>alert('Berhasil Logout.');window.location='sign_in.php';</script>"; //jika berhasil maka akan diredirect ke file index.php
        
    }
?>