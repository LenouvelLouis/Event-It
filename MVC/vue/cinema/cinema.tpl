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
        <input type="text" placeholder="Rechercher un cinéma" name="search" class="search-input">
        <button class="search-button"><i class="fa fa-search"></i></button>
    </div>
    <?php if(isset($_SESSION['status']) && ($_SESSION['status'] == "admin" || $_SESSION['status'] == "gestionnaire") ) {
            echo("<div class='search-image'><a class='plus' href='./?path=pages/ajoutcinema'><i class='fa-solid fa-plus'></i> Ajouter un cinéma</a></div>");
    }
    ?>
</div>

<div class="cinema-card grey">
    <a href="./?path=pages/infocinema"><img src="https://www.chemille-en-anjou.fr/medias/2022/02/Cinema-en-plein-air.jpg" alt="Nom du Deuxième Cinéma" width="300"></a>
    <div class="cinema-info">
        <a href="./?path=pages/infocinema"><h2>Nom Cinéma Cinéma Cinéma Cinéma Cinéma</h2></a>
        <p>Nombre de films</p>
        <p>Adresse du Deuxième Cinéma</p>
        <div class="icons">
            <i class="fa-solid fa-wheelchair"></i>
            <i class="fa-solid fa-ear-deaf"></i>
            <i class="fa-regular fa-eye-slash"></i>
        </div>
    </div>
</div>

<div class="cinema-card">
  <a href="./?path=pages/infocinema"><img src="https://www.chemille-en-anjou.fr/medias/2022/02/Cinema-en-plein-air.jpg" alt="Nom du Deuxième Cinéma" width="300"></a>
    <div class="cinema-info">
        <a href="./?path=pages/infocinema"><h2>Nom du Deuxième Cinéma</h2></a>
        <p>Nombre de films</p>
        <p>Adresse du Deuxième Cinéma</p>
        <div class="icons">
            <i class="fa-solid fa-wheelchair"></i>
            <i class="fa-solid fa-ear-deaf"></i>
            <i class="fa-regular fa-eye-slash"></i>
        </div>
    </div>
</div>

<div class="cinema-card grey">
  <a href="./?path=pages/infocinema"><img src="https://www.chemille-en-anjou.fr/medias/2022/02/Cinema-en-plein-air.jpg" alt="Nom du Deuxième Cinéma" width="300"></a>
    <div class="cinema-info">
        <a href="./?path=pages/infocinema"><h2>Nom du Deuxième Cinéma</h2></a>
        <p>Nombre de films</p>
        <p>Adresse du Deuxième Cinéma</p>
        <div class="icons">
            <i class="fa-solid fa-wheelchair"></i>
            <i class="fa-solid fa-ear-deaf"></i>
            <i class="fa-regular fa-eye-slash"></i>
        </div>
    </div>
</div>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>