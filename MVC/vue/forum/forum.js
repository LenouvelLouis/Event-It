$().ready(init);
let currentUrl;
let containerQuestions = document.querySelector('.list-questions');
let messages = [];
let question;
let isAdmin = false;

/**
 * Display the discussion when a question is clicked
 */
function seeDiscussion() {
    const urlParams = new URLSearchParams(new URL(currentUrl).search);
    const id = urlParams.get('id');
    const discussion = document.querySelector('.general-discussion');
    discussion.style.display = 'block';
    const form = document.querySelector('#form-forum');
    form.action = `./?path=forum/ajoutmessage&id=${id}`;
    const title = document.querySelector('.forum-header h1');
    question = questions.find(question => question.id == id);
    title.textContent = 'Forum - '+question.titre;
    getMessages(id);
    displayMessages();
}

/**
 * Display the messages in the discussion
 */
function displayMessages() {
    const discussion = document.querySelector('.discussion');
    discussion.scrollTop = discussion.scrollHeight;
    let divFirst = document.createElement('div');
    if(question.user.isUser){
        divFirst.className = 'message right';
    }
    else {
        divFirst.className = 'message left';
    }
    const userFirst = document.createElement('div');
    userFirst.textContent = question.user.name;
    const messageContentFirst = document.createElement('div');
    messageContentFirst.textContent = question.titre;
    const dateFirst = document.createElement('div');
    dateFirst.textContent = question.date;
    divFirst.appendChild(userFirst);
    divFirst.appendChild(messageContentFirst);
    divFirst.appendChild(dateFirst);
    discussion.appendChild(divFirst);
   for(const message of messages) {
       const div = document.createElement('div');
       if(message.user.isUser){
              div.className = 'message right';
       }
       else{
           div.className = 'message left';
       }
       const user = document.createElement('div');
       user.textContent = message.user.name;
       const messageContent = document.createElement('div');
         messageContent.textContent = message.message;
         const date = document.createElement('div');
       date.textContent = message.date;
       div.appendChild(user);
         div.appendChild(messageContent);
            div.appendChild(date);
       discussion.appendChild(div);
   }
}

/**
 * Get the messages of a discussion
 * @param id
 */
function getMessages(id) {
    $.ajax({
        url: './?path=forum/getMessages&id=' + id,
        async: false,
        type: 'POST',
        data: {id: id},
        success: function (data) {
            messages = JSON.parse(data);

        }
    });

}

/**
 * Get the questions from the database
 */
function getDiscussions() {
    $.ajax({
        url: './?path=forum/getDiscussions',
        async: false,
        type: 'POST',
        success: function (data) {
            questions = JSON.parse(data);
        }
    });
    for(let i = 0; i < questions.length; i++) {
        const li = document.createElement('li');
        const a = document.createElement('a');
        a.href = `./?path=pages/forum&id=${questions[i].id}`;
        a.textContent = questions[i].titre;
        a.className = 'question';
        li.appendChild(a);
        containerQuestions.appendChild(li);
    }
}

/**
 * Initialize the forum page

 */
function init() {
    currentUrl = window.location.href;
    getDiscussions();
    if (currentUrl.includes('id')) {
        document.querySelector('.question-prompt').style.display = 'none';
        seeDiscussion();
        isUserAdmin();
        if(isAdmin) {
            const btnSupprimer = document.querySelector('.supprimer-sujet');
            btnSupprimer.style.display = 'inline-block';
            btnSupprimer.href = `./?path=forum/deleteQuestion&id=${question.id}`;
        }
    }

}

function isUserAdmin() {
    $.ajax({
        url: './?path=utilisateur/isAdmin',
        async: false,
        type: 'POST',
        success: function (response) {
            isAdmin= response ==="1";
        }
    });
}

/**
 * search for a question
 */
function searchQuestion() {
    const input = document.getElementById('searchBox');
    const filter = input.value.toLowerCase();
    const suggestions = document.getElementById('suggestions');
    suggestions.innerHTML = '';

    if (!filter) {
        suggestions.style.display = 'none';
        return;
    }

    const filteredQuestions = questions.filter(question => question.titre.toLowerCase().includes(filter));
    filteredQuestions.forEach(question => {
        const a = document.createElement('a');
        a.textContent = question.titre;
        a.href = `./?path=pages/forum&id=${question.id}`;
        suggestions.appendChild(a);
    });

    suggestions.style.display = filteredQuestions.length ? 'block' : 'none';
}
