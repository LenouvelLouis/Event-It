<?php
session_start();
$path = isset($_GET['path'])? explode('/', trim($_GET['path'], '/')) : [];
$controle = isset($path[0])? $path[0] : NULL;
$action = isset($path[1])? $path[1] : NULL;
switch ($controle) {
    case NULL:
        require("./controle/home.php");
        ident();
        break;
    case 'pages':
        require("./controle/pages/" . $action . ".php");
        $action();
        break;
    default:
        require("./controle/" . $controle . ".php");
        $action();
        break;
}
?>