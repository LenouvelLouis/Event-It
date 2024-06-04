<?php
function voirfilm()
{
    if($_GET['id'] == null || $_GET['id'] == "" || !isset($_GET['id'])){
        header("Location: ./?path=pages/accueil");
        return;
    }
    require("./vue/ajoutfilm/ajoutfilm.tpl");
}
?>