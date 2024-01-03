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

    <title>QST || Quản lý trang chủ</title>
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
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Danh mục sản phẩm ở trang chủ</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí trang chủ</li>
                        <li class="breadcrumb-item active">Danh mục sản phẩm</li>
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
                <% int b = 0;
                    List<Categories> listCa = (List<Categories>) request.getAttribute("categoriesHome");
                    for (Categories ca : listCa) {
                        b++;
                %>
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="blogitem mb-5">
                            <div class="blogitem-image">
                                <a href="#"><img src="<%=ca.getImgC()%>" onclick="show<%=ca.getIdC()%>()"
                                                 style="height: 450px"
                                                 alt="blog image"></a>
                            </div>
                            <div class="blogitem-content">

                                <p><%=ca.getNameC()%>
                                </p>

                                <button class="btn-primary btn"
                                        onclick="show<%=ca.getIdC()%>()"><i
                                        class="zmdi zmdi-edit" style="font-size: 20px;"></i></button>
                                <div id="show<%=ca.getIdC()%>" style="display: none" class="promotion">
                                    <div class="promotion-box">
                                        <label class="title">Tùy chỉnh danh mục</label>
                                        <i class="zmdi zmdi-close icon-close"
                                           onclick="closeNew<%=ca.getIdC()%>()"></i>
                                        <div class="promotion-content">
                                            <select id="product_category<%=ca.getIdC()%>"
                                                    class="form-control show-tick ms select2"
                                                    data-placeholder="Select">
                                                <%
                                                    List<Categories> categoriesList = (List<Categories>) request.getAttribute("categoriesList");
                                                    for (Categories category : categoriesList) {
                                                        String selected = "";
                                                        if (ca.getIdC() == category.getIdC()) {
                                                            selected = "selected";
                                                        }
                                                %>
                                                <option value="<%=category.getIdC()%>" <%=selected%>><%=category.getNameC()%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <button onclick="edit<%=b%>()"
                                                class="btn btn-raised btn-primary btn-round waves-effect">
                                            Lưu
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
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
    <% int a = 0;
    for (Categories c:listCa){
           a++ ; %>

    function show<%=c.getIdC()%>() {
        var box = document.getElementById('show<%=c.getIdC()%>');
        box.style.display = 'flex';
    }

    function closeNew<%=c.getIdC()%>() {
        var box = document.getElementById('show<%=c.getIdC()%>');
        box.style.display = 'none';
    }

    function edit<%=a%>() {
        var idC<%=c.getIdC()%> = document.getElementById("product_category<%=c.getIdC()%>").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AdminHomeAll", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification("Cập nhật thông tin danh mục thành công");
                closeNew<%=c.getIdC()%>();

            }
        };
        xhr.send("idC<%=a%>=" + idC<%=c.getIdC()%>
            + "&command=category");
    }

    <%}%>
</script>
</body>


</html>

