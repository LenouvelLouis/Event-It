$().ready(init);
let id;

function init() {
    const currentUrl = window.location.href;
    let urlParams = new URLSearchParams(new URL(currentUrl).search);
    id = urlParams.get('id');
    getInfoCinema();
    initMap();
    getWeather();
}
function getWeather() {
    const apiKey = '8fe0c12b136bde87846ad7efc632889e'; // Replace with your actual API key
    const city = 'Paris,fr';
    const url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric&lang=fr`;

    fetch(url)
        .then(response => response.json())
        .then(data => {
            const weatherDiv = document.getElementById('weather');
            weatherDiv.innerHTML = `
                <h2>Météo à ${data.name}</h2>
                <p>${data.weather[0].description}</p>
                <p>Température : ${data.main.temp}°C</p>
            `;
        })
        .catch(error => console.error('Erreur :', error));
}

function initMap(){
    // Coordonnées de la France
    const map = L.map('mapid').setView([46.603354, 1.888334], 5);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
    }).addTo(map);

    const geocoder = L.Control.geocoder({
        defaultMarkGeocode: false
    })
        .on('markgeocode', function(e) {
            var bbox = e.geocode.bbox;
            var poly = L.polygon([
                bbox.getSouthEast(),
                bbox.getNorthEast(),
                bbox.getNorthWest(),
                bbox.getSouthWest()
            ]).addTo(map);
            map.fitBounds(poly.getBounds());
        })
        .addTo(map);

    function setMapAddress(address) {
        geocoder.markGeocode(address);
    }

    // Coordonnées de Paris
    const paris = L.marker([48.8566, 2.3522]).addTo(map);
    paris.bindPopup("<b>Paris</b>").openPopup();
}
function getInfoCinema() {
    $.ajax({
        url: "./?path=cinema/getInfoCinema&id="+id,
        type: "GET",
        async: false,
        dataType: "json",
        success: function (data) {
            const titre = document.querySelector('.titre_cine h1');
            titre.innerHTML = data.nom;
            const adresse = document.querySelector('.adresse_cine');
            adresse.innerHTML = "Adresse : "+data.adresse;
            const telephone = document.querySelector('.telephone_cine');
            telephone.innerHTML = "Téléphone : "+data.telephone;
            const email = document.querySelector('.email_cine');
            email.innerHTML = "Email : "+data.mail;
            const pmrIcon = document.querySelector('.icons-wheelchair');
            const deafIcon = document.querySelector('.icons-ear-deaf');
            const blindIcon = document.querySelector('.icons-eye-slash');
            const accessibilityText = document.querySelector('.accessibility-text');
            const img = document.querySelector('#img');
            img.src = "vue/img/cinemas/"+data.image;
            pmrIcon.style.display = 'none';
            deafIcon.style.display = 'none';
            blindIcon.style.display = 'none';
            accessibilityText.style.display = 'none';
            if (data.handicape === 1) {
                pmrIcon.style.display = 'inline';
            }
            if (data.sourd === 1) {
                deafIcon.style.display = 'inline';
            }
            if (data.malvoyant === 1) {
                blindIcon.style.display = 'inline';
            }
            if (data.handicape !== 1 && data.sourd !== 1 && data.malvoyant !== 1) {
                accessibilityText.style.display = 'block';
                accessibilityText.innerHTML = 'No accessibility options available';
            }

        }
    });
}