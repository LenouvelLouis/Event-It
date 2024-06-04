<?php
function ajoutcinema()
{
    if(!isset($_SESSION['id']) && $_SESSION['status'] != "admin"){
        header("Location: ./?path=pages/accueil");
    }
    require("./vue/ajoutcinema/ajoutcinema.tpl");
}
?>