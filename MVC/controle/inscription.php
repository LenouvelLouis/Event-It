<?php
function inscription(){
    $name = isset($_POST['name'])?($_POST['name']):'';
    $email = isset($_POST['email'])?($_POST['email']):'';
    $phone = isset($_POST['phone'])?($_POST['phone']):'';
    $password = isset($_POST['password'])?($_POST['password']):'';
    $status = isset($_POST['status'])?($_POST['status']):getStatus($email);
	$_SESSION['email']=$email;
    require('./modele/utilisateurBD.php');
    signUp($name,$email,$phone,$password,$status);
    $msgAcc = "Compte créé, vous pouvez vous connecter";
    $_SESSION['msgAcc'] = $msgAcc;
    //require('./vue/home/home.tpl');
	//var_dump($login );
	//var_dump($email);
	// IMPORTANT Rappel PDO
	//PDOStatement::prepare() et PDOStatement::execute()
	//pour préparer des requêtes et les exécuter qu'elles rendent OU PAS des lignes

}

function getStatus($email)
{
    //$index_at = strpos($email, "@");
    //$domaine = substr($email, $index_at+1);
    return "user";
}

?>