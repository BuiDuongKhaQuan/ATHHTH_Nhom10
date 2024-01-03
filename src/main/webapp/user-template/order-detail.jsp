<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.service.*" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>Mỹ Phẩm QST || Chi tiết đơn hàng</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="Free HTML Templates" name="keywords"/>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="user-template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/style.css" type="text/css">

    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">

</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
<%
    Account acc = (Account) request.getSession().getAttribute("a");
%>
<!-- Page Header Start -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4> Tài khoản</h4>
                    <div class="breadcrumb__links">
                        <a href="./home">Trang chủ</a>
                        <span>Tài khoản</span>
                        <span>/ Chi tiết đơn hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Page Header End -->
<div class="container" style="padding: 30px 0;">
    <div class="main-body">
        <div class="col">
            <div class="tab-content">
                <%
                    int total1 = 0;
                    CheckOut checkOut = (CheckOut) request.getAttribute("checkOut");
                    Province province = api.getProvinceById(checkOut.getIdProvince());
                    District district = api.getDistrictById(checkOut.getIdProvince(), Integer.parseInt(checkOut.getIdDistrict()));
                    Ward ward = api.getWardById(Integer.parseInt(checkOut.getIdDistrict()), checkOut.getIdWard());
                    Voucher voucher = VoucherService.getVoucherById(checkOut.getIdVoucher());
                    List<ListProductByCheckOut> productByCheckOutList = (List<ListProductByCheckOut>) request.getAttribute("listProductByCheckOuts");
                    String address = ward.getWardName() + ", " + district.getDistrictName() + ", " + province.getProvinceName();
                    String status = "";
                    if (checkOut.getIdStatus() == 0) {
                        status = "Chờ xác nhận";
                    }
                    if (checkOut.getIdStatus() == 1) {
                        status = "Đang vận chuyển";
                    }
                    if (checkOut.getIdStatus() == 2) {
                        status = "Hoàn thành";
                    }
                    if (checkOut.getIdStatus() == 3) {
                        status = "Đã hoàn thành";
                    }
                    if (checkOut.getIdStatus() == 4) {
                        status = "Chờ xác nhận hủy";
                    }
                    if (checkOut.getIdStatus() == 5) {
                        status = "Đã hủy";
                    }

                %>
                <div class="tab-pane fade show active">
                    <div class="row">
                        <div class="row-1 status-text">
                            <div class="d-flex text-muted mb-0 container-a">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="small mb-0 mb-01">
                                        <a href="#">Mã đơn :
                                            <%=checkOut.getIdCk()%>
                                        </a>
                                    </div>
                                    <div class="small mb-0 mb-02">
                                        <i class="fa-light fa-car-side"></i>
                                        <a href="#"
                                           style="color: green"><%=status%>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-1">
                            <div class="row-1-list">
                                <div class="row-1-item"></div>
                            </div>
                        </div>
                        <div class="card card-status">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
                                    <div class="d-flex flex-wrap-1">
                                        <div>
                                            ĐỊA CHỈ NHẬN HÀNG
                                            <% if (checkOut.getIdStatus()==0){%>
                                            |<a href="Address?command=change&idCk=<%=checkOut.getIdCk()%>"> Đổi địa chỉ</a>
                                        <%}%>
                                        </div>
                                        <div>
                                            THEO DÕI ĐƠN HÀNG TẠI ĐÂY
                                        </div>
                                    </div>
                                    <div class="d-flex status-container">
                                        <div class="status-list list-address">
                                            <h6><%=checkOut.getName()%>
                                            </h6>
                                            <p><%=checkOut.getPhone()%>
                                                <%=address%>
                                            </p>
                                            <h6>Địa chỉ chi tiết
                                            </h6>
                                            <p><%=checkOut.getDetailAddress()%>
                                            </p>
                                        </div>
                                        <div class="status-list list-status">
                                            <div style="display: flex;padding-bottom: 17px;flex-direction: column;">
                                                <div class="status-item">
                                                    <div class="si1">
                                                    </div>
                                                    <div class="si2">
                                                        <div>Ngày giao dự kiến</div>
                                                        <div>
                                                            <p style="margin-left: 15px"><%=checkOut.getConfirmDate()==null?"Chưa có thông tin":checkOut.getConfirmDate()%>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="status-item">
                                                    <div class="si1">
                                                    </div>
                                                    <div class="si2">
                                                        <div>Cập nhật thời gian</div>
                                                        <div>
                                                            <p  style="margin-left: 15px"><%=checkOut.getReceivedDate()==null?"Chưa có thông tin":checkOut.getReceivedDate()%>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="status-item">
                                                    <div class="si1">
                                                    </div>
                                                    <div class="si2">
                                                        <div>Ngày tạo đơn</div>
                                                        <div>
                                                            <p  style="margin-left: 15px"><%=checkOut.getOrderDate()%>
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="status-item">
                                                    <div class="si1">
                                                    </div>
                                                    <div class="si2">
                                                        <div>Mã vận đơn</div>
                                                        <div>
                                                            <p  style="margin-left: 15px"><%=checkOut.getIdTransport()%>
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-table" style="width: 100%;">
                            <div class="card-body p-4" style="width: 100%;">

                                <table style="width: 100%;">
                                    <thead>
                                    <tr>
                                        <th style="width: 85%;"></th>
                                        <th style="width: 15%;"></th>
                                    </tr>
                                    </thead>
                                    <tbody id="quantity-product">
                                    <%
                                        for (ListProductByCheckOut productByCheckOut : productByCheckOutList) {
                                            Product product = ProductService.getProductById(productByCheckOut.getIdP());
                                            total1 += product.getPrice() * productByCheckOut.getQuantity();
                                            List<Image> m = ProductService.getImages(String.valueOf(product.getIdP()));
                                    %>
                                    <tr style="border-top: 1px solid #00000017">

                                        <td class="product__cart__item"
                                            style="display: flex; align-items: center; padding: 15px 0px;">
                                            <img src="<%=m.get(0).getImg()%>" alt="" style="max-width: 12%;">
                                            <div style="display: flex; flex-direction: column; padding: 0 30px">
                                                <h6  onclick="detailProduct(<%=product.getIdP()%>)"
                                                    style="padding: 17px 0; cursor: pointer"
                                                ><%=product.getName()%>
                                                </h6>
                                                <h6>x<%=productByCheckOut.getQuantity()%>
                                                </h6>
                                            </div>
                                        </td>
                                        <td class="cart__price__total"><%=Format.formatPrice(product.getPrice() * productByCheckOut.getQuantity())%>
                                            đ
                                        </td>
                                    </tr>

                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="total">
                            <% int reduction = 0;
                                if (voucher != null) {
                                    reduction = total1 * voucher.getPrice() / 100;
                                }
                                int priceLast = total1 - reduction;
                                int fee = (priceLast>=100000)?0:25000;%>
                            <div class="inf">
                                <div class="inf-text">Tổng tiền hàng</div>
                                <div class="inf-m">
                                    <div><%=Format.formatPrice(total1)%>đ</div>
                                </div>
                            </div>
                            <div class="inf">
                                <div class="inf-text">Phí vận chuyển</div>
                                <div class="inf-m">
                                    <div><%=Format.formatPrice(fee)%>đ</div>
                                </div>
                            </div>
                            <div class="inf">
                                <div class="inf-text">Giảm giá voucher</div>
                                <div class="inf-m">
                                    <div>- <%=Format.formatPrice(reduction)%>đ</div>
                                </div>
                            </div>
                            <div class="inf">
                                <div class="inf-text">Thành tiền</div>
                                <div class="inf-m">
                                    <div><%=Format.formatPrice(priceLast + fee)%>đ
                                    </div>
                                </div>
                            </div>
                            <div class="inf">
                                <i class="fa-light fa-money-check-dollar"></i>
                                <div class="inf-text">Phương thức thanh toán</div>
                                <div class="inf-m">
                                    <% if (checkOut.getIdPm() == 1) {%>
                                    <div>Thanh toán khi nhận hàng</div>
                                    <%} else {%>
                                    <div>Paypal</div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer Start -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- JavaScript Libraries -->
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
<!-- Template Javascript -->
<script src="user-template/js/product.js"></script>
<script src="admin-template/assets/plugins/dropify/js/dropify.min.js"></script>

<script>
    $('.dropify').dropify();

    function show() {
        var box = document.getElementById('show');
        box.style.display = 'flex';
    }

    function closeNew() {

        var box = document.getElementById('show');
        box.style.display = 'none';

    }

    function editProfile(idA) {
        var email = document.getElementById("email").value;
        var fullName = document.getElementById("fullName").value;
        var address = document.getElementById("address").value;
        var phone = document.getElementById("phone").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "profile", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                alert("Cập nhật thông tin thành công.");
            }
        };
        xhr.send("idA=" + idA
            + "&email=" + encodeURIComponent(email)
            + "&fullName=" + encodeURIComponent(fullName)
            + "&address=" + encodeURIComponent(address)
            + "&command=edit"
            + "&phone=" + encodeURIComponent(phone));
    }

    function detailOrder(idCk) {
        window.location.href = "profile?command=order-detail&idCk=" + idCk;
    }
</script>

</body>

</html>