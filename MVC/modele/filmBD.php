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

/**
 * Fonction de récupération des informations d'un film
 * @param $id
 * @return mixed
 */
function getFilm($id){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT * FROM `film` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $result = $commande->fetch();
        echo json_encode($result);
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de récupération des informations d'un film
 * @param $id
 * @return mixed|void
 */
function getSeanceFilmBD($id){
    require('./modele/connectSQL.php');
    $sql = "SELECT seance.horairedébut, seance.id, seance.date, salle.nom as salle_nom, cinema.nom as cinema_nom 
            FROM seance 
            JOIN salle ON seance.id_salle = salle.id 
            JOIN cinema ON salle.id_cinema = cinema.id 
            WHERE seance.id_film = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}
/**
 * Fonction de récupération du nom d'un film
 * @param $id
 * @return mixed|void
 */
function getFilmName($id){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT titre FROM `film` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $res= $commande->fetch();
        return $res['titre'];
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de mise à jour d'un film
 * @param $id
 * @param string $titre
 * @param $duree
 * @param $realisateur
 * @param $acteurs
 * @param $synopsis
 * @param $genre
 * @param string $newNomImage
 * @return void
 */
function updateFilm($id, string $titre, $duree, $realisateur, $acteurs, $synopsis, $genre, string $newNomImage){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "UPDATE `film` SET titre = :titre, duree = :duree, realisateur = :realisateur, acteurs = :acteurs, synopsis = :synopsis, genre = :genre, image = :image WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':titre', $titre);
        $commande->bindParam(':duree', $duree);
        $commande->bindParam(':realisateur', $realisateur);
        $commande->bindParam(':acteurs', $acteurs);
        $commande->bindParam(':synopsis', $synopsis);
        $commande->bindParam(':genre', $genre);
        $commande->bindParam(':image', $newNomImage);
        $commande->bindParam(':id', $id);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction de récupération du nom d'une image
 * @param $id
 * @return mixed|void
 */
function getImgmName($id){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT image FROM `film` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $res= $commande->fetch();
        return $res['image'];
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction de suppression d'un film
 * @param $id
 * @return void
 */
function deleteFilmBD($id)
{
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "DELETE FROM `film` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}
{

}
?>