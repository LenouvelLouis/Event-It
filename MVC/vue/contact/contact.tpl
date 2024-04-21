<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/contact/contact.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
    <div class="navbarcontact">
        <a href="./?path=pages/accueil">Accueil</a> /
        <a>Contact</a>
    </div>
    
    <div class="container">
        <div class="contact-header">
            <h1>Contacter Events-IT</h1>
        </div>
        <div class="containercontact">
            <form action="#" method="POST">
                <div class="input-group">
                    <label for="name">Nom <span class="required-asterisk">*</span></label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="input-group">
                    <label for="email">E-mail <span class="required-asterisk">*</span></label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="input-group">
                    <label for="message">Message <span class="required-asterisk">*</span></label>
                    <textarea id="message" name="message" required maxlength="1000" oninput="updateCharacterCount()"></textarea>
                    <p id="character-count">0 / 1000 caractères</p>
                </div>
                <div class="input-group">
                    <button type="submit">Envoyer</button>
                </div>
                <p class="required"><span class="required-asterisk">*</span> : Obligatoire</p>
            </form>
        </div>
    </div>
<?php require("./vue/footer/footer.tpl"); ?>
</body>
<script src="./vue/contact/contact.js"></script>
</html>