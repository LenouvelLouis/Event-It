<?php
function infocinema(){
    if(!isset($_SESSION['id']) && $_SESSION['status'] != "admin"){
        header("Location: ./?path=pages/accueil");
    }
    require("./vue/infocinema/infocinema.tpl");
}
?>