

$().ready(init);
let infoUser
function init() {
    getInfoUser();
    displayInfoUser();
    displayMdp();
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

function displayMdp() {
    const resetPasswordYes = document.getElementById('yes');
    const containerMdp = document.getElementById('password-container');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirm_password');
    if (resetPasswordYes.checked) {
        containerMdp.style.display = 'block';
        password.required = true;
        confirmPassword.required = true;
    } else {
        containerMdp.style.display = 'none';
        password.required = false;
        confirmPassword.required = false;
    }
}