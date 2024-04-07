<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>

<h1 class="Titre_statseance"> Statistiques Séances </h1>
<p class="path_statseance"> Accueil / Statistiques de séance </p>

<div class="container_statseance">

<div class="column_statseance">
<h2> Statistiques des capteurs sonores</h2>
<p> Voici les statistiques des séances de cinéma </p>
</div>

<div class="column_statseance">
<h2> Statistiques des capteurs de température</h2>
<p> Ici nous avons les données recueillies de chaque séance par les capteurs de température, 
ainsi que les statistiques qui découlent de ces données </p>
</div>

<div>
<h2> Données globales</h2>
<p> Les statistiques moyennes de chaque cinéma sont montrées ici </p>
</div>

</div>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>