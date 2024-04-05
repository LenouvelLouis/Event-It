<?php
function login(){
    $email = isset($_POST['email'])?($_POST['email']):'';
    $password = isset($_POST['password'])?($_POST['password']):'';
    require('./modele/utilisateurBD.php');
    $login = signIn($email,$password);
    if($login){
        $_SESSION['email']=$email;
        $_SESSION['status']=$login['status'];
        $_SESSION['name']=$login['name'];
        $_SESSION['id']=$login['id'];
    }else{
        $msgErr = "Email ou mot de passe incorrect";
        $_SESSION['msgErr'] = $msgErr;
    }

}


?>