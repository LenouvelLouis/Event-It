$().ready(init);
let isUserAdmin;
let id;
let link
let infosFilm;
let  session;
function init() {
    const currentUrl = window.location.href;
    link = document.getElementById('links-film');
    let urlParams = new URLSearchParams(new URL(currentUrl).search);
    id = urlParams.get('id');
    isAdmin();
    if (currentUrl.includes('voirfilm')) {
       pageVoirFilm();
    }
    if(currentUrl.includes('editfilm')){
        pageEditFilm();
    }
}
function pageVoirFilm() {
    getInfosFilm();
    getSeanceFilm();
    if (isUserAdmin) {
        const editlinks = document.querySelector('.modif');
        editlinks.href = './?path=pages/editfilm&id='+id;
        editlinks.style.display = 'block';
        const iconDelete = document.querySelector('.delete');
        iconDelete.href = './?path=film/deleteFilm&id='+id;
        iconDelete.style.display = 'block';
    }
    console.log(session);
    if(session.length>0){
        const seance_films = document.querySelector('.seance-films');
        seance_films.style.display = 'block';
    }

    link.href = './?path=pages/voirfilm&id='+id;
    link.innerHTML = 'Informations Film';
    const submitButton = document.querySelector('.button-ajout-film');
    if (submitButton) {
        submitButton.style.display = 'none';
    }

    const form = document.getElementById('form-page');
    const inputsInForm = form.querySelectorAll('input');
    inputsInForm.forEach(input => {
        input.disabled = true;
    });

    const textareas = document.querySelectorAll('textarea');
    textareas.forEach(textarea => {
        textarea.disabled = true;
    });
}

function pageEditFilm() {
    const submitButton = document.querySelector('.button-ajout-film');
    submitButton.innerHTML = 'Modifier';
    submitButton.style.display = 'block';
    const cancelButton = document.querySelector('.cancel');
    cancelButton.href = './?path=pages/voirfilm&id='+id;
    cancelButton.style.display = 'block';
    getInfosFilm();
    const link = document.getElementById('links-film');
    link.href = './?path=pages/editfilm&id='+id;
    link.innerHTML = 'Modifications Film';
    document.getElementById('delete-img').style.display = 'block';
    document.getElementById('form-page').action = './?path=film/editFilm&id='+id;
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

/**
 * Récupère les séances du film
 */
function getSeanceFilm() {
    $.ajax({
        url: './?path=film/getSeanceFilm&id='+id,
        type: 'POST',
        async: false,
        success: function (response) {
            session=JSON.parse(response);
            displaySessions(session);
        }
    });

}

/**
 * Affiche les séances
 * @param sessions
 */
function displaySessions(sessions) {
    const filmsContainer = document.getElementById('films-container');
    const sessionsByCinema = sessions.reduce((groups, session) => {
        const group = groups[session.cinema_nom] || [];
        group.push(session);
        groups[session.cinema_nom] = group;
        return groups;
    }, {});
    for (const cinema in sessionsByCinema) {
        const filmDiv = document.createElement('div');
        filmDiv.className = 'film';

        const cinemaDiv = document.createElement('div');
        const cinemaName = document.createElement('h4');
        cinemaName.textContent = cinema;
        cinemaDiv.appendChild(cinemaName);
        filmDiv.appendChild(cinemaDiv);

        const sessionsDiv = document.createElement('div');
        sessionsDiv.className = 'seance';

        sessionsByCinema[cinema].forEach(session => {
            const sessionLink = document.createElement('a');
            sessionLink.href = './?path=pages/voirseance&id=' + session.id;

            const sessionCard = document.createElement('div');
            sessionCard.className = 'seance-card';

            const salleP = document.createElement('p');
            salleP.textContent = session.salle_nom;
            sessionCard.appendChild(salleP);

            const horaireP = document.createElement('p');
            horaireP.textContent = session.horairedébut;
            sessionCard.appendChild(horaireP);

            sessionLink.appendChild(sessionCard);
            sessionsDiv.appendChild(sessionLink);
        });

        filmDiv.appendChild(sessionsDiv);
        filmsContainer.appendChild(filmDiv);
    }
}

/**
 * Récupère les informations du film
 */
function getInfosFilm() {
    $.ajax({
        url: './?path=film/getInfosFilm&id='+id,
        type: 'POST',
        success: function (response) {
            infosFilm = JSON.parse(response);
            document.getElementById('titre').value = infosFilm.titre.charAt(0).toUpperCase() + infosFilm.titre.slice(1);
            document.getElementById('realisateur').value = infosFilm.realisateur;
            document.getElementById('acteurs').value = infosFilm.acteurs;
            document.getElementById('durée').value = infosFilm.duree;
            document.getElementById('genre').value = infosFilm.genre;
            document.getElementById('synopsis').innerHTML = infosFilm.synopsis;
            document.querySelector('.image-container img').src = './vue/img/films/'+infosFilm.image;
            document.querySelector('.image-container').style.display = 'flex';
            document.getElementById('imageChoisi').style.display = 'none';
        }
    });
}

/**
 * Ajoute un film
 * @param e
 */
function ajoutimg(e) {
    const file = e.target.files[0];
    const reader = new FileReader();
    reader.onloadend = function () {
        document.querySelector('.image-container img').src = reader.result;
        document.getElementById('imageChoisi').style.display = 'none'; // cache l'input
        document.querySelector('.image-container').style.display = 'flex'; // affiche l'image
        document.getElementById('delete-img').style.display = 'block'; // affiche le bouton de suppression
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        document.querySelector('.image-container img').src = "";
        document.getElementById('imageChoisi').style.display = 'block'; // affiche l'input
        document.querySelector('.image-container img').style.display = 'none'; // cache l'image
    }
};

/**
 * Supprime l'image
 */
function deleteimg() {
    document.querySelector('.image-container img').src = "";
    document.getElementById('imageChoisi').value = ""; // reset l'input
    document.getElementById('imageChoisi').style.display = 'block'; // affiche l'input
    document.querySelector('.image-container').style.display = 'none'; // cache l'image
    document.getElementById('delete-img').style.display = 'none'; // cache le bouton de suppression
}