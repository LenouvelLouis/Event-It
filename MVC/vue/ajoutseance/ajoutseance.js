$().ready(init);

let film=[];
let cinema=[];
let salle=[];
let type_affichage = '';
let isUserAdmin;
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
const form = document.getElementById("form");
const link = document.getElementById("link");
let id;
let seance;
function init() {
    const currentUrl = window.location.href;

    let urlParams = new URLSearchParams(new URL(currentUrl).search);
    id = urlParams.get('id');
    isAdmin();
    getInfo();
    if (currentUrl.includes('voirseance')) {
        pageVoireSeance();

    }
    if(currentUrl.includes('editseance')){
        pageEditSeance();
    }
    if(currentUrl.includes('ajoutseance')){
pageAjoutFilm();
    }
}
function pageEditSeance(){
    const submitButton = document.querySelector('#button');
    submitButton.innerHTML = 'Modifier';
    submitButton.style.display = 'block';
    const cancelButton = document.querySelector('.cancel');
    cancelButton.href = './?path=pages/voirseance&id='+id;
    cancelButton.style.display = 'block';
    const link = document.getElementById('link');
    link.href = './?path=pages/editseancem&id='+id;
    link.innerHTML = 'Modifications Seance';
    document.getElementById('form').action = './?path=seance/editseance&id='+id;
    getInfoSeance();
    for (let i = 0; i < film.length; i++) {
        if(film[i].titre !== seance[0].film_titre) {
            const option = document.createElement('option');
            option.text = film[i].titre;
            option.value = JSON.stringify(film[i]);
            list_film.appendChild(option);
        }
    }
    for (let i = 0; i < cinema.length; i++) {
        if(cinema[i].nom !== seance[0].cinema_nom) {
            const option = document.createElement('option');
            option.text = cinema[i].nom;
            option.value = JSON.stringify(cinema[i]);
            list_cinema.appendChild(option);
        }
    }
    for (let i = 0; i < salle.length; i++) {
        if(salle[i].id !== seance[0].id_salle && salle[i].id_cinema === seance[0].cinema_id) {
            const option = document.createElement('option');
            option.text = salle[i].nom;
            option.value = JSON.stringify(salle[i]);
            list_salle.appendChild(option);
        }
    }
}

function pageAjoutFilm(){
    info_seance();
}
function pageVoireSeance() {
    if (isUserAdmin) {
        const editlinks = document.querySelector('.modif');
        editlinks.href = './?path=pages/editseance&id='+id;
        editlinks.style.display = 'block';
        const iconDelete = document.querySelector('.delete');
        iconDelete.href = './?path=seance/deleteSeance&id='+id;
        iconDelete.style.display = 'block';
        const iconstats = document.querySelector('.stats');
        iconstats.href = './?path=pages/statseance&id='+id;
        iconstats.style.display = 'block';
    }
    link.href = "./?path=pages/voirseance&id="+id;
    link.innerHTML = "Informations de la séance";
    list_salle.innerHTML = '';
    list_film.innerHTML = '';
    list_cinema.innerHTML = '';
    getInfoSeance();
    disableForm();
}

function getInfoSeance() {
    $.ajax({
        url: './?path=seance/getSeanceByid&id='+id,
        async: false,
        method: 'POST',
        success: function (data) {
            seance= JSON.parse(data);
            displayInfoSeance(seance);
        },
    });
}

