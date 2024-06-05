<?php

/**
 * Fonction de récupération des films
 * @return void
 */
function get_film()
{
    require('./modele/connectSQL.php');
    $sql = "SELECT id, titre, image,duree FROM `film`";
    try {
        $commande = $pdo->prepare($sql);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        echo(json_encode($result));
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function get_seance($id){
    require('./modele/connectSQL.php');
    $sql = "SELECT 
    seance.id AS id_seance,
    seance.horairedébut,
    seance.id_salle,
    seance.date,
    seance.type_affichage,
    film.id AS film_id,
    film.image AS film_image,
    film.titre AS film_titre,
        cinema.id AS cinema_id,
    cinema.nom AS cinema_nom
FROM
    seance
JOIN
    film ON seance.id_film = film.id
JOIN
    cinema ON seance.id_cinéma = cinema.id
WHERE
    seance.id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction de récupération des séances
 * @param $id
 * @param $iDcinema
 * @param $iDfilm
 * @param $iDsalle
 * @param $typeFilm
 * @param $heure
 * @param $date
 * @return void
 */
function edit_seance( $id, $iDcinema, $iDfilm, $iDsalle, $typeFilm, $heure, $date)
{
    require('./modele/connectSQL.php');
    $sql = "UPDATE `seance` SET `id_cinéma` = :id_cinema, `id_film` = :id_film, `id_salle` = :id_salle, `type_affichage` = :type_affichage, `horairedébut` = :horairedebut, `date` = :date WHERE `id` = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->bindParam(':id_cinema', $iDcinema);
        $commande->bindParam(':id_film', $iDfilm);
        $commande->bindParam(':id_salle', $iDsalle);
        $commande->bindParam(':type_affichage', $typeFilm);
        $commande->bindParam(':horairedebut', $heure);
        $commande->bindParam(':date', $date);
        $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de update : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de suppression d'une séance
 * @param $id
 * @return void
 */
function delete_seance($id){
    require('./modele/connectSQL.php');
    $sql = "DELETE FROM `seance` WHERE `id` = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de delete : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de récupération des cinémas
 * @return void
 */
function get_cinema()
{
    require('./modele/connectSQL.php');
    $sql = "SELECT id, nom, type_cine FROM `cinema`";
    try {
        $commande = $pdo->prepare($sql);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        echo(json_encode($result));
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de vérification de l'existence d'une séance
 * @param $iDcinema
 * @param $iDfilm
 * @param $iDsalle
 * @param $heure
 * @return bool|void
 */
function seanceAlreadyExist( $iDcinema, $iDfilm, $iDsalle, $heure, $date, $typeFilm)
{
    require('./modele/connectSQL.php');
    $sql = "SELECT * FROM `seance` WHERE `id_cinéma` = :id_cinema AND `id_film` = :id_film AND `id_salle` = :id_salle AND `horairedébut` = :horairedebut AND `date` = :date AND `type_affichage` = :type_affichage";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_cinema', $iDcinema);
        $commande->bindParam(':id_film', $iDfilm);
        $commande->bindParam(':id_salle', $iDsalle);
        $commande->bindParam(':horairedebut', $heure);
        $commande->bindParam(':date', $date);
        $commande->bindParam(':type_affichage', $typeFilm);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        if (count($result) > 0) {
            return true;
        } else {
            return false;
        }
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

/**
 * Fonction de récupération des salles
 * @return void
 */
function get_salle()
{
    require('./modele/connectSQL.php');
    $sql = "SELECT id, nom, id_cinéma FROM `salle`";
    try {
        $commande = $pdo->prepare($sql);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        echo(json_encode($result));
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction d'ajout de seance'
 * @param $iDcinema
 * @param $iDfilm
 * @param $iDsalle
 * @param $typeFilm
 * @param $heure
 * @return void
 */
function ajout_seance($iDcinema,$iDfilm,$iDsalle,$typeFilm,$heure,$date){
    require('./modele/connectSQL.php');
    $sql = "INSERT INTO `seance` (`id_cinéma`, `id_film`, `id_salle`, `type_affichage`, `horairedébut`, `date`) VALUES (:id_cinema, :id_film, :id_salle, :type_affichage, :horairedebut, :date)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_cinema', $iDcinema);
        $commande->bindParam(':id_film', $iDfilm);
        $commande->bindParam(':id_salle', $iDsalle);
        $commande->bindParam(':type_affichage', $typeFilm);
        $commande->bindParam(':horairedebut', $heure);
        $commande->bindParam(':date', $date);
        $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function getSeanceBySalle($iDsalle)
{
    require('./modele/connectSQL.php');
    $sql = "SELECT 
    seance.id AS id_seance,
    seance.horairedébut,
    seance.id_salle,
    seance.date,
    film.id AS film_id,
    film.titre AS film_titre,
    film.synopsis AS film_synopsis,
    film.duree AS film_duree,
    film.realisateur AS film_realisateur,
    film.acteurs AS film_acteurs,
    film.genre AS film_genre
FROM 
    seance
JOIN 
    film ON seance.id_film = film.id
WHERE 
    seance.id_salle = :id_salle;";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_salle', $iDsalle);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function get_seance(){
    require('./modele/connectSQL.php');
    $sql = "SELECT * FROM `seance`";
    try {
        $commande = $pdo->prepare($sql);
        $commande->execute();
        $result = $commande->fetchAll(PDO::FETCH_ASSOC);
        echo(json_encode($result));
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

?>