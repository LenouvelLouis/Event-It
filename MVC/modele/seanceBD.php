<?php

function get_film()
{
    require('./modele/connectSQL.php');
    $sql = "SELECT id, titre, image FROM `film`";
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

function ajout_seance($iDcinema,$iDfilm,$iDsalle,$typeFilm,$heure){
    require('./modele/connectSQL.php');
    $sql = "INSERT INTO `seance` (`id_cinéma`, `id_film`, `id_salle`, `type_affichage`, `horairedébut`) VALUES (:id_cinema, :id_film, :id_salle, :type_affichage, :horairedebut)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_cinema', $iDcinema);
        $commande->bindParam(':id_film', $iDfilm);
        $commande->bindParam(':id_salle', $iDsalle);
        $commande->bindParam(':type_affichage', $typeFilm);
        $commande->bindParam(':horairedebut', $heure);
        $commande->execute();
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