<?php

function CinemaAlreadyExist($nom){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT * FROM `cinema` WHERE nom = :nom";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':nom', $nom);
        $commande->execute();
        $result = $commande->fetch();
        if($result){
            return true;
        }else{
            return false;
        }
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

function salleToDB($nomSalle, $idcinema){
    require('./modele/connectSQL.php');
    $sql = "INSERT INTO `salle` (nom, id_cinema) VALUES (:nom, :id_cinema)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':nom', $nomSalle);
        $commande->bindParam(':id_cinema', $idcinema);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

function cinemaToDB($nom, $adresse, $telephone, $email, $typeCine, $handicape, $sourd, $malvoyant, $newNomImage){
    require('./modele/connectSQL.php');
    $sql = "INSERT INTO `cinema` (nom, adresse, telephone, mail, type_cine, handicape, sourd, malvoyant, image) VALUES (:nom, :adresse, :telephone, :mail, :type_cine, :handicape, :sourd, :malvoyant, :image)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':nom', $nom);
        $commande->bindParam(':adresse', $adresse);
        $commande->bindParam(':telephone', $telephone);
        $commande->bindParam(':mail', $email);
        $commande->bindParam(':type_cine', $typeCine);
        $commande->bindParam(':handicape', $handicape);
        $commande->bindParam(':sourd', $sourd);
        $commande->bindParam(':malvoyant', $malvoyant);
        $commande->bindParam(':image', $newNomImage);
        $commande->execute();
        return $pdo->lastInsertId();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

?>