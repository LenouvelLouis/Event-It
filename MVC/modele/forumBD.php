<?php
/**
 * Fonction de vérification de l'existence de la discussion
 * @param $titre
 * @return bool|void
 */
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

/**
 * Fonction d'ajout de discussion
 * @param $titre
 * @param $idUtilisateur
 * @param $date
 * @return mixed|void
 */
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

/**
 * Fonction de récupération des discussions
 * @return void
 */
function getDiscussionsBD(){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT * FROM `discussion-forum`";
    try {
        $commande = $pdo->prepare($sql);
        $commande->execute();
        $result = $commande->fetchAll();
        return $result;
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction d'ajout de message
 * @return void
 */
function ajoutMessageBD($idDiscussion,$message,$idUtilisateur,$date){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "INSERT INTO `message-forum`(`idDiscussion`, `message`, `idUser`, `date`) VALUES (:idDiscussion,:message,:idUtilisateur,:date)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idDiscussion', $idDiscussion);
        $commande->bindParam(':message', $message);
        $commande->bindParam(':idUtilisateur', $idUtilisateur);
        $commande->bindParam(':date', $date);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction de récupération des messages
 * @return mixed|void
 */
function getMessagesBD($id){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "SELECT * FROM `message-forum` WHERE idDiscussion = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
        $result = $commande->fetchAll();
        return $result;
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction de suppression de message d'une discussion
 * @param $id
 * @return void
 */
function deleteMessageBD($id){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "DELETE FROM `message-forum` WHERE idDiscussion = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}

/**
 * Fonction de suppression d'une discussion
 * @param $id
 * @return void
 */
function deleteQuestionBD($id){
    require('./modele/connectSQL.php'); // On inclut la connexion à la base de données
    $sql = "DELETE FROM `discussion-forum` WHERE id = :id";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $id);
        $commande->execute();
    }catch (PDOException $e) {
        echo utf8_encode("Echec de l'insert : " . $e->getMessage() . "\n");
        die();
    }

}
?>