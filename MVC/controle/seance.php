<?php

/**
 * Fonction de récupération des films
 * @return void
 */
 function getFilm(){
     require_once('./modele/seanceBD.php');
    get_film();
 }

 function getSeance(){
     $id = isset($_GET['id'])?$_GET['id']:'';
        checkId($id);
     require_once('./modele/seanceBD.php');
        $seance =get_seance($id);
        if($seance==null){
            $_SESSION['msgErr'] = "Aucune séance sélectionné";
            $_SESSION['msgType'] = "error";
            header('Location: ./?path=pages/ajoutseance');
            return;
        }
     echo(json_encode($seance));

 }
/**
 * Fonction de vérification de l'existence d'un film
 * @param $id
 * @return void
 */
function checkId($id)
{
    if (!isset($id)) {
        $msgErr = "Aucune séance sélectionné";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        die();
    }
    if (!is_numeric($id)) {
        $msgErr = "Aucune séance sélectionné";
        $_SESSION['msgErr'] = $msgErr;
        $_SESSION['msgType'] = 'error';
        $url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "./?path=pages/accueil";
        header("Location:" . $url);
        die();
    }
}
/**
 * Fonction de récupération des cinémas
 * @return void
 */
 function getCinema(){
     require_once('./modele/seanceBD.php');
    get_cinema();
 }

 /**
  * Fonction de récupération des salles
  * @return void
  */
 function getSalle(){
     require_once('./modele/seanceBD.php');
   get_salle();
 }

/**
 * Fonction d'ajout d'une séance
 * @return void
 * @throws Exception
 */
 function ajoutSeance(){
  require('./controle/utilisateur.php');
  closedNotifier();
  $cinema =isset($_POST['cinema'])?json_decode($_POST['cinema'],true):'';
  $film = isset($_POST['film'])?json_decode($_POST['film'],true):'';
  $salle = isset($_POST['salle'])?json_decode($_POST['salle'],true):'';
  $affiche = isset($_POST['chek_affiche'])?($_POST['chek_affiche']):'';
  $nouveautes = isset($_POST['chek_nouveautes'])?($_POST['chek_nouveautes']):'';
  $heure = isset($_POST['heure'])?($_POST['heure']):'';
  $date = isset($_POST['date'])?($_POST['date']):'';
  if($film==null || $cinema==null || $salle==null || $heure==null || ($affiche==null && $nouveautes==null) || $date==null){
    $_SESSION['msgErr'] = "Veuillez remplir tous les champs";
    $_SESSION['msgType'] = "error";
    header('Location: ./?path=pages/ajoutseance');
    return;
  }
if($date<date('Y-m-d')){
    $_SESSION['msgErr'] = "Veuillez choisir une date valide";
    $_SESSION['msgType'] = "error";
    header('Location: ./?path=pages/ajoutseance');
    return;
  }


  if(checkFilmAlreadyInTime($film['id'],$heure,$salle['id'],$film['duree'],$date)){
    $_SESSION['msgErr'] = "Un film est déjà programmé à cette heure";
    $_SESSION['msgType'] = "error";
    header('Location: ./?path=pages/ajoutseance');
    return;
  }

  require_once('./modele/seanceBD.php');
  if(seanceAlreadyExist($cinema['id'],$film['id'],$salle['id'],$heure)){
    $_SESSION['msgErr'] = "Cette séance existe déjà";
    $_SESSION['msgType'] = "error";
    header('Location: ./?path=pages/ajoutseance');
    return;
  }
  if($nouveautes=='on'){
    $typeFilm = "nouveautes";}
    else{
    $typeFilm = "affiche";
  }
    require_once('./modele/seanceBD.php');
    ajout_seance($cinema['id'],$film['id'],$salle['id'],$typeFilm,$heure,$date);
  $_SESSION['msgAcc'] = "Votre séance a bien était crée";
  $_SESSION['msgType'] = "success";
  header('Location: ./?path=pages/ajoutseance');
 }

/**
 * @throws Exception
 */
