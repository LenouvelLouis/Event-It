<?php

	function signUp($name,$email,$phone,$password,$status,$salt) {
        require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
        $sql="Insert into `user` (name,email,phone,password,status,salt) values (:name,:email,:phone,:password,:status,:salt)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':name', $name);
            $commande->bindParam(':email', $email);
            $commande->bindParam(':phone', $phone);
            $commande->bindParam(':password', $password);
            $commande->bindParam(':status', $status);
            $commande->bindParam(':salt', $salt);
			$commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
function signIn($email, $password){
    require('./modele/connectSQL.php');
    $sql = "SELECT * FROM `user` WHERE email = :email AND password = :password";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->bindParam(':password', $password);
        $commande->execute();
        $result = $commande->fetch();
        return $result;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}
function emailExist($email){
    require('./modele/connectSQL.php');
    $sql = "SELECT * FROM `user` WHERE email = :email";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->execute();
        $result = $commande->fetch();
        return $result;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }

}
function getSalt($email)
{
    require('./modele/connectSQL.php');
    $sql = "SELECT salt FROM `user` WHERE email = :email";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->execute();
        $result = $commande->fetch();
        return $result['salt'];
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}
?>