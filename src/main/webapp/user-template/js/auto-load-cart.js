function getCartCount() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("cart-count").innerHTML = this.responseText;
            document.getElementById("cart-count1").innerHTML = this.responseText;
        }
    };
    xhr.open("GET", "auto-load?command=load_quantity", true);
    xhr.send();
}
function getFavoriteCount() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("favorite-count").innerHTML = this.responseText;
        }
    };
    xhr.open("GET", "auto-load?command=load_quantity_favorite", true);
    xhr.send();
}
setInterval(getCartCount, 2000);
setInterval(getFavoriteCount, 2000);
