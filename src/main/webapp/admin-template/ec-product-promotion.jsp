<%@ page import="qht.shopmypham.com.vn.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Image" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.model.Selling" %>
<%@ page import="qht.shopmypham.com.vn.model.PromotionProduct" %>
<%@ page import="java.util.Date" %>
<%@ page import="qht.shopmypham.com.vn.tools.DateUtil" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

    <title>QST || Quản lý sản phẩm</title>
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
                    <h2>Danh sách sản phẩm ưu đãi</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item">Quản lí sản phẩm</li>
                        <li class="breadcrumb-item active">Danh sách sản phẩm ưu đãi</li>
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
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th data-breakpoints="xs">Giá</th>
                                    <th data-breakpoints="xs md">Trang thái</th>
                                    <th data-breakpoints="sm xs md">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<PromotionProduct> list = (List<PromotionProduct>) request.getAttribute("promotionProducts");
                                    String pattern = "hh:mm:ss a dd/MM/yyyy";
                                    SimpleDateFormat formatter = new SimpleDateFormat(pattern);
                                    Selling selling = ProductService.getSelling();
                                    String status = "";
                                    for (PromotionProduct p : list) {
                                        Date date1 = formatter.parse(p.getStartDay());
                                        Date date2 = formatter.parse(p.getEndDay());
                                        Date dateNow1 = formatter.parse(DateUtil.getDateNow());
                                        if (dateNow1.after(date1) && dateNow1.before(date2)) {
                                            status = "<span class=\"col-green\">Đang khuyến mãi</span>";
                                        } else {
                                            status = "<span class=\"col-red\">Hết khuyến mãi</span>";
                                        }
                                        Product product = ProductService.getProductById(p.getIdP());
                                        List<Image> imageList = ProductService.getImages(String.valueOf(product.getIdP()));
                                %>
                                <tr>
                                    <td class="cursor-pointer" onclick="show<%=p.getId()%>()"><img src="<%=imageList.get(0).getImg()%>" width="48" alt="Product img">
                                    </td>
                                    <td class="cursor-pointer" onclick="show<%=p.getId()%>()"><h5 class="nowrap_text"><%=product.getName()%>
                                    </h5>
                                    </td>
                                    <td><%=Format.formatPrice(product.getPrice())%>đ</td>
                                    <td><%=status%></td>
                                    <td>
                                        <% if (p.getIdP() != selling.getIdP()){%>
                                        <a style="margin-left: 20px"
                                           href="admin-product?command=deletePromotion&id=<%=p.getId()%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-green"><i
                                                class="zmdi zmdi-delete"></i></a><%}else {%>
                                        Sell trong tuần <%}%>
                                    </td>
                                </tr>
                                <div id="show<%=p.getId()%>" class="promotion">
                                    <div class="promotion-box">
                                        <label class="title">Chi tiết khuyến
                                            mãi</label>
                                        <i class="zmdi zmdi-close icon-close"
                                           onclick="close<%=p.getId()%>()"></i>
                                        <div class="promotion-content">
                                            <div class="label-text">
                                                <label>Ngày bắt đầu khuyến mãi</label>
                                            </div>
                                            <div class="form-group-date">
                                                <%=p.getStartDay()%>
                                            </div>
                                        </div>
                                        <div class="promotion-content">
                                            <div class="label-text">
                                                <label>Ngày kết thúc khuyến mãi</label>
                                            </div>
                                            <div class="form-group-date">
                                                <%=p.getEndDay()%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/js/notification.js"></script>
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/js/pages/tables/footable.js"></script><!-- Custom Js -->
<script>
    <%for (PromotionProduct p:list){%>


    function show<%=p.getId()%>() {
        var box = document.getElementById('show<%=p.getId()%>');
        box.style.display = 'flex';
    }

    function close<%=p.getId()%>() {
        var box = document.getElementById('show<%=p.getId()%>');
        box.style.display = 'none';
    }

    <%}%>
</script>


</body>


</html>