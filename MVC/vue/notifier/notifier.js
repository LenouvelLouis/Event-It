function closeNotifier() {
    const notification = document.getElementById('notification');
    notification.style.display = 'none';
    $.ajax({
        type: 'POST',
        url: './index.php?controle=utilisateur&action=closedNotifier',
        success: function (data) {}
    });
}