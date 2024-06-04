<?php
function editfilm()
{
    if(!isset($_SESSION['id']) || $_SESSION['status'] != "admin"){
        header("Location: ./?path=pages/accueil");
    }
    require("./vue/ajoutfilm/ajoutfilm.tpl");
}
?>
