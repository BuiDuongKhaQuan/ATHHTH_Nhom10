var box = document.getElementById('show');
const notification = document.getElementById("notification");
const alert = document.getElementById("alert");

function showNotification(txt) {
    notification.innerHTML = txt;
    notification.style.display = "block";
    setTimeout(function () {
        notification.style.display = "none";
    }, 2000);
}
function showNotificationBox(txt) {
    notification.innerHTML = txt;
    notification.style.display = "block";
    box.style.display = 'none';
    setTimeout(function () {
        notification.style.display = "none";
    }, 2000);
}

function showAlert(txt) {
    alert.innerHTML = txt;
    alert.style.display = "block";
    setTimeout(function () {
        alert.style.display = "none";
    }, 2000);
}

function show() {
    box.style.display = 'flex';
}

function closeNew() {
    box.style.display = 'none';
}