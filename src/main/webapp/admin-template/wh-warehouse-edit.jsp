<%@ page import="qht.shopmypham.com.vn.model.*" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý kho</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.min.css">

</head>

<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <% WarehouseDetail warehouseDetail = (WarehouseDetail) request.getAttribute("warehouseDetail");
            String idL = (String) request.getAttribute("idL");%>
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Chỉnh sửa hàng nhập</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i>Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí kho</li>
                        <li class="breadcrumb-item"><a href="AdminWareHouse?command=list"> Danh sách hàng</a></li>
                        <li class="breadcrumb-item active">Chỉnh sửa hàng nhập</li>
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
                                <div class="col-xl-9 col-lg-8 col-md-12">
                                    <label for="quantityInput">Số lượng nhập</label>
                                    <div class="form-group">
                                        <input type="number" id="quantityInput" class="form-control"
                                               value="<%=warehouseDetail.getQuantityInput()%>"
                                               min="1" oninput="this.value =
 !!this.value && Math.abs(this.value) >= 1 ? Math.abs(this.value) : null">
                                    </div>
                                    <label for="date1">Ngày nhập <%=warehouseDetail.getDateInput()%>
                                    </label>
                                    <div class="form-group">
                                        <input type="datetime-local" id="date1"
                                               class="form-control">
                                    </div>
                                    <button onclick="save(<%=warehouseDetail.getId()%>)"
                                            class="btn btn-raised btn-primary btn-round waves-effect">
                                        Lưu chỉnh sửa
                                    </button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>

<%----%>
<script>

    function save(id) {
        var quantityInput = document.getElementById("quantityInput").value;
        var dateInput = document.getElementById("date1").value;
        if (quantityInput.trim() === '' || dateInput.trim() === '') {
            showAlert("Vui lòng nhập đầy đủ thông tin");
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminWareHouse", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showNotification("Thông tin đã được chỉnh sửa thành công");
                    window.location.href = "AdminWareHouse?command=detail&id=" +
                    <%=idL%>;
                }
            };
            xhr.send("quantityInput=" + encodeURIComponent(quantityInput)
                + "&id=" + id
                + "&dateInput=" + encodeURIComponent(formatDate(dateInput))
                + "&command=edit");
        }
    }

    const notification = document.getElementById("notification");
    const alert = document.getElementById("alert");

    function showNotification(txt) {
        notification.innerHTML = txt;
        notification.style.display = "block";
        setTimeout(function () {
            notification.style.display = "none";
        }, 2000);
    }

    function showAlert(txt) {
        alert.innerHTML = txt;
        alert.style.display = "block";
        setTimeout(function () {
            alert.style.display = "none";
        }, 2000);
    }


    function formatDate(date) {
        let currentDate = new Date(date);
        let hours = currentDate.getHours();
        let minutes = currentDate.getMinutes();
        let seconds = currentDate.getSeconds();
        let ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12;
        let day = currentDate.getDate();
        let month = currentDate.getMonth() + 1;
        let year = currentDate.getFullYear();

        if (hours < 10) {
            hours = "0" + hours;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (month < 10) {
            month = "0" + month;
        }
        let formattedDate = hours + ":" + minutes + ":" + seconds + " " + ampm + " " + day + "/" + month + "/" + year;
        return formattedDate;
    }


</script><!-- Custom Js -->

</body>

</html>