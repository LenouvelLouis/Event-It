<?php
/**
 * Fonction de création d'un utilisateur
 * @param $name
 * @param $email
 * @param $phone
 * @param $password
 * @param $status
 * @param $salt
 * @return void
 */
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

/**
 * Fonction de récupération des informations de l'utilisateur
 * @param $email
 * @param $password
 * @return mixed|void
 */
function signIn($email, $password){
    require('./modele/connectSQL.php');
    $sql = "SELECT * FROM `user` WHERE email = :email AND password = :password";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->bindParam(':password', $password);
        $commande->execute();
        return $commande->fetch();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de vérification de l'existence de l'email
 * @param $email
 * @return mixed|void
 */
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

/**
 * Fonction de récupération du sel
 * @param $email
 * @return string
 */
function getSalt($email): string
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

/**
 * Fonction de récupération de l'utilisateur
 * @param $id
 * @return void
 */
function getUser($id): void
{
    require('./modele/connectSQL.php');
    $sql = "SELECT * FROM `user` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $res = $commande->fetch();
        echo(json_encode($res));
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de récupération du mot de passe crypté
 * @param string $email
 * @return string
 */
function getHashPassword(string $email): string{
    require('./modele/connectSQL.php');
    $sql = "SELECT password FROM `user` WHERE email = :email";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->execute();
        $result = $commande->fetch();
        return $result['password'];
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de mise à jour des informations de l'utilisateur
 * @param mixed $id
 * @param mixed $email
 * @param mixed $phone
 * @param string|null $password
 * @param string $username
 * @return void
 */
function updateInfoUser(mixed $id, mixed $email, mixed $phone, ?string $password, string $username, string $salt)
{
    require('./modele/connectSQL.php');
    if ($password != null) {
        $sql = "UPDATE `user` SET email = :email, phone = :phone, password = :password, name = :username, salt = :salt WHERE id = :id";
    } else {
        $sql = "UPDATE `user` SET email = :email, phone = :phone, name = :username WHERE id = :id";
    }
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->bindParam(':phone', $phone);
        if ($password != null) {
            $commande->bindParam(':password', $password);
            $commande->bindParam(':salt', $salt);
        }
        $commande->bindParam(':id', $id);
        $commande->bindParam(':username', $username);
        $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}
/**
 * Fonction de récupération de l'email
 * @param mixed $id
 * @return string
 */
function getEmail(mixed $id): string
{
    require('./modele/connectSQL.php');
    $sql = "SELECT email FROM `user` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $result = $commande->fetch();
        return $result['email'];
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }

}

?>