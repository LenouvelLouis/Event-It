<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/cinema/cinema.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
    <div class="barre">
        <a href="./?path=pages/accueil">Accueil</a> /
        <a href="./?path=pages/cinema">Cinéma</a>
    </div>

<div class="top-bar">
    <div class="search-bar">
        <input type="text" placeholder="Rechercher un cinéma" id="recherche" name="search" class="search-input" oninput="showDropdown(this)">
        <button class="search-button"><i class="fa fa-search"></i></button>
        <div class="dropdown">
            <div class="dropdown-content" id="resultats"></div>
        </div>
    </div>
    <?php if(isset($_SESSION['status']) && ($_SESSION['status'] == "admin" || $_SESSION['status'] == "gestionnaire") ) {
            echo("<div class='search-image'><a class='plus' href='./?path=pages/ajoutcinema'><i class='fa-solid fa-plus'></i> Ajouter un cinéma</a></div>");
    }
    ?>
</div>

<div id="list_cinema">

</div>
<?php require("./vue/footer/footer.tpl"); ?>
</body>
<script src="./vue/cinema/cinema.js"></script>
</html>