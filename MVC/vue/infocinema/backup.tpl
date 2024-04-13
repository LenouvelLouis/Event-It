<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/infocinema/infocinema.css">
    <link href="Leaflet.Weather.css" rel="stylesheet" type="text/css" />
</head>

<body>
<?php require("./vue/navbar/nav.tpl"); ?>
<center>
<h2>Informations sur votre Cinéma</h2>
<figure class="table" style="width:46.78%;">
    <table class="ck-table-resized">
        <colgroup>
            <col style="width:43.44%;">
            <col style="width:56.56%;">
        </colgroup>
        <tbody>
            <tr>
                <td rowspan="4">
                    <figure class="image"><img src="https://www.chemille-en-anjou.fr/medias/2022/02/Cinema-en-plein-air.jpg" width=100% height=auto></figure>
                </td>
                <td>Nom :&nbsp;</td>
            </tr>
            <tr>
                <td>Adresse :&nbsp;</td>
            </tr>
            <tr>
                <td>Numéro de téléphone :&nbsp;</td>
            </tr>
            <tr>
                <td>Adresse mail de contact :&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table style="border-color:white;">
    <tr style="border-color:white;">
        <td style="border-color:white;"><img src="https://lopinion.com/storage/articles/ktRYzoXfCdX7OxWaF7EdT3wd1iSuhqixAMy4BP0n.jpg" style="max-width: 100%; height: auto; display: block;" alt="Image 1"></td>
        <td style="border-color:white;"><img src="https://cdn-s-www.leprogres.fr/images/1A0F8EAA-EBE3-4B0F-8B2E-D19FA1BFC6DD/MF_contenu/cinema-en-plein-air-les-dates-a-ne-pas-louper-cet-ete-1538576399.jpg" style="max-width: 100%; height: auto; display: block;" alt="Image 3"></td>
    </tr>
</table>
                </td>
                <td>N° de SIRET :&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3 style="text-align:center;">Horaires d'ouvertures</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Lundi - Vendredi<br>10h00 - 00h00</li>
                    </ul>
                </td>
                <td>
                    <ul>
                        <li>Samedi - Dimanche<br>10h00 - 02h00</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3 style="text-align:center;">Services disponibles</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Service 1</li>
                    </ul>
                </td>
                <td>
                    <ul>
                        <li>Service 2</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Service 3</li>
                    </ul>
                </td>
                <td>
                    <ul>
                        <li>Service 3</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3 style="text-align:center;">Langues</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Langue 1</li>
                    </ul>
                </td>
                <td>
                    <ul>
                        <li>Langue 2</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Langue 3</li>
                    </ul>
                </td>
                <td>
                    <ul>
                        <li>Langue 4</li>
                    </ul>
                </td>
            </tr>

        </tbody>
    </table>
</figure>
<h3>Localisation</h3>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2626.7616134560744!2d2.2773399753126453!3d48.82460970308475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e670797935962f%3A0xa2a4098b11eb5c09!2s10%20Rue%20de%20Vanves%2C%2092170%20Issy-les-Moulineaux!5e0!3m2!1sfr!2sfr!4v1713004630545!5m2!1sfr!2sfr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
<div id="ww_d856f26ecd6a9" v='1.3' loc='id' a='{"t":"horizontal","lang":"fr","sl_lpl":1,"ids":[],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"image","cl_font":"#FFFFFF","cl_cloud":"#FFFFFF","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>Plus de prévisions: <a href="https://oneweather.org/fr/paris/30_jours/" id="ww_d856f26ecd6a9_u" target="_blank">Meteo a 30 jours</a></div><script async src="https://app2.weatherwidget.org/js/?id=ww_d856f26ecd6a9"></script>
</center>
<?php require("./vue/footer/footer.tpl"); ?>
</body>
</html>
