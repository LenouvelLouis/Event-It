<?php
function statseance(){
  if(!isset($_SESSION['id']) && $_SESSION['status'] != "admin"){
    header("Location: ./?path=pages/accueil");
  }
  require("./vue/statseance/statseance.tpl");
}
?>
