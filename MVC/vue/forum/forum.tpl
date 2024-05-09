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
        <div class="div-list-questions">
            <ul class="list-questions">
            </ul>
        </div>
    </div>

    <div class="main-content">
        <div class="general-discussion">
            <div class="discussion">
            </div>
            <form id="form-forum" action="./?path=forum/ajoutmessage" method="post">
                <div class="container-ajout-message">
                    <textarea name="message" placeholder="Répondre à la discussion..."></textarea>
                    <button class="ajout-message" type="submit">Ajouter un message</button>
                </div>

            </form>
        </div>

        <div class="question-prompt">
            <form action="./?path=forum/ajoutdiscussion" method="post">
            <p>Votre question n'est pas dans ce Forum ?</p>
            <textarea name="titre" placeholder="Posez votre question ici..."></textarea>
            <button class="ajout-sujet" type="submit">Ajouter un sujet</button>
            </form>
            <!-- Lien de suppression -->

        </div>
        <a class="supprimer-sujet" href="">Supprimer la discussion</a>
    </div>
</div>
<?php require("./vue/footer/footer.tpl"); ?>
<script src="./vue/forum/forum.js"></script>
</body>
</html>
