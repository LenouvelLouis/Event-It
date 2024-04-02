
function openModal() {
    document.getElementById('myModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('myModal').style.display = 'none';
}
function openNavTel() {
    if(document.getElementById('navTel').style.display === 'block'){
        document.getElementById('navTel').style.display = 'none';
    }
    else {
        document.getElementById('navTel').style.display = 'block';
    }
}