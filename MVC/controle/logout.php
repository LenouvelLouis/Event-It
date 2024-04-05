<?php

function deconnexion(){
    session_destroy();
    require("./vue/home/home.tpl");
}
?>