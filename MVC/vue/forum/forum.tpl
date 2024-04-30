<!DOCTYPE HTML>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./vue/forum/forum.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
<div class="barre">
    <a href="./?path=pages/accueil">Accueil</a> /
    <a href="./?path=pages/forum">Forum</a>
</div>

<div class="forum-header">
    <h1>Forum</h1>
</div>

<div class="forum-container">
    <div class="sidebar">
        <!-- Barre de recherche -->
        <input type="text" id="searchBox" onkeyup="searchQuestion()" placeholder="Chercher une question...">
        <div id="suggestions" class="suggestions"></div>

    </div>

    <div class="main-content">
        <div class="question-prompt">
            <p>Votre question n'est pas dans ce Forum ?</p>
            <textarea placeholder="Posez votre question ici..."></textarea>
            <button class="ajout-sujet" onclick="submitQuestion()">Ajouter un sujet</button>
        </div>
    </div>
</div>
<?php require("./vue/footer/footer.tpl"); ?>
<script src="./vue/forum/forum.js"></script>
</body>
</html>
