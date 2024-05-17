<?php
/**
 * Fonction de connexion
 * @return void
 */
function login(){
    $email = isset($_POST['emailLogin'])?($_POST['emailLogin']):'';
    $password = isset($_POST['passwordLogin'])?($_POST['passwordLogin']):'';
    require './controle/utilisateur.php';
    closedNotifier();
    require('./modele/utilisateurBD.php');
    if (empty($email) || empty($password)){
        $msgErr = "Veuillez remplir tous les champs";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        return;
    }
    $emailExist = emailExist($email);
    if (!$emailExist){
        $msgErr = "Email ou mot de passe incorrect";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        exit();
    }
    $salt = getSalt($email);
    $hashPassword = getHashPassword($email);
    require './service/hashService.php';
    $password = hashPassword($password,$salt);
    $login = signIn($email,$password);
    if($login){
        $_SESSION['name']=$login['name'];
        $_SESSION['id']=$login['id'];
        $_SESSION['status'] = $login['status'];
        $msgAcc = "Bienvenue ".$login['name'];
        $_SESSION['msgAcc'] = $msgAcc;
        $_SESSION['msgType'] = 'success';

    }else{
        $msgErr = "Email ou mot de passe incorrect";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        var_dump($_SESSION['msgErr']);
    }
    $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
    header("Location:" . $url);
}



?>