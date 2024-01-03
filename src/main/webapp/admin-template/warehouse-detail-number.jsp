<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.service.VoucherService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<%@ page import="qht.shopmypham.com.vn.service.WareHouseService" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">
    <title>QST || Quản lý nhập hàng sản phẩm</title>
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
    List<WarehouseDetail> warehouseDetailList = (List<WarehouseDetail>) request.getAttribute("warehouseDetailList");
    String idL = (String) request.getAttribute("idL");
%>

<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">

                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Danh sách nhập hàng sản phẩm</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí kho</li>
                        <li class="breadcrumb-item active">Danh sách nhập hàng sản phẩm</li>
                    </ul>
                    <button class="btn btn-primary btn-icon mobile_menu" type="button"><i
                            class="zmdi zmdi-sort-amount-desc"></i></button>
                </div>
                <div class="row-1 status-text">
                    <div class="d-flex text-muted mb-0 container-a">
                        <div class="justify-content-between align-items-center">
                            <div class="small mb-0 mb-01">
                                <h6>Mã sản phẩm :
                                    #<%=warehouseDetailList.get(0).getIdP()%>
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-1">
                    <div class="row-1-list">
                        <div class="row-1-item"></div>
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
                                                <th style="width: 10%;">Lần</th>
                                                <th data-breakpoints="xs">Số lượng nhập kho</th>
                                                <th data-breakpoints="xs md">Ngày nhập kho</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                int a = 1;
                                                for (int i = 0; i < warehouseDetailList.size(); i++) {

                                            %>

                                            <tr>

                                                <td><%=a++%>
                                                </td>

                                                <td><%=warehouseDetailList.get(i).getQuantityInput()%>
                                                </td>
                                                <td><span
                                                        class="col-green"><%=warehouseDetailList.get(i).getDateInput()%></span>
                                                </td>
                                                <td>
                                                    <a href="AdminWareHouse?command=edit&idL=<%=idL%>&id=<%=warehouseDetailList.get(i).getId()%>"
                                                       class="btn btn-default waves-effect waves-float btn-sm waves-green"><i
                                                            class="zmdi zmdi-edit"></i></a>
                                                    <a href="AdminWareHouse?command=delete&idL=<%=idL%>&id=<%=warehouseDetailList.get(i).getId()%>"
                                                       class="btn btn-default waves-effect waves-float btn-sm waves-red"><i
                                                            class="zmdi zmdi-delete"></i></a>
                                                </td>
                                            </tr>
                                            <%}%>

                                            </tbody>
                                        </table>
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