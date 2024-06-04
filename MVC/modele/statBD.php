<?php
function getStatSeanceTemperature($id)
{
    require('./modele/connectSQL.php');
    $sql = "SELECT capteur.*, data_capteur_temperature.*
FROM seance
LEFT JOIN capteur ON seance.id_salle = capteur.id_salle
LEFT JOIN data_capteur_temperature ON capteur.id = data_capteur_temperature.id_capteur
WHERE seance.id = :id_seance";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_seance', $id); // Change ':id' to ':id_seance'
        $commande->execute();
        return $commande->fetchAll();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

function getStatSeanceSon($id){
    require('./modele/connectSQL.php');
    $sql = "SELECT capteur.*, data_capteur_son.*
FROM seance
LEFT JOIN capteur ON seance.id_salle = capteur.id_salle
LEFT JOIN data_capteur_son ON capteur.id = data_capteur_son.id_capteur
WHERE seance.id = :id_seance";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_seance', $id); // Change ':id' to ':id_seance'
        $commande->execute();
        return $commande->fetchAll();
    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}

?>