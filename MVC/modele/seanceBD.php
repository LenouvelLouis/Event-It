<?php

function get_film()
{
    require('./modele/connectSQL.php');
    $sql = "SELECT id, titre FROM `film`";
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

function ajout_seance($cinema,$film,$salle,$affichage,$heure)
{
    require('./modele/connectSQL.php');
    $sql="Insert into `seance` (horairedébut,id_cinéma,id_film,id_salle,type_affichage) values (:heure,:cinema,:film,:salle,:affichage)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':heure', $heure);
        $commande->bindParam(':cinema', $cinema);
        $commande->bindParam(':film', $film);
        $commande->bindParam(':salle', $salle);
        $commande->bindParam(':affichage', $affichage);
        $commande->execute();
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }

}

?>