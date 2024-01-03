<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="qht.shopmypham.com.vn.model.Trademark" %>
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
                    <h2>Chỉnh sửa thương hiệu</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí sản phẩm</li>
                        <li class="breadcrumb-item"><a href="admin-general?command=trademark">Danh sách thương hiệu</a>
                        </li>
                        <li class="breadcrumb-item active">Chỉnh sửa thương hiệu</li>
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
                                <% Trademark trademark = (Trademark) request.getAttribute("trademark");
                                    Map<String, String> map = (Map<String, String>) request.getSession().getAttribute("imgsTrademark");
                                    String img = "";
                                    String img1 = "";
                                    if (map != null) {
                                        List<String> list = new ArrayList<>();
                                        for (Map.Entry<String, String> entry : map.entrySet()) {
                                            img = "data:image/jpeg;base64," + entry.getValue();
                                            img1 = entry.getKey();
                                            list.add(img);
                                        }
                                %>
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1"><img
                                                src="<%=list.get(0)%>" style="height: 330px"
                                                class="img-fluid" alt=""/>
                                        </div>
                                    </div>
                                    <button class="btn-primary btn" onclick="show()">Tải ảnh lên</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải logo thương hiệu</label>
                                            <img src="user-template/img/icon/close.png" width="22px"
                                                 class="zmdi zmdi-close icon-close"
                                                 onclick="closeNew()">
                                            <div class="promotion-content">
                                                <form id="upload-form" method="post"
                                                      enctype="multipart/form-data">
                                                    <input type="file" name="file-input"
                                                           class="dropify" id="file-input">
                                                    <button type="submit">Tải lên</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} else {%>

                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_a"><img
                                                src="<%=trademark.getLogo()%>" class="img-fluid"
                                                alt=""/>
                                        </div>
                                    </div>
                                    <button class="btn-primary btn" onclick="show()">Tải ảnh lên</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải logo thương hiệu</label>
                                            <img src="user-template/img/icon/close.png" width="22px"
                                                 class="zmdi zmdi-close icon-close"
                                                 onclick="closeNew()">
                                            <div class="promotion-content">
                                                <form id="upload-form" method="post"
                                                      enctype="multipart/form-data">
                                                    <input type="file" name="file-input"
                                                           class="dropify" id="file-input">
                                                    <button type="submit">Tải lên</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <div class="col-xl-9 col-lg-8 col-md-12">


                                    <label for="name">Tên Thương hiệu</label>
                                    <div class="form-group">
                                        <input type="text" id="name" class="form-control"
                                               value="<%=trademark.getName()%>" placeholder="Tên thương hiệu">
                                    </div>

                                    <div class="row clearfix">

                                        <%  if (map!=null){%>
                                        <input type="hidden" id="logo" value="<%=img1%>">
                                        <%} else {%>
                                        <input type="hidden" id="logo" value="<%=trademark.getLogo()%>">
                                        <%}%>
                                        <div class="col-sm-6">
                                            <label for="address">Địa chỉ</label>
                                            <div class="form-group">
                                                <input type="text" id="address" class="form-control"
                                                       value="<%=trademark.getAddress()%>"
                                                       placeholder="Địa chỉ ">
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label for="phone">Điện thoại</label>
                                            <div class="form-group">
                                                <input type="text" id="phone"
                                                       value="<%=trademark.getPhone()%>" class="form-control"
                                                       placeholder="Nhập số điện thoại">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="status">Trang thái</label>
                                            <div class="form-group">
                                                <select id="status"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <% String selected = "";
                                                        if (trademark.getStatus() == 1) {
                                                            selected = "selected";
                                                        }%>
                                                    <option value="0">Ẩn
                                                    </option>
                                                    <option value="1" <%=selected%>>Hiện
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" onclick="edit(<%=trademark.getId()%>)"
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
    $('.dropify').dropify();

    const form = document.getElementById('upload-form');
    const fileInput = document.getElementById('file-input');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const formData = new FormData();
        formData.append('file', fileInput.files[0]);
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'UploadLogoTrademark', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                window.location.href = "admin-general?command=editTrademark&idT=<%=trademark.getId()%>";
            }
        };
        xhr.send(formData);
    });

    function edit(idT) {
        var name = document.getElementById("name").value;
        var address = document.getElementById("address").value;
        var logo = document.getElementById("logo").value;
        var phone = document.getElementById("phone").value;
        var status = document.getElementById("status").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-general", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Chỉnh sửa thương hiệu thành công');
            }
        };
        xhr.send("name=" + encodeURIComponent(name)
            + "&idT=" + idT
            + "&address=" + encodeURIComponent(address)
            + "&logo=" + encodeURIComponent(logo)
            + "&phone=" + encodeURIComponent(phone)
            + "&status=" + encodeURIComponent(status)
            + "&command=editTrademark");
    }

</script><!-- Custom Js -->
</body>

</html>