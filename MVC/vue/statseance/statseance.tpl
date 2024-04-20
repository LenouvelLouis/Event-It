<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
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
                <div id="myPlot1" style="width:100%;max-width:700px"></div>
                    <script>
                        const xArray1 = [50,60,70,80,90,100,110,120,130,140,150]; 
                        const yArray1 = [10,20,30,40,50,60,70,80,90,80,70]; 
                        const yArray2 = [70,80,90,80,70,60,50,40,30,20,10]; 
                        const yArray3 = [50,60,50,60,50,60,50,60,50,60,50];

                        const data1 = [
                            { x: xArray1, y: yArray1, mode: "lines", name: "Capteur 1" },
                            { x: xArray1, y: yArray2, mode: "lines", name: "Capteur 2" },
                            { x: xArray1, y: yArray3, mode: "lines", name: "Capteur 3" }
                        ];

                        const layout1 = {
                            xaxis: {range: [40, 160], title: "Temps (min)"},
                            yaxis: {range: [0, 90], title: "Puissance du son (dB)"},  
                            title: "Evolution du son pendant la séance"
                        };
                        Plotly.newPlot("myPlot1", data1, layout1);
                    </script>
                </div>
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
                <div id="myPlot2" style="width:100%;max-width:700px"></div>
                    <script>
                        const xArray2 = [50,60,70,80,90,100,110,120,130,140,150]; 
                        const yArray4 = [10,20,30,40,50,60,70,80,90,80,70]; 
                        const yArray5 = [70,80,90,80,70,60,50,40,30,20,10]; 
                        const yArray6 = [50,60,50,60,50,60,50,60,50,60,50];

                        const data2 = [
                            { x: xArray2, y: yArray4, mode: "lines", name: "Capteur 1" },
                            { x: xArray2, y: yArray5, mode: "lines", name: "Capteur 2" },
                            { x: xArray2, y: yArray6, mode: "lines", name: "Capteur 3" }
                        ];

                        const layout2 = {
                            xaxis: {range: [40, 160], title: "Temps (min)"},
                            yaxis: {range: [0, 90], title: "Température (°C)"},  
                            title: "Evolution de la température pendant la séance"
                        };
                        Plotly.newPlot("myPlot2", data2, layout2);
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

    <p> Valeur absolue : </p>
    <p> Vous trouverez dans cette section les indicateurs de santé liés aux données prélevées, 
    ainsi que la carte de la salle où les mesures ont été faites.</p>
    </div>

    </div>

    <script src="./vue/statseance/statseance_code.js"> </script>
    <script> 
        statseance.addEventListener('DOMContentLoaded', function() {
            drawSoundSensorChart();
        }); 
    </script>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>


