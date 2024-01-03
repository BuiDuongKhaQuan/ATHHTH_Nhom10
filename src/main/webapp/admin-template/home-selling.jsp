<%@ page import="qht.shopmypham.com.vn.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Image" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.model.Selling" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
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
    <link rel="stylesheet" href="admin-template/assets/plugins/footable-bootstrap/css/footable.bootstrap.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/footable-bootstrap/css/footable.standalone.min.css">

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
                    <h2>Chọn sản phẩm ưu đãi</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí trang chủ</li>
                        <li class="breadcrumb-item active">Chọn sản phẩm làm sản phẩm ưu đãi</li>
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
                        <div class="table-responsive">
                            <table id="table_id" class="table table-hover product_item_list c_table theme-color mb-0">
                                <thead>
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th data-breakpoints="xs">Giá</th>
                                    <th data-breakpoints="xs md">Trang thái</th>
                                    <th data-breakpoints="sm xs md">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<Product> productList = (List<Product>) request.getAttribute("promotionProducts");
                                    for (Product product : productList) {
                                        List<Image> imageList = ProductService.getImages(String.valueOf(product.getIdP()));
                                        Selling selling = ProductService.getSelling();
                                        String status = "";
                                        if (product.getIdP() == selling.getIdP()) {
                                            status = "Đang được chọn";
                                        } else {status = "Không được chọn";}
                                %>
                                <tr>
                                    <td><img src="<%=imageList.get(0).getImg()%>" width="48" alt="Product img">
                                    </td>
                                    <td><h5><%=product.getName()%>
                                    </h5>
                                    </td>
                                    <td><%=Format.formatPrice(product.getPrice())%>đ</td>
                                    <td><span class="col-green"><%=status%></span></td>
                                    <td>
                                        <a onclick="selected(<%=product.getIdP()%>)"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-green"><i
                                                class="zmdi zmdi-check"></i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="promotion-show" class="promotion">
                    <% Selling selling = (Selling) request.getAttribute("selling");%>
                    <div class="promotion-box">
                        <label class="title">Cài đặt sản phẩm ưu đãi</label>
                        <i class="zmdi zmdi-close icon-close"
                           onclick="closePromotion()"></i>
                        <div class="promotion-content">
                            <div class="label-text">
                                <label>Câu ưu đãi</label>
                            </div>
                            <div class="form-group-date">
                                <input type="text" id="text"
                                       value="<%=selling.getText()%>" class="form-control">
                            </div>
                        </div>
                        <div class="promotion-content">
                            <div class="label-text">
                                <label>Câu quảng cáo về sản phẩm 1</label>
                            </div>
                            <div class="form-group-date">
                                <input type="text" id="text1"
                                       value="<%=selling.getText1()%>" class="form-control">
                            </div>
                        </div>
                        <div class="promotion-content">
                            <div class="label-text">
                                <label>Câu quảng cáo về sản phẩm 2</label>
                            </div>
                            <div class="form-group-date">
                                <input type="text" id="text2"
                                       value="<%=selling.getText2()%>" class="form-control">
                            </div>
                        </div>
                        <div class="promotion-content">
                            <div class="label-text">
                                <label>Câu quảng cáo về sản phẩm 3</label>
                            </div>
                            <div class="form-group-date">
                                <input type="text" id="text3"
                                       value="<%=selling.getText3()%>" class="form-control">
                            </div>
                        </div>
                        <button onclick="updateText()"
                                class="btn btn-raised btn-primary btn-round waves-effect">
                            Cài đặt
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/js/pages/tables/footable.js"></script><!-- Custom Js -->
<script>
    function selected(idP) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AdminHomeAll", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Chọn sản phẩm thành công, vui lòng cập nhật câu giới thiệu!");
                showQ();
            }
        };
        xhr.send("idP=" + idP
            + "&command=selling");
    }

    function updateText() {
        var text1 = document.getElementById("text1").value;
        var text2 = document.getElementById("text2").value;
        var text3 = document.getElementById("text3").value;
        var text = document.getElementById("text").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AdminHomeAll", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Cập nhật câu quảng cáo thành công!");
                closePromotion();
            }
        };
        xhr.send("text1=" + encodeURIComponent(text1)
            + "&text=" + encodeURIComponent(text)
            + "&text2=" + encodeURIComponent(text2)
            + "&text3=" + encodeURIComponent(text3)
            + "&command=selling");
    }

    function showQ() {
        var box = document.getElementById('promotion-show');
        box.style.display = 'flex';
    }

    function closePromotion() {

        var box = document.getElementById('promotion-show');
        box.style.display = 'none';
    }
</script>
</body>


</html>