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
 * Fonction de récupération des utilisateurs
 * @return void
 */
function getUsers(){
    require('./modele/utilisateurBD.php');
    $users = getAllUsers();
    echo json_encode($users);

}

/**
 * Fonction de récupération des informations de l'utilisateur
 * @return void
 */
function getInfoUser()
{
    require('./modele/utilisateurBD.php');
    $user =getUser($_SESSION['id']);
    echo $user;
}

/**
 * Fonction de vérification si l'utilisateur est admin
 * @return void
 */
function isAdmin(){
    echo $_SESSION['status'] === 'admin';

}

/**
 * Fonction de suppression de l'utilisateur
 * @return void
 */
function deleteUser(){
    $id = isset($_GET['id'])?$_GET['id']:'';
    require('./modele/utilisateurBD.php');
    deleteUserBD($id);
    if($id == $_SESSION['id']){
        require './controle/logout.php';
        deconnexion();
    }
    header('Location: ./?path=pages/users');
}

/**
 * Fonction de mise à jour des informations de l'utilisateur
 * @return void
 */
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
        header('Location: ./?path=pages/profile');
        exit();
    }
    require('./modele/utilisateurBD.php');
    $email = getEmail($id);
    if($emailPost != $email && emailExist($emailPost)){
        $_SESSION['msgErr'] = "Cet email existe déjà";
        $_SESSION['msgType'] = "error";
        header('Location: ./?path=pages/profile');
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
    header('Location: ./?path=pages/profile');
}

?>