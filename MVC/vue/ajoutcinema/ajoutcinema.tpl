<!DOCTYPE HTML>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./vue/ajoutcinema/ajoutcinema.css">
    <title>Ajout de cinéma</title>
</head>
<body>

<?php require("./vue/navbar/nav.tpl"); ?>

<div class="barre">
  <a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a>/
  <a href="./index.php?action=ajoutcinema&controle=pages/ajoutcinema">Ajout de cinéma</a>
</div>

<center>
  <?php
  echo "<h2>" .$_SESSION['name'] . "</h2>";
  ?>
  </center>

<div class="info">
  <div class="gauche">
    <center>
    <label>Image du cinéma</label><br></center>
      <div class="image-container">
            <img src="./vue/img/infocineclassique.png" alt="Image du film">
        </div>
  </div>

  <div class="milieu">
    <label>Nom de cinéma<span class = "highlight">*</span></label><br>
    <input type="text" id="nom_cinema" name="nom_cinema" placeholder="Entrez le nom du cinéma"><br>
    <label class="lieu_cinema" >Lieu de cinéma<span class = "highlight">*</span></label><br>
    <input type="text" id="lieu_cinema" name="lieu_cinema" placeholder="Entrez le lieu du cinéma">
  </div>

  <div class="droite">
    <label>Messagerie</label>
    <textarea id="message" name="message" placeholder="Entrez votre message"></textarea>
    <center>
    <button>Ajouter cinéma</button>
    </center>
  </div>
</div>

<?php require("./vue/footer/footer.tpl"); ?>

</body>
<script src="./vue/profile/profile.js"></script>
</html>
