<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Mỹ Phẩm QST || Đăng nhập</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">
    <link rel="stylesheet" href="user-template/css/login.css"/>
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />
</head>
<body>
<% String active = (String) request.getAttribute("active");%>
<img src="user-template/img/background/login.png" style="width: 100%;height: 100vh; position: absolute">
<div class="wrapper <%=active%>" style="z-index: 99999">
    <div class="form-box login">
        <h2>Đăng nhập</h2>
        <form action="login" id="login" method="post">
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
                <i class="bx bx-lock-alt show"></i>
                <input type="password" name="pass" id="passlogin"/>
                <label id="label-pass-login">Mật khẩu</label>
            </div>
            <div class="error-box pass" id="text-pass-login">
                <i class="bx bx-error-circle"></i>
                <label>Mật khẩu không được để trống!</label>
            </div>
            <% String mess = (String) request.getAttribute("mess");
                String mess1 = (String) request.getAttribute("mess1");
                if (mess != null) {%>
            <div class="mess">
                <i class="bx bx-error-circle"></i>
                <label>Tài khoản hoặc mật khẩu không đúng!</label>
            </div>
            <%
                }
                if (mess1 != null) {
            %>
            <div class="remember-forgot"
                 style="justify-content: flex-start; color: #ff0000; font-size: 0.96em; margin-right: 4px;">
                <i class="bx bx-error-circle" style="margin-right: 2px;"></i>
                <label>Tài khoản của bạn đã bị khóa! <a href="contact">Trợ giúp</a></label>
            </div>
            <%}%>
            <div class="remember-forgot">
                <label><input type="checkbox"/>Nhớ mật khẩu</label>
                <a href="forgot-password.jsp">Quên mật khẩu?</a>
            </div>
            <% String success = (String) request.getAttribute("success");
                if (success != null) {%>
            <div class="alert alert-primary" role="alert"
                 style="color: #009d0c;font-size: 0.8em;font-weight: bold;margin-bottom: 16px;">
                <%=success %>
            </div>
            <%}%>
            <button type="submit" class="btn">Đăng nhập</button>

            <div class="login-register">
                <p>
                    Bạn chưa có tài khoản?
                    <a href="#" class="register-link">Đăng ký</a>
                </p>
            </div>
            <div
                    class="other_fb"
                    style="
              display: flex;
              justify-content: center;
              flex-direction: column;
              align-items: center;
            "
            >
                <div
                        style="
                border-top: 2px solid #ccc;
                width: 80%;
                height: 0%;
                margin-bottom: 5px;
              "
                ></div>
                <div><p style="height: 2%">OR</p></div>
                <div class="form_icons">
                    <a
                            href="https://www.facebook.com/v16.0/dialog/oauth?client_id=713236200417479&redirect_uri=http://localhost:8080/ShopMyPham_war_exploded/login-facebook"
                    ><i class="bx bxl-facebook-circle"></i>
                    </a>
                    <a
                            href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/ShopMyPham_war_exploded/login-google&response_type=code
                    &client_id=70792321459-u2vj38c8q86v2l64qj98jpst4kme46rg.apps.googleusercontent.com&approval_prompt=force"
                    ><i class="bx bxl-google"></i>
                    </a>
                </div>
            </div>
        </form>
    </div>
    <div class="form-box register">
        <h2>Đăng ký</h2>
        <!--  -->
        <form id="signup" action="createKey" method="post">
            <div class="input-box">
                <i class="bx bx-user"></i>
                <input type="text" name="user" id="user"/>
                <label id="label-user">Tên tài khoản</label>
            </div>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div class="error-box user" style="display: block">
                <i class="bx bx-error-circle"></i>
                <label><%=error%>
                </label>
            </div>
            <%}%>
            <div class="error-box user" id="text-user">
                <i class="bx bx-error-circle"></i>
                <label>Tên tài khoản không được để trống!</label>
            </div>
            <div class="input-box">
                <i class="bx bx-envelope"></i>
                <input type="text" name="email" id="email"/>
                <label id="label-email">E-mail</label>
            </div>
            <div class="error-box email" id="text-email">
                <i class="bx bx-error-circle"></i>
                <label>Vui lòng nhập đúng định dạng của e-mail!</label>
            </div>
            <div class="input-box">
                <i class="bx bx-lock-alt show"></i>
                <input type="password" name="pass" id="pass"/>
                <label id="label-pass">Mật khẩu</label>
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

            <div class="remember-forgot">
                <label
                ><input type="checkbox"/>Tôi đồng ý với các điều khoản & dịch
                    vụ</label
                >
            </div>
            <button type="submit" class="btn" >Tiếp tục</button>
            <div class="login-register">
                <p>
                    Bạn đã có tài khoản?
                    <a href="#" class="login-link">Đăng nhập </a>
                </p>
            </div>
            <div
                    class="other_fb"
                    style="
              display: flex;
              justify-content: center;
              flex-direction: column;
              align-items: center;
            "
            >
                <div
                        style="
                border-top: 2px solid #ccc;
                width: 80%;
                height: 0%;
                margin-bottom: 5px;
              "
                ></div>
                <div><p style="height: 2%">OR</p></div>
                <div class="form_icons">
                    <a
                            href="https://www.facebook.com/v16.0/dialog/oauth?client_id=713236200417479&redirect_uri=http://localhost:8080/ShopMyPham_war_exploded/login-facebook"
                    ><i class="bx bxl-facebook-circle"></i>
                    </a>
                    <a
                            href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/ShopMyPham_war_exploded/login-google&response_type=code
                    &client_id=70792321459-u2vj38c8q86v2l64qj98jpst4kme46rg.apps.googleusercontent.com&approval_prompt=force"
                    ><i class="bx bxl-google"></i>
                    </a>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="user-template/js/prosvip-login.js"></script>
<script>

</script>

</body>
</html>
