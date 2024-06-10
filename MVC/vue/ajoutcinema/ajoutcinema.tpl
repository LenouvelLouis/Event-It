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

<form action="./?path=cinema/ajoutcinema" id="form-page" method="post" enctype="multipart/form-data">

  <div class="info">

    <div class="gauche">
      <center><label>Image du cinéma<span class = "highlight">*</span></label><br></center>
        <div class="image-container">
            <img src="" alt="Image du cinéma">
        </div>
        <span id="delete-img" onclick="deleteimg()"><i class="fa-solid fa-xmark"></i></span>
        <div>
          <input type="file" id="imageChoisi" name="image" accept="image/*" class="container_image_cinema_bp" onchange="ajoutimg(event)">
        </div>
    </div>

    <div class="milieu">
      <label>Nom du cinéma<span class = "highlight">*</span></label><br>
      <input type="text" id="nom_cinema" name="nom_cinema" placeholder="Entrez le nom du cinéma" required><br>
      <label class="lieu_cinema" >Adresse du cinéma<span class = "highlight">*</span></label>
      <small>Format : numéro de rue, nom de rue, code postal, ville</small>
      <br>
      <input type="text" id="lieu_cinema" name="lieu_cinema" placeholder="Entrez l'adresse du cinéma" required></br>
      <label class="lieu_cinema" >Numéros de téléphone<span class = "highlight">*</span></label><br>
      <input type="tel" id="telephone_cinema" name="telephone_cinema" placeholder="Entrez le numéro de téléphone" required></br>
      <label class="lieu_cinema" >Mail<span class = "highlight">*</span></label><br>
      <input type="text" id="mail_cinema" name="mail_cinema" placeholder="Entrez le mail" required>
    </div>

    <div class="droite">
      <label>Type du cinéma<span class = "highlight">*</span></label><br>
      <div class="checkbox_access">
        <input type="checkbox" id="Indoor" class="block" name="Indoor">
        <label for="Indoor"> Intérieur</label>
      </div>
      <div id="salleCinema" style="display: none;">
        <input type="number" name = "nombreSalles" id="nombreSalles">
        <label for = "nombreSalles">Nombre de salles </label></br>
    </div>
    <div class="checkbox_access">
      <input type="checkbox" id="Outdoor" class="block" name="Outdoor">
      <label for="Outdoor"> Extérieur</label>
    </div>
    <br>
    <label>Accessibilité<span class = "highlight">*</span></label><br>
    <div class="checkbox_access">
      <input type="checkbox" id="Handicape" class="block" name="Handicape">
      <label for="Handicape"> Handicapé</label>
    </div>

      
    <div class="checkbox_access">
      <input type="checkbox" id="Sourd" class="block" name="Sourd">
      <label for="Sourd"> Sourd</label>
    </div>


    <div class="checkbox_access">
      <input type="checkbox" id="Malvoyant" class="block" name="Malvoyant">
      <label for="Malvoyant"> Malvoyant</label>
    </div>

    <center>
      <button type="submit">Ajouter cinéma</button>
    </center>

    </form>

  </div>
  
</div>

<?php require("./vue/footer/footer.tpl"); ?>
<script src="./vue/ajoutcinema/ajoutcinema.js"></script>
</body>

</html>
