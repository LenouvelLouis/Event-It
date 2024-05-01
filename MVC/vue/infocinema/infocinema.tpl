    <!DOCTYPE HTML>
    <html lang="fr">
    <meta charset="UTF-8">

    <head>
        <link rel="stylesheet" href="./vue/infocinema/infocinema.css">
    </head>

    <body>
        <?php require("./vue/navbar/nav.tpl"); ?>
        <div class="barre">
            <a href="./?path=pages/accueil">Accueil</a> /
            <a href="./?path=pages/cinema">Cinéma</a> /
            <a href="./?path=pages/infocinema">Info cinéma</a>
        </div>
        <center>
            <h1 id="titre_global">Cinéma des platanes</h1>
            <table id="table">
                <tbody>
                    <tr>
                        <td class="td_1">
                            <p><img id="image_cinema" src="https://www.chemille-en-anjou.fr/medias/2022/02/Cinema-en-plein-air.jpg"/>&nbsp;</p>
                            <h3>Informations</h3>
                            <p>Cin&eacute;ma des platanes</p>
                            <p>10 rue de vanves, 92130 Issy les Moulineaux</p>
                            <p>SIREN : 383 987 864 00030</p>
                            <p>Téléphone : 01 80 15 42 42</p>
                            <p>Mél : cinema.platane@issy.com</p>
                        </td>
                        <td class="td_1">
                            <h3>Horaires d'ouvertures :</h3>
                            <p>- Du lundi au jeudi : 18h00 - 00h00</p>
                            <p>- Samedi : 17h00 - 02h00</p>
                            <p>- Dimanche : 17h00 - 03h00</p>
                            <h3>Langues parl&eacute;es :</h3>
                            <p><img id="langue" src="https://www.customicondesign.com/images/freeicons/flag/round-flag/48/France.png" alt="France"><span class="texttd">France</span></p>
                            <p><img id="langue" src="https://www.customicondesign.com/images/freeicons/flag/round-flag/48/United-kingdom.png" alt="United kingdom"><span class="texttd">Anglais</span></p>
                            <p><img id="langue" src="https://www.customicondesign.com/images/freeicons/flag/round-flag/48/Spain.png" alt="Spain"><span class="texttd">Espagne</span></p>
                            <h3>&nbsp;</h3>
                        </td>
                        <td class="td_1">
                            <h3>Accessibilit&eacute; :&nbsp;</h3>
                            <p><i class="fa-solid fa-wheelchair icons"></i><span class="texttd">PMR</span></p>
                            <p><i class="fa-solid fa-ear-deaf icons"></i><span class="texttd">Malentandant</span></p>
                            <p><i class="fa-regular fa-eye-slash icons"></i><span class="texttd">Audio description</span></p>
                            <h3>Services disponibles :&nbsp;</h3>
                            <p>- Vente de nouriture</p>
                            <p>- Vente de boisson (sans alcool)</p>
                            <p>- Anniversaire</p>
                            <p>- Animation</p>
                            <p>- Cin&eacute;gout&eacute;</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p>&nbsp;</p>
            <table id="table_2">
    <tbody>
    <tr>
        <td>
            <h3>Listes des séances</h3>
            <div class="film">
                <h4>Oppenheimer</h4>
                <div class="image-container">
                    <img src="./vue/img/A_l'affiche/Oppenheimer.png" alt="Affiche du film">
                </div>
                <div class="seance">
                    <a href="./?path=pages/statseance">
                    <div class="seance-card">
                        <p>Salle X</p>
                        <p>15:50</p>
                    </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="film">
                <h4>Barbie</h4>
                <div class="image-container">
                    <img src="./vue/img/A_l'affiche/Barbie.png" alt="Affiche du film">
                </div>
                <div class="seance">
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                    <a href="./?path=pages/statseance">
                        <div class="seance-card">
                            <p>Salle X</p>
                            <p>15:50</p>
                        </div>
                    </a>
                </div>
            </div>
        </td>
    </tr>
        <tr>
            <td>
                <h3>Informations complémentaires</h3>
            </td>
        </tr>
        <tr>
            <td id="td_2">
                <iframe id="google_maps" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2626.7616134560744!2d2.2773399753126453!3d48.82460970308475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e670797935962f%3A0xa2a4098b11eb5c09!2s10%20Rue%20de%20Vanves%2C%2092170%20Issy-les-Moulineaux!5e0!3m2!1sfr!2sfr!4v1713004630545!5m2!1sfr!2sfr" width="400" height="300" allowfullscreen=""frameborder="0" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </td>
            <td>
               &nbsp; 
            </td>
            <td id="td_2">
                <iframe id="meteo"src="https://api.wo-cloud.com/content/widget/?geoObjectKey=5350008&language=fr&region=FR&timeFormat=HH:mm&windUnit=kmh&systemOfMeasurement=metric&temperatureUnit=celsius" name="CW2" scrolling="no" width="290" height="318" frameborder="0" ></iframe>
            </td>
        </tr>
    </tbody>
</table>
        </center>
        <?php require("./vue/footer/footer.tpl"); ?>
    </body>
    </html>
