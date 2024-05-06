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
            <label>Affiche du film</label>
            <div class="image-container">
                <img id="image_film">
            </div>
        </div>

        <div class="container_sceance_millieu">

            <div>
                <label> Sélection du film </label>
                <br>
                <select name="film" id="film">
                    <option value="">Choisir un film</option>      
                </select>
            </div>

            <div>
                <label> Sélection du cinéma </label>
                <br>
                <select name="cinema" id="cinema">
                    <option value="">Choisir un cinéma</option>      
                </select>
            </div>

            <div id="affichage_salle">
                <label> Sélection de la salle </label>
                <br>
                <select name="salle" id="salle">
                    <option value="">Choisir une salle</option>      
                </select>
            </div>

            <div>
                <label> Heure de début </label>
                <br>
                <input type="time" id="heure_debut" </input>
            </div>

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

            <ul class="info-liste" id="recap_info">
                <li>Film : </li>
                <li>Cinéma : </li>
                <li>Salle : </li>
                <li>Heure de début : </li>
            </ul>

            <button type="button">Ajout de séance</button>
        </div>
    </div>
</form>

<?php require("./vue/footer/footer.tpl"); ?> 
</body>
<script src="./vue/ajoutseance/ajoutseance.js"></script>
</html>