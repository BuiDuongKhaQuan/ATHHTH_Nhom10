<%@ page import="qht.shopmypham.com.vn.model.CheckOut" %>
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
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
</head>

<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <% CheckOut checkOut = (CheckOut) request.getAttribute("checkOut");%>
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Chỉnh sửa đơn hàng</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí đơn hàng</li>
                        <li class="breadcrumb-item"><a href="admin-order?command=list">Danh sách đơn hàng</a>
                        </li>
                        <li class="breadcrumb-item active">Chỉnh sửa đơn hàng</li>
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
            <form id="edit-product">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="body">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12">
                                        <div class="product details">
                                            <label for="name">Tên người nhận</label>
                                            <div class="form-group">
                                                <input type="text" id="name" class="form-control"
                                                       value="<%=checkOut.getName()%>">
                                            </div>

                                            <label for="address">Địa chỉ</label>
                                            <div class="form-group">
                                                <input type="text" id="address" class="form-control"
                                                       value="<%=checkOut.getAddress()%>">
                                            </div>
                                            <label for="phone">Số điện thoại</label>
                                            <div class="form-group">
                                                <input type="text" id="phone" class="form-control"
                                                       value="<%=checkOut.getPhone()%>">
                                            </div>
                                            <label for="note">Ghi chú</label>
                                            <div class="form-group">
                                                <input type="text" id="note" class="form-control"
                                                       value="<%=checkOut.getNote()%>">
                                            </div>
                                        </div>
                                        <button onclick="saveOrder(<%=checkOut.getIdCk()%>)"
                                                class="btn btn-raised btn-primary btn-round waves-effect">Lưu
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
    </div>
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->

<script>
    function saveOrder(idCk) {
        var name = document.getElementById("name").value;
        var address = document.getElementById("address").value;
        var phone = document.getElementById("phone").value;
        var note = document.getElementById("note").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-order", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Thông tin đơn hàng đã được cập nhật");
            }
        };
        xhr.send("name=" + encodeURIComponent(name)
            + "&address=" + encodeURIComponent(address)
            + "&phone=" + encodeURIComponent(phone)
            + "&note=" + encodeURIComponent(note)
            + "&idCk=" + idCk
            + "&command=edit");
    }
</script><!-- Custom Js -->

</body>

</html>