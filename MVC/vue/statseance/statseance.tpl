<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>
    <?php require("./vue/navbar/nav.tpl"); ?>
    <div class="barre">
        <a href="./?path=pages/accueil">Accueil</a> /
        <a href="./?path=pages/statseance">Statistiques de séances</a>
    </div>

    <div class="container_statseance">
        <div class="container1-stat">
            <div class="column_statseance">
                <h2> Statistiques des capteurs sonores</h2>
                <p> Voici les statistiques recueillies par les capteurs sonores pendant les séances de cinéma.
                Vous pouvez voir leur évolutions en fonction du temps, aussi bien de manière gloable que précise, 
                le graphique permettant un certain niveau de précision. </p>
                <div class="case_menu_deroulant">
                <div class="espace_bouton">
                    <select class="menu_deroulant_statseance" name="capteur-sonore" id="quel_capteur_sonore" onchange="updateSonGraph()">
                        <option value="bouton-global" selected="selected">Tous les capteurs</option>
                    </select>
                </div>
                </div>
            </div>

            <div class="column_graph_statseance">
                <canvas class="graph" id="myPlot1">
                </canvas>
            </div>
        </div>
        
        <div class="container2-stat">
            <div class="column_statseance">
                <h2> Statistiques des capteurs de température</h2>
                <p> Ici nous avons les données recueillies de chaque séance par les capteurs de température, 
                ainsi que les statistiques qui découlent de ces données </p>

                <div class="case_menu_deroulant">
                <div class="espace_bouton">
                    <select class="menu_deroulant_statseance" name="capteur-temp" id="quel_capteur_temp" onchange="updateTempGraph()">
                        <option value="bouton-global-2" selected="selected">Tous les capteurs </option>
                    </select>
                </div>
                </div>
            </div>

            <div class="column_graph_statseance">
                <canvas class="graph" id="myPlot2">
                </canvas>
            </div>
        </div>
    </div>

    <div class="row_after_column_statseance">
        <p> Les statistiques moyennes de chaque séance sont montrées ici. 
        Le mode représente la valeur qui revient le plus souvent. <br>
        Vous trouverez dans cette section les indicateurs de santé liés aux données qui ont été prélevées pendant la séance. </p>
        <div class="column_graph_statseance">
            <h2> Données globales sonores</h2>
            <p class="stat-globales"> Moyenne : <span id="moyenne"></span><br>
            Médiane : <span id="mediane"></span><br>
            Mode : <span id="mode"></span> </p>
                <p> Il n'est pas permis de dépasser un seuil de 102 dB pendant une durée maximale de 5 min en 
                raison des dangers que cela peut entraîner pour les spectateurs. <br>
                Mais il est en général recommander de rester sous le seuil des 85 dB pour éviter tout risque, 
                car une exposition prolongée à des bruits allant au-delà du seuil des 85 dB peut être nuisible 
                pour la santé. </p>
        </div>

        <div class="column_graph_statseance">
            <h2> Données globales sur la température</h2>
            <p class="stat-globales"> Moyenne : <span id="moyenne2"></span><br>
            Médiane : <span id="mediane2"></span><br>
            Mode : <span id="mode2"></span> </p>
            <p> La température d'un cinéma avoisine les 19 °C en moyenne.<br>
            Faites attention à vous hydrater en permanence, et quand la température dépasse les 30 °C 
            pendant plus d'une demi-heure prenez des précautions par rapport à la chaleur.</p>
        </div>
    </div>


    <?php require("./vue/footer/footer.tpl"); ?>
    
</body>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment"></script>
<script src="./vue/statseance/statseance.js"></script>
</html>


