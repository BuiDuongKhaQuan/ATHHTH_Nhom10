<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Blog" %>
<%@ page import="qht.shopmypham.com.vn.service.AccountService" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý blog</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <!-- Favicon-->
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.min.css">

</head>

<body class="theme-blush">

<jsp:include page="header.jsp"></jsp:include>

<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Danh sách Blog</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i>Admin</a></li>
                        <li class="breadcrumb-item">Quản lí Blog</li>
                        <li class="breadcrumb-item active">Danh sách Blog</li>
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
        <div class="container">
            <div class="row" id="list">
                <% List<Blog> blogList = (List<Blog>) request.getAttribute("blogList");
                    for (Blog blog : blogList) {%>
                <div class="col-lg-6 col-md-12" id="item">
                    <div class="card">
                        <div class="blogitem mb-5">
                            <div class="blogitem-image">
                                <a><img src="<%=blog.getImg()%>" style="height: 450px"
                                        alt="blog image"></a>
                                <span class="blogitem-date"><%=blog.getTime()%></span>
                                <span class="blogitem-date"><%=blog.getTime()%></span>
                            </div>
                            <div class="blogitem-content">
                                <div class="blogitem-header">
                                    <div class="blogitem-meta">
                                        <span><i class="zmdi zmdi-account"></i>Từ <a href="javascript:void(0);">
                                            <%=AccountService.getAccountById(blog.getIdA()).getFullName()%>
                                        </a></span>
                                    </div>
                                    <div class="blogitem-share">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="javascript:void(0);"><i class="zmdi zmdi-facebook-box"></i></a>
                                            </li>
                                            <li><a href="javascript:void(0);"><i class="zmdi zmdi-instagram"></i></a>
                                            </li>
                                            <li><a href="javascript:void(0);"><i class="zmdi zmdi-twitter-box"></i></a>
                                            </li>
                                            <li><a href="javascript:void(0);"><i class="zmdi zmdi-linkedin-box"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <h5><a href="<%=blog.getLinkBlog()%>"><%=blog.getTopic()%>
                                </a></h5>
                                <a href="<%=blog.getLinkBlog()%>" class="btn btn-info">Xem thêm</a>
                                <a href="admin-blog?command=edit&IdBl=<%=blog.getIdBl()%>"
                                   class="btn btn-default waves-effect waves-float btn-sm waves-green"><i
                                        class="zmdi zmdi-edit" style="font-size: 20px;"></i></a>
                                <a href="admin-blog?command=delete&IdBl=<%=blog.getIdBl()%>"
                                   class="btn btn-default waves-effect waves-float btn-sm waves-red"><i
                                        class="zmdi zmdi-delete" style="font-size: 20px;"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <div id="pagination"></div>
        </div>
    </div>
</section>
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/js/pagination.js"></script><!-- Custom Js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
<script>pagination(6, '#list #item')</script>
</body>


</html>