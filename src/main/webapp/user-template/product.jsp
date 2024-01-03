<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.CategoryService" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.service.ReviewService" %>
<%@ page import="qht.shopmypham.com.vn.service.TrademarkService" %>
<%@ page import="qht.shopmypham.com.vn.tools.CountStar" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page import="qht.shopmypham.com.vn.controller.UserHome" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || Sản phẩm</title>
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
    <link rel="stylesheet" href="user-template/css/product.css" type="text/css">
    <link href="user-template/css/rating.css" rel="stylesheet"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.min.css">

</head>

<body>
<!-- Page Preloder -->


<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<jsp:include page="header.jsp"></jsp:include>
<!-- Header Section End -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Sản phẩm</h4>
                    <div class="breadcrumb__links">
                        <a href="./home">Trang chủ</a>
                        <span>Sản phẩm</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__search" style="display: flex; position: relative">
                        <input style="width: 100%;font-size: 15px;color: #b7b7b7;padding-left: 20px;border: 1px solid #e5e5e5;height: 42px;"
                               type="text"
                               id="name"
                               oninput="search(this)"
                               placeholder="Tìm kiếm..."
                               required
                        />
                        <button type="button"
                                style="color: #b7b7b7;font-size: 15px;border: none;background: transparent;position: absolute;right: 0;padding: 0 15px;top: 0;height: 100%;"
                                onclick="search()"><span class="icon_search"></span></button>
                    </div>

                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseOne">DANH MỤC</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__categories">

                                            <ul class="nice-scroll">
                                                <% List<Categories> listCategories = CategoryService.getAllCategory();
                                                    for (Categories c : listCategories) {
                                                %>
                                                <input type="radio" name="cate" value="<%=c.getIdC()%>"  onchange="sendDataToServer()"> <%=c.getNameC()%><br>
                                                <%}%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">THƯƠNG HIỆU</a>
                                </div>
                                <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__brand">

                                            <ul>
                                                <%
                                                    List<Trademark> list = TrademarkService.getTrademarkAll();
                                                    for (Trademark t : list) {
                                                %>
                                                <input type="radio" name="trade" value="<%=t.getId()%>"  onchange="sendDataToServer()"> <%=t.getName()%><br>
                                                <%}%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">LỌC GIÁ</a>
                                </div>
                                <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__price">
                                            <ul>
                                                <input type="radio" name="price" value="null"  onchange="sendDataToServer()"> Tất cả<br>
                                                <input type="radio" name="price" value="0"  onchange="sendDataToServer()"> 0-100.000<br>
                                                <input type="radio" name="price" value="100000"  onchange="sendDataToServer()"> 100.000-300.000<br>
                                                <input type="radio" name="price" value="300000"  onchange="sendDataToServer()"> 300.000-600.000<br>
                                                <input type="radio" name="price" value="600000"  onchange="sendDataToServer()"> Trên 600.000đ<br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
                                </div>
                                <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__tags">
                                            <a href="#">KEM CHỐNG NẮNG</a>
                                            <a href="#">KEM CHỐNG SẸO</a>
                                            <a href="#">NƯỚC TẨY TRANG</a>
                                            <a href="#">SỬA RỬA MẬT</a>
                                            <a href="#">NƯỚC HOA</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-9">
                <div class="shop__product__option">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__left">
                                <% int size = (int) request.getAttribute("size");
                                    List<Product> productList = (List<Product>) request.getAttribute("listProduct");
                                %>
                                <p>Hiển thị 1 - 9 trong <%=size%> kết quả</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <nav class="header__menu" style="padding: 0;text-align: right;">
                                <ul>
                                    <li><a href="javascript:void(0);" style="font-weight: 100;">Sắp xếp theo giá <i
                                            class="fa fa-level-down" aria-hidden="true"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="javascript:void(0);" onclick="arrange('arrange','decrease')">Giá
                                                giảm dần</a></li>
                                            <li><a href="javascript:void(0);" onclick="arrange('arrange','ascending')">Giá
                                                tăng dần</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="row" id="product_list">
                    <%
                        for (Product p : productList) {
                            List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-6" id="product_item">
                        <div class="product__item" style="background-color: rgba(130,140,230,0.11)">
                            <div class="product__item__pic set-bg" data-setbg="<%=imageList.get(0).getImg()%>">
                                <ul class="product__hover">
                                    <%
                                        Account acc = (Account) request.getSession().getAttribute("a");
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
                                                                           src="user-template/img/icon/compare.png"
                                                                           alt="">
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
                                <h6 onclick="detailProduct(<%=p.getIdP()%>)"
                                    style="cursor: pointer"><%=p.getName()%>
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
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="row" style="width: 100%;">
                    <div class="col-lg-12">
                        <div class="product__pagination">
                            <div class="pagination" id="pagination" style="justify-content: center">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

<!-- Footer Section Begin -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer Section End -->


<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
<script src="admin-template/assets/js/notification.js"></script>
    <%if (size == UserHome.productList.size()) {%>
<script>
    function pagination1(item, count, id) {
        $(document).ready(function () {
            var itemsPerPage = item;
            var itemsCount = count;

            $('#pagination').pagination({
                items: itemsCount,
                itemsOnPage: itemsPerPage,
                cssStyle: 'light-theme',
                prevText: 'Trang trước',
                nextText: 'Trang tiếp',
                onPageClick: function (pageNumber) {
                    var startIndex = (pageNumber - 1) * itemsPerPage;
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "product?command=pagination&startIndex=" + startIndex, true);
                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                            document.getElementById("product_list").innerHTML = this.responseText;
                        }
                    };
                    xhr.send();
                }

            });
            $(id).hide().slice(0, itemsPerPage).show();
        });
    }

    pagination1(9, <%=size%>, '#product_list #product_item');
