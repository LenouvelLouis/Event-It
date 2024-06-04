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

function cinemaToDB($nom, $adresse, $telephone, $email, $nombreSalles, $typeCine, $handicape, $sourd, $malvoyant, $newNomImage){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "INSERT INTO `cinema` (nom, adresse, telephone, mail, nb_salle, type_cine, handicape, sourd, malvoyant, image) VALUES (:nom, :adresse, :telephone, :mail, :nb_salle, :type_cine, :handicape, :sourd, :malvoyant, :image)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':nom', $nom);
        $commande->bindParam(':adresse', $adresse);
        $commande->bindParam(':telephone', $telephone);
        $commande->bindParam(':mail', $email);
        $commande->bindParam(':nb_salle', $nombreSalles);
        $commande->bindParam(':type_cine', $typeCine);
        $commande->bindParam(':handicape', $handicape);
        $commande->bindParam(':sourd', $sourd);
        $commande->bindParam(':malvoyant', $malvoyant);
        $commande->bindParam(':image', $newNomImage);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

?>