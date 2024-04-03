function login(){
    const email = document.getElementById('emailLogin').value;
    const password = document.getElementById('passwordLogin').value;
    if(email === "" || password === ""){
        alert("Please fill all fields");
        return;
    }
    if(verifEmail(email) === false){
        alert("Invalid email");
    }
}
function verifEmail(email) {
    const reg = /^[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;
    return reg.test(email);
}

function generateSalt() {
    const length = 10;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    let salt = "";
    for (let i = 0, n = charset.length; i < length; ++i) {
        salt += charset.charAt(Math.floor(Math.random() * n));
    }
    return salt;
}

async function hashPassword(password, salt) {
    const encoder = new TextEncoder();
    const data = encoder.encode(password + salt);
    const hash = await window.crypto.subtle.digest('SHA-256', data);
    let hashArray = Array.from(new Uint8Array(hash));
    return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
}

function register(){
    const name = document.getElementById('nameRegister').value;
    const phone = document.getElementById('phoneRegister').value;
    const email = document.getElementById('emailRegister').value;
    let password = document.getElementById('passwordRegister').value;
    if(email === "" || password === "" || phone === "" || name === ""){
        alert("Please fill all fields");
        return;
    }
    const salt= generateSalt();
    password = hashPassword(password,salt);
   const user= {
        name: name,
        phone: phone,
        email: email,
        password: password,
       salt: salt
    }
    $.ajax({
        type: "POST",
        url: "./index.php?controle=inscription&action=inscription",
        data: user,
        success: function (response) {
            document.getElementById('myModal').style.display = 'none';
        },
    });
}