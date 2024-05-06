<?php
function disscusionExist($titre){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT * FROM `discussion-forum` WHERE titre = :titre";
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

function discussionToBD($titre,$idUtilisateur,$date){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "INSERT INTO `discussion-forum`(`titre`, `creator`, `date`) VALUES (:titre,:idUtilisateur,:date)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':titre', $titre);
        $commande->bindParam(':idUtilisateur', $idUtilisateur);
        $commande->bindParam(':date', $date);
        $commande->execute();
        return $pdo->lastInsertId();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }
}
?>