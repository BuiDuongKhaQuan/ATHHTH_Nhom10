<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page import="qht.shopmypham.com.vn.controller.UserHome" %>
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
                    <% String success = (String) request.getAttribute("success");
                        if (success != null) {%>
                    <div class="alert alert-primary" role="alert"
                         style="color: #009d0c;font-size: 1em;font-weight: bold;">
                        <%=success %>
                    </div>
                    <%}%>
                    <h6 class="checkout__title">Thông tin thanh toán</h6>
                    <div class="checkout__input">
                        <p>Họ và tên<span>*</span></p>
                        <input
                                type="text"
                                class="form-control from-border"
                                name="name"
                                id="name"
                                placeholder="Họ và tên"
                                required="required"
                                data-validation-required-message="Hãy nhập tên của bạn">
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>Số điện thoại<span>*</span></p>
                                <input type="number"
                                       class="form-control from-border"
                                       id="phone"
                                       name="phone"
                                       placeholder="Số điện thoại"
                                       required="required"
                                       data-validation-required-message="Please enter your email">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>Ghi chú cho đơn hàng<span>*</span></p>
                                <input class="form-control from-border"
                                       rows="6"
                                       id="note"
                                       name="note"
                                       required="required"
                                       placeholder="Lưu ý của bạn về đơn hàng"
                                       data-validation-required-message="Please enter your message">
                            </div>
                        </div>
                    </div>
                    <div class="checkout__input">
                        <p>Địa chỉ<span>*</span></p>
                        <div style="display: flex">
                            <div class="address">
                                <select required="required" id="provinceID" name="provinceID"
                                        onchange="getDistricts()">
                                    <option value="">--Chọn Tỉnh/Thành phố--</option>
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
                                <select required="required" name="wardID" onchange="getCalculateFee()" id="wardID">
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
                    <div class="checkout__input">
                        <div class="checkout__input">
                            <p>Private Key<span>*</span></p>
                            <input class="form-control from-border"
                                   rows="6"
                                   id="private-key"
                                   name="private-key"
                                   required="required"
                                   placeholder="Nhập private key"
                                   data-validation-required-message="Please enter your message"
                                   style="white-space: pre-line;"
                            >
                            <input type="file" id="pdfInput" accept=".pdf" onchange="loadPdf()">

                        </div>

                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="checkout__order">
                        <h4 class="order__title">Tổng đơn hàng</h4>
                        <%
                            List<ListProductByCart> list = (List<ListProductByCart>) request.getAttribute("list");
                            Voucher voucher = (Voucher) request.getSession().getAttribute("voucher");
                            int totalPrice = 0;
                            for (ListProductByCart l : list) {
                                Product p = ProductService.getProductById(l.getIdP());
                                totalPrice += (p.getPrice() * l.getQuantity());
                        %>
                        <div class="checkout__order__products">Sản phẩm <span>Đơn giá</span></div>
                        <ul class="checkout__total__products" onclick="detailProduct(<%=p.getIdP()%>)"
                            style="cursor: pointer">
                            <li><%=p.getName()%> <span><%=Format.formatPrice(p.getPrice())%>đ</span></li>

                        </ul>
                        <%}%>
                        <ul class="checkout__total__all" id="calculate_fee">
                            <li>Tổng tiền hàng <span><%=Format.formatPrice(totalPrice)%>đ</span></li>
                            <li>Phí vận chuyển <span>Chưa có thông tin</span></li>
                            <% int reduction = 0;
                                if (voucher != null) {
                                    reduction = totalPrice * voucher.getPrice() / 100;
                                }
                                int priceLast = totalPrice - reduction;
                            %>
                            <li>Giảm giá <span>- <%=Format.formatPrice(reduction)%>đ</span></li>
                            <li>Tổng thanh toán <span><%=Format.formatPrice(priceLast)%>đ</span></li>
                        </ul>
                        <div class="checkout__input__checkbox">
                        </div>
                        <p>HÌNH THỨC THANH TOÁN</p>
                        <%if (list.size() != 0) {%>
                        <div class="checkout__input__checkbox" id="myDiv">
                            <button class="site-btn" onclick="getMoney()">THANH TOÁN KHI
                                NHẬN
                                HÀNG
                            </button>

                            <div id="paypal-button-container"></div>
                            <div id="loading" style="color: #009d0c; margin-top: 5px; font-size: 1em;display: none">
                                <i class="fa-duotone fa-spinner-third fa-spin"></i> Bạn vui lòng chờ trong giây lát!
                            </div>
                        </div>
                        <%} else {%>
                        <a href="product?command=product" class="site-btn">TIẾP TỤC MUA SẮM</a>
                        <%}%>
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
    //     xhr.open("GET", "checkout?command=total&districtID=" + districtID + "&wardID=" + wardID, true);
    //     xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //     xhr.onreadystatechange = function () {
    //         if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
    //             document.getElementById("calculate_fee").innerHTML = this.responseText;
    //         }
    //     };
    //     xhr.send();
    // }
    function getCalculateFee() {
        // Tạo yêu cầu AJAX để lấy danh sách quận/huyện tương ứng từ servlet
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "checkout?command=total", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                document.getElementById("calculate_fee").innerHTML = this.responseText;
            }
        };
        xhr.send();
    }
