$().ready(init);

let film=[];
let cinema=[];
const list_film = document.getElementById("film");
const list_cinema = document.getElementById("cinema");

function init() {
    getInfo();
    update_list();
}

function getInfo() {
    $.ajax({
        url: './?path=ajoutseance/getFilm',
        async: false,
        method: 'GET',
        success: function (data) {
            film = JSON.parse(data);
        }
    });

    $.ajax({
        url: './?path=ajoutseance/getCinema',
        async: false,
        method: 'GET',
        success: function (data) {
            cinema = JSON.parse(data);
        }
    });
}

function update_list(){

    for(var i = 0; i < film.length; i++) {
        var option = document.createElement('option');
        option.text = film[i].titre;
        list_film.appendChild(option);
    }

    for(var i = 0; i < cinema.length; i++) {
        var option = document.createElement('option');
        option.text = cinema[i].nom;
        list_cinema.appendChild(option);
    }

}