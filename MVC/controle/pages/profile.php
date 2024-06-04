<?php

function profile(){
    if(!isset($_SESSION['id'])){
        header("Location: ./?path=pages/accueil");
    }
    require("./vue/profile/profile.tpl");
}


?>