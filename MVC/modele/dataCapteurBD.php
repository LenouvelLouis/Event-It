<?php
function temperatureToDB($id_capteur, $valeur, $temps)
{
    require('./modele/connectSQL.php'); // Include the connection to the database
    $sql = "INSERT INTO `data_capteur_temperature` (id_capteur, valeur, temps) VALUES (:id_capteur, :valeur, :temps)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_capteur', $id_capteur);
        $commande->bindParam(':valeur', $valeur);
        $commande->bindParam(':temps', $temps);
        $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

function soundToDB($id_capteur, $valeur, $temps)
{
    require('./modele/connectSQL.php'); // Include the connection to the database
    $sql = "INSERT INTO `data_capteur_son` (id_capteur, valeur, temps) VALUES (:id_capteur, :valeur, :temps)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_capteur', $id_capteur);
        $commande->bindParam(':valeur', $valeur);
        $commande->bindParam(':temps', $temps);
        $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}