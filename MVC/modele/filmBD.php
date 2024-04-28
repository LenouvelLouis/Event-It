<?php
/**
 * Fonction d'ajout d'un film
 * @param $titre
 * @param $duree
 * @param $realisateur
 * @param $acteurs
 * @param $synopsis
 * @param $genre
 * @param $newNomImage
 * @return void
 */
function filmToDB($titre, $duree, $realisateur, $acteurs, $synopsis, $genre, $newNomImage){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "INSERT INTO `film` (titre, duree, realisateur, acteurs, synopsis, genre, image) VALUES (:titre, :duree, :realisateur, :acteurs, :synopsis, :genre, :image)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':titre', $titre);
        $commande->bindParam(':duree', $duree);
        $commande->bindParam(':realisateur', $realisateur);
        $commande->bindParam(':acteurs', $acteurs);
        $commande->bindParam(':synopsis', $synopsis);
        $commande->bindParam(':genre', $genre);
        $commande->bindParam(':image', $newNomImage);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de vérification de l'existence d'un film
 * @param $titre
 * @return bool|void
 */
function filmAlreadyExist($titre){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT * FROM `film` WHERE titre = :titre";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':titre', $titre);
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
?>