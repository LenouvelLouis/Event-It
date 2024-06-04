const xArray = [0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150]; 

const yArray1 = [10,10,10,10,10,10,20,30,40,50,60,70,80,90,80,70]; 
const yArray2 = [70,70,70,70,70,70,80,90,80,70,60,50,40,30,20,10]; 
const yArray3 = [50,50,50,50,50,50,60,50,60,50,60,50,60,50,60,50];

const yArray4 = [10,10,10,10,10,10,20,30,40,50,60,70,80,90,80,70]; 
const yArray5 = [70,70,70,70,70,70,80,90,80,70,60,50,40,30,20,10]; 
const yArray6 = [50,50,50,50,50,50,60,50,60,50,60,50,60,50,60,50];

const capteur_son = document.getElementById("quel_capteur_sonore");
const capteur_temp = document.getElementById("quel_capteur_temp");
let id;
let stat;
let idCapteur =[];
let myChartSon;
let myChartTemp;


$().ready(init);

function init() {
    const currentUrl = window.location.href;
    let urlParams = new URLSearchParams(new URL(currentUrl).search);
    id = urlParams.get('id');
    getStatSeance();
    GlobalSon();
    GlobalTemp();
}

function getStatSeance() {
    $.ajax({
        url: "./?path=stat/getStatSeance&id="+id,
        type: "GET",
        async: false,
        dataType: "json",
        success: function (data) {
                stat=data;
                for (let key in data.son) {
                    if (data.son.hasOwnProperty(key) && !isNaN(key) && !idCapteur.includes(data.son[key].id_capteur)) {
                        idCapteur.push(data.son[key].id_capteur);
                    }
                }
                displayCapteur();
                $('#moyenne').html(data.son.mean);
                $('#mediane').html(data.son.median);
                $('#mode').html(data.son.mode);
                $('#moyenne2').html(data.temperature.mean);
                $('#mediane2').html(data.temperature.median);
                $('#mode2').html(data.temperature.mode);

        },
        error: function (error) {
            window.location.href = "./?path=pages/accueil";
        }
    });
}

function displayCapteur() {
    let optionsSon = ``;
    let optionsTemp = ``;
    for (let i = 0; i < idCapteur.length; i++) {
        optionsSon += `<option value="${idCapteur[i]}">Capteur sonore ${idCapteur[i]}</option>`;
        optionsTemp += `<option value="${idCapteur[i]}">Capteur température ${idCapteur[i]}</option>`;
    }
    $('#quel_capteur_sonore').append(optionsSon);
    $('#quel_capteur_temp').append(optionsTemp);

}


capteur_son.onchange = function updateSonGraph() {
    let selectedValue1 = document.getElementById("quel_capteur_sonore").value;
    let sensorDatas = [];
    if (selectedValue1 === "bouton-global") {
        GlobalSon();
    }
    else{
        selectedValue1 = Number(selectedValue1);
        for (let key in stat.son) {
            if (stat.son.hasOwnProperty(key) && !isNaN(key)) {

                if(stat.son[key].id_capteur == selectedValue1){
                    sensorDatas.push(stat.son[key]);
                }}
    }
        sensorDatas.sort((a, b) => new Date(`1970-01-01T${a.temps}Z`) - new Date(`1970-01-01T${b.temps}Z`));
        displaySonGraph(sensorDatas); // Déplacez cette ligne ici

    }
}

function displaySonGraph(sensorDatas) {
    if (myChartSon) {
        myChartSon.destroy();
    }
    let dataset = {
        label: `Capteur sonore ${sensorDatas[0].id_capteur}`,
        data: sensorDatas.map(sensorData => ({x: new Date(`1970-01-01T${sensorData.temps}Z`), y: sensorData.valeur})),
        borderColor: 'red',
        fill: false,
        lineTension: 0.1
    };
    myChartSon = new Chart("myPlot1", {
        type: "line",
        data: {
            datasets: [dataset]
        },
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'minute'
                    }
                }
            }
        }
    });
}

