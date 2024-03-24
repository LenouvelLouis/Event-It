<?php

	function signUp($name,$email,$phone,$password) {
        var_dump($name);
        require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
        $sql="Insert into `user` (full_name,email,phone,password) values (:name,:email,:phone,:password)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':name', $name);
            $commande->bindParam(':email', $email);
            $commande->bindParam(':phone', $phone);
            $commande->bindParam(':password', $password);
			$commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
?>