<!DOCTYPE HTML>
<html lang="fr">
<meta charset="UTF-8">

<head>
    <link rel="stylesheet" href="./vue/ajoutfilm/ajoutfilm.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>
<div class="barre">
    <a href="./?path=pages/accueil">Accueil</a>/
    <a href="./?path=pages/ajoutfilm">Ajout de film</a>
</div>
<div class="container_ajout_film">

    <div class="container_affiche_film">
        <label> Affiche du film <span class="highlight">*</span> </label>
        <div class="image-container">
            <img src="./vue/img/Image_test.png" alt="Image du film">
        </div>
        <div>
            <form>
                <input type="file" id="imageChoisi" name="image" accept="image/*" class="container_affiche_film_bouton">
            </form>
        </div>
    </div>

    <div class="container_info_film" >
        
        <label> Nom du film  <span class="highlight">*</span> </label>
        <input type="text" id="titre" </input>

        <label> Genre <span class="highlight">*</span> </label>
        <input type="text" id="genre" </input>

        <label> Durée <span class="highlight">*</span> </label>
        <input type="text" id="durée" </input>

        <div class ="container_espace">
            <label> De <span class="highlight">*</span> </label>
            <input type="text" id="de" </input>

            <label> Avec </label>
            <input type="text" id="avec" </input>
        </div>
    </div>

    <div class="container_synopsis_film">
        <label> Synopsis <span class="highlight">*</span></label>
        <textarea id="description" name="description" placeholder="Entrez la description ici..."></textarea>
        <button type="button">Ajout du film</button>
    </div>

</div>

<?php require("./vue/footer/footer.tpl"); ?> 
</body>
</html>