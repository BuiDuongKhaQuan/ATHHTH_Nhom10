<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Account" %>
<%@ page import="qht.shopmypham.com.vn.model.Log" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<!doctype html><%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý tài khoản</title>
    <!-- Favicon-->
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/morrisjs/morris.css" />

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
                    <h2>Quản lí tài khoản</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí tài khoản</li>
                        <li class="breadcrumb-item active">Tổng quan</li>
                    </ul>
                    <button class="btn btn-primary btn-icon mobile_menu" type="button"><i class="zmdi zmdi-sort-amount-desc"></i></button>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12">
                    <button class="btn btn-primary btn-icon float-right right_icon_toggle_btn" type="button"><i class="zmdi zmdi-arrow-right"></i></button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <%
                                // khách hàng đã mua
                                List<Account>listA = (List<Account>) request.getAttribute("accountList1");
                                List<Account>allAccount = (List<Account>) request.getAttribute("accountList");
                                // khách hàng ch mua
                                List<Account>noChecout = (List<Account>) request.getAttribute("accountsNocheckout");
                                List<Account>accessList = (List<Account>) request.getAttribute("accesMonth");
                                List<Account>listLoyer = (List<Account>) request.getAttribute("listAccoutLoyal");
                                List<Log>signMonth = (List<Log>) request.getAttribute("signbyMonth");
                            %>
                            <input type="text" class="knob" value="<%=allAccount.size()%>" data-linecap="round" data-width="100" data-height="100" data-thickness="0.08" data-fgColor="#00adef" readonly>
                            <p>Tổng số khách hàng </p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Đã mua hàng </small>
                                    <h5 class="mb-0"><%=listA.size()%></h5>
                                </div>
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Chưa mua</small>
                                    <h5 class="mb-0"><%=noChecout.size()%></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <input type="text" class="knob" value="<%=accessList.size()%>" data-linecap="round" data-width="100" data-height="100" data-thickness="0.08" data-fgColor="#ee2558" readonly>
                            <p>Số tài khoản truy cập web </p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Trong </small>
                                    <h5 class="mb-0"><%=DateUtil.monthNow()%></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">



                            <input type="text" class="knob" value="<%=listLoyer.size()%>>" data-linecap="round" data-width="100" data-height="100" data-thickness="0.08" data-fgColor="#8f78db" readonly>
                            <p>Khách hàng thân thiết</p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Trong </small>
                                    <h5 class="mb-0"><%=DateUtil.monthNow()%></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-6 text-center">
                    <div class="card">
                        <div class="body">
                            <input type="text" class="knob" value="<%=signMonth.size()%>" data-linecap="round" data-width="100" data-height="100" data-thickness="0.08" data-fgColor="#f67a82" readonly>
                            <p>Khách hàng mới</p>
                            <div class="d-flex bd-highlight text-center mt-4">
                                <div class="flex-fill bd-highlight">
                                    <small class="text-muted">Khách mới</small>
                                    <h5 class="mb-0"><%=DateUtil.monthNow()%></h5>
                                </div>
                                <%--                                <div class="flex-fill bd-highlight">--%>
                                <%--                                    <small class="text-muted">Khách nước ngoài</small>--%>
                                <%--                                    <h5 class="mb-0">2K</h5>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-8 col-md-12">
                    <div class="card product-report">
                        <div class="header">
                            <h2><strong>BÁO CÁO</strong> THƯỜNG NIÊN</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
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
                                    <div class="icon xl-amber m-b-15"><i class="zmdi zmdi-chart-donut"></i></div>
                                    <div class="col-in">
                                        <small class="text-muted mt-0">Báo cáo bán hàng</small>
                                        <h4 class="mt-0">$4,516</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4">
                                    <div class="icon xl-blue m-b-15"><i class="zmdi zmdi-chart"></i></div>
                                    <div class="col-in">
                                        <small class="text-muted mt-0">Doanh thu hằng năm</small>
                                        <h4 class="mt-0">$6,481</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4">
                                    <div class="icon xl-purple m-b-15"><i class="zmdi zmdi-card"></i></div>
                                    <div class="col-in">
                                        <small class="text-muted mt-0">Tổng lợi nhuận</small>
                                        <h4 class="mt-0">$3,915</h4>
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
                            <h2><strong>Tài khoản </strong> thường truy cập</h2>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover theme-color c_table">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Phone</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for(Account account:accessList){
                                %>
                                <tr>
                                    <td><%=account.getFullName()%></td>
                                    <td><%=account.getPhone()%></td>
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
                            <h2><strong>Khách hàng </strong> thân thiết</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
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
                                <thead>
                                <tr>

                                    <th>Tên </th>
                                    <th>Phone</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for(Account a:listLoyer){
                                %>
                                <tr>
                                    <td><%=a.getFullName()%></td>
                                    <td><%=a.getPhone()%></td>
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