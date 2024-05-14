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

   $cinema = isset($_POST['cinema'])?($_POST['cinema']):'';
   $film = isset($_POST['film'])?($_POST['film']):'';
   $salle = isset($_POST['salle'])?($_POST['salle']):'';
   $affichage = isset($_POST['affichage'])?($_POST['affichage']):'';
   $heure = isset($_POST['heure'])?($_POST['heure']):'';

   require('./modele/seanceBD.php');

   ajout_seance($cinema,$film,$salle,$affichage,$heure);

   $_SESSION['msgAcc'] = "Votre séance a bien était crée";
   $_SESSION['msgType'] = "success";
   header('Location: ./?path=pages/ajoutseance');
 }

?>