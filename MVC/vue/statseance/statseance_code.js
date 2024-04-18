// Dans votre fichier statseance_code.js

google.charts.load('current', {'packages':['corechart']});

// Fonction pour dessiner le graphique des statistiques des capteurs sonores
function drawSoundSensorChart() {
    // Définir les données du graphique
    var data = google.visualization.arrayToDataTable([
        ['X', 'Y'],
        [1, 2],
        [2, 3],
        [3, 5],
        [1, 2],
        [2, 3],
        [3, 5],
        [1, 2],
        [2, 3],
        [3, 5],
        [1, 2],
        [2, 3],
        [3, 5],
        // Ajoutez vos données ici...
    ]);

    // Configuration du graphique avec Google Charts
    var options = {
        title: 'Statistiques des capteurs sonores',
        hAxis: {title: 'X'},
        vAxis: {title: 'Y'},
        legend: 'none'
        // Ajoutez d'autres options selon vos besoins...
    };

    // Dessiner le graphique
    var chart = new google.visualization.LineChart(document.getElementById('myChart'));
    chart.draw(data, options);
}
