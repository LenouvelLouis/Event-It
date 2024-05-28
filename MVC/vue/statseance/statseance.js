const xArray = [0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150]; 

const yArray1 = [10,10,10,10,10,10,20,30,40,50,60,70,80,90,80,70]; 
const yArray2 = [70,70,70,70,70,70,80,90,80,70,60,50,40,30,20,10]; 
const yArray3 = [50,50,50,50,50,50,60,50,60,50,60,50,60,50,60,50];

const yArray4 = [10,10,10,10,10,10,20,30,40,50,60,70,80,90,80,70]; 
const yArray5 = [70,70,70,70,70,70,80,90,80,70,60,50,40,30,20,10]; 
const yArray6 = [50,50,50,50,50,50,60,50,60,50,60,50,60,50,60,50];




// Nouvelle version du code en dessous //
$().ready(init);

const cinema_son = document.getElementById("quel_cinema_sonore");
const seance_son = document.getElementById("quel_seance_sonore");
const capteur_son = document.getElementById("quel_capteur_sonore");
const cinema_temp = document.getElementById("quel_cinema_temp");
const seance_temp = document.getElementById("quel_seance_temp");
const capteur_temp = document.getElementById("quel_capteur_temp");
let longueur_seance = [];
let echelle_son = [];
let echelle_temp = [];

new Chart("myPlot1", {
    type: "line",
    data: {
        labels: xArray,
        datasets: [{ 
            data: yArray1,
            borderColor: "red",
            fill: false
        }, { 
            data: yArray2,
            borderColor: "green",
            fill: false
        }, { 
            data: yArray3,
            borderColor: "blue",
            fill: false
        }]
    },
    options: {
        legend: {display: false}
    }
  }
);

new Chart("myPlot2", {
    type: "line",
    data: {
        labels: xArray,
        datasets: [{ 
            data: yArray4,
            borderColor: "grey",
            fill: false
        }, { 
            data: yArray5,
            borderColor: "brown",
            fill: false
        }, { 
            data: yArray6,
            borderColor: "purple",
            fill: false
        }]
    },
    options: {
        legend: {display: false}
    }
  }
);


function info_capteur(){
// Ici je vais recuperer les infos
}

function requete_ajax(){
// ici je vais faire les requetes ajax 
}

// Ici (ou dans une fonction ?) je vais mettre à partir de la base de données les values qui seront disponibles dans les menus déroulant


function changement_son(){
    switch (expression) {
        case n1:
            //instructions
            break;
        case n2:
            //instructions
            break;
        default:
            //instructions
    }
    

    cinema_son.onchange = function(){
    }

    seance_son.onchange = function(){
    }

    capteur_son.onchange = function updateSonGraph() {
        const selectedValue1 = document.getElementById("quel_capteur_sonore").value;
        if (selectedValue1 === "bouton-global-1") {
            GlobalSon();
        } else if (selectedValue1 === "bouton-son-1") {
            Son1();
        } else if (selectedValue1 === "bouton-son-2") {
            Son2();
        } else if (selectedValue1 === "bouton-son-3") {
            Son3();
        }
    }

    cinema_temp.onchange = function(){
    }

    seance_temp.onchange = function(){
    }

    capteur_temp.onchange = function updateTempGraph() {
    const selectedValue2 = document.getElementById("quel_capteur_temp").value;
    if (selectedValue2 === "bouton-global-2") {
        GlobalTemp();
    } else if (selectedValue2 === "bouton-temp-1") {
        Temp1();
    } else if (selectedValue2 === "bouton-temp-2") {
        Temp2();
    } else if (selectedValue2 === "bouton-temp-3") {
        Temp3();
    }
}

}



function GlobalSon() {
    new Chart("myPlot1", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray1,
                borderColor: "red",
                fill: false
            }, { 
                data: yArray2,
                borderColor: "green",
                fill: false
            }, { 
                data: yArray3,
                borderColor: "blue",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
} 

function Son1(){
    new Chart("myPlot1", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray1,
                borderColor: "red",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
}

function Son2(){
    new Chart("myPlot1", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray2,
                borderColor: "green",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
}

function Son3(){
    new Chart("myPlot1", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray3,
                borderColor: "blue",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
}

function GlobalTemp() {
    new Chart("myPlot2", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray4,
                borderColor: "grey",
                fill: false
            }, { 
                data: yArray5,
                borderColor: "brown",
                fill: false
            }, { 
                data: yArray6,
                borderColor: "purple",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
} 

function Temp1(){
    new Chart("myPlot2", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray4,
                borderColor: "grey",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
}

function Temp2(){
    new Chart("myPlot2", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray5,
                borderColor: "brown",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
}

function Temp3(){
    new Chart("myPlot2", {
        type: "line",
        data: {
            labels: xArray,
            datasets: [{ 
                data: yArray6,
                borderColor: "purple",
                fill: false
            }]
        },
        options: {
            legend: {display: false}
        }
    });
}