<%@ page import="qht.shopmypham.com.vn.model.Blog" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || Blog</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="user-template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user-template/css/style.css" type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.min.css">
</head>

<body>


<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<jsp:include page="header.jsp"></jsp:include>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-blog set-bg" data-setbg="user-template/img/blog/blog.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 style="color:#7a6565; ">TIN TỨC HÀNG NGÀY</h2>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row" id="list">
            <%
                List<Blog> blogList = (List<Blog>) request.getAttribute("blogList");
                for (Blog b : blogList) {
            %>
            <div class="col-lg-4 col-md-6 col-sm-6" id="item">
                <div class="blog__item">
                    <div class="blog__item__pic set-bg" data-setbg="<%=b.getImg()%>"></div>
                    <div class="blog__item__text">
                        <span><img src="user-template/img/icon/calendar.png" alt=""><%=b.getTime()%></span>
                        <h5><%=b.getTopic()%>
                        </h5>
                        <a href="<%=b.getLinkBlog()%>">Xem thêm</a>
                    </div>
                </div>

            </div>
            <%}%>
        </div>
        <div id="pagination">
        </div>
    </div>
</section>
<!-- Blog Section End -->

<!-- Footer Section Begin -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="user-template/js/jquery-3.3.1.min.js"></script>
<script src="user-template/js/bootstrap.min.js"></script>
<script src="user-template/js/jquery.nice-select.min.js"></script>
<script src="user-template/js/jquery.nicescroll.min.js"></script>
<script src="user-template/js/jquery.magnific-popup.min.js"></script>
<script src="user-template/js/jquery.countdown.min.js"></script>
<script src="user-template/js/jquery.slicknav.js"></script>
<script src="user-template/js/mixitup.min.js"></script>
<script src="user-template/js/owl.carousel.min.js"></script>
<script src="user-template/js/main.js"></script>
<script src="user-template/js/autoLoadCart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
<script>pagination(6, '#list #item');</script>

</body>

</html>