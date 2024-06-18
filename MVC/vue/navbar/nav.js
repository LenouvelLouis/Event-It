
function openModal() {
    document.getElementById('myModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('myModal').style.display = 'none';
}
function openNavTel() {
    const nav = document.getElementById('navPc');
    if(nav.style.display === 'block'){
        nav.style.display = 'none';
        if (document.querySelector(".prev")) {
            document.querySelector(".prev").classList.add("hidden");
            document.querySelector(".next").classList.add("hidden");
        }
    }
    else {
        nav.style.display = 'block';
        if(document.querySelector(".prev")){
            document.querySelector(".prev").classList.add("hidden");
            document.querySelector(".next").classList.add("hidden");
        }

    }
}
fetch('./?path=tram/tram').then();