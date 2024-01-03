<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

<html class="no-js " lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý FAQs</title>
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
                    <h2>Thêm Faqs</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí chung</li>
                        <li class="breadcrumb-item active">Thêm Faqs</li>
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
                                        <label for="question"><i class="zmdi zmdi-help-outline"> Câu hỏi</i></label>
                                        <div class="form-group">
                                            <textarea type="text" id="question" class="form-control"
                                            ></textarea>
                                        </div>
                                        <label for="answer"><i class="zmdi zmdi-comment-alt-text"> Câu trả
                                            lời</i></label>
                                        <div class="form-group">
                                            <textarea type="text" id="answer" class="form-control"></textarea>
                                        </div>

                                        <div class="row clearfix">
                                            <div class="col-sm-6">
                                                <label for="status"><i class="zmdi zmdi-delicious"> Trạng
                                                    thái</i></label>
                                                <select id="status"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <option value="0">Ẩn
                                                    </option>
                                                    <option value="1">Hiện
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <button type="button" onclick="saveFAQs()"
                                                class="btn btn-raised btn-primary btn-round waves-effect">
                                            Thêm
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
    function saveFAQs() {
        var question = document.getElementById("question").value;
        var answer = document.getElementById("answer").value;
        var status = document.getElementById("status").value;
        var xhr = new XMLHttpRequest();
        if (question.trim() === '' || answer.trim() === '' || status.trim() === '') {
            showAlert('Vui lòng nhập đầy đủ thông tin!');
        } else {
        xhr.open("POST", "admin-general", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Thêm câu hỏi thành công');
                window.location.href = "admin-general?command=question";
            }
        };
        xhr.send("question=" + encodeURIComponent(question)
            + "&answer=" + encodeURIComponent(answer)
            + "&status=" + encodeURIComponent(status)
            + "&command=add");
    }}
</script><!-- Custom Js -->
</body>

</html>