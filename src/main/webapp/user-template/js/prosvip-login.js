const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');

registerLink.addEventListener('click',()=>{
    wrapper.classList.add('active');
});
loginLink.addEventListener('click',()=>{
    wrapper.classList.remove('active');
});
const formLogin = document.querySelector("#login");
const inputULogin = formLogin.querySelector("#userlogin");
const inputPLogin = formLogin.querySelector("#passlogin");
const textUserLogin = formLogin.querySelector("#text-user-login");
const textPassLogin = formLogin.querySelector("#text-pass-login");

function validateUserLogin() {
    if (inputULogin.value == "") {
        return textUserLogin.classList.add("block");
    }
    textUserLogin.classList.remove("block");
}
//
function validatePassLogin() {
    if (inputPLogin.value == "") {
        return textPassLogin.classList.add("block");
    }
    textPassLogin.classList.remove("block");
}
formLogin.addEventListener("submit", function (even) {
    even.preventDefault();
    validateUserLogin();
    validatePassLogin();

    inputPLogin.addEventListener("keyup", validatePassLogin);
    inputULogin.addEventListener("keyup", validateUserLogin);

    if(!textUserLogin.classList.contains("block")&&
        !textPassLogin.classList.contains("block")){
        this.submit();
    }
});



const formSignup = document.querySelector("#signup");
const inputUser = formSignup.querySelector("#user");
const inputEmail = formSignup.querySelector("#email");
const inputPass = formSignup.querySelector("#pass");
const inputRPass = formSignup.querySelector("#repass");
const textUser = formSignup.querySelector("#text-user");
const textEmail = formSignup.querySelector("#text-email");
const textPass = formSignup.querySelector("#text-pass");
const textRpass = formSignup.querySelector("#text-repass");

function validateUser() {
    if (inputUser.value === "") {
        return textUser.classList.add("block");
    }
    textUser.classList.remove("block");
}

function validateEmail() {
    const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!inputEmail.value.match(emailPattern)) {
        return textEmail.classList.add("block");
    }
    textEmail.classList.remove("block");
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

formSignup.addEventListener("submit", function (event) {
    event.preventDefault();
    validateUser();
    validateEmail();
    validatePass();
    validateRPass();
    inputUser.addEventListener("keyup", validateUser);
    inputEmail.addEventListener("keyup", validateEmail);
    inputPass.addEventListener("keyup", validatePass);
    inputRPass.addEventListener("keyup", validateRPass);

    if(!textUser.classList.contains("block")&&
        !textEmail.classList.contains("block")&&
        !textPass.classList.contains("block")&&
        !textRpass.classList.contains("block")){
        this.submit();
    }
});



inputUser.addEventListener("focus", function () {
    document.getElementById("label-user").classList.add("abc");
});
inputUser.addEventListener("blur", function () {
    if (inputUser.value == "") {
        document.getElementById("label-user").classList.remove("abc");
    } else {
        document.getElementById("label-user").classList.add("abc");
    }
});

inputEmail.addEventListener("focus", function () {
    document.getElementById("label-email").classList.add("abc");
});
inputEmail.addEventListener("blur", function () {
    if (inputEmail.value == "") {
        document.getElementById("label-email").classList.remove("abc");
    } else {
        document.getElementById("label-email").classList.add("abc");
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

inputPLogin.addEventListener("focus", function () {
    document.getElementById("label-pass-login").classList.add("abc");
});

inputPLogin.addEventListener("blur", function () {
    if (inputPLogin.value == "") {
        document.getElementById("label-pass-login").classList.remove("abc");
    } else {
        document.getElementById("label-pass-login").classList.add("abc");
    }
});