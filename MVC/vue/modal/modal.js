
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
function register(){
    const name = document.getElementById('nameRegister').value;
    const phone = document.getElementById('phoneRegister').value;
    const email = document.getElementById('emailRegister').value;
    const password = document.getElementById('passwordRegister').value;
    if(email === "" || password === "" || phone === "" || name === ""){
        alert("Please fill all fields");
        return;
    }
   const user= {
        name: name,
        phone: phone,
        email: email,
        password: password
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