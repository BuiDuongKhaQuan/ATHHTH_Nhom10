<%@ page import="qht.shopmypham.com.vn.model.Account" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Trang cá nhân</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">

</head>


<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Thông tin cá nhân</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Trang cá nhân</li>
                        <li class="breadcrumb-item active">Thông tin cá nhân</li>
                    </ul>
                    <button class="btn btn-primary btn-icon mobile_menu" type="button"><i
                            class="zmdi zmdi-sort-amount-desc"></i></button>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12">
                    <button class="btn btn-primary btn-icon float-right right_icon_toggle_btn" type="button"><i
                            class="zmdi zmdi-arrow-right"></i></button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="row">
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <% Account acc = (Account) request.getAttribute("acc");
                                        String myavatar = (String) session.getAttribute("avatar");
                                        String avatar = "";
                                        if (acc.getImg() == null && myavatar == null) {
                                            avatar = "user-template/assets/images/avatar.png";
                                        }
                                        if (acc.getImg() == null && myavatar != null) {
                                            avatar = "data:image/jpeg;base64," + myavatar;
                                        }
                                        if (acc.getImg() != null && myavatar == null) {
                                            avatar = acc.getImg();
                                        }
                                        if (acc.getImg() != null && myavatar != null) {
                                            avatar = "data:image/jpeg;base64," + myavatar;
                                        }
                                    %>
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_a"><img style="height: 410px;"
                                                                                         src="<%=avatar%>"
                                                                                         class="img-fluid"
                                                                                         alt=""/>
                                        </div>
                                    </div>
                                    <button class="btn-primary btn" onclick="show()">Tải ảnh lên</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải lên ảnh đại diện</label>
                                            <img src="user-template/img/icon/close.png" width="22px"
                                                 class="zmdi zmdi-close icon-close"
                                                 onclick="closeNew()">
                                            <div class="promotion-content">
                                                <form id="upload-form" method="post"
                                                      enctype="multipart/form-data">
                                                    <input type="file" name="file-input"
                                                           class="dropify" id="file-input">
                                                    <button type="submit">Tải lên</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-9 col-lg-8 col-md-12">

                                    <label for="fullName">Họ và tên</label>
                                    <div class="form-group">
                                        <input type="text" id="fullName" class="form-control"
                                               value="<%=acc.getFullName()%>"
                                               placeholder="Cập nhật họ và tên">
                                    </div>

                                    <label for="email">Email</label>
                                    <div class="form-group">
                                        <input type="email" id="email" class="form-control"
                                               value="<%=acc.getEmail()%>"
                                               placeholder="Cập nhật email">
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="phone">Số điện thoại</label>
                                            <div class="form-group">
                                                <input type="text" id="phone" class="form-control"
                                                       value="<%=acc.getPhone()%>"
                                                       placeholder="Cập nhật số điện thoại">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="address">Địa chỉ</label>
                                            <div class="form-group">
                                                <input type="text" id="address"
                                                       value="<%=acc.getAddress()%>" class="form-control"
                                                       placeholder="Cập nhật địa chỉ">
                                            </div>
                                        </div>
                                        <button type="submit" onclick="saveAcc(<%=acc.getId()%>)"
                                                class="btn btn-raised btn-primary btn-round waves-effect">Lưu
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/plugins/dropify/js/dropify.min.js"></script>
<script src="admin-template/assets/js/notification.js"></script>

<script>
    $('.dropify').dropify();

    const form = document.getElementById('upload-form');
    const fileInput = document.getElementById('file-input');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const formData = new FormData();
        formData.append('file', fileInput.files[0]);
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'UploadFileServlet', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                window.location.href = "admin-account?command=profile";
            }
        };
        xhr.send(formData);
    });

    function saveAcc(idA) {
        var fullName = document.getElementById("fullName").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;
        var address = document.getElementById("address").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-account", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Thông tin tài khoản đã được cập nhật thành công!");
            }
        };
        xhr.send("fullName=" + encodeURIComponent(fullName)
            + "&email=" + encodeURIComponent(email)
            + "&phone=" + encodeURIComponent(phone)
            + "&address=" + encodeURIComponent(address)
            + "&idA=" + idA
            + "&command=edit");
    }

</script><!-- Custom Js -->
</body>

</html>