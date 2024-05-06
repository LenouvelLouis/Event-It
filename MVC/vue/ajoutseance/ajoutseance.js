$().ready(init);

let film=[];
let cinema=[];
let nb_salle=0;
let type_cine;
let cine_choisi;

const list_film = document.getElementById("film");
const list_cinema = document.getElementById("cinema");
const list_salle = document.getElementById("salle");
const affiche_salle = document.getElementById("affichage_salle");

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

    list_cinema.onchange = function(){
        cine_choisi = list_cinema.value;
        for(var i = 0; i < cinema.length; i++){
            if(cine_choisi == cinema[i].nom)
            {
                if(cinema[i].type_cine == 1)
                {
                    affiche_salle.style.display = "block";
                    nb_salle = cinema[i].nb_salle;

                    for(var i = 0; i < nb_salle; i++) {
                        var option = document.createElement('option');
                        option.text = "Salle "+i;
                        list_salle.appendChild(option);
                    }
                }
                else{
                    affiche_salle.style.display = "none";
                    nb_salle = 0;
                }
            }
        }
    }

}