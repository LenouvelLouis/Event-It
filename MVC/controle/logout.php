<?php
/**
 * Fonction de déconnexion
 * @return void
 */
function deconnexion(){
    session_destroy();
    $defaultUrl = "./?path=pages/accueil";
    header("Location:" . $defaultUrl);
}
?>