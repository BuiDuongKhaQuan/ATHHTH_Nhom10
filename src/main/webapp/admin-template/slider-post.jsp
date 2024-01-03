<%@ page import="java.util.Map" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý đơn slider</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/summernote/dist/summernote.css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap-select/css/bootstrap-select.css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
</head>

<body class="theme-blush">

<jsp:include page="header.jsp"></jsp:include>

<section class="content blog-page">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Thêm Slider </h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i>Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí slider</li>
                        <li class="breadcrumb-item active">Thêm Slider</li>
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
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="form-group">
                                <input id="slider_topic" type="text" class="form-control" placeholder="Tiêu đề Slider"/>
                            </div>
                            <div class="form-group">

                                <%
                                    Map<String, String> imgBlog = (Map<String, String>) request.getSession().getAttribute("imgSlider");
                                    String img = "";
                                    String path = "";
                                    if (imgBlog != null) {
                                        for (Map.Entry<String, String> entry : imgBlog.entrySet()) {
                                            img = entry.getKey();
                                            path = entry.getValue();
                                        }
                                %>
                                <input value="<%=img%>" required type="text" class="form-control"
                                       placeholder="Hình đại đại diện"/>
                                <input value="<%=path%>" id="slider_img" required type="hidden"/>
                                <% } else { %>
                                <input id="slider_img" type="text" class="form-control" placeholder="Hình Ảnh"/>
                                <%}%>
                                <button class="btn-primary btn" onclick="show()">Tải ảnh lên
                                </button>
                                <div id="show" class="promotion">
                                    <div class="promotion-box">
                                        <label class="title">Tải lên ảnh sản phẩm</label>
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
                            <label for="status">Trạng thái</label>
                            <div class="form-group">
                                <select id="status" class="form-control show-tick ms select2"
                                        name="status" data-placeholder="Select">
                                    <option value="0">Ẩn</option>
                                    <option value="1">Hiển thị</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="body">
                            <button onclick="addSlider()" type="button" class="btn btn-info waves-effect m-t-20">ĐĂNG
                            </button>
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
<script src="admin-template/assets/plugins/dropzone/dropzone.js"></script> <!-- Dropzone Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/plugins/summernote/dist/summernote.js"></script>
<script src="admin-template/assets/plugins/dropify/js/dropify.min.js"></script>

<script>
    $('.dropify').dropify();

    const form = document.getElementById('upload-form');
    const fileInput = document.getElementById('file-input');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const formData = new FormData();
        formData.append('file', fileInput.files[0]);
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'UploadImgSlider', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                window.location.href = "admin-slider?command=add";
            }
        };
        xhr.send(formData);
    });

    function addSlider() {
        var slider_topic = document.getElementById("slider_topic").value;
        var slider_img = document.getElementById("slider_img").value;
        var status = document.getElementById("status").value;
        if (slider_topic.trim() === '' || slider_img.trim() === '') {
            showAlert('Vui lòng nhập đầy đủ thông tin!');
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "admin-slider", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showNotification("Bài đã được đăng thành công");
                    window.location.href = "admin-slider?command=list";
                }
            };
            xhr.send("text=" + encodeURIComponent(slider_topic)
                + "&img=" + encodeURIComponent(slider_img)
                + "&status=" + encodeURIComponent(status)
                + "&command=add");
        }
    }


</script><!-- Custom Js -->
</body>


</html>