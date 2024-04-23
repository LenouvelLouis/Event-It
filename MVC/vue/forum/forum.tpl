<!DOCTYPE HTML>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./vue/forum/forum.css">
</head>
<body>
<?php require("./vue/navbar/nav.tpl"); ?>

<div class="navbarForum">
    <a href="./index.php?action=accueil&controle=pages/accueil">Accueil</a> /
    <span>Forum</span>
</div>

<div class="forum-header">
    <h1>Forum</h1>
</div>

<div class="forum-container">
    <div class="sidebar">
        <!-- Barre de recherche -->
        <input type="text" id="searchBox" onkeyup="searchQuestion()" placeholder="Chercher une question...">
        <div id="suggestions" class="suggestions"></div>

    </div>

    <div class="main-content">
        <div class="question-prompt">
            <p>Votre question n'est pas dans ce Forum ?</p>
            <textarea placeholder="Posez votre question ici..."></textarea>
            <button onclick="submitQuestion()">Ajouter un sujet</button>
        </div>
    </div>
</div>

<?php require("./vue/footer/footer.tpl"); ?>

<script>
    function submitQuestion() {
    }
</script>
<script>
    const questions = ["Retrouver le cinéma ?", "Problème de connexion ?", "Comment créer un compte ?"];

    function searchQuestion() {
        const input = document.getElementById('searchBox');
        const filter = input.value.toLowerCase();
        const suggestions = document.getElementById('suggestions');

        suggestions.innerHTML = '';

        if (!filter) {
            suggestions.style.display = 'none';
            return;
        }

        const filteredQuestions = questions.filter(question => question.toLowerCase().includes(filter));

        filteredQuestions.forEach(question => {
            const a = document.createElement('a');
            a.textContent = question;
            a.href = '#';
            suggestions.appendChild(a);
        });

        suggestions.style.display = filteredQuestions.length ? 'block' : 'none';
    }
</script>

</body>
</html>
