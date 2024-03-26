<head>
    <title>Event-It</title>
    <link rel="stylesheet" href="./vue/navbar/nav.css">
    <link rel="stylesheet" href="./vue/style/style.css">
</head>
<div class="nav">
<div class="img-nav">
    <img src="./vue/img/eventIt.png" alt="eventIt">
</div>
<nav>
    <ul class="centered-list">
        <li><a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a></li>
        <li><a href="./index.php?action=forum&controle=pages/forum">Forum</a></li>
        <li><a href="./index.php?action=cinema&controle=pages/cinema">Cinéma</a></li>
        <li><a href="./index.php?action=film&controle=pages/film">Film</a></li>
        <li><a href="./index.php?action=contact&controle=pages/contact">Contact</a></li>
        <li><a onclick="openModal()">Connexion</a></li>
    </ul>
</nav>
</div>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <?php require './vue/modal/modal.tpl'; ?>
    </div>
</div>

<script src="./vue/navbar/nav.js"></script>
