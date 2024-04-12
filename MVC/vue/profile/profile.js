

$().ready(init);
let infoUser
function init() {
    getInfoUser();
    displayInfoUser();
}

function getInfoUser() {
    $.ajax({
        url: './index.php?action=getInfoUser&controle=utilisateur',
        async: false,
        method: 'GET',
        success: function (data) {
            infoUser= JSON.parse(data);
        }
    });
}

function displayInfoUser() {
    $('#username').val(infoUser.name);
    $('#email').val(infoUser.email);
    $('#phone').val(infoUser.phone);
}