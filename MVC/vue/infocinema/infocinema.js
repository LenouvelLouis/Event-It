$().ready(init);
let id;

function init() {
    const currentUrl = window.location.href;
    let urlParams = new URLSearchParams(new URL(currentUrl).search);
    id = urlParams.get('id');
    getInfoCinema();
}

function getInfoCinema() {
    $.ajax({
        url: "./?path=cinema/getInfoCinema&id="+id,
        type: "GET",
        async: false,
        dataType: "json",
        success: function (data) {
            const titre = document.querySelector('.titre_cine h1');
            titre.innerHTML = data.nom;
            const adresse = document.querySelector('.adresse_cine');
            adresse.innerHTML = "Adresse : "+data.adresse;
            const telephone = document.querySelector('.telephone_cine');
            telephone.innerHTML = "Téléphone : "+data.telephone;
            const email = document.querySelector('.email_cine');
            email.innerHTML = "Email : "+data.mail;
            const pmrIcon = document.querySelector('.icons-wheelchair');
            const deafIcon = document.querySelector('.icons-ear-deaf');
            const blindIcon = document.querySelector('.icons-eye-slash');
            const accessibilityText = document.querySelector('.accessibility-text');
            const img = document.querySelector('#img');
            img.src = "vue/img/cinemas/"+data.image;
            pmrIcon.style.display = 'none';
            deafIcon.style.display = 'none';
            blindIcon.style.display = 'none';
            accessibilityText.style.display = 'none';
            if (data.handicape === 1) {
                pmrIcon.style.display = 'inline';
            }
            if (data.sourd === 1) {
                deafIcon.style.display = 'inline';
            }
            if (data.malvoyant === 1) {
                blindIcon.style.display = 'inline';
            }
            if (data.handicape !== 1 && data.sourd !== 1 && data.malvoyant !== 1) {
                accessibilityText.style.display = 'block';
                accessibilityText.innerHTML = 'No accessibility options available';
            }

        }
    });
}