</script>
    <%} else {%>
<script>pagination(9, '#product_list #product_item');</script>
    <%}%>
<script>
    function sendDataToServer() {
        var cate = document.querySelector('input[name="cate"]:checked');
        var trade = document.querySelector('input[name="trade"]:checked');
        var price = document.querySelector('input[name="price"]:checked');
        var minPrice = 0;
        var maxPrice = 10000000000;

        // Lấy giá trị minPrice và maxPrice từ giá trị priceValue
        if (price !== null) {
            var priceValue = parseInt(price.value);
            if (priceValue === 0) {
                minPrice = 0;
                maxPrice = 100000;
            } else if (priceValue === 100000) {
                minPrice = 100000;
                maxPrice = 300000;
            } else if (priceValue === 300000) {
                minPrice = 300000;
                maxPrice = 600000;
            } else if (priceValue === 600000) {
                minPrice = 600000;
                maxPrice = 10000000000;
            }
            else if (priceValue === null) {
                minPrice = 0;
                maxPrice = 10000000000;
            }
        } else {
            // Nếu price không được chọn, sử dụng giá trị mặc định
            minPrice = 0;
            maxPrice = 10000000000;
        }

        var params = "";

        if (cate !== null) {
            params += "cate=" + cate.value + "&";
        }
        if (trade !== null) {
            params += "trade=" + trade.value + "&";
        }
        // Thêm minPrice và maxPrice vào params ngay cả khi chúng là giá trị mặc định
        params += "minPrice=" + minPrice + "&";
        params += "maxPrice=" + maxPrice + "&";

        if (params === "") {
            console.log("Không có giá trị được chọn");
            return;
        }

        var xhr = new XMLHttpRequest();

        xhr.open("GET", "product?command=filter&" + params.slice(0, -1), true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                document.getElementById("product_list").innerHTML = this.responseText;
                pagination(9, '#product_list #product_item');
            }
        };

        xhr.send();
    }

</script>
</html>