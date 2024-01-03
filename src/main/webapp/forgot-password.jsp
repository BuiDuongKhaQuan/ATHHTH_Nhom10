<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Mỹ Phẩm QST || Quên mật khẩu</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">    <link rel="stylesheet" href="user-template/css/login.css"/>
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta3/css/all.css">

</head>
<body>
<img src="user-template/img/background/login.png" style="width: 100%;height: 100vh; position: absolute">

<div class="wrapper" id="active" style="z-index: 99999">
    <div class="form-box login">
        <h2>Quên mật khẩu</h2>
        <div id="login">
            <div class="input-box">
                <i class="bx bx-user"></i>
                <input type="text" name="user" id="userlogin"/>
                <label id="label-user-login">Tài khoản</label>
            </div>
            <div class="error-box user" id="text-user-login">
                <i class="bx bx-error-circle"></i>
                <label>Tên tài khoản không được để trống!</label>
            </div>
            <div class="input-box">
                <i class="bx bx-envelope"></i>
                <input type="text" name="email" id="emaillogin"/>
                <label id="label-email-login">Email</label>
            </div>
            <div class="error-box email" id="text-email-login">
                <i class="bx bx-error-circle"></i>
                <label>Vui lòng nhập đúng định dạng email!</label>
            </div>
            <div class="mess" id="mess">
            </div>
            <div id="loading" style="color: #009d0c; margin-top: 11px; font-size: 0.9em;display: none">
                <i class="fa-duotone fa-spinner-third fa-spin"></i> Vui lòng chờ!
            </div>
            <button class="btn" id="click_otp" style="margin-top: 13px">Xác nhận</button>
            <div class="login-register">
                <p>
                    Bạn đã có tài khoản?
                    <a href="login.jsp">Đăng nhập</a>
                </p>
            </div>
        </div>
    </div>
    <div class="form-box register">
        <h2>Nhập Mã OTP</h2>
        <!--  -->
        <div id="signup" action="">
            <div class="input-box">
                <i class="fa-light fa-input-numeric"></i>
                <input type="text" name="otp" id="otp"/>
                <label id="label-otp">Nhập Mã OTP</label>
            </div>
            <div class="error-box user" id="text-otp">
                <i class="bx bx-error-circle"></i>
                <label>OTP không được để trống!</label>
            </div>
            <div class="input-box">
                <i class="bx bx-lock-alt show"></i>
                <input type="password" name="pass" id="pass"/>
                <label id="label-pass">Mật khẩu mới</label>
            </div>
            <div class="error-box pass" id="text-pass">
                <i class="bx bx-error-circle"></i>
                <label
                >Mật khẩu phải đủ 8 ký tự và bao gồm chữ thường, chữ hoa, số, ký
                    tự đặc biệt!</label
                >
            </div>
            <div class="input-box">
                <i class="bx bx-lock-alt show"></i>
                <input type="password" name="repass" id="repass"/>
                <label id="label-repass">Nhập lại mật khẩu</label>
            </div>
            <div class="error-box repass" id="text-repass">
                <i class="bx bx-error-circle"></i>
                <label>Mật khẩu không khớp!</label>
            </div>
            <div id="loading1" style="color: #009d0c; margin-top: 5px; font-size: 0.9em;display: none">
                <i class="fa-duotone fa-spinner-third fa-spin"></i> Vui lòng chờ!
            </div>
            <div id="notication">
                <div class="remember-forgot"
                     style="justify-content: space-evenly; color: #009d0c; font-size: 0.96em;">
                    <i class="fa-light fa-check"></i>
                    <label>Mã otp đã được gửi đến E-mail của bạn!</label>
                </div>
            </div>
            <button class="btn" id="click_check">Xác nhận</button>
            <div class="login-register">
                <p>
                    Bạn đã có tài khoản?
                    <a href="login.jsp">Đăng nhập</a>
                </p>
            </div>
        </div>
    </div>
