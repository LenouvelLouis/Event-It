<?php

/**
 * Fonction d'ajout de seance'
 * @return void
 */

 function getFilm(){
    require('./modele/seanceBD.php');
    get_film();
 }

 function getCinema(){
    require('./modele/seanceBD.php');
    get_cinema();
 }

 function getSalle(){
   require('./modele/seanceBD.php');
   get_salle();
 }

 function ajoutSeance(){

  require('./controle/utilisateur.php');
  closedNotifier();
  $cinema =isset($_POST['cinema'])?json_decode($_POST['cinema'],true):'';
  $film = isset($_POST['film'])?json_decode($_POST['film'],true):'';
  $salle = isset($_POST['salle'])?json_decode($_POST['salle'],true):'';
  $affiche = isset($_POST['chek_affiche'])?($_POST['chek_affiche']):'';
  $nouveautes = isset($_POST['chek_nouveautes'])?($_POST['chek_nouveautes']):'';
  $heure = isset($_POST['heure'])?($_POST['heure']):'';

  if($film==null || $cinema==null || $salle==null || $heure==null || $affiche==null){
    $_SESSION['msgErr'] = "Veuillez remplir tous les champs";
    $_SESSION['msgType'] = "error";
    header('Location: ./?path=pages/ajoutseance');
    return;
  }

  if($nouveautes=='on'){
    $typeFilm = "nouveautes";}
    else{
    $typeFilm = "affiche";
  }
  require('./modele/seanceBD.php');
  ajout_seance($cinema['id'],$film['id'],$salle['id'],$typeFilm,$heure);
  $_SESSION['msgAcc'] = "Votre séance a bien était crée";
  $_SESSION['msgType'] = "success";
  header('Location: ./?path=pages/ajoutseance');
 }

?>