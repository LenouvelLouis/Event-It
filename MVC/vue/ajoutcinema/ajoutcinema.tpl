<!DOCTYPE HTML>
<html lang="fr">
<head>

    <meta charset="UTF-8">
    <link rel="stylesheet" href="./vue/ajoutcinema/ajoutcinema.css">

</head>
<body>

<?php require("./vue/navbar/nav.tpl"); ?>

<div class="barre">
  <a href="./?path=pages/accueil">Accueil</a>/
  <a href="./?path=pages/ajoutcinema">Ajout de cinéma</a>
</div>

<center>
    <br>
    <h2>Ajout de cinéma</h2>
    <hr class="ligne-noire">
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
    <label class="lieu_cinema" >Adresse du cinéma<span class = "highlight">*</span></label><br>
    <input type="text" id="lieu_cinema" name="lieu_cinema" placeholder="Entrez le lieu du cinéma">

  </div>

  <div class="droite">
  <label>Type du cinéma</label><br>
    <div class="checkbox_access">
      <input type="checkbox" id="Indoor" class="block" name="Indoor" value="Indoor">
      <label for="Indoor"> Indoor</label>
    </div>
    <div id="salleCinema" style="display: none;">
      <label>Nombre de salles du cinéma intérieur </label>
      <input type="number" id="nombreSalles">
  </div>
    <div class="checkbox_access">
      <input type="checkbox" id="Outdoor" class="block" name="Outdoor" value="Outdoor">
      <label for="Outdoor"> Outdoor</label>
    </div>
    <br>
    <label>Accessibilité</label><br>
    <div class="checkbox_access">
      <input type="checkbox" id="Handicapé" class="block" name="Handicapé" value="Handicapé">
      <label for="Handicapé"> Handicapé</label>
    </div>

    
    <div class="checkbox_access">
      <input type="checkbox" id="Sourd" class="block" name="Sourd" value="Sourd">
      <label for="Sourd"> Sourd</label>
    </div>


    <div class="checkbox_access">
      <input type="checkbox" id="Malvoyant" class="block" name="Malvoyant" value="Malvoyant">
      <label for="Malvoyant"> Malvoyant</label>
    </div>

    <center>
    <button>Ajouter cinéma</button>
    </center>

  </div>
  
</div>

<?php require("./vue/footer/footer.tpl"); ?>
<script src="./vue/ajoutcinema/ajoutcinema.js"></script>
</body>

</html>
