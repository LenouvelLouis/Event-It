<?php

	function signUp($name,$email,$phone,$password,$salt) {
        require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
        $sql="Insert into `user` (name,email,phone,password,salt) values (:name,:email,:phone,:password,:salt)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':name', $name);
            $commande->bindParam(':email', $email);
            $commande->bindParam(':phone', $phone);
            $commande->bindParam(':password', $password);
            $commande->bindParam(':salt', $salt);
			$commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
?>