<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/ajoutseance/ajoutseance.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
<div class="barre">
    <a href="./?path=pages/accueil">Accueil</a>/
    <a href="./?path=pages/ajoutseance">Ajout de séance</a>
</div>

<form action="./?path=ajoutseance/ajoutseance" method="post">
    <div class="container_ajout_sceance">

        <div class="container_sceance_gauche">
            <label>Affiche film</label>
            <div class="image-container">
                <img src="./vue/img/Image_test.png" alt="Image du film">
            </div>
        </div>

        <div class="container_sceance_millieu">

            <label> Sélection du film </label>
            <select name="film" id="film">
                <option value="">Choisir un film</option>      
            </select>

            <label> Sélection du cinéma </label>
            <select name="cinema" id="cinema">
                <option value="">Choisir un cinéma</option>      
            </select>

            <div id="affichage_salle">
                <label> Sélection de la salle </label>
                <br>
                <select name="salle" id="salle">
                <option value="">Choisir une salle</option>      
                </select>
            </div>

            <label> Heure de début du film </label>
            <input type="time" id="Heure_debut" </input>

            <div class ="type_film">
                <input type="checkbox" id="bp_affiche" value="Affiche" class="ckeck_box">
                <label for="bp_affiche">A l'affiche</label>
            </div>

            <div class ="type_film">
                <input type="checkbox" id="bp_nouveautes" value="nouveautes" class="ckeck_box">
                <label for="bp_nouveautes">Nouveautés</label>
            </div>
        </div>

        <div class="container_sceance_droit">
            <label> Récapitulatif : </label>

            <ul class="info-liste">
                <li>Film : xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</li>
                <li>Lieu : xxxxxxxxxxxxxxxxxxxxxxxxxxxxx</li>
                <li>Heure de début : xxxxxxxxxxxxxxxxxxxxxxxxxxxxx</li>
                <li>Salle : xxxxxxxxxxxxxxxxxxxxxxxxxxxxx</li>
            </ul>

            <button type="button">Ajout de séance</button>
        </div>
    </div>
</form>

<?php require("./vue/footer/footer.tpl"); ?> 
</body>
<script src="./vue/ajoutseance/ajoutseance.js"></script>
</html>