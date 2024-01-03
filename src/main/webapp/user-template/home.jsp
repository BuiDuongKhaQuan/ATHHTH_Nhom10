<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.SliderSerivce" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.service.ReviewService" %>
<%@ page import="qht.shopmypham.com.vn.tools.CountStar" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx" id="product-list">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || Trang chủ</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<!-- Page Preloder -->

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div id="notification" class="hidden-noti">Đã thêm vào giỏ hàng
</div>

<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero">
    <div class="hero__slider owl-carousel">
        <%
            List<Slider> sliderList = SliderSerivce.getSliderByStatus();
        %>
        <div class="hero__items set-bg" data-setbg="<%=sliderList.get(0).getImg()%>">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <%--                            <h6>Summer Collection</h6>--%>
                            <%--                            <h2>Fall - Winter Collections 2030</h2>--%>
                            <%--                            <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering--%>
                            <%--                                commitment to exceptional quality.</p>--%>
                            <%--                            <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>--%>
                            <%--                            <div class="hero__social">--%>
                            <%--                                <a href="#"><i class="fa fa-facebook"></i></a>--%>
                            <%--                                <a href="#"><i class="fa fa-twitter"></i></a>--%>
                            <%--                                <a href="#"><i class="fa fa-pinterest"></i></a>--%>
                            <%--                                <a href="#"><i class="fa fa-instagram"></i></a>--%>
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            for (int i = 1; i < sliderList.size(); i++) {
        %>
        <div class="hero__items set-bg" data-setbg="<%=sliderList.get(i).getImg()%>">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <%--                            <h6>Summer Collection</h6>--%>
                            <%--                            <h2>Fall - Winter Collections 2030</h2>--%>
                            <%--                            <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering--%>
                            <%--                                commitment to exceptional quality.</p>--%>
                            <%--                            <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>--%>
                            <%--                            <div class="hero__social">--%>
                            <%--                                <a href="#"><i class="fa fa-facebook"></i></a>--%>
                            <%--                                <a href="#"><i class="fa fa-twitter"></i></a>--%>
                            <%--                                <a href="#"><i class="fa fa-pinterest"></i></a>--%>
                            <%--                                <a href="#"><i class="fa fa-instagram"></i></a>--%>
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</section>
<!-- Hero Section End -->

<!-- Banner Section Begin -->
<section class="banner spad">
    <div class="container">
        <%
            List<Categories> categoryList = (List<Categories>) request.getAttribute("categoryList");
            Categories c1 = categoryList.get(0);
            Categories c2 = categoryList.get(1);
            Categories c3 = categoryList.get(2);
        %>
        <div class="row">
            <div class="col-lg-7 offset-lg-4">

                <div class="banner__item">
                    <div class="banner__item__pic">
                        <img src="<%=c1.getImgC()%>" alt="" style="width: 440px; height: 440px">
                    </div>
                    <div class="banner__item__text">
                        <h2><%=c1.getNameC()%>
                        </h2>
                        <a href="product?command=category&cid=<%=c1.getIdC()%>">Xem thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="banner__item banner__item--middle">
                    <div class="banner__item__pic">
                        <img src="<%=c2.getImgC()%>" alt="" style="width: 440px; height: 440px">
                    </div>
                    <div class="banner__item__text">
                        <h2><%=c2.getNameC()%>
                        </h2>
                        <a href="product?command=category&cid=<%=c2.getIdC()%>">Xem thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="banner__item banner__item--last">
                    <div class="banner__item__pic">
                        <img src="<%=c3.getImgC()%>" alt="" style="width: 440px; height: 440px">
                    </div>
                    <div class="banner__item__text">
                        <h2><%=c3.getNameC()%>
                        </h2>
                        <a href="product?command=category&cid=<%=c3.getIdC()%>">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">Bán chạy nhất</li>
                    <li data-filter=".new-arrivals">Sản phẩm mới</li>
                    <li data-filter=".hot-sales">Ưu đãi hấp dẫn</li>
                </ul>
            </div>
        </div>
        <div class="row product__filter">
            <% Account acc = (Account) request.getSession().getAttribute("a");
                List<Product> listIsNew = (List<Product>) request.getAttribute("listNew");
                for (Product p : listIsNew) {
                    List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
            %>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item" style="background-color: rgba(130,140,230,0.11)">
                    <div class="product__item__pic set-bg" data-setbg="<%=imageList.get(0).getImg()%>">
                        <span class="label">Mới</span>
                        <ul class="product__hover">
                            <%
                                if (acc != null) {
                            %>
                            <li><a href="javascript:void(0);"><img onclick="addFavorite(<%=p.getIdP()%>)"
                                                                   src="user-template/img/icon/heart.png"
                                                                   alt=""><span>Yêu thích</span></a></li>
                            <%} else {%>
                            <li><a href="javascript:void(0);"><img onclick="inform()"
                                                                   src="user-template/img/icon/heart.png"
                                                                   alt=""><span>Yêu thích</span></a></li>
                            <%}%>
                            <li><a href="javascript:void(0);"><img onclick="category(<%=p.getIdC()%>)"
                                                                   src="user-template/img/icon/compare.png" alt="">
                                <span>Cùng loại</span></a></li>
                            <li><a href="javascript:void(0);"><img onclick="detailProduct(<%=p.getIdP()%>)"
                                                                   src="user-template/img/icon/view.png"
                                                                   alt=""><span>Chi tiết</span></a></li>
                            <%
                                if (acc != null) {
                            %>
                            <li><a href="javascript:void(0);"><img onclick="insertItem(<%=p.getIdP()%>)"
                                                                   src="user-template/img/icon/add-to-basket.png"
                                                                   alt=""><span>Thêm vào giỏ</span></a></li>
                            <%} else {%>
                            <li><a href="javascript:void(0);"><img onclick="inform()"
                                                                   src="user-template/img/icon/add-to-basket.png"
                                                                   alt=""><span>Thêm vào giỏ</span></a></li>
                            <%}%>
                        </ul>

                    </div>
                    <div class="product__item__text">
                        <h6 onclick="detailProduct(<%=p.getIdP()%>)" style="cursor: pointer"><%=p.getName()%>
                        </h6>
                        <div class="rating">
                            <%
                                List<Review> reviewList = ReviewService.getAllReviewByIdP(String.valueOf(p.getIdP()));
                                double avgStart = 0;
                                double sum = 0;
                                for (Review r : reviewList) {
                                    sum += r.getStar();

                                }
                                avgStart = sum / reviewList.size();
                            %>
                            <%=CountStar.star(avgStart, reviewList.size())%>
                        </div>
                        <h5><%=Format.formatPrice(p.getPrice())%>đ</h5>
                        <div class="product__color__select">
                            <label for="pc-1">
                                <input type="radio" id="pc-1">
                            </label>
                            <label class="active black" for="pc-2">
                                <input type="radio" id="pc-2">
                            </label>
                            <label class="grey" for="pc-3">
                                <input type="radio" id="pc-3">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
            <%
                List<Product> listIsPro = (List<Product>) request.getAttribute("lisPromotion");
                int price = 0;
                for (Product pro : listIsPro) {
                    price = ProductService.getPricePromotion(String.valueOf(pro.getIdP())).getPrice();
                    List<Image> imageList = ProductService.getImages(String.valueOf(pro.getIdP()));

            %>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item" style="background-color: rgba(130,140,230,0.11)">

                    <div class="product__item__pic set-bg" data-setbg="<%=imageList.get(0).getImg()%>">
                        <ul class="product__hover">
                            <%
                                if (acc != null) {
                            %>
                            <li><a href="javascript:void(0);"><img onclick="addFavorite(<%=pro.getIdP()%>)"
                                                                   src="user-template/img/icon/heart.png"
                                                                   alt=""><span>Yêu thích</span></a></li>
                            <%} else {%>
                            <li><a href="javascript:void(0);"><img onclick="inform()"
                                                                   src="user-template/img/icon/heart.png"
                                                                   alt=""><span>Yêu thích</span></a></li>
                            <%}%>
                            <li><a href="javascript:void(0);"><img onclick="category(<%=pro.getIdC()%>)"
                                                                   src="user-template/img/icon/compare.png" alt="">
                                <span>Cùng loại</span></a></li>
                            <li><a href="javascript:void(0);"><img onclick="detailProduct(<%=pro.getIdP()%>)"
                                                                   src="user-template/img/icon/view.png"
                                                                   alt=""><span>Chi tiết</span></a></li>
                            <%
                                if (acc != null) {
                            %>
                            <li><a href="javascript:void(0);"><img onclick="insertItem(<%=pro.getIdP()%>)"
                                                                   src="user-template/img/icon/add-to-basket.png"
                                                                   alt=""><span>Thêm vào giỏ</span></a></li>
                            <%} else {%>
                            <li><a href="javascript:void(0);"><img onclick="inform()"
                                                                   src="user-template/img/icon/add-to-basket.png"
                                                                   alt=""><span>Thêm vào giỏ</span></a></li>
                            <%}%>
                        </ul>
                    </div>

                    <div class="product__item__text">
                        <h6 onclick="detailProduct(<%=pro.getIdP()%>)" style="cursor: pointer"><%=pro.getName()%>
                        </h6>
                        <div class="rating">
                            <%
                                List<Review> reviewList = ReviewService.getAllReviewByIdP(String.valueOf(pro.getIdP()));
                                double avgStart = 0;
                                double sum = 0;
                                for (Review r : reviewList) {
                                    sum += r.getStar();
                                }
                                avgStart = sum / reviewList.size();
                            %>
                            <%=CountStar.star(avgStart, reviewList.size())%>
                        </div>
                        <div style="display: inline-flex">
                            <h5><%=Format.formatPrice(price)%>đ</h5>
                            <del style="margin: 0 15px;color: #00000087;"
                            ><%=Format.formatPrice(pro.getPriceDefault())%>đ
                            </del>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Categories Section Begin -->
<section class="categories spad">
    <div class="container">
        <div class="row">
            <% Product productSelling = (Product) request.getAttribute("productSelling");
                Selling selling = (Selling) request.getAttribute("selling");
                List<Image> imageList = ProductService.getImages(String.valueOf(productSelling.getIdP()));
            %>
            <div class="col-lg-3">
                <div class="categories__text">
                    <h2><%=selling.getText1()%> <br/> <span><%=selling.getText2()%></span> <br/> <%=selling.getText3()%>
                    </h2>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="categories__hot__deal">
                    <img src="<%=imageList.get(0).getImg()%>" alt="">
                    <div class="hot__deal__sticker">
                        <span> Giá chỉ còn</span>
                        <h5><%=Format.formatPrice(ProductService.getPricePromotion(String.valueOf(productSelling.getIdP())).getPrice())%>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 offset-lg-1">
                <div class="categories__deal__countdown">
                    <span><%=selling.getText()%></span>
                    <h2><%=productSelling.getName()%>
                    </h2>
                    <div class="categories__deal__countdown__timer" id="countdown">
                        <div class="cd-item">
                            <span>3</span>
                            <p>Ngày</p>
                        </div>
                        <div class="cd-item">
                            <span>1</span>
                            <p>Giờ</p>
                        </div>
                        <div class="cd-item">
                            <span>50</span>
                            <p>Phút</p>
                        </div>
                        <div class="cd-item">
                            <span>18</span>
                            <p>Giây</p>
                        </div>
                    </div>
                    <a href="detail?pid=<%=productSelling.getIdP()%>" class="primary-btn">Xem thêm</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Instagram Section Begin -->
<section class="instagram spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="instagram__pic">
                    <% List<String> imgTrends = (List<String>) request.getAttribute("imgTrends");
                        List<ImageTrend> contentTrends = (List<ImageTrend>) request.getAttribute("contentTrends");
                        for (String img : imgTrends) {%>
                    <div class="instagram__pic__item set-bg" data-setbg="<%=img%>"></div>
                    <%}%>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="instagram__text">
                    <% if (contentTrends.get(0).getStatus() == 1) {%>
                    <h2><%=contentTrends.get(0).getImg()%>
                    </h2>
                    <%
                        }
                        if (contentTrends.get(1).getStatus() == 1) {
                    %>
                    <p><%=contentTrends.get(1).getImg()%>
                    </p>
                    <%
                        }
                        if (contentTrends.get(2).getStatus() == 1) {
                    %>
                    <h3><%=contentTrends.get(2).getImg()%>
                    </h3>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Instagram Section End -->

<!-- Latest Blog Section Begin -->
<section class="latest spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <span>Latest News</span>
                    <h2>New Trend Cosmetics</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <%
                List<Blog> blogList = (List<Blog>) request.getAttribute("blogList");
                for (Blog b : blogList) {
            %>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic set-bg" data-setbg="<%=b.getImg()%>"></div>
                    <div class="blog__item__text">
                        <span><img src="user-template/img/icon/calendar.png" alt=""> <%=b.getTime()%></span>
                        <h5><%=b.getTopic()%>
                        </h5>
                        <a href="<%=b.getLinkBlog()%>">Xem thêm</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

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
<script src="user-template/js/product.js"></script>
<script src="admin-template/assets/js/notification.js"></script>

</body>

</html>