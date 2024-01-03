<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Log" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js " lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Lịch sử hoạt động máy chủ</title>
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
                    <h2>Danh sách log</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí log</li>
                        <li class="breadcrumb-item active">Danh sách log</li>
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
                                    <th>Hành động</th>
                                    <th>Src</th>
                                    <th data-breakpoints="xs">Thời gian</th>
                                    <th data-breakpoints="sm xs md">Nội dung</th>
                                    <th>Level</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<Log> logList = (List<Log>) request.getAttribute("logList");
                                    for (Log lg : logList) {
                                %>
                                <tr>
                                    <td>#<%=lg.getId()%>
                                    </td>
                                    <td><h5><%=lg.actionLog()%>
                                    </h5>
                                    <td><%=lg.getSrc()%>
                                    </td>
                                    <% String level = "";
                                        if (lg.getLevel() == 1) {
                                            level = "<h5 style=\"color: #1c9a1f\">\n" +
                                                    "Thông tin</h5>";
                                        }
                                        if (lg.getLevel() == 2) {
                                            level = "<h5 style=\"color: orange\">\n" +
                                                    "Thông báo</h5>";
                                        }
                                        if (lg.getLevel() == 3) {
                                            level = "<h5 style=\"color: #eeff00\">\n" +
                                                    "Cảnh báo</h5>";
                                        }
                                        if (lg.getLevel() == 4) {
                                            level = "<h5 style=\"color: red\">\n" +
                                                    "Nguy hiểm</h5>";
                                        }
                                    %>
                                    <td><%=lg.getTime()%>
                                    </td>
                                    <td><%=lg.getContent()%>
                                    </td>
                                    <td><%=level%>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <a class="btn btn-info" href="AdminLog?command=export">Xuất file excel</a>
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