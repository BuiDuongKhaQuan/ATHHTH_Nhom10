<%@ page import="java.util.Map" %>
<%@ page import="qht.shopmypham.com.vn.model.Shop" %>
<%@ page import="qht.shopmypham.com.vn.model.Province" %>
<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.api" %>
<%@ page import="qht.shopmypham.com.vn.service.ShopService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

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
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">
    <style>
        .form-group label {
            flex: 2;
        }

        .form-group input {
            flex: 10;
        }

        .address {
            width: 33%;
            margin-right: 10px;
        }
    </style>
</head>

<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <% Shop shop = (Shop) request.getAttribute("shop");%>
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Thông tin cửa hàng</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i>Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí trang chủ</li>
                        <li class="breadcrumb-item active">Thông tin cửa hàng</li>
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
                                    Map<String, String> map = (Map<String, String>) request.getSession().getAttribute("logo");
                                    String img = "";
                                    String path = "";
                                    if (map != null) {
                                        for (Map.Entry<String, String> entry : map.entrySet()) {
                                            img = "data:image/jpeg;base64," + entry.getValue();
                                            path = entry.getKey();
                                        }
                                    } else {
                                        img = shop.getLogo_header();
                                    }
                                %>
                                <div class="col-xl-3 col-lg-4 col-md-12" style="margin-top: 20px;">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1">
                                            <img src="<%=img%>"
                                                 class="img-fluid" alt=""/>
                                        </div>
                                    </div>
                                    <div class="preview preview-pic tab-content" style="margin-top: 20px;">
                                        <div class="tab-pane active">
                                            <button class="btn-primary btn" onclick="show()">Tải ảnh
                                                lên
                                            </button>
                                        </div>
                                    </div>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải lên ảnh sản phẩm</label>
                                            <i class="zmdi zmdi-close icon-close"
                                               onclick="closeNew()"></i>
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
                                    <% if (map != null) {%>
                                    <input value="<%=path%>" type="hidden" name="logo_header" id="logo_header">
                                    <%} else {%>
                                    <input value="<%=shop.getLogo_header()%>" type="hidden" name="logo_header"
                                           id="logo_header">
                                    <%}%>
                                    <div class="form-group">
                                        <label for="name">TÊN CỬA HÀNG</label>
                                        <input type="text" id="name" class="form-control"
                                               value="<%=shop.getShopName()%>">
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label for="email">E-MAIL</label>
                                        <input type="text" id="email" class="form-control"
                                               value="<%=shop.getEmail()%>">
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label for="phone">SỐ ĐIỆN THOẠI</label>
                                        <input type="text" id="phone"
                                               value="<%=shop.getPhone()%>" class="form-control">
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label for="provinceID">Địa chỉ</label>
                                        <div class="form-group" style="width: 84%;">
                                            <div class="address">
                                                <select id="provinceID"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select"
                                                        onchange="getDistricts()">
                                                    <option value="<%=api.getProvinceById(ShopService.getShop().getProvinceID()).getProvinceID()%>"><%=api.getProvinceById(ShopService.getShop().getProvinceID()).getProvinceName()%>
                                                    </option>
                                                    <% List<Province> provinces = api.getProvince();
                                                        for (Province province : provinces) {%>
                                                    <option value="<%=province.getProvinceID()%>"><%=province.getProvinceName()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                            </div>
                                            <div class="address" id="district">
                                                <select id="districtID"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select"
                                                        onchange="getWards()">
                                                    <option value="<%=api.getDistrictById(ShopService.getShop().getProvinceID(), ShopService.getShop().getDistrictID()).getDistrictID()%>"><%=api.getDistrictById(ShopService.getShop().getProvinceID(), ShopService.getShop().getDistrictID()).getDistrictName()%>
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="address" id="ward" style="margin: 0">
                                                <select class="form-control show-tick ms select2"
                                                        data-placeholder="Select"
                                                        id="wardID">
                                                    <option value="<%=api.getWardById(ShopService.getShop().getDistrictID(), ShopService.getShop().getWardID()).getWardCode()%>"><%=api.getWardById(ShopService.getShop().getDistrictID(), ShopService.getShop().getWardID()).getWardName()%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label for="desginer">THIẾT KẾ BỞI</label>
                                        <input type="text" id="desginer"
                                               value="<%=shop.getDesignerBy()%>" class="form-control">
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label for="slogan">CÂU SLOGAN</label>
                                        <textarea rows="6" class="form-control no-resize" style="flex: 10"
                                                  id="slogan"
                                                  name="contact"><%=shop.getAboutShop()%></textarea>
                                    </div>
                                    <hr>
                                    <div class="form-group" style="width: 100%;">
                                        <label for="contact">CÂU LIÊN HỆ</label>
                                        <textarea rows="6" class="form-control no-resize" style="flex: 10"
                                                  id="contact"
                                                  name="contact"><%=shop.getTextInHelp()%></textarea>
                                    </div>

                                    <button type="submit" onclick="save(<%=shop.getIdS()%>)"
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
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/plugins/dropify/js/dropify.min.js"></script>
<script src="admin-template/assets/js/notification.js"></script>

<%----%>
<script>

    $('.dropify').dropify();

    const form = document.getElementById('upload-form');
    const fileInput = document.getElementById('file-input');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const formData = new FormData();
        formData.append('file', fileInput.files[0]);
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'UploadLogoHeader', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                window.location.href = "AdminHomeAll?command=information";
            }
        };
        xhr.send(formData);
    });

    function save(idS) {
        var phone = document.getElementById("phone").value;
        var slogan = document.getElementById("slogan").value;
        var contact = document.getElementById("contact").value;
        var email = document.getElementById("email").value;
        var name = document.getElementById("name").value;
        var desginer = document.getElementById("desginer").value;
        var logo_header = document.getElementById("logo_header").value;
        var provinceID = document.getElementById("provinceID").value;
        var districtID = document.getElementById("districtID").value;
        var wardID = document.getElementById("wardID").value;

        if (phone.trim() === '' || slogan.trim() === '' || contact.trim() === ''
            || email.trim() === '' || name.trim() === '' || desginer.trim() === '') {
            showAlert("Vui lòng nhập đủ thông tin!");
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminHomeAll", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showNotification("Thông tin đã được cập nhật thành công.");
                }
            };
            xhr.send("phone=" + encodeURIComponent(phone)
                + "&slogan=" + encodeURIComponent(slogan)
                + "&contact=" + encodeURIComponent(contact)
                + "&email=" + encodeURIComponent(email)
                + "&name=" + encodeURIComponent(name)
                + "&desginer=" + encodeURIComponent(desginer)
                + "&logo_header=" + encodeURIComponent(logo_header)
                + "&provinceID=" + encodeURIComponent(provinceID)
                + "&districtID=" + encodeURIComponent(districtID)
                + "&wardID=" + encodeURIComponent(wardID)
                + "&idS=" + idS
                + "&command=information");
        }
    }

</script><!-- Custom Js -->
<script>
    function getDistricts() {
        // Lấy giá trị của tùy chọn được chọn trong danh sách tỉnh/thành phố
        var provinceID = document.getElementById("provinceID").value;
        var districtSelect = document.getElementById("district");

        // Tạo yêu cầu AJAX để lấy danh sách quận/huyện tương ứng từ servlet
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "Address?command=provincei&provinceID=" + provinceID, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                districtSelect.innerHTML = this.responseText;
            }
        };
        xhr.send();

    }

    function getWards() {
        // Lấy giá trị của tùy chọn được chọn trong danh sách tỉnh/thành phố
        var districtID = document.getElementById("districtID").value;
        var wardSelect = document.getElementById("ward");

        // Tạo yêu cầu AJAX để lấy danh sách quận/huyện tương ứng từ servlet
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "Address?command=wardi&wardID=" + districtID, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                wardSelect.innerHTML = this.responseText;
            }
        };
        xhr.send();
    }
</script>
</body>

</html>