<?php
/**
 * Fonction de fermeture des notifications
 * @return void
 */
function closedNotifier(){
    unset($_SESSION['msgAcc']);
    unset($_SESSION['msgErr']);
    unset($_SESSION['msgType']);
}

/**
 * Fonction de récupération des informations de l'utilisateur
 * @return void
 */
function getInfoUser(): void
{
    require('./modele/utilisateurBD.php');
    getUser($_SESSION['id']);
}
function updateuser()
{
    closedNotifier();
    $emailPost = $_POST['email'];
    $phone = $_POST['phone'];
    $id = $_SESSION['id'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm_password'];
    $username = $_POST['username'];
    if ($password != $confirmPassword) {
        $_SESSION['msgErr'] = "Les mots de passe ne correspondent pas";
        $_SESSION['msgType'] = "error";
        header('Location: ./?action=profile&controle=pages/profile');
        exit();
    }
    require('./modele/utilisateurBD.php');
    $email = getEmail($id);
    if($emailPost != $email && emailExist($emailPost)){
        $_SESSION['msgErr'] = "Cet email existe déjà";
        $_SESSION['msgType'] = "error";
        header('Location: ./?action=profile&controle=pages/profile');
        exit();
    }
    $salt = getSalt($emailPost);
    require './service/hashService.php';
    $password = hashPassword($password, $salt);
    updateInfoUser($id, $emailPost, $phone, $password, $username);
    $_SESSION['name'] = $username;
    $_SESSION['msgAcc'] = "Informations mises à jour avec succès";
    $_SESSION['msgType'] = "success";
    header('Location: ./?action=profile&controle=pages/profile');
}



?>