
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
        document.querySelector(".prev").classList.remove("hidden");
        document.querySelector(".next").classList.remove("hidden");
    }
    else {
        nav.style.display = 'block';
        document.querySelector(".prev").classList.add("hidden");
        document.querySelector(".next").classList.add("hidden");
    }
}