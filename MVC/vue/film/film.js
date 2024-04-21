const nom_film_nouveaux = ["Barbie", "Bob_Marley", "Dune", "Grand_Turismo", "Madame_Web", "Maison_de_Retraite", "Oppenheimer", "Spider_Man", "Spider_Man", "Spider_Man", "Spider_Man"];
const nom_film_affiche = ["Barbie", "Bob_Marley", "Dune", "Grand_Turismo", "Madame_Web", "Maison_de_Retraite", "Oppenheimer", "Oppenheimer", "Oppenheimer", "Oppenheimer", "Oppenheimer"];
const cinemas = ["Cinema1", "Cinema2", "Cinema3", "Cinema4", "Cinema5", "Cinema6", "Cinema7"];
let currentImageIndex_nouveaux= 0;
let currentImageIndex_affiche= 0;
const imagesPerView = 5;
const totalImages_nouveaux = nom_film_nouveaux.length;
const totalImages_affiche = nom_film_affiche.length;
const carousel_nouveaux = document.getElementById("carousel_nouveaux");
const carousel_affiche = document.getElementById("carousel_affiche");

document.body.onload = function(){

    var list_cinema = document.getElementById('list_cinema');

    for(var i = 0; i < cinemas.length; i++) {
        var option = document.createElement('option');
        option.text = cinemas[i];
        option.value = cinemas[i];
        list_cinema.appendChild(option);
    }

    for(i=0;i<totalImages_nouveaux;i++)
    {
        div = document.createElement("div");
        div.className="image_container_nouveaux";

        if (i < imagesPerView) {
            div.style.display = "block";
        } else {
            div.style.display = "none"; 
        }

        img = document.createElement("img");
        img.src = "./vue/img/Nouveautés/" + nom_film_nouveaux[i] + ".png";
        div.appendChild(img); 
        carousel_nouveaux.appendChild(div);
    }

    for(i=0;i<totalImages_affiche;i++)
    {
        div = document.createElement("div");
        div.className="image_container_affiche";

        if (i < imagesPerView) {
            div.style.display = "block";
        } else {
            div.style.display = "none"; 
        }

        img = document.createElement("img");
        img.src = "./vue/img/A_l'affiche/" + nom_film_affiche[i] + ".png";
        div.appendChild(img); 
        carousel_affiche.appendChild(div);
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