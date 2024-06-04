<?php
function statseance(){
  if(!isset($_SESSION['id']) && $_SESSION['status'] != "admin"){
    header("Location: ./?path=pages/accueil");
  }
  require("./vue/statseance/statseance.tpl");
}

/* Je vais utiliser AJAX pour appeler les fonctions php depuis le fichier js en fonction des options prises dans les menus déroulants,
et avec php je vais faire le lien vers la base de données pour ensuite renvoyer les données au JavaScript */

$statpage=fopen("./vue/statseance/statseance.tpl","r");
fread($statpage,filesize("./vue/statseance/statseance.tpl"));

/*
$cinema_son = 
$seance_son = 
$capteur_son = 

$cinema_temp = 
$seance_temp = 
$capteur_temp = 
*/

/*Cette fonction va me servir a recuperer les données quand c'est le cinema qui change, 
et par défaut on affichera la séance 1 avec tous les capteurs */
function checkCinema(){
}

/*Cette fonction va me servir a recuperer les données quand c'est la séance qui change, 
et par défaut on affichera tous les capteurs */
function checkSeance(){
}

/*Cette fonction va me servir a recuperer les données quand c'est le capteur qui change */
function checkCapteur(){
  $sql = "SELECT id FROM capteur";
  /* 
  id des capteurs du cinema selectionne = id - (cinema id - 1) x 3
  pour le cinema 1 les capteurs ont les id 1,2,3 --> capteur 1 = 1 - (1-1)x3, capteur 2 = 2 - (1-1)x3.....
  pour le cinema 2 les cpateurs ont les id 4,5,6 --> capteur 1 = 4 - (2-1)x3, capteur 2 = 5 - (2-1)x3.....
  ....
  */
}

fclose($statpage);
?>
