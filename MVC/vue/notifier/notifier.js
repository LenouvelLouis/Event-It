function closeNotifier() {
    const notification = document.getElementById('notification');
    notification.style.display = 'none';
    $.ajax({
        type: 'POST',
        url: './?path=utilisateur/closedNotifier',
        success: function (data) {}
    });
}