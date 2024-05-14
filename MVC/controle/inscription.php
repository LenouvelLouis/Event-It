<?php
require './service/mailService.php';
/**
 * Fonction d'inscription
 * @return void
 */
function inscription(){
    $name = isset($_POST['nameRegister'])?($_POST['nameRegister']):'';
    $email = isset($_POST['emailRegister'])?($_POST['emailRegister']):'';
    $phone = isset($_POST['phoneRegister'])?($_POST['phoneRegister']):'';
    $password = isset($_POST['passwordRegister'])?($_POST['passwordRegister']):'';
    $status = getStatus($email);
    require './service/hashService.php';
    $salt = generateSalt();
    $password = hashPassword($password,$salt);
    require './controle/utilisateur.php';
    closedNotifier();
    require('./modele/utilisateurBD.php');
    if(emailExist($email)){
        $msgErr = "Cet email est déjà utilisé";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
    }
    else{
        signUp($name,$email,$phone,$password,$status,$salt);
        $msgAcc = "Compte créé, vous pouvez vous connecter";
        $_SESSION['msgAcc'] = $msgAcc;
        $_SESSION['msgType'] = 'success';
        $title = "Bienvenue sur Events-it";
        $message = "
<head>
    <title>Bienvenue sur Events-it</title>
    <meta charset='UTF-8'>
</head>
<body>
<h1>Bonjour $name,</h1>
<p>Votre compte a été créé avec succès. Vous pouvez désormais vous connecter sur notre <a href='events-it.go.yo.fr'>site</a>.</p>
<p>Bienvenue sur <a href='events-it.go.yo.fr'>Events IT</a>, votre portail incontournable pour toutes les dernières informations sur les événements cinématographiques. Conçu pour répondre à vos besoins spécifiques, notre site vous offre un accès facile à une multitude de fonctionnalités dédiées au monde passionnant du cinéma.</p>

<div style='display: flex; justify-content: center; margin-bottom: 20px;'>
   <img src='https://i.imgur.com/MpqS0He.png' alt='screen-site' style='width: 100%; max-width: 400px;'>
</div>

<p>Sur notre page d'accueil conviviale, plongez dans un univers de divertissement en découvrant les derniers films à l'affiche, les horaires des séances et les événements à ne pas manquer.</p>

<p>Grâce à notre fonction d'ajout, vous pouvez contribuer à enrichir notre base de données en soumettant des informations sur les cinémas, les films et les séances pour que d'autres passionnés puissent en profiter.Pour garantir une utilisation harmonieuse de notre plateforme, consultez nos Conditions Générales d’Utilisation qui détaillent nos politiques et directives.</p>

<div style='display: flex; justify-content: center; align-items: center'>
   <img src='https://i.imgur.com/niBDHGj.png' alt='liste-type-cinéma' style='width: 100%; max-width: 300px;'>

</div>
<p>Découvrez également des pages dédiées offrant des informations détaillées sur les cinémas et les films, vous permettant de trouver rapidement ce que vous cherchez. Besoin d'assistance ? Notre FAQ répondra à toutes vos questions fréquentes, tandis que notre formulaire de contact vous permettra d'entrer en communication directe avec un responsable compétent.</p>
<p>Cordialement,</p>
<div style='display: flex; align-items: center'>
    <img src='https://i.imgur.com/ISfug8A.png' alt='Logo site' style='width: 50%; max-width: 150px; margin-right:20px'>
    <h4>L'équipe Events-it</h4>
</div>
</body>
";
        sendMail($name,$email,$title,$message);

    }
    $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
    header("Location:" . $url);
	// IMPORTANT Rappel PDO
	//PDOStatement::prepare() et PDOStatement::execute()
	//pour préparer des requêtes et les exécuter qu'elles rendent OU PAS des lignes

}


/**
 * Fonction de récupération du status
 * @param $email
 * @return string
 */
function getStatus($email): string
{
    $index_at = strpos($email, "@");
    $domaine = substr($email, $index_at + 1);
    $title = "Demande de status";
    $status = 'user';
    $mail ='soundwave.soundcheck@gmail.com';
    switch ($domaine) {
        case "events-it.fr":
            $status= "admin";
            break;
        case "grandRex.fr":
            $status= "gestionnaire";
            break;
    }
    $message = "
<head>
    <title>Demande de status</title>
    <meta charset='UTF-8'>
</head>
<body>
<h1>Bonjour,</h1>
<p>Un utilisateur a demandé un status : $status , sur le site Events-it.</p>
<p>Voici son email : $email</p>
</body>
";

    sendMail('Louis',$mail,$title,$message);
    return "user";
}

?>