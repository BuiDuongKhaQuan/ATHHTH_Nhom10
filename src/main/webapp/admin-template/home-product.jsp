<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.service.HomeService" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý trang chủ</title>
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
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Số lượng sản phẩm hiển thị, Cosmetics New Trends</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí trang chủ</li>
                        <li class="breadcrumb-item active">Số lượng sản phẩm, Cosmetics New Trends</li>
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
                <% Home home = HomeService.getHome();%>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="row">
                                <div class="col-xl-9 col-lg-8 col-md-12">

                                    <label for="quantityProS">Sản phẩm bán chạy</label>
                                    <div class="form-group">
                                        <input type="number" id="quantityProS"
                                               style="flex: 10"
                                               class="form-control"
                                               value="<%=home.getQuantityProS()%>"> <label>sản phẩm</label>
                                    </div>
                                    <label for="quantityProN">Sản phẩm mới</label>
                                    <div class="form-group">
                                        <input type="number" id="quantityProN"
                                               style="flex: 10"
                                               class="form-control"
                                               value="<%=home.getQuantityProN()%>"> <label>sản phẩm</label>
                                    </div>
                                    <label for="quantityProP">Sản phẩm ưu đãi</label>
                                    <div class="form-group">
                                        <input type="number" id="quantityProP"
                                               style="flex: 10"
                                               class="form-control"
                                               value="<%=home.getQuantityProP()%>"> <label>sản phẩm</label>
                                    </div>
                                    <label for="quantityBlog">Fashion New Trends</label>
                                    <div class="form-group">
                                        <input type="number" id="quantityBlog"
                                               style="flex: 10"
                                               class="form-control"
                                               value="<%=home.getQuantityBlog()%>"> <label>bài</label>
                                    </div>
                                    <button type="submit" onclick="save()"
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
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script>
    function save() {
        var quantityProS = document.getElementById("quantityProS").value;
        var quantityProN = document.getElementById("quantityProN").value;
        var quantityProP = document.getElementById("quantityProP").value;
        var quantityBlog = document.getElementById("quantityBlog").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AdminHomeAll", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Cập nhật số lượng thành công");
            }
        };
        xhr.send("quantityProS=" + encodeURIComponent(quantityProS)
            + "&quantityProN=" + encodeURIComponent(quantityProN)
            + "&quantityProP=" + encodeURIComponent(quantityProP)
            + "&quantityBlog=" + encodeURIComponent(quantityBlog)
            + "&command=quantity");
    }

</script>
</body>


</html>
