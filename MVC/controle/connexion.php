<?php
/**
 * Fonction de connexion
 * @return void
 */
function login(){
    $email = isset($_POST['emailLogin'])?($_POST['emailLogin']):'';
    $password = isset($_POST['passwordLogin'])?($_POST['passwordLogin']):'';
    require('./modele/utilisateurBD.php');
    $salt = getSalt($email);
    $password = custom_password_hash($password,$salt);
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
        var_dump($_SESSION['msgErr']);
    }
    $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./index.php?controle=pages/accueil&action=accueil";
    header("Location:" . $url);
}

/**
 * Fonction de génération de mot de passe crypté
 * @param $password
 * @param $salt
 * @return string
 */
function custom_password_hash($password,$salt): string
{
    $prefix = sprintf("$2y$%02d$", 10);
    return crypt($password, $prefix . $salt);
}

?>