function editseance(){
    require('./controle/utilisateur.php');
    closedNotifier();
    $id = isset($_GET['id'])?$_GET['id']:'';
    checkId($id);
     require_once('./modele/seanceBD.php');
    $seance = get_seance($id);
    if($seance==null){
        $_SESSION['msgErr'] = "Aucune séance sélectionné";
        $_SESSION['msgType'] = "error";
        header('Location: ./?path=pages/ajoutseance');
        return;
    }
    $cinema =isset($_POST['cinema'])?json_decode($_POST['cinema'],true):'';
    $film = isset($_POST['film'])?json_decode($_POST['film'],true):'';
    $salle = isset($_POST['salle'])?json_decode($_POST['salle'],true):'';
    $affiche = isset($_POST['chek_affiche'])?($_POST['chek_affiche']):'';
    $nouveautes = isset($_POST['chek_nouveautes'])?($_POST['chek_nouveautes']):'';
    $heure = isset($_POST['heure'])?($_POST['heure']):'';
    $date = isset($_POST['date'])?($_POST['date']):'';
    if($film==null || $cinema==null || $salle==null || $heure==null || ($affiche==null && $nouveautes==null) || $date==null){
      $_SESSION['msgErr'] = "Veuillez remplir tous les champs";
      $_SESSION['msgType'] = "error";
      header('Location: ./?path=pages/voirseance&id='.$id);
      return;
    }
  if($date<date('Y-m-d')){
      $_SESSION['msgErr'] = "Veuillez choisir une date valide";
      $_SESSION['msgType'] = "error";
      header('Location: ./?path=pages/voirseance&id='.$id);
      return;
    }

    if(($seance[0]['horairedébut'] != $heure || $seance[0]['date'] != $date || $seance[0]['film_id'] != $film['id'] ) && $seance[0]['salle_id'] != $salle['id']) {
        if (checkFilmAlreadyInTime($film['id'], $heure, $salle['id'], $film['duree'], $date)) {
            $_SESSION['msgErr'] = "Un film est déjà programmé à cette heure";
            $_SESSION['msgType'] = "error";
            header('Location: ./?path=pages/voirseance&id=' . $id);
            return;
        }
    }
    if($nouveautes=='on'){
        $typeFilm = "nouveautes";}
    else{
        $typeFilm = "affiche";
    }
    require_once('./modele/seanceBD.php');
    if(seanceAlreadyExist($cinema['id'],$film['id'],$salle['id'],$heure,$date,$typeFilm)){
        $_SESSION['msgErr'] = "Cette séance existe déjà";
        $_SESSION['msgType'] = "error";
        header('Location: ./?path=pages/voirseance&id='.$id);
        return;
    }

     require_once('./modele/seanceBD.php');
     edit_seance($id,$cinema['id'],$film['id'],$salle['id'],$typeFilm,$heure,$date);
    $_SESSION['msgAcc'] = "Votre séance a bien était modifiée";
    $_SESSION['msgType'] = "success";
    header('Location: ./?path=pages/voirseance&id='.$id);

 }


 function deleteSeance(){
    require('./controle/utilisateur.php');
    closedNotifier();
    $id = isset($_GET['id'])?$_GET['id']:'';
    checkId($id);
     require_once('./modele/seanceBD.php');
    delete_seance($id);
    $_SESSION['msgAcc'] = "Votre séance a bien été supprimée";
    $_SESSION['msgType'] = "success";
    header('Location: ./?path=pages/ajoutseance');

 }

/**
 * Fonction de vérification de l'existence d'une séance
 * @return boolean
 * @throws Exception
 */
function checkFilmAlreadyInTime($iDfilm, $heure, $iDsalle, $dureeFilm,$date): bool
{
    require_once('./modele/seanceBD.php');
    $seances= getSeanceBySalle($iDsalle);
    foreach ($seances as $seance){
        if($seance['date']==$date){
            $horaireFinAlready = calculerHoraireFin($seance['horairedébut'], $seance['film_duree']);
            $horaireFinAjout = calculerHoraireFin($heure, $dureeFilm);
            if($seance['horairedébut']<=$heure ||  ($horaireFinAlready<=$horaireFinAjout && $horaireFinAlready>=$heure)){
                return true;
            }
    }
 }
    return false;
}

/**
 * Fonction pour calculer l'horaire de fin d'un film
 * @param $heureDebut
 * @param $dureeFilm
 * @return string
 * @throws Exception
 */
function calculerHoraireFin($heureDebut, $dureeFilm): string
{
    $horaireDebut = new DateTime($heureDebut);
    [$hours, $minutes] = explode(':', $dureeFilm);
    $filmDuree = new DateInterval(sprintf('PT%dH%dM', $hours, $minutes));
    $horaireDebut->add($filmDuree);
    return $horaireDebut->format('H:i:s');
}
?>