<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
<link rel="stylesheet" href="./vue/profile/profile.css">
</head>
<body>

<?php require("./vue/navbar/nav.tpl"); ?>

<div class="barre">
  <a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a>/
  <a href="./index.php?action=profile&controle=pages/profile">Profile</a>
</div>

<center>
    <h2>Utilisateurs</h2>
    <hr class="ligne-noire">
  </center>


<form class="form form-flexbox" action="./index.php?action=updateuser&controle=utilisateur" method="post">
  <div class="left-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required class="input-form">

    <label for="password">Mot de passe:</label>
    <input type="password" id="password" name="password" required class="input-form">

    <label for="confirm_password">Confirmation du mot de passe:</label>
    <input type="password" id="confirm_password" name="confirm_password" required class="input-form">
  </div>
  <div class="right-group">
    <label for="username">Nom d'utilisateur:</label>
    <input type="text" id="username" name="username" required class="input-form">

    <label for="phone">Numéro de téléphone:</label>
    <input type="tel" id="phone" name="phone" required class="input-form">
  </div>
  <div class="btn-container">
    <input class="btn-form-profil" type="submit" value="Sauvegarder"><br>
  </div>
</form>

<?php require("./vue/footer/footer.tpl"); ?>

</body>
<script src="./vue/profile/profile.js"></script>
</html>
