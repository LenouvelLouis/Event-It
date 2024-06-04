<head>
    <title>Event-It</title>
    <link rel="icon" href="./vue/img/favicon.png" type="image/png">
    <link rel="stylesheet" href="./vue/navbar/nav.css">
    <link rel="stylesheet" href="./vue/style/style.css">
    <script src="https://kit.fontawesome.com/0ef5e8cca6.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<?php require("./vue/notifier/notifier.tpl"); ?>
<div class="nav">
<div class="img-nav">
    <img src="./vue/img/eventIt.png" alt="eventIt">
</div>
    <button onclick="openNavTel()" class="btn-nav"><i class="fa-solid fa-bars"></i></button>
<nav id="navPc">
    <ul class="nav-list">
        <li><a href="./?path=pages/accueil">Accueil</a></li>
        <li><a href="./?path=pages/forum">Forum</a></li>
        <li><a href="./?path=pages/cinema">Cinéma</a></li>
        <li><a href="./?path=pages/film">Film</a></li>
        <li><a href="./?path=pages/contact">Contact</a></li>
        <?php
        if(isset($_SESSION['status']) && ($_SESSION['status'] == "admin" || $_SESSION['status'] == "gestionnaire") ) {
            echo("<li><a href='./?path=pages/ajoutfilm'><i class='fa-solid fa-plus'></i> Film</a></li>");
        }
        ?>
        <?php
                if(isset($_SESSION['name']) && isset($_SESSION['name'])!=NULL) {
                    echo("<li class='dropdown'>
        <span  class='dropBtn'>".$_SESSION['name']."</span>
        <div class='dropdown-content'>
            <a href='./?path=pages/profile'>Mon profile</a>
            <a href='./?path=logout/deconnexion'>Deconnexion</a>
        </div>
        </li>");
        } else {
        echo(" <li><button onclick='openModal()'>Connexion</button></li>");
        }
        ?>
    </ul>
</nav>

</div>

<div id="myModal" class="modal">
    <div class="modal-content">
        <button class="close" onclick="closeModal()"><i class="fa-solid fa-x"></i></button>
        <?php require './vue/modal/modal.tpl'; ?>
    </div>
</div>

<script src="./vue/navbar/nav.js"></script>
