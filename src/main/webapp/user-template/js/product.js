function search(name) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "product?command=search&name=" + name.value, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            document.getElementById("product_list").innerHTML = this.responseText;
            pagination(9, '#product_list #product_item');
        }
    };
    xhr.send();
}

function insertItem(IdP) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "product", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            showNotification("Đã thêm sản phẩm vào giỏ hàng");
        }
    };
    xhr.send("IdP=" + IdP
        + "&command=insertItem");
}

function inform() {
    showNotification("Bạn hãy đăng nhập để sử dụng chức năng này");
}

function detailProduct(idP) {
    window.location.href = "detail?pid=" + idP;
}

function category(idC) {
    window.location.href = "product?command=category&cid=" + idC;
}

function addFavorite(IdP) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "product", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            showNotification("Đã thêm sản phẩm vào danh mục yêu thích");
        }
    };
    xhr.send("IdP=" + IdP
        + "&command=favorite");
}

function arrange(command, action) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "product?command=" + command + "&action=" + action, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            document.getElementById("product_list").innerHTML = this.responseText;
            pagination(9, '#product_list #product_item');
        }
    };
    xhr.send();
}