capteur_temp.onchange = function updateTempGraph() {
    let selectedValue2 = document.getElementById("quel_capteur_temp").value;
    let sensorDatas = [];
    if (selectedValue2 === "bouton-global-2") {
        GlobalTemp();
    }
    else {
        selectedValue2 = Number(selectedValue2);
        for (let key in stat.temperature) {
            if (stat.temperature.hasOwnProperty(key) && !isNaN(key)) {
                if(stat.temperature[key].id_capteur === selectedValue2){
                    sensorDatas.push(stat.temperature[key]);
                }
            }
        }
        sensorDatas.sort((a, b) => new Date(`1970-01-01T${a.temps}Z`) - new Date(`1970-01-01T${b.temps}Z`));
        displayTempGraph(sensorDatas);
    }
}


/**
 * Display the graph of the selected sensor
 * @param sensorDatas
 */
function displayTempGraph(sensorDatas) {
    if (myChartTemp) {
        myChartTemp.destroy();
    }
    let dataset = {
        label: `Capteur température ${sensorDatas[0].id_capteur}`,
        data: sensorDatas.map(sensorData => ({x: new Date(`1970-01-01T${sensorData.temps}Z`), y: sensorData.valeur})),
        borderColor: 'red',
        fill: false
    };
    myChartTemp = new Chart("myPlot2", {
        type: "line",
        data: {
            datasets: [dataset]
        },
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'minute',
                        displayFormats: {
                            minute: 'HH:mm'
                        }
                    },
                    display: true,
                    title: {
                        display: true,
                        text: 'Temps'
                    }
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Degrés Celsius'
                    }
                }
            }
        }
    });
}


function GlobalSon() {
    let datasets = [];
    let colors = ['red', 'green', 'blue', 'yellow', 'purple', 'orange', 'pink']; // Add more colors if you have more sensors
    let groupedData = {};
    for (let key in stat.son) {
        if (stat.son.hasOwnProperty(key) && !isNaN(key)) {
            let sensorData = stat.son[key];
            if (!groupedData[sensorData.id_capteur]) {
                groupedData[sensorData.id_capteur] = [];
            }
            groupedData[sensorData.id_capteur].push({x: new Date(`1970-01-01T${sensorData.temps}Z`), y: sensorData.valeur});
        }
    }
    let i = 0;
    for (let id_capteur in groupedData) {
        groupedData[id_capteur].sort((a, b) => a.x - b.x);

        let dataset = {
            label: `Capteur sonore ${id_capteur}`,
            data: groupedData[id_capteur],
            borderColor: colors[i % colors.length],
            fill: false,
            lineTension: 0.1
        };
        datasets.push(dataset);
        i++;
    }

    if (myChartSon) {
        myChartSon.destroy();
    }
    myChartSon = new Chart("myPlot1", {
        type: "line",
        data: {
            datasets: datasets
        },
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'minute'
                    }
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Décibels'
                    }
                }
            }
        }
    });
}
/**
 * Display the graph of all the sensors
 */
function GlobalTemp() {
    let datasets = [];
    let colors = ['red', 'green', 'blue', 'yellow', 'purple', 'orange', 'pink']; // Add more colors if you have more sensors
    let groupedData = {};
    for (let key in stat.temperature) {
        if (stat.temperature.hasOwnProperty(key) && !isNaN(key)) {
            let sensorData = stat.temperature[key];
            if (!groupedData[sensorData.id_capteur]) {
                groupedData[sensorData.id_capteur] = [];
            }
            groupedData[sensorData.id_capteur].push({x: new Date(`1970-01-01T${sensorData.temps}Z`), y: sensorData.valeur});
        }
    }
    let i = 0;
    for (let id_capteur in groupedData) {
        groupedData[id_capteur].sort((a, b) => a.x - b.x);

        let dataset = {
            label: `Capteur température ${id_capteur}`,
            data: groupedData[id_capteur],
            borderColor: colors[i % colors.length],
            fill: false
        };
        datasets.push(dataset);
        i++;
    }

    if (myChartTemp) {
        myChartTemp.destroy();
    }
    myChartTemp = new Chart("myPlot2", {
        type: "line",
        data: {
            datasets: datasets
        },
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'minute'
                    }
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Degrés Celsius'
                    }
            }
        }
        }
    });

}