<%@ page import="qht.shopmypham.com.vn.model.CheckOut" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>


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
    <link rel="stylesheet" href="admin-template/assets/plugins/footable-bootstrap/css/footable.bootstrap.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/footable-bootstrap/css/footable.standalone.min.css">

    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
</head>

<body class="theme-blush">

<jsp:include page="header.jsp"></jsp:include>

<% List<CheckOut> checkOutList = (List<CheckOut>) request.getAttribute("checkOuts");

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
                                    <th>Mã đơn hàng</th>
                                    <th>Trạng thái</th>
                                    <th data-breakpoints="xs">Người đặt</th>
                                    <th data-breakpoints="xs md">Ngày đặt</th>
                                    <th data-breakpoints="xs md"></th>
                                    <th data-breakpoints="xs md">Xác nhận</th>
                                    <th data-breakpoints="xs md">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (CheckOut co : checkOutList) {
                                        String status = "";
                                        if (co.getIdStatus() == 0) {
                                            status = "Chờ xác nhận";
                                        }
                                        if (co.getIdStatus() == 1) {
                                            status = "Đang vận chuyển";
                                        }
                                        if (co.getIdStatus() == 2) {
                                            status = "Hoàn thành";
                                        }
                                        if (co.getIdStatus() == 3) {
                                            status = "Đã hoàn thành";
                                        }
                                        if (co.getIdStatus() == 4) {
                                            status = "Chờ xác nhận hủy";
                                        }
                                        if (co.getIdStatus() == 5) {
                                            status = "Đã hủy";
                                        }
                                        int idCk = co.getIdCk();
                                %>
                                <tr>
                                    <td><a href="admin-order?command=detail&IdCk=<%=idCk%>" width="48"
                                           alt=" img">#<%=idCk%>
                                    </a>
                                    </td>
                                    <td><h5 id="status<%=idCk%>">
                                        <%=status%>
                                    </h5></td>
                                    <td><%=co.getName()%>
                                    </td>
                                    <td><span class="col-green"><%=co.getOrderDate()%></span></td>

                                    <% if (co.getIdStatus() == 0) {%>
                                    <td><a href="admin-order?command=ok&idCk=<%=idCk%>"
                                           class="btn btn-primary"
                                           style="padding: 10px;">Xác nhận</a>
                                    </td>
                                    <%}%>
                                    <% if (co.getIdStatus() == 1) {%>
                                    <td><a href="admin-order?command=confirm&idCk=<%=idCk%>"
                                           class="btn btn-primary"
                                           style="padding: 10px;">Hoàn thành</a>
                                    </td>
                                    <%}%>
                                    <% if (co.getIdStatus() == 3) {%>
                                    <td>
                                    </td>
                                    <%}%>
                                    <% if (co.getIdStatus() == 4) {%>
                                    <td><a href="admin-order?command=cance&idCk=<%=idCk%>"
                                           class="btn btn-primary"
                                           style="padding: 10px;">Xác nhận hủy</a>
                                    </td>
                                    <%}%>
                                    <% if (co.getIdStatus() == 5) {%>
                                    <td>
                                    </td>
                                    <%}%>
                                    <%--                                    Xac nhận đơn hàng--%>
                                    <td>
                                        <div id="checkBillBtn<%=idCk%>">
                                            <button
                                                    class="btn btn-primary"
                                                    type="button"
                                                    onclick="checkBill<%=idCk%>(<%=idCk%>)"
                                                    style="padding: 10px;">Xác thực ĐH
                                            </button>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="admin-order?command=edit&IdCk=<%=idCk%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-green"><i
                                                class="zmdi zmdi-edit"></i></a>
                                        <a href="admin-order?command=delete&IdCk=<%=idCk%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-red"><i
                                                class="zmdi zmdi-delete"></i></a>
                                        <a href="admin-order?command=bill&IdCk=<%=idCk%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-red">Xuất hóa
                                            đơn</a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--                    <div class="card">--%>
                    <%--                        <div class="body">--%>
                    <%--                            <ul class="pagination pagination-primary m-b-0">--%>
                    <%--                                <li class="page-item"><a class="page-link" href="javascript:void(0);"><i--%>
                    <%--                                        class="zmdi zmdi-arrow-left"></i></a></li>--%>
                    <%--                                <li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="javascript:void(0);"><i--%>
                    <%--                                        class="zmdi zmdi-arrow-right"></i></a></li>--%>
                    <%--                            </ul>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
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
<script>
    <%  for (CheckOut co : checkOutList) { %>

    function checkBill<%=co.getIdCk()%>(idCk) {
        var status = document.getElementById("status" + idCk);
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("checkBillBtn<%=co.getIdCk()%>").innerHTML = this.responseText;
                if (this.responseText.includes("Đơn không hợp lệ")) {
                    status.innerHTML = "Đã hủy";
                }
            }
        };
        xhr.open('GET', 'admin-order?command=authenticate&idCk=' + idCk, true);
        xhr.send();
    }

    <%}%>
</script>
</body>


</html>