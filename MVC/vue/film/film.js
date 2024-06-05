$().ready(init);

let film_nouveaux = [];
let film_affiche = [];
let cinemas = [];
let seances = [];
let films = [];
let currentImageIndex_nouveaux= 0;
let currentImageIndex_affiche= 0;
let imagesPerView = 5;
let totalImages_nouveaux = 0;
let totalImages_affiche = 0;
let timerId = null;
let films_seances = [];
const list_cinema = document.getElementById('list_cinema');
const carousel_nouveaux = document.getElementById("carousel_nouveaux");
const carousel_affiche = document.getElementById("carousel_affiche");
const affiche_recherche_film = document.getElementById("container_recherche_film");
const affiche_film_nouveaux = document.getElementById("container_film_nouveaux");
const affiche_film_affiche = document.getElementById("container_film_affiche");
const recherche = document.getElementById('recherche');
const resultats = document.getElementById('resultats');

window.onresize = adjustLayout;  // Le délai est de 250 millisecondes


function init() {

    get_info();

}

get_info = function() {

    $.ajax({
        url: './?path=seance/getCinema',
        async: false,
        method: 'GET',
        success: function (data) {
            cinemas = JSON.parse(data);
        }
    });

    $.ajax({
        url: './?path=seance/getSeance',
        async: false,
        method: 'GET',
        success: function (data) {
            seances = JSON.parse(data);
        }
    });

    $.ajax({
        url: './?path=seance/getFilm',
        async: false,
        method: 'GET',
        success: function (data) {
            films = JSON.parse(data);
        }
    });

    for(var i = 0; i < cinemas.length; i++) {
        var option = document.createElement('option');
        option.text = cinemas[i].nom;
        option.value = cinemas[i].nom;
        list_cinema.appendChild(option);
    }

    seances.forEach(seance => {
        films.filter(film => film.id === seance.id_film).forEach(film => {
            if (!films_seances.includes(film)) {
                films_seances.push(film);
            }
        });
    });

    affiche_film_affiche.style.display = "none";
    affiche_film_nouveaux.style.display = "none";

}

list_cinema.onchange = function() {

    var cinema_choisie = list_cinema.value;
    film_nouveaux = [];
    film_affiche = [];
    affiche_film_affiche.style.display = "flex";
    affiche_film_nouveaux.style.display = "flex";

    cinemas.filter(cinema => cinema.nom === cinema_choisie).forEach(cinema => {
        seances.filter(seance => seance.id_cinéma === cinema.id).forEach(seance => {
            films.filter(film => film.id === seance.id_film).forEach(film => {
                seances.filter(s => s.id_film === film.id).forEach(s => {
                    let filmData = {id: film.id, image: film.image};
                    if (s.type_affichage === "affiche") {
                        if (!film_nouveaux.some(f => f.id === filmData.id)) {
                            film_nouveaux.push(filmData);
                        }
                    } else {
                        if (!film_affiche.some(f => f.id === filmData.id)) {
                            film_affiche.push(filmData);
                        }
                    }
                });
            });
        });
    });

    totalImages_nouveaux= film_nouveaux.length;
    totalImages_affiche= film_affiche.length;
    carousel();

}


recherche.addEventListener('input', function(e) {
    clearTimeout(timerId); 

    timerId = setTimeout(() => { 

        let recherchePrecedente = '';
        let film_rechercher = recherche.value; 

        if (film_rechercher === recherchePrecedente) {
            return;
        }
    
        recherchePrecedente = film_rechercher;

        let filmsTrouves = films_seances.filter(film => film.titre.toLowerCase().startsWith(film_rechercher.toLowerCase()));

        resultats.innerHTML = ''; 
        filmsTrouves.forEach(film => {

            let div = document.createElement('div');

            let a = document.createElement('a');
            a.href = `.?path=pages/voirfilm&id=${film.id}`; 

            let img = document.createElement('img');
            img.src = "./vue/img/films/"+film.image; 
            a.appendChild(img);
            div.appendChild(a);

            let span = document.createElement('span');
            span.textContent = film.titre;
            div.appendChild(span);

            resultats.appendChild(div);
        });
    }, 500);
});

