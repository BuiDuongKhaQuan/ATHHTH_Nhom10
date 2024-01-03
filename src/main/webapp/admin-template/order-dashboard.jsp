<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.CheckOut" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="qht.shopmypham.com.vn.model.Product" %>
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
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/morrisjs/morris.css"/>

    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
</head>

<body class="theme-blush">

<jsp:include page="header.jsp"></jsp:include>

<!-- Main Content -->
<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Quản lí đơn hàng</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí đơn hàng</li>
                        <li class="breadcrumb-item active">Tổng quan</li>
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
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <%
                                List<CheckOut> checkOutList = (List<CheckOut>) request.getAttribute("checkOuts");
                                List<CheckOut> listOrderMonth = (List<CheckOut>) request.getAttribute("listOrderMonth");
                                List<CheckOut> listOrderYear = (List<CheckOut>) request.getAttribute("listOrderYear");
                                List<CheckOut> listCancel = (List<CheckOut>) request.getAttribute("listCancel");
                            %>
                            <input type="text" class="knob" value="<%=checkOutList.size()%>>" data-linecap="round"
                                   data-width="100"
                                   data-height="100" data-thickness="0.08" data-fgColor="#00adef" readonly>
                            <p> Đơn hàng</p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Trong</small>
                                    <h5 class="mb-0">Cửa hàng
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <input type="text" class="knob" value="<%=listOrderYear.size()%>" data-linecap="round"
                                   data-width="100"
                                   data-height="100" data-thickness="0.08" data-fgColor="#8f78db" readonly>
                            <p> Đơn hàng</p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Trong năm</small>
                                    <h5 class="mb-0"><%=DateUtil.yearNow()%>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <input type="text" class="knob" value="<%=listOrderMonth.size()%>"
                                   data-linecap="round"
                                   data-width="100"
                                   data-height="100" data-thickness="0.08" data-fgColor="#ee2558" readonly>
                            <p>Tổng đơn hàng </p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Trong</small>
                                    <h5 class="mb-0"><%=DateUtil.monthNow()%>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <input type="text" class="knob" value="<%=listCancel.size()%>>"
                                   data-linecap="round"
                                   data-width="100"
                                   data-height="100" data-thickness="0.08" data-fgColor="#f67a82" readonly>
                            <p>Đơn hàng bị hủy</p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Trong</small>
                                    <h5 class="mb-0"><%=DateUtil.monthNow()%>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                NumberFormat nf = NumberFormat.getInstance();
                nf.setMinimumFractionDigits(0);
            %>
            <div class="row clearfix">
                <div class="col-lg-8 col-md-12">
                    <div class="card product-report">
                        <div class="header">
                            <h2><strong>BÁO CÁO</strong> THƯỜNG NIÊN</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="javascript:void(0);">Hành động</a></li>
                                        <li><a href="javascript:void(0);">Hành động khác</a></li>
                                        <li><a href="javascript:void(0);">Khác</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-lg-4 col-md-4 col-sm-4">
                                    <div class="icon xl-amber m-b-15"><i
                                            class="zmdi zmdi-chart-donut"></i></div>
                                    <div class="col-in">
                                        <small class="text-muted mt-0">Doanh thu hằng năm</small>
                                        <h6 class="mt-0"><%=nf.format(Product.revenue())%>vnd</h6>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4">
                                    <div class="icon xl-blue m-b-15"><i class="zmdi zmdi-chart"></i>
                                    </div>
                                    <div class="col-in">
                                        <small class="text-muted mt-0">Doanh thu hằng tháng </small>
                                        <h6 class="mt-0"><%=nf.format(Product.revenue() / 12)%>vnd</h6>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4">
                                    <div class="icon xl-purple m-b-15"><i class="zmdi zmdi-card"></i>
                                    </div>
                                    <div class="col-in">
                                        <small class="text-muted mt-0">Tổng lợi nhuận</small>
                                        <h6 class="mt-0"><%=nf.format(Product.revenue())%>vnd</h6>
                                    </div>
                                </div>
                            </div>
                            <div id="area_chart"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2><strong>Đơn hàng</strong> đã hủy</h2>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover theme-color c_table">
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên</th>
                                    <th>Số điện thoại</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (CheckOut c : listCancel) {
                                %>
                                <tr>
                                    <td>#<%=c.getIdCk()%>></td>
                                    <td><%=c.getName()%>
                                    </td>
                                    <td><%=c.getPhone()%>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row clearfix">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="header">
                            <h2><strong>Đơn hàng</strong> gần đây</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"><a href="javascript:void(0);"
                                                        class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"> <i
                                        class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right slideUp">
                                        <li><a href="javascript:void(0);">Hành động</a></li>
                                        <li><a href="javascript:void(0);">Hành động khác</a></li>
                                        <li><a href="javascript:void(0);">Khác</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover c_table">
                                <%--                                <table class="table table-hover theme-color c_table">--%>
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên</th>
                                    <th>Số điện thoại</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<CheckOut> checkOutListNew = (List<CheckOut>) request.getAttribute("checkOutListNew");
                                    for (CheckOut c : checkOutListNew) {
                                %>
                                <tr>
                                    <td>#<%=c.getIdCk()%>
                                    </td>
                                    <td><%=c.getName()%>
                                    </td>
                                    <td><%=c.getOrderDate()%>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
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

<script src="admin-template/assets/bundles/morrisscripts.bundle.js"></script> <!-- Morris Plugin Js -->
<script src="admin-template/assets/bundles/jvectormap.bundle.js"></script> <!-- JVectorMap Plugin Js -->
<script src="admin-template/assets/bundles/sparkline.bundle.js"></script> <!-- Sparkline Plugin Js -->
<script src="admin-template/assets/bundles/knob.bundle.js"></script> <!-- Jquery Knob Plugin Js -->

<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script>
<script src="admin-template/assets/js/pages/ecommerce.js"></script>
<script src="admin-template/assets/js/pages/charts/jquery-knob.min.js"></script>
</body>


</html>