
$().ready(init);

function init() {
    fetchUsers();
}

function fetchUsers() {
    $.ajax({
        url: './?path=utilisateur/getUsers',
        type: 'GET',
        success: function(users) {
            const usersArray = JSON.parse(users);
            displayUsersTable(usersArray);
        },
        error: function() {
            alert('Error fetching users');
        }
    });
}

function displayUsersTable(users) {
    const usersTable = document.querySelector('#users-table');
    const thead = document.createElement('thead');
    const headerRow = document.createElement('tr');

    const usernameHeader = document.createElement('th');
    usernameHeader.textContent = 'Nom d\'utilisateur';
    headerRow.appendChild(usernameHeader);

    const emailHeader = document.createElement('th');
    emailHeader.textContent = 'Email';
    headerRow.appendChild(emailHeader);

    const phoneHeader = document.createElement('th');
    phoneHeader.textContent = 'Téléphone';
    headerRow.appendChild(phoneHeader);

    const statusHeader = document.createElement('th');
    statusHeader.textContent = 'Status';
    headerRow.appendChild(statusHeader);

    const deleteHeader = document.createElement('th');
    deleteHeader.textContent = 'Supprimer';
    headerRow.appendChild(deleteHeader);

    thead.appendChild(headerRow);
    usersTable.appendChild(thead);
    users.forEach(user => {
        const row = document.createElement('tr');

        const usernameCell = document.createElement('td');
        usernameCell.textContent = user.name;
        row.appendChild(usernameCell);
        const emailCell = document.createElement('td');
        emailCell.textContent = user.email;
        row.appendChild(emailCell);
        const phoneCell = document.createElement('td');
        phoneCell.textContent = user.phone;
        row.appendChild(phoneCell);
        const statusCell = document.createElement('td');
        statusCell.textContent = user.status;
        row.appendChild(statusCell);
        const deleteCell = document.createElement('td');
        const deleteLink = document.createElement('a');
        deleteLink.href = `./?path=utilisateur/deleteUser&id=${user.id}`;
        const deleteIcon = document.createElement('i');
        deleteIcon.className = 'fa fa-trash';
        deleteLink.appendChild(deleteIcon);
        deleteCell.appendChild(deleteLink);
        row.appendChild(deleteCell);

        usersTable.appendChild(row);
    });
}