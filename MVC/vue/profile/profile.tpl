<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
<link rel="stylesheet" href="./vue/profile/profile.css">
</head>
<style>
  .form-flexbox {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
  }

  .left-group,

  .right-group {
    flex-basis: 48%;
  }
  .left-group label,
  .left-group input,
  .right-group label,
  .right-group input {
    width: 75%;
    margin-top: 10px; 
    margin-left: 40px;
    margin-right: 50px; 
    margin-bottom: 10px;
  }
  .btn-container {
    width: 100%;
    text-align: center;
    margin-top: 40px;
    margin-bottom: 90px;
  }
</style>

<body>

<?php require("./vue/navbar/nav.tpl"); ?>

<div class="barre">
  <a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a>/
  <a href="./index.php?action=accueil&controle=pages/profile">Profile</a>
</div>

  <center>
    <h2>Utilisateurs</h2>
    <hr class="ligne-noire">
  </center>

   
<form class="form form-flexbox" action="#" method="post">
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
</html>
