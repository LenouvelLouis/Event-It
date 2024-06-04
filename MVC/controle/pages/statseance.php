<?php
function statseance(){
  if(!isset($_SESSION['id']) || $_SESSION['status'] != "admin" || $_GET['id'] == null || $_GET['id'] == ""  || !isset($_GET['id'])){
    header("Location: ./?path=pages/accueil");
    return;
  }
  require("./vue/statseance/statseance.tpl");
}
?>
