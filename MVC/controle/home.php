<?php
 if(!isset($_SESSION)) 
 { 
     session_start(); 
 } 
   function ident(){
    $login =  isset($_POST['cologin'])?($_POST['cologin']):'';
    $mdp =  isset($_POST['comdp'])?($_POST['comdp']):'';
    $msg = '';
    $msgAcc = isset($_SESSION['msgAcc'])?($_SESSION['msgAcc']):'';
<<<<<<< Updated upstream
    require ("./vue/home/home.tpl");
=======
    require ("./vue/ajoutfilm/ajoutfilm.tpl");
>>>>>>> Stashed changes
}
?>
