$().ready(init);

let film=[];
let cinema=[];
let salle=[];
let type_cine;

let id_cinema;
let id_film;
let id_salle;
let type_affichage;
let heure_debut;
let cine_interieur;

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
            if (cinema[i].nom == list_cinema.value)
            {
                id_cinema = cinema[i].id;
            }
        }

        for(var i = 0; i < cinema.length; i++){
            if(list_cinema.value == cinema[i].nom)
            {
                if(cinema[i].type_cine == 1)
                {
                    affichage_salle.style.display = "block";
                    list_salle.options.length=0;
                    cine_interieur = 1;
                    for(let j=0;j<salle.length;j++){
                        if(salle[j].id_cinéma==cinema[i].id){
                            var option = document.createElement('option');
                            option.text = salle[j].nom;
                            list_salle.appendChild(option);
                        }
                    }
                }
                else{
                    affichage_salle.style.display = "none";
                    element_list[2].textContent = "Salle : -";
                    cine_interieur = 0;

                    for(var i = 0; i < cinema.length; i++){

                        if(cinema[i].nom == list_cinema.value)
                        {
                            for(var j = 0; j < salle.length; j++){
                                if (salle[j].id_cinéma == cinema[i].id && salle[j].nom == "Salle 01")
                                {
                                    id_salle = salle[j].id;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}

list_film.onchange = function(){

    affiche_film.src="./vue/img/Nouveautés/" +list_film.value+ ".png";
    element_list[0].textContent = "Film : "+list_film.value;

    for(var i = 0; i < film.length; i++){
        if (film[i].titre == list_film.value)
        {
            id_film = film[i].id;
        }
    }
    
}

list_salle.onchange = function(){

    element_list[2].textContent = "Salle : "+list_salle.value;

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
    }else{
        chek_nouv.disabled = false;
    }
});


boutton.addEventListener('click', function() {


    if(cine_interieur == 1)
    {
        if(list_cinema.value == "Choisir un cinéma" || list_film.value == "Choisir un film" || list_salle.value=="" || heure.value=="" || (chek_affiche.checked==0 && chek_nouv.checked==0))
        {
            alert("test");
        }
        else{
            $.ajax({
                url: './?path=seance/ajoutSeance',
                async: false,
                method: 'POST',
                data : {cinema:id_cinema, film:id_film, salle:id_salle, affichage:type_affichage, heure:heure_debut }
            });
        }

    }else{

        if(list_cinema.value == "Choisir un cinéma" || list_film.value == "Choisir un film" || heure.value=="" || (chek_affiche.checked==0 && chek_nouv.checked==0))
        {
            console.log("Non");
        }
        else{
            console.log("Ok");

            $.ajax({
                url: './?path=seance/ajoutSeance',
                async: false,
                method: 'POST',
                data : {cinema:id_cinema, film:id_film, salle:id_salle, affichage:type_affichage, heure:heure_debut }
            });
        }

    }


});