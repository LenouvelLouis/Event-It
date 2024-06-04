<?php

/**
 * Fonction d'ajout d'un film
 * @return void
 */
function ajoutfilm(){
    $titre = isset($_POST['titre']) ? $_POST['titre'] : '';
    $titre=strtolower( $titre);
    $duree = isset($_POST['duree']) ? $_POST['duree'] : '';
    $realisateur = isset($_POST['realisateur']) ? $_POST['realisateur'] : '';
    $acteurs = isset($_POST['acteurs']) ? $_POST['acteurs'] : '';
    $synopsis = isset($_POST['synopsis']) ? $_POST['synopsis'] : '';
    $genre = isset($_POST['genre']) ? $_POST['genre'] : '';
    if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $image = $_FILES['image'];
        $nomImage = $_FILES['image']['name'];
        $tmpName = $_FILES['image']['tmp_name'];
        $directory = './vue/img/films/';
        $extension = pathinfo($nomImage, PATHINFO_EXTENSION);
        $newNomImage = str_replace(' ', '_', $titre) . '.' . $extension;
        if (!is_dir($directory)) {
            mkdir($directory, 0755, true);
        }
        require './modele/filmBD.php';
        if (filmAlreadyExist($titre)) {
            $msgErr = "Ce film existe déjà";
            $_SESSION['msgErr'] = $msgErr;
            $_SESSION['msgType'] = 'error';
            $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
            header("Location:" . $url);
            die();
        }
        if(move_uploaded_file($tmpName, $directory . $newNomImage)){
            filmToDB($titre, $duree, $realisateur, $acteurs, $synopsis, $genre, $newNomImage);
            $msgAcc = "Film ajouté";
            $_SESSION['msgAcc'] = $msgAcc;
            $_SESSION['msgType'] = 'success';
            $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
            header("Location:" . $url);
        }

    }
    else{
        $msgErr = "Veuillez ajouter une image";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        die();
    }

}

/**
 * Fonction de récupération des informations d'un film
 * @return void
 */
function getInfosFilm()
{
    $id = $_GET['id'];
    checkId($id);
    require './modele/filmBD.php';
    getFilm($id);
}

/**
 * Fonction de vérification de l'existence d'un film
 * @param $id
 * @return void
 */
function checkId($id)
{
    if (!isset($id)) {
        $msgErr = "Aucun film sélectionné";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        die();
    }
    if (!is_numeric($id)) {
        $msgErr = "Aucun film sélectionné";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        die();
    }
}

/**
 * Fonction de modification d'un film
 * @return void
 */
function editfilm()
{
    $id = isset($_GET['id']) ? $_GET['id'] : '';
    checkId($id);
    $titre = isset($_POST['titre']) ? $_POST['titre'] : '';
    $titre = strtolower($titre);
    $duree = isset($_POST['duree']) ? $_POST['duree'] : '';
    $realisateur = isset($_POST['realisateur']) ? $_POST['realisateur'] : '';
    $acteurs = isset($_POST['acteurs']) ? $_POST['acteurs'] : '';
    $synopsis = isset($_POST['synopsis']) ? $_POST['synopsis'] : '';
    $genre = isset($_POST['genre']) ? $_POST['genre'] : '';
    $directory = './vue/img/films/';
    require './modele/filmBD.php';
    $imgNameAlreadyExist = getImgmName($id);
    $baseName = pathinfo($imgNameAlreadyExist, PATHINFO_FILENAME);
    $titreFilmAlreadyExist = str_replace('_', ' ', $baseName);
    if(!isset($_FILES['image']) || $_FILES['image']['error'] == 4){
        $extension = pathinfo($imgNameAlreadyExist, PATHINFO_EXTENSION);
        $newNomImage = str_replace(' ', '_', $titre) . '.' . $extension;
        rename($directory . $imgNameAlreadyExist, $directory . $newNomImage);
        updateFilm($id, $titre, $duree, $realisateur, $acteurs, $synopsis, $genre, $newNomImage);
        $msgAcc = "Film modifié";
        $_SESSION['msgAcc'] = $msgAcc;
        $_SESSION['msgType'] = 'success';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
    }
    else{
        $image = $_FILES['image'];
        $nomImage = $_FILES['image']['name'];
        $tmpName = $_FILES['image']['tmp_name'];
        $extension = pathinfo($nomImage, PATHINFO_EXTENSION);
        $newNomImage = str_replace(' ', '_', $titre) . '.' . $extension;
        unlink($directory . $imgNameAlreadyExist);
        if (move_uploaded_file($tmpName, $directory . $newNomImage)) {
            updateFilm($id, $titre, $duree, $realisateur, $acteurs, $synopsis, $genre, $newNomImage);
            $msgAcc = "Film modifié";
            $_SESSION['msgAcc'] = $msgAcc;
            $_SESSION['msgType'] = 'success';
            $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
            header("Location:" . $url);
        }
    }

}

/**
 * Fonction de suppression d'un film
 * @return void
 */
function deleteFilm(){
    $id = isset($_GET['id']) ? $_GET['id'] : '';
    checkId($id);
    require './modele/filmBD.php';
    $imgName = getImgmName($id);
    $directory = './vue/img/films/';
    unlink($directory . $imgName);
    deleteFilmBD($id);
    $msgAcc = "Film supprimé";
    $_SESSION['msgAcc'] = $msgAcc;
    $_SESSION['msgType'] = 'success';
    $url ="./?path=pages/accueil";
    header("Location:" . $url);

}



?>