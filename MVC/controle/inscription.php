<?php
function inscription(){
    $name = isset($_POST['name'])?($_POST['name']):'';
    $email = isset($_POST['email'])?($_POST['email']):'';
    $phone = isset($_POST['phone'])?($_POST['phone']):'';
    $password = isset($_POST['password'])?($_POST['password']):'';
	$_SESSION['email']=$email;
    require('./modele/utilisateurBD.php');
    signUp($name,$email,$phone,$password);
    $msgAcc = "Compte créé, vous pouvez vous connecter";
    $_SESSION['msgAcc'] = $msgAcc;
    //require('./vue/home/home.tpl');
	//var_dump($login );
	//var_dump($email);
	// IMPORTANT Rappel PDO
	//PDOStatement::prepare() et PDOStatement::execute()
	//pour préparer des requêtes et les exécuter qu'elles rendent OU PAS des lignes

}
?>