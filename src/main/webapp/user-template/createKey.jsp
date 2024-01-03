<%--
  Created by IntelliJ IDEA.
  User: Phan Hong Siem
  Date: 11/13/2023
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || Tạo key</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="user-template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/style.css" type="text/css">
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/old-key-with-house-shaped-keychain-pink-background-with-copy-space_625455-1334.jpg?w=1060'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
        }

        .inputfile {
            width: 0.1px;
            height: 0.1px;
            opacity: 0;
            overflow: hidden;
            position: absolute;
            z-index: -1;
        }

        .inputfile + label {
            color: black;
            display: inline-block;
            cursor: pointer;
            margin-left: 10px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #ffaee0;
        }

        .inputfile:focus + label,
        .inputfile + label:hover {
            background-color: #c63f78;
        }

        .btn-primary:disabled {
            color: #fff;
            background-color: rgba(255, 174, 224, 0.84);
            border-color: #f187c8;

    </style>
</head>
<body>
<div id="alert" class="hidden-noti" style="display: none"></div>
<div id="notification" class="hidden-noti" style="display: none"></div>
<div class="content-genaral">
    <form class="content-genaral" id="keyForm" action="signup" method="post">
        <h5 style="margin-top: 10px">HÃY NHẬP KEY ĐỂ HOÀN TẤT QUÁ TRÌNH ĐĂNG KÝ!</h5>
        <textarea rows="5" cols="100" placeholder="Hãy nhập public key" name="publicKey" id="publicKey"
                  style="margin-bottom: 5px"></textarea>
        <div style="display: flex; align-items: center; justify-content: center">
            <p style="margin: 0; font-weight: bold;">Hoặc</p>
            <input class="inputfile" type="file" id="pdfInputPublicKey" accept=".pdf" onchange="loadPdfPublicKey()"
                   data-multiple-caption="{count} files selected" multiple>
            <label id="lable publickey" for="pdfInputPublicKey">Chọn file public key</label>
        </div>

        <textarea rows="5" cols="100" placeholder="Hãy nhập private key" name="publicKey" id="privateKey"
                  style="margin-bottom: 5px"></textarea>
        <div style="display: flex; align-items: center; justify-content: center">
            <p style="margin: 0 ; font-weight: bold;">Hoặc</p>
            <input class="inputfile" type="file" id="pdfInputPrivateKey" accept=".pdf" onchange="loadPdfPrivateKey()"
                   data-multiple-caption="{count} files selected" multiple>
            <label for="pdfInputPrivateKey">Chọn file private key</label>
        </div>
        <button type="button" onclick="checkKey()" class="btn btn-raised btn-primary btn-round waves-effect">Kiểm tra
            khóa!
        </button>
        <button type="submit" class="btn btn-raised btn-primary btn-round waves-effect"
                id="btnComplete" style="margin-top: 10px"
                disabled>Đăng ký
        </button>
        <p style="font-size: 20px; font-weight: bold;margin: 10px 10px;">Vui lòng kiểm tra khóa trước khi nhấn "Hoàn
            tất"</p>
        <h5>
            Nếu bạn chưa có khóa hãy
            <a onclick="downloadKeys()"
               style="color: #1c9a1f; font-size: 20px; font-weight: bold"
               class="btn btn-default waves-effect waves-float btn-sm waves-red">TẠO KHOÁ</a>

        </h5>
    </form>
</div>
<script src="admin-template/assets/js/notification.js"></script>
<script>
    var inputs = document.querySelectorAll('.inputfile');
    Array.prototype.forEach.call(inputs, function (input) {
        var label = input.nextElementSibling;

        input.addEventListener('change', function (e) {
            var fileName = '';
            if (this.files && this.files.length > 1)
                fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
            else
                fileName = e.target.value.split('\\').pop();

            // Hiển thị tên tệp đã chọn trong thẻ <label>
            if (fileName)
                label.innerHTML = fileName;
            else
                label.innerHTML = label.value;
        });
    });

</script>
<script>
    function downloadKeys() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    var keysInfo = this.getResponseHeader('Keys-Info');
                    var keys = JSON.parse(keysInfo);
                    document.getElementById('publicKey').innerText = keys.publicKey;
                    document.getElementById('privateKey').innerText = keys.privateKey;
                    var blob = new Blob([this.response], {type: 'application/zip'});
                    var link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = 'keys.zip';
                    link.click();
                } else {
                    console.error('Failed to fetch keys.');
                }
            }
        };
        xhr.responseType = 'blob';
        xhr.open('GET', 'setKey?command=setKey', true);
        xhr.send();
    }


    function checkKey() {
        var publicKey = document.getElementById('publicKey').value;
        var privateKey = document.getElementById('privateKey').value;
        var btnComplete = document.getElementById('btnComplete');

        if (publicKey.trim().length > 0 || privateKey.trim().length > 0) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        if (xhr.responseText == "ok") {
                            showNotification("Khóa hợp lệ!");
                            btnComplete.removeAttribute('disabled');
                        }
                        if (xhr.responseText == "Invalid long key") {
                            showAlert("Độ dài khóa tối thiểu phải là 2024 bit!");
                            btnComplete.setAttribute('disabled', true);
                        }
                    } else {
                        showAlert("Khóa không hợp lệ!!!");
                        btnComplete.setAttribute('disabled', true);
                    }
                }
            };
            // Mở yêu cầu POST đến URL "setKey?command=readKey"
            xhr.open('POST', 'setKey?command=checkKey&publicKey=' + encodeURIComponent(publicKey) + '&privateKey=' + encodeURIComponent(privateKey), true);
            xhr.send();
        } else {
            showAlert("Vui lòng nhập đầy đủ private key và public key");
        }
    }

    function loadPdfPublicKey() {
        var pdfText = document.getElementById('publicKey');
        var pdfInput = document.getElementById('pdfInputPublicKey');
        // Kiểm tra xem đã chọn tệp hay chưa
        if (pdfInput.files.length > 0) {
            // Lấy tệp đầu tiên từ danh sách các tệp được chọn
            var selectedFile = pdfInput.files[0];

            // Tạo đối tượng FormData để gửi dữ liệu
            var formData = new FormData();

            // Thêm tệp đã chọn vào FormData
            formData.append('pdfFile', selectedFile);

            // Tạo XMLHttpRequest
            var xhr = new XMLHttpRequest();

            // Cài đặt sự kiện khi yêu cầu hoàn thành
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Xử lý phản hồi từ máy chủ
                        pdfText.value = xhr.responseText;
                    } else {
                        // Xử lý lỗi nếu có
                        console.error('Error:', xhr.status);
                    }
                }
            };

            // Mở yêu cầu POST đến URL "setKey?command=readKey"
            xhr.open('POST', 'setKey?command=readKey', true);
            // Gửi yêu cầu với FormData chứa tệp đã chọn
            xhr.send(formData);
        } else {
            console.log('No file selected');
        }
    }

    function loadPdfPrivateKey() {
        var pdfText = document.getElementById('privateKey');
        var pdfInput = document.getElementById('pdfInputPrivateKey');
        // Kiểm tra xem đã chọn tệp hay chưa
        if (pdfInput.files.length > 0) {
            // Lấy tệp đầu tiên từ danh sách các tệp được chọn
            var selectedFile = pdfInput.files[0];

            // Tạo đối tượng FormData để gửi dữ liệu
            var formData = new FormData();

            // Thêm tệp đã chọn vào FormData
            formData.append('pdfFile', selectedFile);

            // Tạo XMLHttpRequest
            var xhr = new XMLHttpRequest();

            // Cài đặt sự kiện khi yêu cầu hoàn thành
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Xử lý phản hồi từ máy chủ
                        pdfText.value = xhr.responseText;
                    } else {
                        // Xử lý lỗi nếu có
                        console.error('Error:', xhr.status);
                    }
                }
            };

            // Mở yêu cầu POST đến URL "setKey?command=readKey"
            xhr.open('POST', 'setKey?command=readKey', true);

            // Gửi yêu cầu với FormData chứa tệp đã chọn
            xhr.send(formData);
        } else {
            console.log('No file selected');
        }
    }
</script>

</body>

</html>

