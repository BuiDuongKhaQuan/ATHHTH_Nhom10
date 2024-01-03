<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý thương hiệu</title>
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
                    <h2>Danh sách thương hiệu</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí chung</li>
                        <li class="breadcrumb-item active">Danh sách thương hiệu</li>
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
                                    <th>Mã</th>
                                    <th>Logo</th>
                                    <th data-breakpoints="xs">Tên thương hiệu</th>
                                    <th data-breakpoints="xs">Trạng thái</th>
                                    <th data-breakpoints="sm xs md">Hành động</th>

                                </tr>
                                </thead>
                                <tbody>
                                <% List<Trademark> trademarkList = (List<Trademark>) request.getAttribute("trademarkList");
                                    String status = "";
                                    for (Trademark trademark : trademarkList) {
                                        if (trademark.getStatus() == 0) {
                                            status = "Đang ẩn";
                                        } else {
                                            status = "Đang hiện";
                                        }
                                %>
                                <tr>
                                    <td><h5># <%=trademark.getId()%>
                                    </h5>
                                    </td>
                                    <td><img src="<%=trademark.getLogo()%>" style="width: 60px;">
                                    </td>
                                    <td><%=trademark.getName()%>
                                    </td>
                                    <td><span class="col-green"><%=status%></span></td>
                                    <td>
                                        <a class="btn btn-default waves-effect waves-float btn-sm waves-green"
                                                href="admin-general?command=editTrademark&idT=<%=trademark.getId()%>"><i
                                                class="zmdi zmdi-edit"></i>
                                        </a>
                                        <a href="admin-general?command=deleteTrademark&idT=<%=trademark.getId()%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-red"><i
                                                class="zmdi zmdi-delete"></i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <a href="admin-general?command=addTrademark"
                                class="btn btn-default waves-effect waves-float btn-sm waves-red"><i class="zmdi zmdi-collection-plus" style="font-size: 20px"> Thêm thương hiệu</i></a>
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

<script src="admin-template/assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/js/pages/tables/footable.js"></script><!-- Custom Js -->

</body>


</html>