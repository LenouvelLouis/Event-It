$().ready(init);
let cinemas = [];
const list_cinema = document.getElementById('list_cinema');
const recherche = document.getElementById('recherche');
const resultats = document.getElementById('resultats');
let timerId = null;

function afficheCinema() {
    let html = '';
    for (let i = 0; i < cinemas.length; i++) {
        html += '<div class="cinema-card ' + (i % 2 === 0 ? 'grey' : '') + '">';
        html += '<a href="./?path=pages/infocinema&id=' + cinemas[i].id + '"><img src="./vue/img/cinemas/' + cinemas[i].image + '" alt="' + cinemas[i].nom + '" width="300"></a>';
        html += '<div class="cinema-info">';
        html += '<a href="./?path=pages/infocinema&id=' + cinemas[i].id + '"><h2>' + cinemas[i].nom + '</h2></a>';
        html += '<p>' + cinemas[i].adresse + '</p>';
        html += '<div class="icons">';
        if (cinemas[i].handicape == 1) {
            html += '<i class="fa-solid fa-wheelchair"></i>';
        }
        if (cinemas[i].sourd == 1) {
            html += '<i class="fa-solid fa-ear-deaf"></i>';
        }
        if (cinemas[i].malvoyant == 1) {
            html += '<i class="fa-regular fa-eye-slash"></i>';
        }
        html += '</div>';
        html += '</div>';
        html += '</div>';
    }
    list_cinema.innerHTML = html;
}

function getListCinema() {
    $.ajax({
        url: './?path=cinema/getCinemaList',
        async: false,
        method: 'GET',
        success: function (data) {
            console.log(data);
            cinemas = JSON.parse(data);
        }
    });
    afficheCinema();
}

function init() {
    getListCinema();
}

recherche.addEventListener('input', function(e) {
    clearTimeout(timerId);

    timerId = setTimeout(() => {

        let recherchePrecedente = '';
        let cinema_rechercher = recherche.value;

        if (cinema_rechercher === recherchePrecedente) {
            return;
        }

        recherchePrecedente = cinema_rechercher;

        let cinemasTrouves = cinemas.filter(cinema => cinema.nom.toLowerCase().startsWith(cinema_rechercher.toLowerCase()));

        resultats.innerHTML = '';
        cinemasTrouves.forEach(cinema => {

            let div = document.createElement('div');
            div.style.display = 'flex';
            div.style.justifyContent = 'center';
            div.style.flexDirection = 'column';
            div.style.alignItems = 'center';

            let a = document.createElement('a');
            a.href = `./?path=pages/infocinema&id=${cinema.id}`;

            let img = document.createElement('img');
            img.src = "./vue/img/cinemas/"+cinema.image;
            img.style.width = '100px';
            img.style.height = '100px';
            a.appendChild(img);
            div.appendChild(a);

            let span = document.createElement('span');
            span.textContent = cinema.nom;
            div.appendChild(span);

            resultats.appendChild(div);
        });
    }, 500);
});

function showDropdown(element) {
    var dropdownContent = document.getElementById('resultats');
    if (element.value !== '') {
        dropdownContent.style.display = 'block';
    } else {
        dropdownContent.style.display = 'none';
    }
}