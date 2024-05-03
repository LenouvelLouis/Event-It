$().ready(init);
let isUserAdmin;
let id;
let link

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
    if (isUserAdmin) {
        const editlinks = document.querySelector('.icon-modif');
        editlinks.href = './?path=pages/editfilm&id='+id;
        editlinks.style.display = 'block';
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
    getInfosFilm();
    const link = document.getElementById('links-film');
    link.href = './?path=pages/editfilm&id='+id;
    link.innerHTML = 'Modifications Film';
    document.getElementById('delete-img').style.display = 'block';
    document.getElementById('form-page').action = './?path=film/editFilm&id='+id;
    const editButton =  document.querySelector('.icon-modif i');
    editButton.className = 'fa-solid fa-ban';
    editButton.style.display = 'block';
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

function getInfosFilm() {
    $.ajax({
        url: './?path=film/getInfosFilm&id='+id,
        type: 'POST',
        success: function (response) {
            const infosFilm = JSON.parse(response);
            document.getElementById('titre').value = infosFilm.titre.charAt(0).toUpperCase() + infosFilm.titre.slice(1);
            document.getElementById('realisateur').value = infosFilm.realisateur;
            document.getElementById('durée').value = infosFilm.duree;
            document.getElementById('genre').value = infosFilm.genre;
            document.getElementById('synopsis').innerHTML = infosFilm.synopsis;
            document.querySelector('.image-container img').src = './vue/img/films/'+infosFilm.image;
            document.querySelector('.image-container').style.display = 'flex';
            document.getElementById('imageChoisi').style.display = 'none';
        }
    });
}
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

function deleteimg() {
    document.querySelector('.image-container img').src = "";
    document.getElementById('imageChoisi').value = ""; // reset l'input
    document.getElementById('imageChoisi').style.display = 'block'; // affiche l'input
    document.querySelector('.image-container').style.display = 'none'; // cache l'image
    document.getElementById('delete-img').style.display = 'none'; // cache le bouton de suppression
}