<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/cinema/cinema.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
    <div class="navbarcinema">
        <a href="./index.php?action=cinema&controle=pages/cinema">Accueil</a> /
        <a>Cinéma</a>
    </div>

<div class="search-bar">
    <input type="text" placeholder="Rechercher un cinéma" name="search" class="search-input">
    <button class="search-button"><i class="fa fa-search"></i></button>
</div>

<div class="cinema-card grey">
  <img src="chemin-vers-votre-image-cinema-1.jpg" alt="UGC GRAND NORMANDIE" width="300">
    <div class="cinema-info">
        <h2>UGC GRAND NORMANDIE</h2>
        <p>15 films</p>
        <p>116 bis, avenue des Champs-Élysées 75008 PARIS</p>
        <div class="icons">
            <img src="" alt="Accessibilité">
            <img src="" alt="Malentendant">
            <img src="" alt="Malvoyant">
        </div>
    </div>
</div>

<div class="cinema-card">
  <img src="chemin-vers-votre-image-cinema-2.jpg" alt="Nom du Deuxième Cinéma" width="300">
    <div class="cinema-info">
        <h2>Nom du Deuxième Cinéma</h2>
        <p>Nombre de films</p>
        <p>Adresse du Deuxième Cinéma</p>
        <div class="icons">
            <img src="" alt="Accessibilité">
            <img src="" alt="Malentendant">
            <img src="" alt="Malvoyant">
        </div>
    </div>
</div>

<div class="cinema-card grey">
  <img src="chemin-vers-votre-image-cinema-3.jpg" alt="Nom du Deuxième Cinéma" width="300">
    <div class="cinema-info">
        <h2>Nom du Deuxième Cinéma</h2>
        <p>Nombre de films</p>
        <p>Adresse du Deuxième Cinéma</p>
        <div class="icons">
            <img src="" alt="Accessibilité">
            <img src="" alt="Malentendant">
            <img src="" alt="Malvoyant">
        </div>
    </div>
</div>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>