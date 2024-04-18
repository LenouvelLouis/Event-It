<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
    <?php require("./vue/navbar/nav.tpl"); ?>

    <div class="container_statseance">
        <div class="container1-stat">
            <div class="column_statseance">
                <h2> Statistiques des capteurs sonores</h2>
                <p> Voici les statistiques des séances de cinéma </p>
                <p> (Ici je mettrais le graphique avec les statistiques des capteurs sonores quand j'aurais compris comment le faire, 
                en attendant je finis la mise en page du reste des statistiques des séances) </br></p>

                <div class="espace_bouton">
                    <select class="menu_deroulant_statseance" name="capteur-sonore" id="quel-capteur-sonore">
                        <option value="bouton-son-1">Capteur sonore 1</option>
                        <option value="bouton-son-2">Capteur sonore 2</option>
                        <option value="bouton-son-3">Capteur sonore 3</option>
                    </select>
                </div>
            </div>

            <div class="column_graph_statseance">
                <p> Ici on verra les statistiques capteur par capteur.</p>
                <canvas id="myChart"></canvas>
            </div>
        </div>
        
        <div>
            <div class="column_statseance">
                <h2> Statistiques des capteurs de température</h2>
                <p> Ici nous avons les données recueillies de chaque séance par les capteurs de température, 
                ainsi que les statistiques qui découlent de ces données </p>
                <p> (Ici je mettrais aussi le graphique avec les statistiques des capteurs de températures quand j'aurais compris comment le faire, 
                comme pour les capteurs sonores, en attendant je finis la mise en page du reste des statistiques des séances) </br></p>

                <div class="espace_bouton">
                    <select class="menu_deroulant_statseance" name="capteur-temp" id="quel-capteur-temp">
                        <option value="bouton-temp-1">Capteur température 1</option>
                        <option value="bouton-temp-2">Capteur température 2</option>
                        <option value="bouton-temp-3">Capteur température 3</option>
                    </select>
                </div>
            </div>

            <div class="column_graph_statseance">
                <p>Ici on verra les statistiques capteur par capteur.</p>
                <div id="myChart"></div> 
                <script>
                    statseance.tpl.addEventListener('DOMContentLoaded', function() {
                        drawSoundSensorChart(); // Appel de la fonction pour dessiner le graphique des capteurs sonores
                    });
                </script>
            </div>
        </div>

        <div class="row_after_column_statseance">
    <h2> Données globales</h2>
    <p> Les statistiques moyennes de chaque séance sont montrées ici </p> 
    <p> Moyenne : <span id="moyenne"></span></p>
    <p> Médiane : <span id="mediane"></span></p>
    <p> Mode : <span id="mode"></span></p>

    <script> 
        const donnees_sonores = [99,86,87,88,86,103,87,94,78,77,85,86];
        const moyenne = calculateMean(donnees_sonores);
        document.getElementById("moyenne").innerHTML = moyenne;

        const mediane = calculateMedian(donnees_sonores);
        document.getElementById("mediane").innerHTML = mediane;

        const mode = calculateMode(donnees_sonores);
        document.getElementById("mode").innerHTML = mode;

        // Fonction pour calculer la moyenne
        function calculateMean(data) {
            const total = data.reduce((acc, val) => acc + val, 0);
            return total / data.length;
        }

        // Fonction pour calculer la médiane
        function calculateMedian(data) {
            const sortedData = data.slice().sort((a, b) => a - b);
            const middle = Math.floor(sortedData.length / 2);
            if (sortedData.length % 2 === 0) {
                return (sortedData[middle - 1] + sortedData[middle]) / 2;
            } else {
                return sortedData[middle];
            }
        }

        // Fonction pour calculer le mode
        function calculateMode(data) {
            const counts = {};
            data.forEach(value => counts[value] = (counts[value] || 0) + 1);
            const mode = Object.keys(counts).reduce((a, b) => counts[a] > counts[b] ? a : b);
            return parseInt(mode);
        }
    </script>

    <p> Valeur absolue : </p>
    <p> Vous trouverez dans cette section les indicateurs de santé liés aux données prélevées, 
    ainsi que la carte de la salle où les mesures ont été faites.</p>
</div>

    </div>

    <script src="./vue/statseance/statseance_code.js"> </script>
    <script> 
        statseance.addEventListener('DOMContentLoaded', function() {
            drawChart();
        }); 
    </script>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>


