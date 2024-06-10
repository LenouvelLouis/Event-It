<?php
session_start();
$path = isset($_GET['path'])? explode('/', trim($_GET['path'], '/')) : [];
$controle = isset($path[0])? $path[0] : NULL;
$action = isset($path[1])? $path[1] : NULL;
switch ($controle) {
    case NULL:
        require("./controle/home.php");
        home();
        break;
    case 'pages':
        $filePath = "./controle/pages/" . $action . ".php";
        if (file_exists($filePath)) {
            require($filePath);
            $action();
        } else {
            require("./controle/home.php");
            home();
        }
        break;
    default:
        $filePath = "./controle/" . $controle . ".php";
        if (file_exists($filePath)) {
            require($filePath);
            $action();
        } else {
            require("./controle/home.php");
            home();
        }
        break;
}
?>