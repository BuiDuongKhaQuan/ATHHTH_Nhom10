<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="qht.shopmypham.com.vn.service.ReviewService" %>
<%@ page import="qht.shopmypham.com.vn.service.AccountService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.tools.CountStar" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductCheckoutService" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || Chi tiết sản phẩm</title>
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

<!-- Shop Details Section Begin -->
<section class="shop-details">
    <% Product p = (Product) request.getAttribute("product");
        List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
        List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
    %>
    <div class="product__details__pic">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product__details__breadcrumb">
                        <a href="home">Trang chủ</a>
                        <a href="product?command=product">Sản phẩm</a>
                        <span>Chi tiết sản phẩm</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                <div class="product__thumb__pic set-bg" data-setbg="<%=imageList.get(0).getImg()%>">
                                </div>
                            </a>
                        </li>
                        <%
                            int a = 1;
                            for (int i = 1; i < imageList.size(); i++) {
                                a++;
                        %>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-<%=a%>" role="tab">
                                <div class="product__thumb__pic set-bg" data-setbg="<%=imageList.get(i).getImg()%>">
                                </div>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>
                <div class="col-lg-6 col-md-9">
                    <div class="tab-content">

                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__pic__item">
                                <img src="<%= imageList.get(0).getImg()%>" alt="">
                            </div>
                        </div>
                        <%
                            int b = 1;
                            for (int i = 1; i < imageList.size(); i++) {
                                b++;
                        %>
                        <div class="tab-pane" id="tabs-<%=b%>" role="tabpanel">
                            <div class="product__details__pic__item">
                                <img src="<%= imageList.get(i).getImg()%>" alt="">
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="product__details__content">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="product__details__text">
                        <h4><%=p.getName()%>
                        </h4>
                        <div class="rating">
                            <%
                                double avgStart = (double) request.getAttribute("avgStart");
                            %>
                            <%=CountStar.star(avgStart, reviewList.size())%>
                            <span> - <%=reviewList.size()%> đánh giá</span>
                        </div>
                        <h3><%=Format.formatPrice(p.getPrice())%>đ
                            <span><%if (p.isPromotion()) {%>
                                    <del style="margin: 0 15px;color: #00000087;"
                                    ><%=Format.formatPrice(p.getPriceDefault())%>
                                    </del>
                                    <%}%>
                            </span>
                        </h3>
                        <div class="product__details__cart__option">
                            <a href="javascript:void(0);" onclick="insertItem(<%=p.getIdP()%>)" class="primary-btn">+
                                Thêm vào giỏ hàng</a>
                        </div>
                        <div class="product__details__btns__option">
                            <a href="javascript:void(0);" onclick="addFavorite(<%=p.getIdP()%>)"><i
                                    class="fa fa-heart"></i> Thêm vào danh sách yêu thích</a>
                            <a href="javascript:void(0);" onclick="category(<%=p.getIdC()%>)"><i
                                    class="fa fa-exchange"></i> Sản phẩm cùng danh mục</a>
                        </div>
                        <div class="product__details__last__option">
                            <h5><span>Thanh toán an toàn</span></h5>
                            <img src="user-template/img/payment/details-payment.png" alt="">
                            <%
                                Categories categories = (Categories) request.getAttribute("cate");
                                Trademark trademark = (Trademark) request.getAttribute("trademark");
                            %>
                            <ul>
                                <li><span>Mã sản phẩm:</span> #<%=p.getIdP()%>
                                </li>
                                <li><span>Danh mục:</span> <%=categories.getNameC()%>
                                </li>
                                <li><span>Xuất xứ:</span> <%=trademark.getName()%>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                   role="tab">Mô tả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Đánh giá</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                <div class="product__details__tab__content">
                                    <div class="product__details__tab__content__item">
                                        <h5><%=p.getName()%>
                                        </h5>
                                        <p><%=p.getInformation()%>></p>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-6" role="tabpanel">
                                <div class="product__details__tab__content">
                                    <div class="row">

                                        <div class="col-md-6">
                                            <div id="comment-size">
                                                <h4 class="mb-4"><%=reviewList.size()%> đánh giá về <%=p.getName()%>
                                                </h4>
                                            </div>
                                            <div id="comment">
                                                <%
                                                    for (Review r : reviewList) {
                                                        Account acc = AccountService.getAccountById(r.getIdA());
                                                %>
                                                <div class="media mb-4" id="comment_item">
                                                    <img src="<%=acc.getImg()%>" alt="Image" class="img-fluid mr-3 mt-1"
                                                         style="width: 50px; border-radius: 50%; height: 50px;">
                                                    <div class="media-body">
                                                        <h6><%=acc.getUser()%><small>
                                                            - <i><%=r.getDate()%>
                                                        </i></small></h6>

                                                        <div class="rating">
                                                            <%=CountStar.starReview(r.getStar())%>
                                                        </div>
                                                        <p><%=r.getInfomation()%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                            <div id="pagination"></div>
                                        </div>
                                        <div class="col-md-6" id="review">
                                            <h4 class="mb-4">Để lại đánh giá của bạn</h4>
                                            <div class="d-flex my-3">
                                                <p class="mb-0 mr-2">Đánh giá * :</p>
                                                <form method="get" id="rating" class="text-primary"
                                                      style="margin-top: -10px">
                                                    <input type="radio" id="star5" name="star" value="5"/>
                                                    <label class="full" for="star5"
                                                           title="Rất tốt - 5 stars"></label>

                                                    <input type="radio" id="star4half" name="star" value="4.5"/>
                                                    <label class="half" for="star4half" title="4.5 sao"></label>

                                                    <input type="radio" id="star4" name="star" value="4"/>
                                                    <label class="full" for="star4" title="Tốt - 4 sao"></label>

                                                    <input type="radio" id="star3half" name="star" value="3.5"/>
                                                    <label class="half" for="star3half" title="3.5 stars"></label>

                                                    <input type="radio" id="star3" name="star" value="3"/>
                                                    <label class="full" for="star3"
                                                           title="Bình thường - 3 sao"></label>

                                                    <input type="radio" id="star2half" name="star" value="2.5"/>
                                                    <label class="half" for="star2half" title="2.5 sao"></label>

                                                    <input type="radio" id="star2" name="star" value="2"/>
                                                    <label class="full" for="star2"
                                                           title="Trung bình  - 2 sao"></label>

                                                    <input type="radio" id="star1half" name="star" value="1.5"/>
                                                    <label class="half" for="star1half" title="1.5 sao"></label>

                                                    <input type="radio" id="star1" name="star" value="1"/>
                                                    <label class="full" for="star1" title="Tệ - 1 sao"></label>

                                                    <input type="radio" id="starhalf" name="star" value="0.5"/>
                                                    <label class="half" for="starhalf"
                                                           title="Rất tệ - 0.5 sao"></label>
                                                </form>

                                            </div>

                                            <form>
                                                <div class="form-group">
                                                    <label for="message">Đánh giá của bạn *</label>
                                                    <textarea id="message"
                                                              name="information" cols="30" rows="5"
                                                              class="form-control" required></textarea>
                                                </div>
                                                <%
                                                    Account ac = (Account) request.getSession().getAttribute("a");
                                                    if (ac == null) {
                                                %>
                                                <div class="form-group mb-0">
                                                    <a href="login.jsp"
                                                       class="btn btn-primary px-3"
                                                       style="border-radius: 5px"> Đăng nhập để đánh giá
                                                    </a>
                                                </div>
                                                <%
                                                } else {
                                                    if (ProductCheckoutService.getProductProductCheckout(ac.getId(), p.getIdP()) == null) {
                                                %>
                                                <div class="form-group mb-0">
                                                    <h5 class="btn btn-primary px-3"> Bạn cần mua sản phẩm này để đánh
                                                        giá!
                                                    </h5>
                                                </div>
                                                <%} else {%>
                                                <div class="form-group mb-0">
                                                    <button type="button" onclick="send(<%=p.getIdP()%>)"
                                                            class="btn btn-primary px-3"> Đánh giá
                                                    </button>
                                                </div>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Details Section End -->

<!-- Related Section Begin -->
<section class="related spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="related-title">Sản phẩm tương tự</h3>
            </div>
        </div>
        <div class="row">
            <%
                List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                for (Product p1 : listProduct) {
                    List<Image> imageList1 = ProductService.getImages(String.valueOf(p1.getIdP()));
            %>
            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                <div class="product__item" style="background-color: rgba(130,140,230,0.11)">
                    <div class="product__item__pic set-bg" data-setbg="<%=imageList1.get(0).getImg()%>">
                        <ul class="product__hover">
                            <%
                                Account acc = (Account) request.getSession().getAttribute("a");
                                if (acc != null) {
                            %>
                            <li><a href="javascript:void(0);"><img onclick="addFavorite(<%=p1.getIdP()%>)"
                                                                   src="user-template/img/icon/heart.png"
                                                                   alt=""><span>Yêu thích</span></a></li>
                            <%} else {%>
                            <li><a href="javascript:void(0);"><img onclick="inform()"
                                                                   src="user-template/img/icon/heart.png"
                                                                   alt=""><span>Yêu thích</span></a></li>
                            <%}%>
                            <li><a href="javascript:void(0);"><img onclick="category(<%=p1.getIdC()%>)"
                                                                   src="user-template/img/icon/compare.png"
                                                                   alt="">
                                <span>Cùng loại</span></a></li>
                            <li><a href="javascript:void(0);"><img onclick="detailProduct(<%=p1.getIdP()%>)"
                                                                   src="user-template/img/icon/view.png"
                                                                   alt=""><span>Chi tiết</span></a></li>
                            <%
                                if (acc != null) {
                            %>
                            <li><a href="javascript:void(0);"><img onclick="insertItem(<%=p1.getIdP()%>)"
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
                        <h6 onclick="detailProduct(<%=p1.getIdP()%>)" style="cursor: pointer"><%=p1.getName()%>
                        </h6>
                        <div class="rating">
                            <%
                                List<Review> reviewList1 = ReviewService.getAllReviewByIdP(String.valueOf(p1.getIdP()));
                                double sum1 = 0;
                                for (Review r : reviewList1) {
                                    sum1 += r.getStar();
                                }
                                double avgStart1 = sum1 / reviewList.size();
                            %>
                            <%=CountStar.star(avgStart1, reviewList1.size())%>
                        </div>
                        <div style="display: inline-flex">
                            <h5><%=Format.formatPrice(p1.getPrice())%>đ</h5>
                            <%if (p1.isPromotion()) {%>
                            <del style="margin: 0 15px;color: #00000087;"><%=Format.formatPrice(p1.getPriceDefault())%>đ
                            </del>
                            <%}%>
                        </div>

                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>
<!-- Related Section End -->

<!-- Footer Section Begin -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer Section End -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>

<script>
    pagination(3, '#comment #comment_item');
    const form = document.querySelector("#rating");
    const ratingInputs = form.elements.star;

    let ratingValue;

    for (let i = 0; i < ratingInputs.length; i++) {
        ratingInputs[i].addEventListener("change", function () {
            ratingValue = ratingInputs[i].value;
            console.log(ratingValue);
        });
    }

    function send(idP) {
        var mess = document.getElementById("message").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "review", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                loadSizeComment();
                loadComment();
                load();
                pagination(3, '#comment #comment_item');
            }
        };
        xhr.send("mess=" + encodeURIComponent(mess)
            + "&command=add"
            + "&start=" + ratingValue
            + "&idP=" + idP);
    }

    function getStart() {
        let star = document.forms[0]
        let txt = "";
        let i;
        for (i = 0; i < star.length; i++) {
            if (star[i].checked) {
                txt = txt + star[i].value
            }
        }
        return txt;
    }

    function loadComment() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "review", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("comment").innerHTML = this.responseText;
                pagination(3, '#comment #comment_item');
            }
        };
        xhr.send("idP=" + <%=p.getIdP()%>
            +"&command=r");
    }

    function loadSizeComment() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "review", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("comment-size").innerHTML = this.responseText;
            }
        };
        xhr.send("idP=" + <%=p.getIdP()%>
            +"&command=s");
    }

    function detailProduct(idP) {
        window.location.href = "detail?pid=" + idP;
    }

    function load() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "review", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("review").innerHTML = this.responseText;
                pagination(3, '#comment #comment_item');
            }
        };
        xhr.send("idP=" + <%=p.getIdP()%>
            +"&command=b");
    }

</script><!-- Js Plugins -->


</body>

</html>