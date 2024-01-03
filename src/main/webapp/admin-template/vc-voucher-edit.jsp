<%@ page import="qht.shopmypham.com.vn.model.Voucher" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý voucher</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">

</head>


<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Chỉnh sửa voucher</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí voucher</li>
                        <li class="breadcrumb-item"><a href="admin-general?command=trademark">Danh sách voucher</a>
                        </li>
                        <li class="breadcrumb-item active">Chỉnh sửa voucher</li>
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
                        <div class="body">
                            <div class="row">
                                <% Voucher voucher = (Voucher) request.getAttribute("voucher");
                                %>
                                <div class="col-xl-9 col-lg-8 col-md-12">
                                    <label for="name">Tên voucher</label>
                                    <div class="form-group">
                                        <input type="text" id="name" class="form-control"
                                               value="<%=voucher.getName()%>" placeholder="Tên thương hiệu">
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="price">Giá giảm (Theo %)</label>
                                            <div class="form-group">
                                                <input type="text" id="price" class="form-control"
                                                       value="<%=voucher.getPrice()%>"
                                                       placeholder="Nhập giá giảm">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="quantity">Số lượng</label>
                                            <div class="form-group">
                                                <input type="text" id="quantity"
                                                       value="<%=voucher.getQuantity()%>" class="form-control"
                                                       placeholder="Nhập số số lượng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="code">Mã</label>
                                            <div class="form-group">
                                                <input type="text" id="code"
                                                       value="<%=voucher.getCode()%>" class="form-control"
                                                       placeholder="Nhập mã">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="status">Trang thái</label>
                                            <div class="form-group">
                                                <select id="status"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <% String selected = "";
                                                        if (voucher.getStatus() == 1) {
                                                            selected = "selected";
                                                        }%>
                                                    <option value="0">Ẩn
                                                    </option>
                                                    <option value="1" <%=selected%>>Hiển thị
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" onclick="edit(<%=voucher.getId()%>)"
                                            class="btn btn-raised btn-primary btn-round waves-effect">Lưu
                                    </button>
                                </div>
                            </div>
                        </div>
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
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/plugins/dropify/js/dropify.min.js"></script>
<script src="admin-template/assets/js/notification.js"></script>

<script>

    function edit(id) {
        var name = document.getElementById("name").value;
        var price = document.getElementById("price").value;
        var quantity = document.getElementById("quantity").value;
        var code = document.getElementById("code").value;
        var status = document.getElementById("status").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AdminVoucher", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Chỉnh sửa voucher thành công");
            }
        };
        xhr.send("name=" + encodeURIComponent(name)
            + "&id=" + id
            + "&price=" + encodeURIComponent(price)
            + "&quantity=" + encodeURIComponent(quantity)
            + "&code=" + encodeURIComponent(code)
            + "&status=" + encodeURIComponent(status)
            + "&command=edit");
    }

</script><!-- Custom Js -->
</body>

</html>