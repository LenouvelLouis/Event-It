<?php
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
?>