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
    $imgName = getImgmName($id);
    $image = $_FILES['image'];
    $nomImage = $_FILES['image']['name'];
    $tmpName = $_FILES['image']['tmp_name'];
    $directory = './vue/img/films/';
    $extension = pathinfo($nomImage, PATHINFO_EXTENSION);
    $newNomImage = str_replace(' ', '_', $titre) . '.' . $extension;
    $filename = $directory . $imgName;
    if($tmpName){
        if (file_exists($filename)) {
            if (unlink($filename)) {
                if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {

                    if (!is_dir($directory)) {
                        mkdir($directory, 0755, true);
                    }
                    if (move_uploaded_file($tmpName, $directory . $newNomImage)) {
                        updateFilm($id, $titre, $duree, $realisateur, $acteurs, $synopsis, $genre, $newNomImage);
                        $msgAcc = "Film modifié";
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
            } else {
                $msgErr = "Erreur lors de la suppression de l'image";
                $_SESSION['msgErr'] = $msgErr;
                $_SESSION['msgType'] = 'error';
                $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
                header("Location:" . $url);
                die();
            }
    }
    }
    else{
        $extension = pathinfo($imgName, PATHINFO_EXTENSION);
        if (file_exists($filename)) {
            $newFilename = $directory . $newNomImage.$extension;
            var_dump($filename);
            var_dump($newFilename);
            rename($filename, $newFilename);
        }
        updateFilm($id, $titre, $duree, $realisateur, $acteurs, $synopsis, $genre, $newNomImage);
        $msgAcc = "Film modifié";
        $_SESSION['msgAcc'] = $msgAcc;
        $_SESSION['msgType'] = 'success';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
    }


}




?>