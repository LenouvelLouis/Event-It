<?php
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
        $directory = './vue/img/test/';
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

}



?>