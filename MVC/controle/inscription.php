<?php
function inscription(){
    $name = isset($_POST['nameRegister'])?($_POST['nameRegister']):'';
    $email = isset($_POST['emailRegister'])?($_POST['emailRegister']):'';
    $phone = isset($_POST['phoneRegister'])?($_POST['phoneRegister']):'';
    $password = isset($_POST['passwordRegister'])?($_POST['passwordRegister']):'';
    $status = getStatus($email);
    require('./modele/utilisateurBD.php');
    if(userExist($email)){
        $msgErr = "Cet email est déjà utilisé";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
    }
    else{
        signUp($name,$email,$phone,$password,$status);
        $msgAcc = "Compte créé, vous pouvez vous connecter";
        $_SESSION['msgAcc'] = $msgAcc;
        $_SESSION['msgType'] = 'success';
    }
    $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./index.php?controle=pages/accueil&action=accueil";
    header("Location:" . $url);

    //require('./vue/home/home.tpl');
	//var_dump($login );
	//var_dump($email);
	// IMPORTANT Rappel PDO
	//PDOStatement::prepare() et PDOStatement::execute()
	//pour préparer des requêtes et les exécuter qu'elles rendent OU PAS des lignes

}

function userExist($email)
{
    return emailExist($email);
}



function getStatus($email)
{
    //$index_at = strpos($email, "@");
    //$domaine = substr($email, $index_at+1);
    return "user";
}

?>