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
function getInfoUser()
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
    $password = isset($_POST['password']) ? $_POST['password'] : null;
    $confirmPassword = isset($_POST['confirm_password']) ? $_POST['confirm_password'] : null;
    $username = $_POST['username'];
    if ($password!= null && $password !== $confirmPassword) {
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
    $salt = '';
    if ($password != null) {
        require './service/hashService.php';
        $salt = generateSalt();
        $password = hashPassword($password, $salt);
    }
    updateInfoUser($id, $emailPost, $phone, $password, $username, $salt);
    $_SESSION['name'] = $username;
    $_SESSION['msgAcc'] = "Informations mises à jour avec succès";
    $_SESSION['msgType'] = "success";
    header('Location: ./?action=profile&controle=pages/profile');
}



?>