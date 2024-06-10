<?php
 if(!isset($_SESSION)) 
 { 
     session_start(); 
 } 
   function home(){
    $msg = '';
    $msgAcc = isset($_SESSION['msgAcc'])?($_SESSION['msgAcc']):'';
    require ("./vue/home/home.tpl");
}
?>