function carousel(){
    carousel_nouveaux.innerHTML = "";
    carousel_affiche.innerHTML = "";
    for(i=0;i<totalImages_nouveaux;i++)
    {
        a=document.createElement("a");
        a.href = `.?path=pages/voirfilm&id=${film_nouveaux[i].id}`;
        div = document.createElement("div");
        div.className="image_container_nouveaux";

        if (i < imagesPerView) {
            div.style.display = "block";
        } else {
            div.style.display = "none"; 
        }

        img = document.createElement("img");
        img.src = "./vue/img/films/" + film_nouveaux[i].image ;
        div.appendChild(img);
        a.appendChild(div);
        carousel_nouveaux.appendChild(a);
    }

    for(i=0;i<totalImages_affiche;i++)
    {
        a=document.createElement("a");
        a.href = `.?path=pages/voirfilm&id=${film_affiche[i].id}`;
        div = document.createElement("div");
        div.className="image_container_affiche";

        if (i < imagesPerView) {
            div.style.display = "block";
        } else {
            div.style.display = "none"; 
        }

        img = document.createElement("img");
        img.src = "./vue/img/films/" + film_affiche[i].image;
        div.appendChild(img); 
        a.appendChild(div);
        carousel_affiche.appendChild(a);
    }

}

function moveRight_nouveaux() {
    if (currentImageIndex_nouveaux < totalImages_nouveaux - imagesPerView) {
        currentImageIndex_nouveaux ++;
        updateSlidePosition();
    }
}
function moveRight_affiche() {
    if (currentImageIndex_affiche < totalImages_affiche - imagesPerView) {
        currentImageIndex_affiche ++;
        updateSlidePosition();
    }
}

function moveLeft_nouveaux() {
    if (currentImageIndex_nouveaux > 0) {
        currentImageIndex_nouveaux --;
        updateSlidePosition();
    }
}
function moveLeft_affiche() {
    if (currentImageIndex_affiche > 0) {
        currentImageIndex_affiche --;
        updateSlidePosition();
    }
}

function updateSlidePosition() {

    let divs_nouveaux = document.getElementsByClassName("image_container_nouveaux");
    let divs_affiche = document.getElementsByClassName("image_container_affiche");
    // Masquer tous les divs
    for (let div of divs_nouveaux) {
        div.style.display = "none";
    }
    for (let div of divs_affiche) {
        div.style.display = "none";
    }
    // Afficher seulement les divs nécessaires
    for (let i = currentImageIndex_nouveaux; i < currentImageIndex_nouveaux + imagesPerView; i++) {
        if (i < totalImages_nouveaux) {
            divs_nouveaux[i].style.display = "block";
        }
    }
    for (let i = currentImageIndex_affiche; i < currentImageIndex_affiche + imagesPerView; i++) {
        if (i < totalImages_affiche) {
            divs_affiche[i].style.display = "block";
        }
    }
}

// Responsive

function adjustLayout() {

    const taille_fenetre = window.innerWidth; 

    if ( 900 < taille_fenetre && taille_fenetre< 1100) {
        imagesPerView = 4;
        updateSlidePosition();
    }
    else if(750 < taille_fenetre && taille_fenetre< 900){
        imagesPerView = 3;
        updateSlidePosition();
    }
    else if(550 < taille_fenetre && taille_fenetre < 750){
        imagesPerView = 2;
        updateSlidePosition();
    }
    else if(taille_fenetre < 550){
        imagesPerView = 1;
        updateSlidePosition();
    }
    else{
        imagesPerView = 5;
        updateSlidePosition();
    }
}

function showDropdown(element) {
    var dropdownContent = document.getElementById('resultats');
    if (element.value !== '') {
        dropdownContent.style.display = 'block';
    } else {
        dropdownContent.style.display = 'none';
    }
}

document.addEventListener('click', function(event) {
    if (!resultats.contains(event.target)) {
        resultats.style.display = 'none';
    }
});