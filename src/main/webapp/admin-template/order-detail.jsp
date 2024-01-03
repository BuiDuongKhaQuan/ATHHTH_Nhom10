<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.service.VoucherService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">
    <title>QST || Quản lý đơn hàng</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="user-template/css/detail-order.css" type="text/css">
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
</head>

<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>
<%
    int total1 = 0;
    CheckOut checkOut = (CheckOut) request.getAttribute("checkOut");
    Voucher voucher = VoucherService.getVoucherById(checkOut.getIdVoucher());
    Province province = api.getProvinceById(checkOut.getIdProvince());
    District district = api.getDistrictById(checkOut.getIdProvince(), Integer.parseInt(checkOut.getIdDistrict()));
    Ward ward = api.getWardById(Integer.parseInt(checkOut.getIdDistrict()), checkOut.getIdWard());
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

<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">

                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Danh sách đơn hàng</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí đơn hàng</li>
                        <li class="breadcrumb-item active">Danh sách đơn hàng</li>
                    </ul>
                    <button class="btn btn-primary btn-icon mobile_menu" type="button"><i
                            class="zmdi zmdi-sort-amount-desc"></i></button>
                </div>
                <div class="row-1 status-text">
                    <div class="d-flex text-muted mb-0 container-a">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="small mb-0 mb-01">
                                <a href="#">Mã đơn :
                                    #<%=checkOut.getIdCk()%>
                                </a>
                            </div>
                            <div class="small mb-0 mb-02">
                                <i class="fa-light fa-car-side"></i>
                                <a href="#"><%=status%>
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
                                                    <p style="margin-left: 15px"><%=checkOut.getReceivedDate()==null?"Chưa có thông tin":checkOut.getReceivedDate()%>
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
                                                    <p style="margin-left: 15px"><%=checkOut.getOrderDate()%>
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
                                                    <p style="margin-left: 15px"><%=checkOut.getIdTransport()%>
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
                <div class="container-fluid">
                    <form>
                        <div class="row clearfix">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="table-responsive">
                                        <table id="table_id"
                                               class="table table-hover product_item_list c_table theme-color mb-0">
                                            <thead>
                                            <tr>
                                                <th style="width: 10%;">Hình ảnh</th>
                                                <th data-breakpoints="xs">Tên sản phẩm</th>
                                                <th data-breakpoints="xs md">Số lượng</th>
                                                <th data-breakpoints="xs md">Đơn giá</th>
                                                <th data-breakpoints="xs md">Tổng đơn giá</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                for (ListProductByCheckOut productByCheckOut : productByCheckOutList) {
                                                    Product product = ProductService.getProductById(productByCheckOut.getIdP());
                                                    total1 += product.getPrice() * productByCheckOut.getQuantity();
                                                    List<Image> m = ProductService.getImages(String.valueOf(product.getIdP()));
                                            %>
                                            <tr>
                                                <td><img src="<%=m.get(0).getImg()%>">
                                                </td>
                                                <td><%=product.getName()%>
                                                </td>
                                                <td><span class="col-green"><%=productByCheckOut.getQuantity()%></span>
                                                </td>
                                                <td><span class="col-green"><%= Format.formatPrice(product.getPrice())%>đ </span>
                                                </td>
                                                <td><span
                                                        class="col-green"><%= Format.formatPrice(product.getPrice() * productByCheckOut.getQuantity())%>đ </span>
                                                </td>
                                            </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
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
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->


</body>

</html>