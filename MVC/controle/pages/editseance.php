<?php
function editseance(){
    if(!isset($_SESSION['id']) || $_SESSION['status'] != "admin"){
        header("Location: ./?path=pages/accueil");
    }
    require("./vue/ajoutseance/ajoutseance.tpl");
}
?>