<!DOCTYPE HTML>
       <html lang="fr">
       <meta charset="UTF-8">

       <head>
           <link rel="stylesheet" href="./vue/home/home.css">
       </head>
       <body>
       <?php require("./vue/navbar/nav.tpl"); ?>
       <div class="slider">
              <div class="slide">
                     <img src="./vue/img/carousselsiegecine.jpg" alt="Image 1">
                     <h3>Siège Cinématographique: Voyage au Coeur des Films</h3>
              </div>
              <div class="slide">
                     <img src="./vue/img/carousselcinema.jpg" alt="Image 2">
                     <h3>L'Univers Cinématographique: Exploration en Profondeur</h3>
              </div>
              <div class="slide">
                     <img src="./vue/img/carousselcinedrivein.jpg" alt="Image 3">
                     <h3>Drive-in Cinématographique: Sous les Étoiles du Septième Art</h3>
              </div>
              <button class="prev" onclick="prevSlide()"><i class="fa-solid fa-angle-left"></i></button>
              <button class="next" onclick="nextSlide()"><i class="fa-solid fa-angle-right"></i></button>
       </div>
       <div class="cine-info grey">
              <div class="cine-info-text">
                     <h1>Cinéma Drive-in :</h1>
                     <p>
                            Le cinéma drive-in propose une expérience unique, mêlant cinéma et intimité de sa voiture, parfait pour une soirée romantique ou familiale. Cette forme nostalgique permet de profiter d'un film sous les étoiles, offrant liberté et confort, loin des contraintes d'une salle traditionnelle.
                     </p>
              </div>
              <img src="./vue/img/infocinedrivein.png">
       </div>
       <div class="cine-info">
              <img src="./vue/img/infocinepleinair.png">
              <div class="cine-info-text">
                     <h1>Cinéma en Plein Air :</h1>
                     <p>
                            Le cinéma en plein air transforme la projection en un moment convivial et festif en communion avec la nature. Idéal pour les soirées d'été, il offre un cadre magique et social pour apprécier les films dans des lieux atypiques, sous le ciel ouvert.                     </p>
              </div>
       </div>
       <div class="cine-info grey">
              <div class="cine-info-text">
                     <h1>Cinéma Drive-in :</h1>
                     <p>
                            Le cinéma classique invite à redécouvrir les chefs-d'œuvre du septième art dans une salle au charme nostalgique. C'est une plongée dans le patrimoine cinématographique, permettant de vivre ou revivre les moments iconiques qui ont marqué l'histoire du cinéma.                     </p>
              </div>
              <img src="./vue/img/infocineclassique.png">
       </div>
       <div class="info-site">
              <div class="info-site-text">
                     <img src="./vue/img/securite.png">
                     <h4>Sécurité</h4>
                     <h5>Pas de regroupement de foule</h5>
              </div>
              <div class="info-site-text">
                     <img src="./vue/img/utilisation.png">
                     <h4>Facilité d'installation</h4>
                     <h5>Juste besoin d'un emplacement <br>Juste besoin d'électricité</h5>
              </div>
              <div class="info-site-text">
                     <img class="sound" src="./vue/img/son.png">
                     <h4>Le son de qualité</h4>
              </div>
       </div>
       <?php require("./vue/footer/footer.tpl"); ?>
       </body>
<script src="./vue/home/home.js"></script>
</html>
