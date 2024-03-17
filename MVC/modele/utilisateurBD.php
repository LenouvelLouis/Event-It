<?php
    function verif_ident($login,$mdp) {
		global $resId;
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql="SELECT logUser(:log,:mdp) FROM `utilisateurs`";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':log', $login);
			$commande->bindParam(':mdp', $mdp);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}

		//echo json_encode($resultat);

		$param = "logUser('" . $login . "','" . $mdp . "')";
		
		if ($resultat[0][$param] == NULL) return false; 
		// ou if (empty($resultat)) return false;
		else {
			$resId = $resultat[0][$param];
			$_SESSION['id'] = $resId;
            
			//var_dump($renvoi) ; die();
			return true;
		}
	}
    function verifEmail($email) {
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql="SELECT emailExists(:mail) FROM `utilisateurs`";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':mail', $email);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		//var_dump($resultat);
		$param = "emailExists('" . $email . "')";
		$int = (int)$resultat[0][$param];
		
		if ($int == 0) return false; 
		else {
			return true;
		}
	}

	function verifLogin($login) {
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql="SELECT loginExists(:log) FROM `utilisateurs`";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':log', $login);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}

		$param = "loginExists('" . $login . "')";
		$int = (int)$resultat[0][$param];

		if ($int == 0) return false; 
		else {
			return true;
		}
	}

	function signIn($name,$email,$phone,$password) {
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