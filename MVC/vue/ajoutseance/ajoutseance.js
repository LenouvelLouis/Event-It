$().ready(init);

let film=[];
let cinema=[];
let nb_salle=0;
let type_cine;

const list_film = document.getElementById("film");
const list_cinema = document.getElementById("cinema");
const list_salle = document.getElementById("salle");
const affichage_salle = document.getElementById("affichage_salle");
const affiche_film = document.getElementById("image_film");
const list_info = document.getElementById("recap_info");
const element_list = list_info.getElementsByTagName("li");
const heure = document.getElementById("heure_debut")

function init() {
    getInfo();
    info_seance();
}

function getInfo() {
    $.ajax({
        url: './?path=seance/getFilm',
        async: false,
        method: 'GET',
        success: function (data) {
            film = JSON.parse(data);
        }
    });

    $.ajax({
        url: './?path=seance/getCinema',
        async: false,
        method: 'GET',
        success: function (data) {
            cinema = JSON.parse(data);
        }
    });
}

function info_seance(){

    affichage_salle.style.display = "none";

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

        element_list[1].textContent = "Cinéma : "+list_cinema.value;

        for(var i = 0; i < cinema.length; i++){
            if(list_cinema.value == cinema[i].nom)
            {
                if(cinema[i].type_cine == 1)
                {
                    affichage_salle.style.display = "block";
                    nb_salle = cinema[i].nb_salle;

                    for(var i = 0; i < nb_salle; i++) {
                        var option = document.createElement('option');
                        option.text = "Salle "+i;
                        list_salle.appendChild(option);
                    }
                }
                else{
                    affichage_salle.style.display = "none";
                    nb_salle = 0;
                    element_list[2].textContent = "Salle : -";
                }
            }
        }
    }

    list_film.onchange = function(){

        affiche_film.src="./vue/img/Nouveautés/" +list_film.value+ ".png";
        element_list[0].textContent = "Film : "+list_film.value;
        
    }

    list_salle.onchange = function(){

        element_list[2].textContent = "Salle : "+list_salle.value;
    }

    heure.onchange = function(){
        element_list[3].textContent = "Heure de début : "+heure.value;
    }

}