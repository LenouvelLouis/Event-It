<?php
/**
 * Fonction d'ajout de discussion
 * @return void
 */
function ajoutdiscussion(){
    if(isset($_SESSION['id'])){
        $titre = $_POST['titre'];
        $titre= strtolower($titre);
        require './modele/forumBD.php';
        if(disscusionExist($titre)){
            $msgErr = "Discussion déjà existante";
            $_SESSION['msgErr'] = $msgErr;
            $_SESSION['msgType'] = 'error';
            $url = "./?path=pages/forum";
            header("Location:" . $url);
            die();
        }
        else{
            $idUtilisateur = $_SESSION['id'];
            $date = date('Y-m-d H:i:s');
            $id = discussionToBD($titre,$idUtilisateur,$date);
            $msgAcc = "Discussion ajoutée";
            $_SESSION['msgAcc'] = $msgAcc;
            $_SESSION['msgType'] = 'success';
            $url = "./?path=pages/forum&id=".$id;
            header("Location:" . $url);
        }
    }
    else{
        $msgErr = "Vous devez être connecté pour ajouter une discussion";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = "./?path=pages/forum";
        header("Location:" . $url);
    }
}

/**
 * Fonction de récupération des discussions
 * @return void
 */
function getDiscussions(){
    require './modele/forumBD.php';
    $disscusions =getDiscussionsBD();
    for ($i=0; $i < count($disscusions); $i++) {
        $idUtilisateur = $disscusions[$i]['creator'];
        require_once('./modele/utilisateurBD.php');
        $disscusions[$i]['user'] = getNameUser($idUtilisateur);
        $disscusions[$i]['user']= json_decode($disscusions[$i]['user']);
        if (isset($_SESSION['id']) && $disscusions[$i]['user']->id == $_SESSION['id']) {
            $disscusions[$i]['user']->isUser = true;
        } else {
            $disscusions[$i]['user']->isUser = false;
        }
    }
    echo json_encode($disscusions);
}

/**
 * Fonction d'ajout de message
 * @return void
 */
function ajoutmessage(){
    if(isset($_SESSION['id'])){
        $idDiscussion = $_GET['id'];
        $message = $_POST['message'];
        $idUtilisateur = $_SESSION['id'];
        $date = date('Y-m-d H:i:s');
        require './modele/forumBD.php';
        ajoutMessageBD($idDiscussion,$message,$idUtilisateur,$date);
        $url = "./?path=pages/forum&id=".$idDiscussion;
        header("Location:" . $url);
    }
    else{
        $msgErr = "Vous devez être connecté pour ajouter un message";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = "./?path=pages/forum";
        header("Location:" . $url);
    }
}

/**
 * Fonction de récupération des messages
 * @return void
 */
function getMessages(){
    $id = $_GET['id'];
    require './modele/forumBD.php';
    $messages =getMessagesBD($id);
    for ($i=0; $i < count($messages); $i++) {
        $idUtilisateur = $messages[$i]['idUser'];
        require_once('./modele/utilisateurBD.php');
        $messages[$i]['user'] = getNameUser($idUtilisateur);
        $messages[$i]['user']= json_decode($messages[$i]['user']);
        if (isset($_SESSION['id']) && $messages[$i]['user']->id == $_SESSION['id']) {
            $messages[$i]['user']->isUser = true;
        } else {
            $messages[$i]['user']->isUser = false;
        }
    }
    echo json_encode($messages);
}

/**
 * Fonction de suppression d'une discussion
 * @return void
 */
function deleteQuestion(){
    $id = $_GET['id'];
    require './modele/forumBD.php';
    deleteMessageBD($id);
    deleteQuestionBD($id);
    $url = "./?path=pages/forum";
    header("Location:" . $url);

}
?>