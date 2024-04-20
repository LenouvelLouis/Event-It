function GlobalSon(selectElement) {
    const xArray1 = [50,60,70,80,90,100,110,120,130,140,150]; 
    const yArray1 = [10,20,30,40,50,60,70,80,90,80,70]; 
    const yArray2 = [70,80,90,80,70,60,50,40,30,20,10]; 
    const yArray3 = [50,60,50,60,50,60,50,60,50,60,50];

    const data0 = [
        { x: xArray1, y: yArray1, mode: "lines", name: "Capteur 1" },
        { x: xArray1, y: yArray2, mode: "lines", name: "Capteur 2" },
        { x: xArray1, y: yArray3, mode: "lines", name: "Capteur 3" }
    ];

    const data1 = [
        { x: xArray1, y: yArray1, mode: "lines", name: "Capteur 1" },
    ];

    const data2 = [
        { x: xArray1, y: yArray2, mode: "lines", name: "Capteur 2" },
    ];

    const data3 = [
        { x: xArray1, y: yArray3, mode: "lines", name: "Capteur 3" }
    ];

    const layout1 = {
        xaxis: {range: [40, 160], title: "Temps (min)"},
        yaxis: {range: [0, 90], title: "Puissance du son (dB)"},  
        title: "Evolution du son pendant la séance"
    };

    const selectedSensor = selectElement.value;
    if (selectedSensor === "bouton-global-1") {
        Plotly.restyle("myPlot1", data0);
    } 
    else if (selectedSensor === "bouton-son-1") {
        Plotly.restyle("myPlot1", data1);
    } 
    else if (selectedSensor === "bouton-son-2") {
        Plotly.restyle("myPlot1", data2);
    } 
    else if (selectedSensor === "bouton-son-3") {
        Plotly.restyle("myPlot1", data3);
    } else {
        Plotly.restyle("myPlot1", data0);
    }
}
