<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page import="qht.shopmypham.com.vn.controller.UserHome" %>
<%@ page import="org.checkerframework.checker.units.qual.C" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || Thanh toán</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Css Styles -->
    <link rel="stylesheet" href="user-template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/style.css" type="text/css">
    <script src="https://www.paypal.com/sdk/js?client-id=AYoXyaQCdEAzGEyqU23K4fz_G1aU7RP2PzM8RE9x36p8q1ilxYDvwkr2xlC4w5dc8wjfXRnyDT6FizMP&currency=USD&disable-funding=card"></script>
</head>

<body>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>

<!-- Header Section Begin -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Thanh toán</h4>
                    <div class="breadcrumb__links">
                        <a href="./home">Trang chủ</a>
                        <a href="./product">Sản Phẩm</a>
                        <span>Thanh toán</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <div class="row">
                <div class="col-lg-8 col-md-6">
                    <h6 class="checkout__title">Địa chỉ </h6>
                    <div class="checkout__input">
                        <%
                            CheckOut checkOut = (CheckOut) request.getAttribute("checkOut");
                        %>
                        <p>Địa chỉ<span>*</span></p>
                        <div style="display: flex">
                            <div class="address">
                                <select required="required" id="provinceID" name="provinceID"
                                        onchange="getDistricts()">
                                    <option value="<%=checkOut.getIdProvince()%>">--Chọn Tỉnh/Thành phố--</option>
                                    <% List<Province> provinces = UserHome.provinceList;
                                        for (Province province : provinces) {%>
                                    <option value="<%=province.getProvinceID()%>"><%=province.getProvinceName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="address" id="district">
                                <select required="required" id="districtID" onchange="getWards()" name="districtID">
                                    <option value="">--Chọn Huyện--</option>
                                </select>
                            </div>
                            <div class="address" id="ward" style="margin: 0">
                                <select required="required" name="wardID" id="wardID">
                                    <option value="">--Chọn Xã/Ấp--</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="checkout__input">
                        <div class="checkout__input">
                            <p>Địa chỉ cụ thể<span>*</span></p>
                            <input class="form-control from-border"
                                   rows="6"
                                   id="address_detail"
                                   name="address_detail"
                                   required="required"
                                   placeholder="Số nhà, tên đường,..."
                                   data-validation-required-message="Please enter your message">
                        </div>
                    </div>
                    <div class="checkout__input__checkbox" id="myDiv">
                        <button class="site-btn" onclick="change(<%=checkOut.getIdCk()%>)">LƯU
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<!-- Footer Section Begin -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="user-template/js/jquery-3.3.1.min.js"></script>
<script src="user-template/js/bootstrap.min.js"></script>
<script src="user-template/js/jquery.nice-select.min.js"></script>
<script src="user-template/js/jquery.nicescroll.min.js"></script>
<script src="user-template/js/jquery.magnific-popup.min.js"></script>
<script src="user-template/js/jquery.countdown.min.js"></script>
<script src="user-template/js/jquery.slicknav.js"></script>
<script src="user-template/js/mixitup.min.js"></script>
<script src="user-template/js/owl.carousel.min.js"></script>
<script src="user-template/js/main.js"></script>
<script src="user-template/js/product.js"></script>
<script src="admin-template/assets/js/notification.js"></script>

<script>
    function getDistricts() {
        // Lấy giá trị của tùy chọn được chọn trong danh sách tỉnh/thành phố
        var provinceID = document.getElementById("provinceID").value;
        var districtSelect = document.getElementById("district");

        // Tạo yêu cầu AJAX để lấy danh sách quận/huyện tương ứng từ servlet
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "Address?command=province&provinceID=" + provinceID, true);
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
        xhr.open("GET", "Address?command=ward&wardID=" + districtID, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                wardSelect.innerHTML = this.responseText;
            }
        };
        xhr.send();
    }

    // function getCalculateFee() {
    //     var districtID = document.getElementById("districtID").value;
    //     var wardID = document.getElementById("wardID").value;
    //
    //     // Tạo yêu cầu AJAX để lấy danh sách quận/huyện tương ứng từ servlet
    //     var xhr = new XMLHttpRequest();
    //     xhr.open("GET", "Address?command=total-change&districtID=" + districtID + "&wardID=" + wardID, true);
    //     xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //     xhr.onreadystatechange = function () {
    //         if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
    //             document.getElementById("calculate_fee").innerHTML = this.responseText;
    //         }
    //     };
    //     xhr.send();
    // }
</script>
<script>

    function change(idCk) {
        var address_detail = $('#address_detail').val();
        var provinceID = $('#provinceID').val();
        var districtID = $('#districtID').val();
        var wardID = $('#wardID').val();
        if (address_detail.trim().length == 0
            || provinceID.trim().length == 0
            || districtID.trim().length == 0 || wardID.trim().length == 0) {
            showAlert("Vui lòng nhập dầy đủ thông tin thanh toán!")
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "Address", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    window.location.href = "profile?command=order-detail&idCk=" + idCk;
                }
            };
            xhr.send("address_detail=" + encodeURIComponent(address_detail)
                + "&provinceID=" + encodeURIComponent(provinceID)
                + "&districtID=" + encodeURIComponent(districtID)
                + "&wardID=" + encodeURIComponent(wardID)
                + "&idCk=" + idCk
                + "&command=change");
        }
    }

</script>
</body>

</html>