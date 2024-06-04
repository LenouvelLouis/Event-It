<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/film/film.css">
</head>
<body>
    <?php require("./vue/navbar/nav.tpl"); ?>

    <div class="barre">
        <a href="./?path=pages/accueil">Accueil</a> /
        <a href="./?path=pages/film">Film</a>
    </div>

    <div class="container_liste_cinema">
    
        <label>Les séances dans mon cinéma</label>
        
        <select name="cinemas" id="list_cinema">
            <option>Choisir un cinéma </option>      
        </select>

    </div>

    <div class="container_recherche_film" id="container_recherche_film">
        <textarea id="recherche" placeholder="Recherchez un film" oninput="showDropdown(this)"></textarea>
        <i class="fa-solid fa-magnifying-glass"></i>
        <div class="dropdown">
            <div class="dropdown-content" id="resultats"></div>
        </div>
    </div>
    

    <div class="container_film_nouveaux" id="container_film_nouveaux">

        <label>NOUVEAUTÉS</label>

        <div class="container_film_carrousel">

            <i class="fa-solid fa-caret-left" onclick="moveLeft_nouveaux()"></i>
            
            <div class="carousel" id="carousel_nouveaux">
            </div> 

            <i class="fa-solid fa-caret-right" onclick="moveRight_nouveaux()"></i>
        </div>
    </div>

    <div class="container_film_affiche" id="container_film_affiche">

        <label>A L'AFFICHE</label>

        <div class="container_film_carrousel">

        <i class="fa-solid fa-caret-left" onclick="moveLeft_affiche()"></i>
            
        <div class="carousel" id="carousel_affiche">
        </div> 

        <i class="fa-solid fa-caret-right" onclick="moveRight_affiche()"></i>

        </div>

    </div>


<script src="./vue/film/film.js"></script>
<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>