function displayInfoSeance(seance) {
    let dateInput = document.getElementById('date');
    let heureInput = document.getElementById('heure_debut');
    dateInput.value = seance[0].date;
    heureInput.value = seance[0].horairedébut;
    if(seance[0].type_affichage === 'nouveautes'){
        document.getElementById('chek_nouveautes').checked = true;
        document.getElementById('chek_affiche').disabled = true;
        document.getElementById('chek_affiche').checked = false;
    }
    else if(seance[0].type_affichage === 'affiche'){
        document.getElementById('chek_affiche').checked = true;
        document.getElementById('chek_nouveautes').disabled = true;
        document.getElementById('chek_nouveautes').checked = false;
    }
    const filmSeance = film.filter(option => option.titre === seance[0].film_titre);
    const cinemaSeance = cinema.filter(option => option.id === seance[0].cinema_id);
    const salleSeance = salle.filter(option => option.id === seance[0].id_salle);
    const optionFilm = document.createElement('option');
    optionFilm.text = filmSeance[0].titre;
    optionFilm.value = JSON.stringify(filmSeance[0]);
    optionFilm.selected = true;
    list_film.appendChild(optionFilm);
    const optionCinema = document.createElement('option');
    optionCinema.text = cinemaSeance[0].nom;
    optionCinema.value = JSON.stringify(cinemaSeance[0]);
    optionCinema.selected = true;
    list_cinema.appendChild(optionCinema);
    const optionSalle = document.createElement('option');
    optionSalle.text = salleSeance[0].nom;
    optionSalle.value = JSON.stringify(salleSeance[0]);
    optionSalle.selected = true;
    list_salle.appendChild(optionSalle);
    element_list[0].textContent = "Film : " + filmSeance[0].titre;
    element_list[1].textContent = "Cinéma : " + cinemaSeance[0].nom;
    element_list[2].textContent = "Salle : " + salleSeance[0].nom;
    element_list[3].textContent = "Heure de début : " + seance[0].horairedébut;
    document.getElementById("image_film").src = "./vue/img/films/" + filmSeance[0].image;
}

function disableForm() {
    boutton.style.display = 'none';
    const inputsInForm = form.querySelectorAll('input');
    for (let i = 0; i < inputsInForm.length; i++) {
        inputsInForm[i].disabled = true;
    }

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

function isAdmin() {
    $.ajax({
        url: './?path=utilisateur/isAdmin',
        async: false,
        type: 'POST',
        success: function (response) {
            isUserAdmin= response ==="1";
        }
    });
}

function info_seance(){

    affichage_salle.style.display = "none";

    for(let i = 0; i < film.length; i++) {
        const option = document.createElement('option');
        option.text = film[i].titre.charAt(0).toUpperCase() + film[i].titre.slice(1);
        option.value=JSON.stringify(film[i]);
        list_film.appendChild(option);
    }

    for(let i = 0; i < cinema.length; i++) {
        const option = document.createElement('option');
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
            for(let i = 0; i < salle.length; i++) {
                if (salle[i].id_cinema == cinema.id) {
                    const option = document.createElement('option');
                    option.text = salle[i].nom;
                    option.value = JSON.stringify(salle[i]);
                    list_salle.appendChild(option);
                    
                }
            }
        }
        else{
            affichage_salle.style.display = "none";
            element_list[2].textContent = "Salle : -";
            let salleCine;
            for(let i = 0; i < salle.length; i++) {
                if (salle[i].id_cinema == cinema.id) {
                    salleCine=salleCine=salle[i];
                }
            }
            const option = document.createElement('option');
            option.text = salleCine.nom;
            option.value = JSON.stringify(salleCine);
            option.selected = true;
            list_salle.appendChild(option);
        }
    }

/**
 * Fonction qui permet de récupérer le film sélectionné
 */
list_film.onchange = function(){
    const selectedFilmOption= list_film.options[list_film.selectedIndex];
    if(selectedFilmOption.text === 'Choisir un film'){
        return;
    }
    const selectedFilm = JSON.parse(selectedFilmOption.value);
    affiche_film.src = "./vue/img/films/" + selectedFilm.image;
    element_list[0].textContent = "Film : " + selectedFilm.titre.charAt(0).toUpperCase() + selectedFilm.titre.slice(1);

    for(let i = 0; i < film.length; i++){
        if (film[i].titre === list_film.value)
        {
            id_film = film[i].id;
        }
    }
    
}

/**
 * Fonction qui permet de récupérer la salle sélectionnée
 */
list_salle.onchange = function(){
    const selectedOptionText = list_salle.options[list_salle.selectedIndex].text;
    element_list[2].textContent = "Salle : "+selectedOptionText;

    for(let i = 0; i < cinema.length; i++){
        if(cinema[i].nom === list_cinema.value)
        {
            for(let j = 0; j < salle.length; j++){
                if (salle[j].id_cinema === cinema[i].id && salle[j].nom === list_salle.value)
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