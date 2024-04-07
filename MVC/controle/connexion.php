<?php
function login(){
    $email = isset($_POST['emailLogin'])?($_POST['emailLogin']):'';
    $password = isset($_POST['passwordLogin'])?($_POST['passwordLogin']):'';
    require('./modele/utilisateurBD.php');
    $login = signIn($email,$password);
    if($login){
        $_SESSION['name']=$login['name'];
        $_SESSION['id']=$login['id'];
        $msgAcc = "Bienvenue ".$login['name'];
        $_SESSION['msgAcc'] = $msgAcc;
        $_SESSION['msgType'] = 'success';

    }else{
        $msgErr = "Email ou mot de passe incorrect";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
    }
    $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./index.php?controle=pages/accueil&action=accueil";
    header("Location:" . $url);
}


?>