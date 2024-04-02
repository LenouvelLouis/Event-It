<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/cinema/cinema.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
    <div class="navbarcinema">
        <a href="./index.php?action=cinema&controle=pages/cinema">Accueil</a> /
        <a>Cinéma</a>
    </div>
    <div class="containercinema">
  <!-- UGC GRAND NORMANDIE -->
  <div class="cinema">
    <div class="cinema-image">
      <!-- Remplacez 'placeholder.png' par le chemin de votre image -->
      <img src="" alt="UGC GRAND NORMANDIE">
    </div>
    <div class="cinema-details">
      <h2>UGC GRAND NORMANDIE</h2>
      <p class="films">15 films</p>
      <p class="address">116 bis, avenue des Champs-Élysées 75008 PARIS</p>
    </div>
  </div>
</div>
<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>