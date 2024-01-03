<%@ page import="qht.shopmypham.com.vn.model.Account" %>
<%@ page import="qht.shopmypham.com.vn.service.ShopService" %>
<%@ page import="qht.shopmypham.com.vn.model.Log" %>
<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.LogService" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Custom Js -->
<!-- Page Loader -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta3/css/all.css">

<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="admin-template/assets/images/loader.svg" width="48"
                                 height="48" alt="Aero">
        </div>
        <p>Vui lòng chờ...</p>
    </div>
</div>
<div id="notification" class="hidden-noti" style="display: none"></div>
<div id="alert" class="hidden-noti" style="display: none"></div>

<!-- Overlay For Sidebars -->
<div class="overlay"></div>

<!-- Main Search -->
<div id="search">
    <button id="close" type="button" class="close btn btn-primary btn-icon btn-icon-mini btn-round">x</button>
    <form>
        <input type="search" value="" placeholder="Search..."/>
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>
</div>

<!-- Right Icon menu Sidebar -->
<%
    Account account = (Account) request.getSession().getAttribute("a");
    Account acc = account.getAccount();
%>
<div class="navbar-right">
    <ul class="navbar-nav">
        <li><a href="#search" class="main_search" title="Search..."><i class="zmdi zmdi-search"></i></a></li>
        <li class="dropdown">
            <a href="javascript:void(0);" class="dropdown-toggle" title="App" data-toggle="dropdown"
               role="button"><i class="zmdi zmdi-apps"></i></a>
            <ul class="dropdown-menu slideUp2">
                <li class="header">Ứng dụng Sortcute</li>
                <li class="body">
                    <ul class="menu app_sortcut list-unstyled">
                        <li>
                            <a href="admin-image-gallery">
                                <div class="icon-circle mb-2 bg-blue"><i class="zmdi zmdi-camera"></i></div>
                                <p class="mb-0">Hình ảnh</p>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <div class="icon-circle mb-2 bg-amber"><i class="zmdi zmdi-translate"></i></div>
                                <p class="mb-0">Dịch</p>
                            </a>
                        </li>
                        <li>
                            <a href="events.jsp">
                                <div class="icon-circle mb-2 bg-green"><i class="zmdi zmdi-calendar"></i></div>
                                <p class="mb-0">Lịch</p>
                            </a>
                        </li>
                        <li>
                            <a href="contact.jsp">
                                <div class="icon-circle mb-2 bg-purple"><i class="zmdi zmdi-account-calendar"></i>
                                </div>
                                <p class="mb-0">Liên hệ</p>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <div class="icon-circle mb-2 bg-red"><i class="zmdi zmdi-tag"></i></div>
                                <p class="mb-0">Tin tức</p>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <div class="icon-circle mb-2 bg-grey"><i class="zmdi zmdi-map"></i></div>
                                <p class="mb-0">Bản đồ</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0);" class="dropdown-toggle" title="Notifications" data-toggle="dropdown"
               role="button"><i class="zmdi zmdi-notifications"></i>
                <div class="notify"><span class="heartbit"></span><span class="point"></span></div>
            </a>
            <ul class="dropdown-menu slideUp2">
                <li class="header">Thông báo</li>
                <li class="body">
                    <ul class="menu list-unstyled">
                        <% List<Log> logList = LogService.getAllLogAction();
                            Collections.reverse(logList);
                            for (Log log : logList) {%>
                        <li>
                            <a href="javascript:void(0);">
                                <%=log.actionIcon()%>
                                <div class="menu-info">
                                    <h4><%=log.getContent()%>
                                    </h4>
                                    <p><i class="zmdi zmdi-time"></i> <%=DateUtil.between(log.getTime())%>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </li>
                <li class="footer"><a href="javascript:void(0);">Xem tất cả thông báo</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"><i
                    class="zmdi zmdi-flag"></i>
                <div class="notify"><span class="heartbit"></span><span class="point"></span></div>
            </a>
            <ul class="dropdown-menu slideUp2">
                <li class="header">Danh sách nhiệm vụ <small class="float-right"><a href="javascript:void(0);">View
                    All</a></small></li>
                <li class="body">
                    <ul class="menu tasks list-unstyled">
                        <li>
                            <div class="progress-container progress-primary">
                                <span class="progress-badge">Quản lí sản phẩm</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar"
                                         aria-valuenow="86" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 86%;">
                                        <span class="progress-value">86%</span>
                                    </div>
                                </div>
                                <ul class="list-unstyled team-info">
                                    <li class="m-r-15"><small>Đội </small></li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar2.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar3.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar4.jpg" alt="Avatar">
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="progress-container">
                                <span class="progress-badge">Cập nhật Slider</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar"
                                         aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 45%;">
                                        <span class="progress-value">45%</span>
                                    </div>
                                </div>
                                <ul class="list-unstyled team-info">
                                    <li class="m-r-15"><small>Đội</small></li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar10.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar9.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar8.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar7.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar6.jpg" alt="Avatar">
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="progress-container progress-warning">
                                <span class="progress-badge">Cập nhật đơn hàng</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar"
                                         aria-valuenow="29" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 29%;">
                                        <span class="progress-value">29%</span>
                                    </div>
                                </div>
                                <ul class="list-unstyled team-info">
                                    <li class="m-r-15"><small>Đội</small></li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar5.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar2.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="admin-template/assets/images/xs/avatar7.jpg" alt="Avatar">
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="javascript:void(0);" class="app_calendar" title="Lịch"><i class="zmdi zmdi-calendar"></i></a>
        </li>
        <li><a href="javascript:void(0);" class="app_google_drive" title="Google Drive"><i
                class="zmdi zmdi-google-drive"></i></a></li>
        <li><a href="javascript:void(0);" class="app_group_work" title="Công việc nhóm"><i
                class="zmdi zmdi-group-work"></i></a></li>
        <li><a href="javascript:void(0);" class="js-right-sidebar" title="Cài đặt"><i
                class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
        <li><a href="home" class="" title="Tới trang khách hàng"><i
                class="zmdi zmdi-assignment-return"></i></a></li>
        <li><a href="profile?command=out" class="mega-menu" title="Đăng xuất"><i class="zmdi zmdi-power"></i></a></li>
    </ul>
</div>

<!-- Left Sidebar -->
<aside id="leftsidebar" class="sidebar">
    <div class="navbar-brand">
        <button class="btn-menu ls-toggle-btn" type="button"><i class="zmdi zmdi-menu"></i></button>
        <a href="admin-home"><img src="<%=ShopService.getShop().getLogo_header()%>" width="140" alt="Logo"></a>
    </div>
    <div class="menu">
        <ul class="list">
            <% String blog = (String) request.getAttribute("blog1");
                String slide = (String) request.getAttribute("slider1");
                String account1 = (String) request.getAttribute("account1");
                String product = (String) request.getAttribute("product1");
                String voucher = (String) request.getAttribute("voucher1");
                String oder = (String) request.getAttribute("oder1");
                String general = (String) request.getAttribute("general1");
                String home = (String) request.getAttribute("home1");
                String warehouse = (String) request.getAttribute("warehouse1");
            %>
            <li>
                <div class="user-info">
                    <a class="image" href="admin-account?command=profile"><img
                            src="<%=acc.getImg()%>" alt="User"></a>
                    <div class="detail">
                        <h4><%=acc.getFullName()%>
                        </h4>
                        <small>Quản trị viên cấp cao</small>
                    </div>
                </div>
            </li>

            <li><a href="admin-home"><i class="zmdi zmdi-home"></i><span>Tổng quan</span></a></li>

            <li><a href="javascript:void(0);" class="menu-toggle <%=blog%>"><i
                    class="zmdi zmdi-blogger"></i><span>Blog</span></a>
                <ul class="ml-menu">
                    <li><a href="admin-blog?command=list">Danh sách blog</a></li>
                    <li><a href="admin-blog?command=add">Đăng bài blog</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=slide%>"><i class="zmdi zmdi-slideshow"></i><span>Quản lí Slider</span></a>
                <ul class="ml-menu">
                    <li><a href="admin-slider?command=list">Danh sách slider</a></li>
                    <li><a href="admin-slider?command=add">Thêm slider</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=account1%>"><i
                    class="zmdi zmdi-assignment-account"></i><span>Quản
                        lí tài khoản</span></a>
                <ul class="ml-menu">
                    <li><a href="admin-account?command=dashboard">Tổng quan</a></li>
                    <li><a href="admin-account?command=list">Danh sách tài khoản</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=product%>"><i
                    class="zmdi zmdi-shopping-cart"></i><span>Quản
                        lí sản phẩm</span></a>
                <ul class="ml-menu">
                    <li><a href="admin-product?command=dashboard">Tổng quan</a></li>
                    <li><a href="admin-product?command=list">Danh sách sản phẩm</a></li>
                    <li><a href="admin-product?command=add">Thêm sản phẩm</a></li>
                    <li><a href="admin-product?command=category">Danh mục sản phẩm</a></li>
                    <li><a href="admin-product?command=addC">Thêm danh mục</a></li>
                    <li><a href="admin-product?command=listNew">Danh sách sản phẩm mới</a></li>
                    <li><a href="admin-product?command=listPromotion">Danh sách sản phẩm khuyến mãi</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=voucher%>"><i
                    class="zmdi zmdi-card-giftcard"></i><span>Quản
                        lí voucher</span></a>
                <ul class="ml-menu">
                    <li><a href="AdminVoucher?command=list">Danh sách voucher</a></li>
                    <li><a href="AdminVoucher?command=add">Thêm voucher</a>
                    </li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=oder%>"><i
                    class="zmdi zmdi-assignment"></i><span>Quản
                        lí đơn hàng</span></a>
                <ul class="ml-menu">
                    <li><a href="admin-order?command=dashboard">Tổng quan</a></li>
                    <li><a href="admin-order?command=list">Danh sách đơn hàng</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=general%>"><i
                    class="zmdi zmdi-widgets"></i><span>Quản lí chung</span></a>
                <ul class="ml-menu">
                    <li><a href="admin-general?command=trademark">Quản lí thương hiệu</a></li>
                    <li><a href="admin-general?command=list">Danh sách liên hệ</a></li>
                    <li><a href="admin-general?command=question">Danh sách câu hỏi</a></li>
                    <li><a href="admin-general?command=addQ">Thêm câu hỏi</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=home%>"><i
                    class="zmdi zmdi-assignment"></i><span>Quản
                        lí trang chủ</span></a>
                <ul class="ml-menu">
                    <li><a href="AdminHomeAll?command=cate">Quản lí danh mục</a></li>
                    <li><a href="AdminHomeAll?command=productHome">Số lượng sản phẩm,Fashion New Trends hiển thị</a>
                    </li>
                    <li><a href="AdminHomeAll?command=selling">Ưu đãi trong tuần</a></li>
                    <li><a href="AdminHomeAll?command=imageTrend">Ảnh Cosmetics Trends</a></li>
                    <li><a href="AdminHomeAll?command=information">Thông tin cửa hàng</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="menu-toggle <%=warehouse%>"><i
                    class="zmdi zmdi-assignment"></i><span>Quản
                        lí kho hàng</span></a>
                <ul class="ml-menu">
                    <li><a href="AdminWareHouse?command=list">Danh sách hàng</a></li>
                    <li><a href="AdminWareHouse?command=add_warehouse">
                        Nhập kho</a></li>
                    <li><a href="AdminWareHouse?command=add">Thêm hàng</a></li>
                </ul>
            </li>
            <li><a href="AdminLog?command=log"><i class="zmdi zmdi-home"></i><span>Quản lý log</span></a></li>
            <%--            <li>--%>
            <%--                <div class="progress-container progress-primary m-t-10">--%>
            <%--                    <span class="progress-badge">Lưu lượng truy cập tháng này</span>--%>
            <%--                    <div class="progress">--%>
            <%--                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="67"--%>
            <%--                             aria-valuemin="0" aria-valuemax="100" style="width: 67%;">--%>
            <%--                            <span class="progress-value">67%</span>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="progress-container progress-info">--%>
            <%--                    <span class="progress-badge">TẢI MÁY CHỦ</span>--%>
            <%--                    <div class="progress">--%>
            <%--                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="86"--%>
            <%--                             aria-valuemin="0" aria-valuemax="100" style="width: 86%;">--%>
            <%--                            <span class="progress-value">86%</span>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </li>--%>
        </ul>
    </div>
</aside>

<!-- Right Sidebar -->
<aside id="rightsidebar" class="right-sidebar">
    <ul class="nav nav-tabs sm">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#setting"><i
                class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#chat"><i
                class="zmdi zmdi-comments"></i></a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="setting">
            <div class="slim_scroll">
                <div class="card">
                    <h6>TÙY CHỌN CHỦ ĐỀ</h6>
                    <div class="light_dark">
                        <div class="radio">
                            <input type="radio" name="radio1" id="lighttheme" value="light" checked="">
                            <label for="lighttheme">Chế độ sáng</label>
                        </div>
                        <div class="radio mb-0">
                            <input type="radio" name="radio1" id="darktheme" value="dark">
                            <label for="darktheme">Chế độ tối</label>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <h6>Màu sắc</h6>
                    <ul class="choose-skin list-unstyled">
                        <li data-theme="purple">
                            <div class="purple"></div>
                        </li>
                        <li data-theme="blue">
                            <div class="blue"></div>
                        </li>
                        <li data-theme="cyan">
                            <div class="cyan"></div>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                        </li>
                        <li data-theme="blush" class="active">
                            <div class="blush"></div>
                        </li>
                    </ul>
                </div>
                <div class="card">
                    <h6>CÀI ĐẶT CHUNG</h6>
                    <ul class="setting-list list-unstyled">
                        <li>
                            <div class="checkbox">
                                <input id="checkbox1" type="checkbox">
                                <label for="checkbox1">Báo cáo việc sử dụng bảng điều khiển</label>
                            </div>
                        </li>
                        <li>
                            <div class="checkbox">
                                <input id="checkbox2" type="checkbox" checked="">
                                <label for="checkbox2">Chuyển hướng email</label>
                            </div>
                        </li>
                        <li>
                            <div class="checkbox">
                                <input id="checkbox3" type="checkbox" checked="">
                                <label for="checkbox3">Thông báo</label>
                            </div>
                        </li>
                        <li>
                            <div class="checkbox">
                                <input id="checkbox4" type="checkbox">
                                <label for="checkbox4">Tự động cập nhật</label>
                            </div>
                        </li>
                        <li>
                            <div class="checkbox">
                                <input id="checkbox5" type="checkbox" checked="">
                                <label for="checkbox5">Ngoại tuyến</label>
                            </div>
                        </li>
                        <li>
                            <div class="checkbox">
                                <input id="checkbox6" type="checkbox" checked="">
                                <label for="checkbox6">Quyền truy cập thông tin vị trí</label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab-pane right_chat" id="chat">
            <div class="slim_scroll">
                <div class="card">
                    <ul class="list-unstyled">
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="admin-template/assets/images/xs/avatar4.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Sophia <small class="float-right">11:00AM</small></span>
                                        <span class="message">There are many variations of passages of Lorem Ipsum
                                            available</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="admin-template/assets/images/xs/avatar5.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Grayson <small class="float-right">11:30AM</small></span>
                                        <span class="message">All the Lorem Ipsum generators on the</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="offline">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="admin-template/assets/images/xs/avatar2.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Isabella <small
                                                class="float-right">11:31AM</small></span>
                                        <span class="message">Contrary to popular belief, Lorem Ipsum</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="me">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="admin-template/assets/images/xs/avatar1.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">John <small class="float-right">05:00PM</small></span>
                                        <span class="message">It is a long established fact that a reader</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="admin-template/assets/images/xs/avatar3.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Alexander <small
                                                class="float-right">06:08PM</small></span>
                                        <span class="message">Richard McClintock, a Latin professor</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</aside>

