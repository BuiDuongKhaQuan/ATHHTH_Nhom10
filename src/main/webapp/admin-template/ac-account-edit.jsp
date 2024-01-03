<%@ page import="qht.shopmypham.com.vn.model.Account" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý tài khoản</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
</head>

<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <% Account ac = (Account) request.getAttribute("account");
        %>
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Chỉnh sửa tài khoản</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí tài khoản</li>
                        <li class="breadcrumb-item"><a href="admin-account?command=list">Danh sách tài khoản</a></li>
                        <li class="breadcrumb-item active">Chỉnh sửa tài khoản</li>
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
            <form id="edit-product">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="body">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-4 col-md-12">
                                        <div class="preview preview-pic tab-content">
                                            <div class="tab-pane active" id="product_1"><img
                                                    src="<%=ac.getImg()%>" class="img-fluid" alt="avatar"
                                                    style="min-width: 210px; min-height: 210px; border: 1px solid #ccc"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-8 col-md-12">
                                        <div class="product details">
                                            <label for="fullName">Tên đầy đủ</label>
                                            <div class="form-group">
                                                <input type="text" id="fullName"
                                                       placeholder="Nhập tên đầy đủ của bạn"
                                                       class="form-control"
                                                       name="fullName" value="<%=ac.getFullName()%>">
                                            </div>
                                            <label for="email">Email</label>
                                            <div class="form-group">
                                                <input type="email" id="email" class="form-control"
                                                       placeholder="Nhập E-mail của bạn"
                                                       name="email" value="<%=ac.getEmail()%>">
                                            </div>
                                            <label for="phone">Số điện thoại</label>
                                            <div class="form-group">
                                                <input type="text" id="phone" class="form-control"
                                                       value="<%=ac.getPhone()%>"
                                                       name="phone" placeholder="Nhập số điện thoại">
                                            </div>

                                            <label for="address">Địa chỉ</label>
                                            <div class="form-group">
                                                <input type="text" id="address" class="form-control"
                                                       value="<%=ac.getAddress()%>"
                                                       name="address" placeholder="Nhập địa chỉ">
                                            </div>
                                            <button onclick="show()"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">Cấp quyền
                                            </button>
                                            <button type="submit" onclick="resetPass(<%=ac.getId()%>)"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">Đặt lại
                                                mật khẩu
                                            </button>
                                            <%if (ac.getStatus()==0){%>
                                            <button onclick="unLock(<%=ac.getId()%>)"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">Mở khóa
                                            </button>
                                            <%} else {%>
                                            <button onclick="lockA(<%=ac.getId()%>)"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">Khóa
                                            </button>
                                            <%}%>
                                            <button type="submit" onclick="saveAccount(<%=ac.getId()%>)"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">Lưu
                                            </button>
                                            <div id="show" class="promotion">
                                                <div class="promotion-box">
                                                    <label class="title" style="text-align: center">Cấp quyền</label>
                                                    <i class="zmdi zmdi-close icon-close"
                                                       onclick="closeNew()"></i>
                                                    <div style="display: flex; justify-content: center;
                                                                                flex-direction: column;
                                                                                padding: 20px 60px 20px 100px;">
                                                        <div class="row clearfix">
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="blogMana"
                                                                    <%if(ac.powerAccount().getBlogManage()==1){%>
                                                                       checked<%}%>>
                                                                <label for="blogMana"> Quản lí blog</label><br>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="acountMana"
                                                                    <%if(ac.powerAccount().getAccountManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="acountMana"> Quản lí tài
                                                                    khoản</label><br>
                                                            </div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="productMana"
                                                                    <%if(ac.powerAccount().getProductManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="productMana"> Quản lí sản
                                                                    phẩm</label><br>
                                                            </div>
                                                            <div class="col-sm-6">

                                                                <input type="checkbox" id="orderMana"
                                                                    <%if(ac.powerAccount().getOrderManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="orderMana"> Quản lí đơn hàng</label><br>
                                                            </div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="genaralMana"
                                                                    <%if(ac.powerAccount().getGeneralManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="genaralMana"> Quản lí chung</label><br>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="homeMana"
                                                                    <%if(ac.powerAccount().getHomeManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="homeMana"> Quản lí thông trang
                                                                    chủ</label><br>
                                                            </div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="sliderlMana"
                                                                    <%if(ac.powerAccount().getSliderManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="sliderlMana"> Quản lí slider</label><br>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <input type="checkbox" id="voucherMana"
                                                                    <%if(ac.powerAccount().getVoucherManage()==1){%>
                                                                       checked<%}%>
                                                                >
                                                                <label for="voucherMana"> Quản lí mã giảm
                                                                    giá</label><br>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <button type="submit" onclick="saveAuthur(<%=ac.getId()%>)"
                                                                class="btn btn-raised btn-primary btn-round waves-effect">
                                                            Lưu
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
            </form>
        </div>
    </div>

</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->

<%----%>
<script>
    function saveAccount(idA) {
        var fullName = document.getElementById("fullName").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;
        var address = document.getElementById("address").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-account", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Lưu thông tin thành công');
            }
        };
        xhr.send("fullName=" + encodeURIComponent(fullName)
            + "&email=" + encodeURIComponent(email)
            + "&phone=" + encodeURIComponent(phone)
            + "&address=" + encodeURIComponent(address)
            + "&idA=" + idA
            + "&command=edit");
    }

    function resetPass(id) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-account?command=resetPass&id=" + id, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Đặt lại mật khẩu thành công');
            }
        };
        xhr.send();
    }
    function lockA(id) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "admin-account?command=lock&id=" + id, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Đã khóa tài khoản');
            }
        };
        xhr.send();
    }
    function unLock(id) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "admin-account?command=unLock&id=" + id, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Mở khóa thành công');
            }
        };
        xhr.send();
    }
    function saveAuthur(idA) {
        var acountMana = document.getElementById("acountMana").checked;
        var productMana = document.getElementById("productMana").checked;
        var orderMana = document.getElementById("orderMana").checked;
        var blogMana = document.getElementById("blogMana").checked;
        var genaralMana = document.getElementById("genaralMana").checked;
        var homeMana = document.getElementById("homeMana").checked;
        var sliderlMana = document.getElementById("sliderlMana").checked;
        var voucherMana = document.getElementById("voucherMana").checked;


        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-account", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotificationBox("Đã cập nhật quyền thành công");
            }
        };
        xhr.send("acountMana=" + encodeURIComponent(acountMana)
            + "&productMana=" + encodeURIComponent(productMana)
            + "&orderMana=" + encodeURIComponent(orderMana)
            + "&blogMana=" + encodeURIComponent(blogMana)
            + "&genaralMana=" + encodeURIComponent(genaralMana)
            + "&homeMana=" + encodeURIComponent(homeMana)
            + "&sliderlMana=" + encodeURIComponent(sliderlMana)
            + "&voucherMana=" + encodeURIComponent(voucherMana)
            + "&idA=" + idA
            + "&command=editAuthur");
    }

</script><!-- Custom Js -->

</body>

</html>