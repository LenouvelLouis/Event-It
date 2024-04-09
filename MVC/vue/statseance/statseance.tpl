<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
</head>

<body>
    <?php require("./vue/navbar/nav.tpl"); ?>

    <h1 class="Titre_statseance"> Statistiques Séances </h1>

    <div class="container_statseance">

        <div class="column_statseance">
            <h2> Statistiques des capteurs sonores</h2>
            <p> Voici les statistiques des séances de cinéma </p>
            <p> (Ici je mettrais le graphique avec les statistiques des capteurs sonores quand j'aurais compris comment le faire, 
            en attendant je finis la mise en page du reste des statistiques des séances) </br></br>
            Ici on verra les statistiques capteur par capteur.</p>
        </div>

        <div class="column_statseance">
            <h2> Statistiques des capteurs de température</h2>
            <p> Ici nous avons les données recueillies de chaque séance par les capteurs de température, 
            ainsi que les statistiques qui découlent de ces données </p>
            <p> (Ici je mettrais aussi le graphique avec les statistiques des capteurs de températures quand j'aurais compris comment le faire, 
            comme pour les capteurs sonores, en attendant je finis la mise en page du reste des statistiques des séances) </br></br>
            Ici on verra les statistiques capteur par capteur.</p>
        </div>

        <div class="row_after_column_statseance">
            <h2> Données globales</h2>
            <p> Les statistiques moyennes de chaque séance sont montrées ici </br>
            Vous trouverez dans cette section les indicateurs de santé liés aux données prélevées, 
            ainsi que la carte de la salle où les mesures ont été faites.</p>
        </div>

    </div>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>