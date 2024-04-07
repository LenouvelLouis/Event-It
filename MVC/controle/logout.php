<?php

function deconnexion(){
    $defaultUrl = "./index.php?controle=pages/accueil&action=accueil";
    $referrerUrl = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : $defaultUrl;

    // Liste des pages à exclure
    $excludedPages = ["profile", "ajoutfilm", "ajoutseance"];

    foreach ($excludedPages as $page) {
        if (strpos($referrerUrl, $page) !== false) {
            $referrerUrl = $defaultUrl;
            break;
        }
    }

    header("Location:" . $referrerUrl);
}
?>