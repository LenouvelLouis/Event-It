$().ready(init);

let film=[];
let cinema=[];
let salle=[];
let type_affichage = '';

const list_film = document.getElementById("film");
const list_cinema = document.getElementById("cinema");
const list_salle = document.getElementById("salle");
const affichage_salle = document.getElementById("affichage_salle");
const affiche_film = document.getElementById("image_film");
const list_info = document.getElementById("recap_info");
const element_list = list_info.getElementsByTagName("li");
const heure = document.getElementById("heure_debut");
const boutton = document.getElementById("button");
const chek_nouv = document.getElementById("chek_nouveautes");
const chek_affiche = document.getElementById("chek_affiche");

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

    $.ajax({
        url: './?path=seance/getSalle',
        async: false,
        method: 'GET',
        success: function (data) {
            salle = JSON.parse(data);
        }
    });
}

function info_seance(){

    affichage_salle.style.display = "none";

    for(var i = 0; i < film.length; i++) {
        var option = document.createElement('option');
        option.text = film[i].titre.charAt(0).toUpperCase() + film[i].titre.slice(1);
        option.value=JSON.stringify(film[i]);
        list_film.appendChild(option);
    }

    for(var i = 0; i < cinema.length; i++) {
        var option = document.createElement('option');
        option.text = cinema[i].nom;
        option.value=JSON.stringify(cinema[i]);
        list_cinema.appendChild(option);
    }
}
    list_cinema.onchange = function(){
        const selectedOptionText = list_cinema.options[list_cinema.selectedIndex].text;
        element_list[1].textContent = "Cinéma : " + selectedOptionText;
        const cinema = JSON.parse(list_cinema.value);
        list_salle.innerHTML = '';
        if(cinema.type_cine == 1)
        {
            affichage_salle.style.display = "block";
            for(var i = 0; i < salle.length; i++) {
                if (salle[i].id_cinéma == cinema.id) {
                    var option = document.createElement('option');
                    option.text = salle[i].nom;
                    option.value = JSON.stringify(salle[i]);
                    list_salle.appendChild(option);
                    
                }
            }
        }
        else{
            affichage_salle.style.display = "none";
            element_list[2].textContent = "Salle : -";
        }
    }

/**
 * Fonction qui permet de récupérer le film sélectionné
 */
list_film.onchange = function(){
    const selectedFilmOption= list_film.options[list_film.selectedIndex];
    if(selectedFilmOption.text == 'Choisir un film'){
        return;
    }
    const selectedFilm = JSON.parse(selectedFilmOption.value);
    affiche_film.src = "./vue/img/films/" + selectedFilm.image;
    element_list[0].textContent = "Film : " + selectedFilm.titre.charAt(0).toUpperCase() + selectedFilm.titre.slice(1);

    for(var i = 0; i < film.length; i++){
        if (film[i].titre == list_film.value)
        {
            id_film = film[i].id;
        }
    }
    
}

list_salle.onchange = function(){
    const selectedOptionText = list_salle.options[list_salle.selectedIndex].text;
    element_list[2].textContent = "Salle : "+selectedOptionText;

    for(var i = 0; i < cinema.length; i++){

        if(cinema[i].nom == list_cinema.value)
        {
            for(var j = 0; j < salle.length; j++){
                if (salle[j].id_cinéma == cinema[i].id && salle[j].nom == list_salle.value)
                {
                    id_salle = salle[j].id;
                }
            }
        }
    }
}

heure.onchange = function(){
    element_list[3].textContent = "Heure de début : "+heure.value;  
    heure_debut = heure.value;
}

chek_nouv.addEventListener('change', function() {
    if (this.checked) {
        type_affichage = 'nouveautes';
        chek_affiche.value = 0;
        chek_affiche.disabled = true;
    }
    else{
        chek_affiche.disabled = false;
    }
});

chek_affiche.addEventListener('change', function() {
    if (this.checked) {
        type_affichage = 'affiche';
        chek_nouv.disabled = true;
        chek_nouv.value = 0;
    }else{
        chek_nouv.disabled = false;
    }
});