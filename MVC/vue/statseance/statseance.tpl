<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

<body>
    <?php require("./vue/navbar/nav.tpl"); ?>

    <div class="container_statseance">
        <div class="container1-stat">
            <div class="column_statseance">
                <h2> Statistiques des capteurs sonores</h2>
                <p> Voici les statistiques recueillies par les capteurs sonores pendant les séances de cinéma.
                Vous pouvez voir leur évolutions en fonction du temps, aussi bien de manière gloable que précise, 
                le graphique permettant un certain niveau de précision. </p>

                <div class="espace_bouton">
                    <select class="menu_deroulant_statseance" name="capteur-sonore" id="quel-capteur-sonore" onchange="updateSonGraph()">
                        <option onclick="GlobalSon()" value="bouton-global-1">Tous les capteurs</option>
                        <option onclick="Son1()" value="bouton-son-1">Capteur sonore 1</option>
                        <option onclick="Son2()" value="bouton-son-2">Capteur sonore 2</option>
                        <option onclick="Son3()" value="bouton-son-3">Capteur sonore 3</option>
                    </select>
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

                <div class="espace_bouton">
                    <select class="menu_deroulant_statseance" name="capteur-temp" id="quel-capteur-temp" onchange="updateTempGraph()">
                        <option onclick="GlobalTemp"() value="bouton-global-2">Tous les capteurs</option>
                        <option onclick="Temp1()" value="bouton-temp-1">Capteur température 1</option>
                        <option onclick="Temp2()" value="bouton-temp-2">Capteur température 2</option>
                        <option onclick="Temp3()" value="bouton-temp-3">Capteur température 3</option>
                    </select>
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
            <script> 
                const donnees_sonores = [99,86,87,88,86,103,87,94,78,77,85,86];
                    const moyenne = calculateMean(donnees_sonores);
                    document.getElementById("moyenne").innerHTML = moyenne;
                    const mediane = calculateMedian(donnees_sonores);
                    document.getElementById("mediane").innerHTML = mediane;
                    const mode = calculateMode(donnees_sonores);
                    document.getElementById("mode").innerHTML = mode;

                    function calculateMean(data) {
                        const total = data.reduce((acc, val) => acc + val, 0);
                        return total / data.length;
                    }

                    function calculateMedian(data) {
                        const sortedData = data.slice().sort((a, b) => a - b);
                        const middle = Math.floor(sortedData.length / 2);
                        if (sortedData.length % 2 === 0) {
                            return (sortedData[middle - 1] + sortedData[middle]) / 2;
                        } else {
                        return sortedData[middle];
                        }
                    }

                    function calculateMode(data) {
                        const counts = {};
                        data.forEach(value => counts[value] = (counts[value] || 0) + 1);
                        const mode = Object.keys(counts).reduce((a, b) => counts[a] > counts[b] ? a : b);
                        return parseInt(mode);
                    }
                </script>
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
            <script> 
                const donnees_temp = [99,86,87,88,86,103,87,94,78,77,85,86];
                const moyenne2 = calculateMean(donnees_temp);
                document.getElementById("moyenne2").innerHTML = moyenne;
                const mediane2 = calculateMedian(donnees_temp);
                document.getElementById("mediane2").innerHTML = mediane;
                const mode2 = calculateMode(donnees_temp);
                document.getElementById("mode2").innerHTML = mode;

                function calculateMean(data) {
                    const total2 = data.reduce((acc, val) => acc + val, 0);
                    return total2 / data.length;
                }

                function calculateMedian(data) {
                    const sortedData = data.slice().sort((a, b) => a - b);
                    const middle = Math.floor(sortedData.length / 2);
                    if (sortedData.length % 2 === 0) {
                        return (sortedData[middle - 1] + sortedData[middle]) / 2;
                    } else {
                        return sortedData[middle];
                    }
                }

                function calculateMode(data) {
                    const counts = {};
                    data.forEach(value => counts[value] = (counts[value] || 0) + 1);
                    const mode = Object.keys(counts).reduce((a, b) => counts[a] > counts[b] ? a : b);
                    return parseInt(mode);
                }
            </script>
            <p> La température d'un cinéma avoisine les 19 °C en moyenne.<br>
            Faites attention à vous hydrater en permanence, et quand la température dépasse les 30 °C 
            pendant plus d'une demi-heure prenez des précautions par rapport à la chaleur.</p>
        </div>
    </div>


    <?php require("./vue/footer/footer.tpl"); ?>
    
</body>
<script src="./vue/statseance/statseance.js"></script>
</html>


