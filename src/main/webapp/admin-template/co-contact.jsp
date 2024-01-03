<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Contact" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý liên hệ</title>
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
                    <h2>Danh sách liện hệ</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí chung</li>
                        <li class="breadcrumb-item active">Danh sách liên hệ</li>
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
                                    <th>Tên tài khoản</th>
                                    <th data-breakpoints="xs">Email</th>
                                    <th data-breakpoints="xs">Trạng thái</th>
                                    <th data-breakpoints="sm xs md">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<Contact> contactList = (List<Contact>) request.getAttribute("contact");
                                    int a = 0;
                                    String status = "";
                                    for (Contact contact : contactList) {
                                        a++;
                                        if (contact.getStatus() == 0) {
                                            status = "Chưa trả lời";
                                        } else {
                                            status = "Đã trả lời";
                                        }
                                %>
                                <tr>
                                    <td><h5><%=contact.getFullName()%>
                                    </h5>
                                    </td>
                                    <td><%=contact.getEmail()%>
                                    </td>
                                    <td><span class="col-green"><%=status%></span></td>
                                    <td>
                                        <button class="btn btn-default waves-effect waves-float btn-sm waves-green"
                                                onclick="show<%=contact.getIdCt()%>()"><i
                                                class="zmdi zmdi-account-box-phone"></i></button>
                                        <div id="show<%=contact.getIdCt()%>" style="display: none" class="promotion">
                                            <div class="promotion-box">
                                                <label class="title">Phản hồi</label>
                                                <i class="zmdi zmdi-close icon-close"
                                                   onclick="closeNew<%=contact.getIdCt()%>()"></i>
                                                <div class="promotion-content">
                                                    <h6><i class="zmdi zmdi-account-circle"><%= contact.getFullName()%></i></h6>
                                                    <p><%=contact.getContent()%>?</p>

                                                    <label for="reply<%=contact.getIdCt()%>">Trả lời:</label>
                                                    <textarea id="reply<%=contact.getIdCt()%>"></textarea>

                                                </div>
                                                <button onclick="edit<%=a%>(<%=contact.getIdCt()%>)"
                                                        class="btn btn-raised btn-primary btn-round waves-effect">
                                                    Trả lời
                                                </button>
                                            </div>
                                        </div>
                                        <a href="admin-general?command=deleteContact&idCt=<%=contact.getIdCt()%>"
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
     int b=0;
     for (Contact contact : contactList) {
         b++;
    %>

    function show<%=contact.getIdCt()%>() {
        var box = document.getElementById('show<%=contact.getIdCt()%>');
        box.style.display = 'flex';
    }

    function closeNew<%=contact.getIdCt()%>() {
        var box = document.getElementById('show<%=contact.getIdCt()%>');
        box.style.display = 'none';
    }

    function edit<%=b%>(idCt) {
        var reply = document.getElementById("reply<%=contact.getIdCt()%>").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-general?command=answer", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotification('Đã gửi câu trả lời');
                closeNew<%=contact.getIdCt()%>();
            }
        };
        xhr.send("reply=" + encodeURIComponent(reply)
            + "&idCt=" + idCt
            + "&command=answer");
    }

    <%}%>
    const notification = document.getElementById("notification");
    function showNotification(txt) {
        notification.innerHTML = txt;
        notification.style.display = "block";
        setTimeout(function () {
            notification.style.display = "none";
        }, 2000);
    }
</script>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/js/pages/tables/footable.js"></script><!-- Custom Js -->

</body>


</html>