<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.FAQs" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                    <h2>Danh sách Faqs</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí chung</li>
                        <li class="breadcrumb-item active">Danh sách Faqs</li>
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
                                    <th data-breakpoints="xs">Câu hỏi</th>
                                    <th data-breakpoints="xs">Trạng thái</th>
                                    <th data-breakpoints="sm xs md">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<FAQs> faQsList = (List<FAQs>) request.getAttribute("faQsList");
                                    String status = "";
                                    for (FAQs faQs : faQsList) {
                                        if (faQs.getStatus() == 0) {
                                            status = "Đang ẩn";
                                        } else {
                                            status = "Đang hiện";
                                        }
                                %>
                                <tr>
                                    <td><h5># <%=faQs.getIdF()%>
                                    </h5>
                                    </td>
                                    <td><%=faQs.getQuestion()%>
                                    </td>
                                    <td><span class="col-green"><%=status%></span></td>
                                    <td>
                                        <button class="btn btn-default waves-effect waves-float btn-sm waves-green"
                                                onclick="show<%=faQs.getIdF()%>()"><i class="zmdi zmdi-edit"></i>
                                        </button>
                                        <div id="show<%=faQs.getIdF()%>" style="display: none" class="promotion">
                                            <div class="promotion-box">
                                                <h2 style="padding: 12px">Chỉnh sửa câu hỏi</h2>
                                                <i class="zmdi zmdi-close icon-close"
                                                   onclick="closeNew<%=faQs.getIdF()%>()"></i>
                                                <div class="promotion-content">
                                                    <label for="question<%=faQs.getIdF()%>">Câu hỏi:</label>
                                                    <textarea id="question<%=faQs.getIdF()%>" type="text"
                                                              class="form-control"
                                                    ><%=faQs.getQuestion()%></textarea>

                                                    <label for="answer<%=faQs.getIdF()%>" style="margin-top: 20px">Trả
                                                        lời: </label>
                                                    <textarea id="answer<%=faQs.getIdF()%>" type="text"
                                                              class="form-control" style="height: 100px"
                                                    ><%=faQs.getAnswer()%></textarea>
                                                    <label for="status<%=faQs.getIdF()%>"><i
                                                            class="zmdi zmdi-delicious"> Trạng thái</i></label>
                                                    <select id="status<%=faQs.getIdF()%>"
                                                            class="form-control show-tick ms select2"
                                                            data-placeholder="Select">
                                                        <% String selected = "";
                                                            if (faQs.getStatus() == 1) {
                                                                selected = "selected";
                                                            }
                                                        %>
                                                        <option value="0">Ẩn
                                                        </option>
                                                        <option value="1" <%=selected%>>Hiện
                                                        </option>
                                                    </select>
                                                </div>
                                                <button onclick="edit<%=faQs.getIdF()%>(<%=faQs.getIdF()%>)"
                                                        class="btn btn-raised btn-primary btn-round waves-effect">
                                                    Lưu
                                                </button>
                                            </div>
                                        </div>
                                        <a href="admin-general?command=deleteFQAs&idF=<%=faQs.getIdF()%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-red"><i
                                                class="zmdi zmdi-delete"></i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    <%
    for (FAQs faQs : faQsList) {
    %>

    function show<%=faQs.getIdF()%>() {
        var box = document.getElementById('show<%=faQs.getIdF()%>');
        box.style.display = 'flex';
    }

    function closeNew<%=faQs.getIdF()%>() {
        var box = document.getElementById('show<%=faQs.getIdF()%>');
        box.style.display = 'none';
    }

    function edit<%=faQs.getIdF()%>(idF) {
        var question = document.getElementById("question<%=faQs.getIdF()%>").value;
        var answer = document.getElementById("answer<%=faQs.getIdF()%>").value;
        var status = document.getElementById("status<%=faQs.getIdF()%>").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-general", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Chỉnh sửa câu hỏi thành công');
                closeNew<%=faQs.getIdF()%>();
            }
        };
        xhr.send("question=" + encodeURIComponent(question)
            + "&idF=" + encodeURIComponent(idF)
            + "&status=" + encodeURIComponent(status)
            + "&answer=" + encodeURIComponent(answer)
            + "&command=edit");
    }

    <%}%>
</script>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/js/pages/tables/footable.js"></script><!-- Custom Js -->

</body>


</html>