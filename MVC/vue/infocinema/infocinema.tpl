    <!DOCTYPE HTML>
    <html lang="fr">
    <meta charset="UTF-8">

    <head>
        <link rel="stylesheet" href="./vue/infocinema/infocinema.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
    </head>

    <body>
        <?php require("./vue/navbar/nav.tpl"); ?>
        <div class="barre">
            <a href="./?path=pages/accueil">Accueil</a> /
            <a href="./?path=pages/cinema">Cinéma</a> /
            <a href="./?path=pages/infocinema">Info cinéma</a>
        </div>
        <center class ="titre_cine">
            <h1></h1>
        </center>

        <div class="container_flex">
            <div class="image-container img-cine">
                <img id="img" src=""/>
            </div>
            <div>
                <h3>Contact :</h3>
                <p class="adresse_cine"></p>
                <p class="telephone_cine"></p>
                <p class="email_cine"></p>
            </div>
            <div>
                <h3>Accessibilit&eacute; :&nbsp;</h3>
                <p class="icons-wheelchair"><i class="fa-solid fa-wheelchair icons"></i><span class="texttd"> PMR</span></p>
                <p class="icons-ear-deaf"><i class="fa-solid fa-ear-deaf icons"></i><span class="texttd"> Malentandant</span></p>
                <p class="icons-eye-slash"><i class="fa-regular fa-eye-slash icons"></i><span class="texttd"> Audio description</span></p>
                <p class="accessibility-text"></p>
            </div>
        </div>
        <center><h3>Informations complémentaires</h3><center>

        <div class="display_info">
            <div id="mapid" style="height: 300px; width: 300px;"></div>
            <div id="weather"></div>

        </div>
        
    </body>
</table>
        </center>
        <?php require("./vue/footer/footer.tpl"); ?>
    </body>
    <script src="./vue/infocinema/infocinema.js"></script>
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
    </html>
