<?php

function deconnexion(){
    session_destroy();
    $url="./index.php?controle=pages&action=accueil"; //redirection accueil
    header("Location:" . $url);
}
?>