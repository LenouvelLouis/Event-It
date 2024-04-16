<!DOCTYPE HTML>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./vue/ajoutcinema/ajoutcinema.css">
    <title>Ajout de cinéma</title>
</head>
<body>
    <?php require("./vue/navbar/nav.tpl"); ?>

    <div class="navbarcinema">
        <a href="./index.php?action=ajoutcinema&controle=pages/cinema">Accueil</a> /
        <a>Ajout de cinéma</a>
    </div>

    <div class="conteneur">
        <div class="gauche">
            <h2>Affiche du cinéma</h2>
            <!-- Ajoutez ici une image ou tout autre contenu pour l'affiche du cinéma -->
        </div>

        <div class="milieu">
            <div class="milieu-contenu">
                <h1>Nom du cinéma</h1>
                <input type="text" placeholder="Entrez le nom du cinéma">
                <h3>Lieu du cinéma</h3>
                <input type="text" placeholder="Entrez le lieu du cinéma">
                <button>Ajouter cinéma</button>
            </div>
        </div>

        <div class="droite">
            <div class="box-messagerie">
                <!-- Ajoutez ici du contenu pour la boîte de messagerie -->
            </div>
        </div>
    </div>

    <?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>
