<%@ page import="qht.shopmypham.com.vn.model.Categories" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="qht.shopmypham.com.vn.model.Trademark" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý sản phẩm</title>
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
                    <h2>Thêm sản phẩm</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí kho</li>
                        <li class="breadcrumb-item active">Thêm hàng</li>
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
                                <%
                                    Map<String, String> map = (Map<String, String>) request.getSession().getAttribute("imgs");
                                    String img = "";
                                    if (map != null) {
                                        List<String> list = new ArrayList<>();
                                        for (Map.Entry<String, String> entry : map.entrySet()) {
                                            img = "data:image/jpeg;base64," + entry.getValue();
                                            list.add(img);
                                        }
                                %>
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1"><img
                                                src="<%=list.get(0)%>" style="height: 330px"
                                                class="img-fluid" alt=""/>
                                        </div>
                                        <% int a = 1;
                                            for (int i = 1; i < list.size(); i++) {
                                                a++;%>
                                        <div class="tab-pane" id="product_<%=a%>"><img
                                                src="<%=list.get(i)%>" class="img-fluid" style="height: 330px" alt=""/>
                                        </div>
                                        <%}%>
                                    </div>
                                    <ul class="preview thumbnail nav nav-tabs">
                                        <li class="nav-item"><a class="nav-link active" data-toggle="tab"
                                                                href="#product_1"><img
                                                src="<%=list.get(0)%>" style="height: 68px;"
                                                alt=""/></a></li>
                                        <% int b = 1;
                                            for (int i = 1; i < list.size(); i++) {
                                                b++;%>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                href="#product_<%=b%>"><img
                                                src="<%=list.get(i)%>" style="height: 68px;"
                                                alt=""/></a></li>
                                        <%}%>
                                    </ul>
                                    <button class="btn-primary btn" onclick="show()">Tải ảnh lên</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải lên ảnh sản phẩm</label>
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
                                <%} else {%>

                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_a"><img
                                                src="https://fastcare.vn/core/img/default_image.png" class="img-fluid"
                                                alt=""/>
                                        </div>
                                    </div>
                                    <button class="btn-primary btn" onclick="show()">Tải ảnh lên</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải lên ảnh sản phẩm</label>
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
                                <%}%>
                                <div class="col-xl-9 col-lg-8 col-md-12">


                                    <label for="product_name">Tên sản phẩm</label>
                                    <div class="form-group">
                                        <input type="text" id="product_name" class="form-control"
                                               value="">
                                    </div>
                                    <%
                                        List<Categories> categoriesList = (List<Categories>) request.getAttribute("listCategories");
                                        List<Trademark> trademarks = (List<Trademark>) request.getAttribute("trademarks");
                                    %>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="product_price">Giá sản phẩm</label>
                                            <div class="form-group">
                                                <input type="text" id="product_price" class="form-control"
                                                       value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="product_category">Phân loại sản phẩm</label>
                                            <div class="form-group">
                                                <select id="product_category"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <%
                                                        for (Categories category : categoriesList) {
                                                    %>
                                                    <option value="<%=category.getIdC()%>"><%=category.getNameC()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="product_trademark">Thương hiệu</label>
                                            <div class="form-group">
                                                <select id="product_trademark"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <%
                                                        for (Trademark trademark : trademarks) {

                                                    %>
                                                    <option value="<%=trademark.getId()%>"><%=trademark.getName()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">

                                        <div class="col-sm-6">
                                            <label for="quantityInput">Số lượng nhập</label>
                                            <div class="form-group">
                                                <input type="number" id="quantityInput" class="form-control"
                                                       min="1" oninput="this.value =
                                                       !!this.value && Math.abs(this.value) >= 1 ? Math.abs(this.value) : null">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="date1">Ngày nhập</label>
                                            <div class="form-group">
                                                <input type="datetime-local" id="dateInput"
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="new-show" class="promotion">
                                        <div class="promotion-box">
                                            <label for="product_price" class="title">Cài đặt sản phẩm mới</label>
                                            <i class="zmdi zmdi-close icon-close"
                                               onclick="closeNew()"></i>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Ngày kết thúc</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="datetime-local" id="date-new"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <button onclick="newProduct()"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">
                                                Cài đặt
                                            </button>
                                        </div>
                                    </div>
                                    <div id="promotion-show" class="promotion">
                                        <div class="promotion-box">
                                            <label for="product_price" class="title">Cài đặt sản phẩm khuyến
                                                mãi</label>
                                            <i class="zmdi zmdi-close icon-close"
                                               onclick="closePromotion()"></i>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Ngày bắt đầu</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="datetime-local" id="date1"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Ngày kết thúc</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="datetime-local" id="date2"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Giá khuyến mãi</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="number" id="promotion-price"
                                                           class="form-control"
                                                           placeholder="Nhập giá khuyến mãi">
                                                </div>
                                            </div>
                                            <button onclick="promotionProduct()"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">
                                                Cài đặt
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="description">
                                        <div class="row clearfix">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item"><a class="nav-link active" data-toggle="tab"
                                                                        href="#description">Mô tả</a></li>

                                            </ul>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <div class="form-line" style="width: 100%;">
                                                        <textarea rows="6" class="form-control no-resize"
                                                                  id="product_description"
                                                                  name="description"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" onclick="saveProduct()"
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
        xhr.open('POST', 'UpLoadImgPro', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                window.location.href = "AdminWareHouse?command=add";
            }
        };
        xhr.send(formData);
    });

    function saveProduct() {
        var product_name = document.getElementById("product_name").value;
        var quantityInput = document.getElementById("quantityInput").value;
        var dateInput = document.getElementById("dateInput").value;
        var product_price = document.getElementById("product_price").value;
        var product_category = document.getElementById("product_category").value;
        var product_description = document.getElementById("product_description").value;
        var product_trademark = document.getElementById("product_trademark").value;

        if (product_name.trim() === '' || product_price.trim() === '' || product_category.trim() === ''
            || product_description.trim() === '' || product_trademark.trim() === '') {
            showAlert("Vui lòng nhập đủ thông tin!");
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminWareHouse", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showNotification("Sản phẩm đã được thêm thành công");
                    window.location.href = "AdminWareHouse?command=list";
                }
            };
            xhr.send("name=" + encodeURIComponent(product_name)
                + "&price=" + encodeURIComponent(product_price)
                + "&quantity=" + encodeURIComponent(quantityInput)
                + "&quantityInput=" + encodeURIComponent(quantityInput)
                + "&dateInput=" + encodeURIComponent(formatDate(dateInput))
                + "&description=" + encodeURIComponent(product_description)
                + "&idC=" + encodeURIComponent(product_category)
                + "&trademark=" + encodeURIComponent(product_trademark)
                + "&command=add");
        }
    }

    function formatDate(date) {
        let currentDate = new Date(date);
        let hours = currentDate.getHours();
        let minutes = currentDate.getMinutes();
        let seconds = currentDate.getSeconds();
        let ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12;
        let day = currentDate.getDate();
        let month = currentDate.getMonth() + 1;
        let year = currentDate.getFullYear();

        if (hours < 10) {
            hours = "0" + hours;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (month < 10) {
            month = "0" + month;
        }
        let formattedDate = hours + ":" + minutes + ":" + seconds + " " + ampm + " " + day + "/" + month + "/" + year;
        return formattedDate;
    }

</script><!-- Custom Js -->
</body>

</html>