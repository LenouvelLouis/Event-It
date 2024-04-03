<head>
    <title>Event-It</title>
    <link rel="icon" href="./vue/img/favicon.png" type="image/png">
    <link rel="stylesheet" href="./vue/navbar/nav.css">
    <link rel="stylesheet" href="./vue/style/style.css">
    <script src="https://kit.fontawesome.com/0ef5e8cca6.js" crossorigin="anonymous"></script>
</head>
<div class="nav">
<div class="img-nav">
    <img src="./vue/img/eventIt.png" alt="eventIt">
</div>
    <button onclick="openNavTel()" class="btn-nav"><i class="fa-solid fa-bars"></i></button>
<nav id="navPc">
    <ul class="nav-list">
        <li><a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a></li>
        <li><a href="./index.php?action=forum&controle=pages/forum">Forum</a></li>
        <li><a href="./index.php?action=cinema&controle=pages/cinema">Cinéma</a></li>
        <li><a href="./index.php?action=film&controle=pages/film">Film</a></li>
        <li><a href="./index.php?action=contact&controle=pages/contact">Contact</a></li>
        <li><button onclick="openModal()">Connexion</button></li>
    </ul>
</nav>
    <nav id="navTel">
        <ul class="nav-list">
            <li><a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a></li>
            <li><a href="./index.php?action=forum&controle=pages/forum">Forum</a></li>
            <li><a href="./index.php?action=cinema&controle=pages/cinema">Cinéma</a></li>
            <li><a href="./index.php?action=film&controle=pages/film">Film</a></li>
            <li><a href="./index.php?action=contact&controle=pages/contact">Contact</a></li>
            <li><button onclick="openModal()">Connexion</button></li>
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
