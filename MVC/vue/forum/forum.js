$().ready(init);
let currentUrl;
function seeDiscussion() {
    const urlParams = new URLSearchParams(new URL(currentUrl).search);
    const id = urlParams.get('id');
    const discussion = document.querySelector('.discussion');
    discussion.style.display = 'block';
}

function init() {
    currentUrl = window.location.href;
    if (currentUrl.includes('id')) {
        document.querySelector('.question-prompt').style.display = 'none';
        seeDiscussion();
    }
}

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