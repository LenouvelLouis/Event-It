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
  <?php
  echo "<h2>" .$_SESSION['name'] . "</h2>";
  ?>
    <hr class="ligne-noire">
  </center>


<form class="form form-flexbox" action="./index.php?action=updateuser&controle=utilisateur" method="post">
  <div class="left-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required class="input-form">
      <label for="reset_password">Voulez-vous réinitialiser votre mot de passe ?</label><br>
    <div class="radio-container">
      <input type="radio" id="yes" name="reset_password" value="yes" onclick="displayMdp()">
      <label for="yes">Oui</label>
      <input type="radio" id="no" name="reset_password" value="no" checked onclick="displayMdp()">
      <label for="no">Non</label>
    </div>
    <div id="password-container">
    <label for="password">Mot de passe:</label>
    <input type="password" id="password" name="password" required class="input-form">

    <label for="confirm_password">Confirmation du mot de passe:</label>
    <input type="password" id="confirm_password" name="confirm_password" required class="input-form">
    </div>
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
