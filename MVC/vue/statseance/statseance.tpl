<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/statseance/statseance.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

<body>
    <?php require("./vue/navbar/nav.tpl"); ?>

    <h1 class="Titre_statseance"> Statistiques Séances </h1>

    <div class="container_statseance">

        <div class="column_statseance">
            <h2> Statistiques des capteurs sonores</h2>
            <p> Voici les statistiques des séances de cinéma </p>
            <p> (Ici je mettrais le graphique avec les statistiques des capteurs sonores quand j'aurais compris comment le faire, 
            en attendant je finis la mise en page du reste des statistiques des séances) </br></p>

            <div class="espace_bouton">
                <button id="bouton-son-1" class="capteur sonore1">Capteur sonore 1</button>
                <button id="bouton-son-2" class="capteur sonore2">Capteur sonore 2</button>
                <button id="bouton-son-3" class="capteur sonore3">Capteur sonore 3</button>
            </div>

            <p> Ici on verra les statistiques capteur par capteur.</p>
            <canvas class="stat_graph" id="sonore_capt1" style="width:100%;max-width:700px"></canvas>
            <script>
                var xyValues = [
                    {x:10, y:51},
                    {x:20, y:56},
                    {x:30, y:49},
                    {x:40, y:63},
                    {x:50, y:73},
                    {x:60, y:44},
                    {x:70, y:48},
                    {x:80, y:58},
                    {x:90, y:67},
                    {x:100, y:79},
                    {x:110, y:80},
                    {x:120, y:81},
                    {x:130, y:53},
                    {x:140, y:78},
                    {x:150, y:76},
                    {x:160, y:65},
                    {x:170, y:56}

                ];
                new Chart("sonore_capt1", {
                    type: "scatter",
                    data: {
                        datasets: [{
                            pointRadius: 2,
                            pointBackgroundColor: "rgb(0,0,255)",
                            data: xyValues
                        }]
                    },
                    options: {
                        legend: {display: false},
                        scales: {
                            xAxes: [{ticks: {min: 0, max:180}}],
                            yAxes: [{ticks: {min: 0, max:100}}],
                        }
                    }
                });
            </script>
            
            <canvas class="stat_graph" id="sonore_capt2" style="width:100%;max-width:700px"></canvas>
            <script>
                var xyValues = [
                    {x:10, y:30},
                    {x:20, y:35},
                    {x:30, y:30},
                    {x:40, y:35},
                    {x:50, y:30},
                    {x:60, y:35},
                    {x:70, y:30},
                    {x:80, y:35},
                    {x:90, y:30},
                    {x:100, y:35},
                    {x:110, y:30},
                    {x:120, y:35},
                    {x:130, y:30},
                    {x:140, y:35},
                    {x:150, y:30},
                    {x:160, y:35},
                    {x:170, y:30}

                ];
                new Chart("sonore_capt2", {
                    type: "scatter",
                    data: {
                        datasets: [{
                            pointRadius: 2,
                            pointBackgroundColor: "rgb(0,0,255)",
                            data: xyValues
                        }]
                    },
                    options: {
                        legend: {display: false},
                        scales: {
                            xAxes: [{ticks: {min: 0, max:180}}],
                            yAxes: [{ticks: {min: 0, max:100}}],
                        }
                    }
                });
            </script>

            <canvas class="stat_graph" id="sonore_capt3" style="width:100%;max-width:700px"></canvas>
            <script>
                var xyValues = [
                    {x:10, y:5},
                    {x:20, y:10},
                    {x:30, y:15},
                    {x:40, y:20},
                    {x:50, y:25},
                    {x:60, y:30},
                    {x:70, y:35},
                    {x:80, y:40},
                    {x:90, y:45},
                    {x:100, y:50},
                    {x:110, y:55},
                    {x:120, y:60},
                    {x:130, y:65},
                    {x:140, y:70},
                    {x:150, y:75},
                    {x:160, y:80},
                    {x:170, y:85}

                ];
                new Chart("sonore_capt3", {
                    type: "scatter",
                    data: {
                        datasets: [{
                            pointRadius: 2,
                            pointBackgroundColor: "rgb(0,0,255)",
                            data: xyValues
                        }]
                    },
                    options: {
                        legend: {display: false},
                        scales: {
                            xAxes: [{ticks: {min: 0, max:180}}],
                            yAxes: [{ticks: {min: 0, max:100}}],
                        }
                    }
                });
            </script>
        </div>
        
        <div>
            <div class="column_statseance">
                <h2> Statistiques des capteurs de température</h2>
                <p> Ici nous avons les données recueillies de chaque séance par les capteurs de température, 
                ainsi que les statistiques qui découlent de ces données </p>
                <p> (Ici je mettrais aussi le graphique avec les statistiques des capteurs de températures quand j'aurais compris comment le faire, 
                comme pour les capteurs sonores, en attendant je finis la mise en page du reste des statistiques des séances) </br></p>

                <div class="espace_bouton">
                    <button class="capteur">Capteur température 1</button>
                    <button class="capteur">Capteur température 2</button>
                    <button class="capteur">Capteur température 3</button>
                </div>
            </div>

            <div class="column_statseance">
                <p>Ici on verra les statistiques capteur par capteur.</p>
                <canvas class="stat_graph" id="sonore_temp1" style="width:100%;max-width:700px"></canvas>
                <script>
                    var xyValues = [
                        {x:10, y:51},
                        {x:20, y:56},
                        {x:30, y:49},
                        {x:40, y:63},
                        {x:50, y:73},
                        {x:60, y:44},
                        {x:70, y:48},
                        {x:80, y:58},
                        {x:90, y:67},
                        {x:100, y:79},
                        {x:110, y:80},
                        {x:120, y:81},
                        {x:130, y:53},
                        {x:140, y:78},
                        {x:150, y:76},
                        {x:160, y:65},
                        {x:170, y:56}
                    ];
                    new Chart("sonore_temp1", {
                        type: "scatter",
                        data: {
                            datasets: [{
                            pointRadius: 2,
                            pointBackgroundColor: "rgb(0,0,255)",
                            data: xyValues
                            }]
                        },
                        options: {
                            legend: {display: false},
                            scales: {
                                xAxes: [{ticks: {min: 0, max:180}}],
                                yAxes: [{ticks: {min: 0, max:100}}],
                            }
                        }
                    });
                </script>

                <canvas class="stat_graph" id="sonore_temp2" style="width:100%;max-width:700px"></canvas>
                <script>
                    var xyValues = [
                        {x:10, y:30},
                        {x:20, y:35},
                        {x:30, y:30},
                        {x:40, y:35},
                        {x:50, y:30},
                        {x:60, y:35},
                        {x:70, y:30},
                        {x:80, y:35},
                        {x:90, y:30},
                        {x:100, y:35},
                        {x:110, y:30},
                        {x:120, y:35},
                        {x:130, y:30},
                        {x:140, y:35},
                        {x:150, y:30},
                        {x:160, y:35},
                        {x:170, y:30}
                    ];
                    new Chart("sonore_temp2", {
                        type: "scatter",
                        data: {
                            datasets: [{
                                pointRadius: 2,
                                pointBackgroundColor: "rgb(0,0,255)",
                                data: xyValues
                            }]
                        },
                        options: {
                            legend: {display: false},
                            scales: {
                                xAxes: [{ticks: {min: 0, max:180}}],
                                yAxes: [{ticks: {min: 0, max:100}}],
                            }
                        }
                    });
                </script>

                <canvas class="stat_graph" id="sonore_temp3" style="width:100%;max-width:700px"></canvas>
                <script>
                    var xyValues = [
                        {x:10, y:5},
                        {x:20, y:10},
                        {x:30, y:15},
                        {x:40, y:20},
                        {x:50, y:25},
                        {x:60, y:30},
                        {x:70, y:35},
                        {x:80, y:40},
                        {x:90, y:45},
                        {x:100, y:50},
                        {x:110, y:55},
                        {x:120, y:60},
                        {x:130, y:65},
                        {x:140, y:70},
                        {x:150, y:75},
                        {x:160, y:80},
                        {x:170, y:85}
                    ];
                    new Chart("sonore_temp3", {
                        type: "scatter",
                        data: {
                            datasets: [{
                                pointRadius: 2,
                                pointBackgroundColor: "rgb(0,0,255)",
                                data: xyValues
                            }]
                        },
                        options: {
                            legend: {display: false},
                            scales: {
                                xAxes: [{ticks: {min: 0, max:180}}],
                                yAxes: [{ticks: {min: 0, max:100}}],
                            }
                        }
                    });
                </script>
            </div>
        </div>

        <div class="row_after_column_statseance">
            <h2> Données globales</h2>
            <p> Les statistiques moyennes de chaque séance sont montrées ici </p> 
            <p> Moyenne : </p>
            <p> Médiane : </p> <div id="mediane_sonore_result"></div>

            <script> const mediane_sonore = [99,86,87,88,86,103,87,94,78,77,85,86];
            let median = math.median(mediane_sonore);
            document.getElementById("mediane_sonore_result").innerHTML = median;
            </script>

            <p> Valeur absolue : </p>
            <p> Vous trouverez dans cette section les indicateurs de santé liés aux données prélevées, 
            ainsi que la carte de la salle où les mesures ont été faites.</p>
        </div>

    </div>

<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>

<script src="./vue/statseance/statseance_code.js"></script>