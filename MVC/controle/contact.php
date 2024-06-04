<?php
function sendemailcontact(){
    require './controle/utilisateur.php';
    closedNotifier();
    $name = $_POST['name'];
    $emailenvoi = $_POST['email'];
    $messageuser = $_POST['message'];
    if (empty($name) || empty($emailenvoi) || empty($messageuser)){
        $msgErr = "Veuillez remplir tous les champs";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        header('Location: ./?path=pages/contact');
        return;
    }
    if (!filter_var($emailenvoi, FILTER_VALIDATE_EMAIL)){
        $msgErr = "Email invalide";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        header('Location: ./?path=pages/contact');
        return;
    }
    $message = " Contact de : ".$name."<br> Email : ".$emailenvoi. "<br>Message : ".$messageuser;
    $email="soundwave.soundcheck@gmail.com";
    $title = "Contact";
    require './service/mailService.php';
    sendMail($name, $email, $title, $message);
    $msgAcc = "Votre message a bien été envoyé";
    $_SESSION['msgAcc'] = $msgAcc;
    $_SESSION['msgType'] = 'success';
    header('Location: ./?path=pages/contact');

}
?>