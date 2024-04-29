
function updateCharacterCount() {
    var message = document.getElementById('message').value;
    var charCount = message.length;
    document.getElementById('character-count').textContent = charCount + ' / 1000 caractères';
}
