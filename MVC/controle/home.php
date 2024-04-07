<?php
 if(!isset($_SESSION)) 
 { 
     session_start(); 
 } 
   function ident(){
    require ("./vue/home/home.tpl");
}
?>