</script>
<script>
    paypal.Buttons({
        onClick() {
            var name = $('#name').val();
            var note = $('#note').val();
            var phone = $('#phone').val();
            var address_detail = $('#address_detail').val();
            var provinceID = $('#provinceID').val();
            var districtID = $('#districtID').val();
            var wardID = $('#wardID').val();
            if (name.trim().length == 0 || address_detail.trim().length == 0
                || phone.trim().length == 0 || provinceID.trim().length == 0
                || districtID.trim().length == 0 || wardID.trim().length == 0
                || note.trim().length == 0|| private_key.trim().length == 0) {
                showAlert("Vui lòng nhập dầy đủ thông tin thanh toán!");
                return false;
            }
        },
        createOrder: function (data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: '<%=((priceLast)/22000)%>'
                    }
                }]
            });
        },
        onApprove: function (data, actions) {

            return actions.order.capture().then(function (details) {
                document.getElementById("loading").style.display = 'block';
                // Lấy thông tin thanh toán
                var name = $('#name').val();
                var note = $('#note').val();
                var phone = $('#phone').val();
                var address_detail = $('#address_detail').val();
                var provinceID = $('#provinceID').val();
                var districtID = $('#districtID').val();
                var wardID = $('#wardID').val();
                var private_key = $('#private-key').val();

                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'checkout');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        window.location.href = "checkout?command=success"
                    }
                };
                xhr.send("name=" + encodeURIComponent(name)
                    + "&note=" + encodeURIComponent(note)
                    + "&phone=" + encodeURIComponent(phone)
                    + "&address_detail=" + encodeURIComponent(address_detail)
                    + "&provinceID=" + encodeURIComponent(provinceID)
                    + "&districtID=" + encodeURIComponent(districtID)
                    + "&wardID=" + encodeURIComponent(wardID)
                    + "&privateKey=" + encodeURIComponent(private_key)
                    + "&payment=0");
            });
        }
    }).render('#paypal-button-container');

    function getMoney() {
        var name = $('#name').val();
        var note = $('#note').val();
        var phone = $('#phone').val();
        var address_detail = $('#address_detail').val();
        var provinceID = $('#provinceID').val();
        var districtID = $('#districtID').val();
        var wardID = $('#wardID').val();
        var private_key = $('#private-key').val();
        if (name.trim().length == 0 || address_detail.trim().length == 0
            || phone.trim().length == 0 || provinceID.trim().length == 0
            || districtID.trim().length == 0 || wardID.trim().length == 0
            || note.trim().length == 0 || private_key.trim().length == 0) {
            showAlert("Vui lòng nhập dầy đủ thông tin thanh toán!")
        } else {
            document.getElementById("loading").style.display = 'block';
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "checkout", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    window.location.href = "checkout?command=success";
                }
            };
            xhr.send("name=" + encodeURIComponent(name)
                + "&note=" + encodeURIComponent(note)
                + "&phone=" + encodeURIComponent(phone)
                + "&address_detail=" + encodeURIComponent(address_detail)
                + "&provinceID=" + encodeURIComponent(provinceID)
                + "&districtID=" + encodeURIComponent(districtID)
                + "&wardID=" + encodeURIComponent(wardID)
                + "&privateKey=" + encodeURIComponent(private_key)
                + "&payment=1");
        }
    }

    function loadPdf() {
        var pdfInput = document.getElementById('pdfInput');
        var pdfText = document.getElementById('private-key');

        // Kiểm tra xem đã chọn tệp hay chưa
        if (pdfInput.files.length > 0) {
            // Lấy tệp đầu tiên từ danh sách các tệp được chọn
            var selectedFile = pdfInput.files[0];

            // Tạo đối tượng FormData để gửi dữ liệu
            var formData = new FormData();

            // Thêm tệp đã chọn vào FormData
            formData.append('pdfFile', selectedFile);

            // Tạo XMLHttpRequest
            var xhr = new XMLHttpRequest();

            // Cài đặt sự kiện khi yêu cầu hoàn thành
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Xử lý phản hồi từ máy chủ
                        pdfText.value = xhr.responseText;
                    } else {
                        // Xử lý lỗi nếu có
                        console.error('Error:', xhr.status);
                    }
                }
            };

            // Mở yêu cầu POST đến URL "setKey?command=readKey"
            xhr.open('POST', 'setKey?command=readKey', true);

            // Gửi yêu cầu với FormData chứa tệp đã chọn
            xhr.send(formData);
        } else {
            console.log('No file selected');
        }
    }

</script>
</body>

</html>