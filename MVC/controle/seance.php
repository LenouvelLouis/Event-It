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

?>