</div>
<script>
    const click_otp = document.querySelector("#click_otp");
    const inputULogin = document.querySelector("#userlogin");
    const inputELogin = document.querySelector("#emaillogin");
    const textUserLogin = document.querySelector("#text-user-login");
    const textEmailLogin = document.querySelector("#text-email-login");

    function validateUserLogin() {
        if (inputULogin.value == "") {
            return textUserLogin.classList.add("block");
        }
        textUserLogin.classList.remove("block");
    }

    function validateEmail() {
        const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        if (!inputELogin.value.match(emailPattern)) {
            return textEmailLogin.classList.add("block");
        }
        textEmailLogin.classList.remove("block");
    }

    click_otp.addEventListener("click", function (even) {
        validateUserLogin();
        validateEmail();

        inputELogin.addEventListener("keyup", validateEmail);
        inputULogin.addEventListener("keyup", validateUserLogin);

        if (!textUserLogin.classList.contains("block") &&
            !textEmailLogin.classList.contains("block")) {
            otp();
        }
    });


    const click_check = document.querySelector("#click_check");
    const inputOtp = document.querySelector("#otp");
    const inputPass = document.querySelector("#pass");
    const inputRPass = document.querySelector("#repass");
    const textOtp = document.querySelector("#text-otp");
    const textPass = document.querySelector("#text-pass");
    const textRpass = document.querySelector("#text-repass");

    function validateOtp() {
        if (inputOtp.value === "") {
            return textOtp.classList.add("block");
        }
        textOtp.classList.remove("block");
    }


    function validatePass() {
        const passPattern =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (!inputPass.value.match(passPattern)) {
            return textPass.classList.add("block");
        }
        textPass.classList.remove("block");
    }

    function validateRPass() {
        if (inputPass.value !== inputRPass.value || inputRPass.value === "") {
            return textRpass.classList.add("block");
        }
        textRpass.classList.remove("block");
    }

    const showIcons = document.querySelectorAll(".show");
    showIcons.forEach((showIcon) => {
        showIcon.addEventListener("click", () => {
            const pInput = showIcon.parentElement.querySelector("input");
            if (pInput.type === "password") {
                showIcon.classList.replace("bx-lock-alt", "bx-lock-open-alt");
                return (pInput.type = "text");
            }
            showIcon.classList.replace("bx-lock-open-alt", "bx-lock-alt");
            pInput.type = "password";
        });
    });

    click_check.addEventListener("click", function (event) {
        validateOtp();
        validatePass();
        validateRPass();
        inputOtp.addEventListener("keyup", validateOtp);
        inputPass.addEventListener("keyup", validatePass);
        inputRPass.addEventListener("keyup", validateRPass);

        if (!textOtp.classList.contains("block") &&
            !textPass.classList.contains("block") &&
            !textRpass.classList.contains("block")) {
            checkOtp();
        }
    });


    inputULogin.addEventListener("focus", function () {
        document.getElementById("label-user-login").classList.add("abc");
    });
    inputULogin.addEventListener("blur", function () {
        if (inputULogin.value == "") {
            document.getElementById("label-user-login").classList.remove("abc");
        } else {
            document.getElementById("label-user-login").classList.add("abc");
        }
    });

    inputELogin.addEventListener("focus", function () {
        document.getElementById("label-email-login").classList.add("abc");
    });
    inputELogin.addEventListener("blur", function () {
        if (inputELogin.value == "") {
            document.getElementById("label-email-login").classList.remove("abc");
        } else {
            document.getElementById("label-email-login").classList.add("abc");
        }
    });

    inputOtp.addEventListener("focus", function () {
        document.getElementById("label-otp").classList.add("abc");
    });
    inputOtp.addEventListener("blur", function () {
        if (inputOtp.value == "") {
            document.getElementById("label-otp").classList.remove("abc");
        } else {
            document.getElementById("label-otp").classList.add("abc");
        }
    });

    inputPass.addEventListener("focus", function () {
        document.getElementById("label-pass").classList.add("abc");
    });
    inputPass.addEventListener("blur", function () {
        if (inputPass.value == "") {
            document.getElementById("label-pass").classList.remove("abc");
        } else {
            document.getElementById("label-pass").classList.add("abc");
        }
    });

    inputRPass.addEventListener("focus", function () {
        document.getElementById("label-repass").classList.add("abc");
    });
    inputRPass.addEventListener("blur", function () {
        if (inputRPass.value == "") {
            document.getElementById("label-repass").classList.remove("abc");
        } else {
            document.getElementById("label-repass").classList.add("abc");
        }
    });
</script>
<script>
    function otp() {
        const loading = document.getElementById("loading");
        const mess = document.getElementById("mess");
        var xhr = new XMLHttpRequest();
        loading.style.display = "block";
        mess.style.display = "none";
        xhr.open("POST", "forgot-password?command=forgot&user=" + inputULogin.value + "&email=" + inputELogin.value, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                loading.style.display = "none";
                if (this.responseText === "active") {
                    return document.getElementById("active").classList.add(this.responseText);
                }
                document.getElementById("mess").innerHTML = this.responseText;
            }
            mess.style.display = "block";
        };
        xhr.send();
    }

    function checkOtp() {
        const loading = document.getElementById("loading1");
        const notication = document.getElementById("notication");
        var xhr = new XMLHttpRequest();
        loading.style.display = "block";
        notication.style.display = "none";
        xhr.open("POST", "forgot-password?command=forgot_otp&otp="
            + inputOtp.value + "&pass=" + inputPass.value
            + "&repass=" + inputRPass.value, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                loading.style.display = "none";
                if (this.responseText !== "no") {
                    document.getElementById("notication").innerHTML = this.responseText;
                    notication.style.display = "block";
                }
            }
        };
        xhr.send();
    }
</script>

</body>
</html>
