<%@ page import="qht.shopmypham.com.vn.model.Account" %>
<%@ page import="qht.shopmypham.com.vn.model.ListProductByCart" %>
<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ShopService" %>
<%@ page import="qht.shopmypham.com.vn.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Offcanvas Menu Begin -->
<%
    Account acc = (Account) request.getSession().getAttribute("a");
%>
<link rel="stylesheet" href="user-template/css/main.css" type="text/css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta3/css/all.css">

<script>
    function showSearchMobile() {
        const formSearch = document.getElementById("search-header-mobile");
        formSearch.style.display = "block";
    }
</script>
<div id="notification" class="hidden-noti" style="display: none"></div>
<div id="alert" class="hidden-noti" style="display: none"></div>

<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <%if (acc == null) {%>
            <a href="login.jsp">ĐĂNG NHẬP</a>
            <% }
                if (acc != null) {
                    if (!acc.mediumPower()) { %>
            <a href="profile?command=profile"> Xin chào <%=acc.getName()%>
            </a>
            <%} else {%>
            <a href="admin-home"> Xin chào
                ADMIN </a>
            <% }
            } %>
            <a href="faqs">FAQs</a>
        </div>
        <div class="offcanvas__top__hover">
            <span>Usd <i class="arrow_carrot-down"></i></span>
            <ul>
                <li>USD</li>
                <li>EUR</li>
                <li>USD</li>
            </ul>
        </div>
    </div>
    <div>
        <div class="offcanvas__nav__option">
            <a href="javascript:void(0);">
                <i class="fa-light fa-magnifying-glass" onclick="showSearchMobile()"></i>
            </a>
            <% if (acc != null) {
                List<ListProductByCart> list = acc.getProductCart();
                List<Product> productList = acc.getFavoriteProduct();
            %>
            <a href="product?command=favorite"><i class="fa-light fa-heart"></i>
                <span id="favorite-count1" style="left: 18px;top: -8px"><%=productList.size()%></span></a>
            <a href="auto-load?command=show"><i class="fa-light fa-cart-shopping"></i>
                <span id="cart-count1" style="left: 23px;top: -8px"><%=list.size()%></span></a>
            <%} else {%>
            <a href="login.jsp"><i class="fa-light fa-heart"></i>
                <span style="left: 18px;top: -8px">0</span></a>
            <a href="login.jsp"><i class="fa-light fa-cart-shopping"></i>
                <span style="left: 23px;top: -8px">0</span></a>
            <%}%>
        </div>
        <form action="product" method="get" id="search-header-mobile" style="display: none">
            <div class="search-box">
                <input type="text" class="input-search-mobile" name="name-product"
                       placeholder="Tìm kiếm...">
                <input type="hidden" value="search-header" name="command">
            </div>
        </form>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__text">
        <p style="text-transform: uppercase"><%=ShopService.getShop().getShopName()%>
        </p>
    </div>
</div>
<!-- Offcanvas Menu End -->
<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7 header_height">
                    <div class="header__top__left">
                        <p style="text-transform: uppercase"><%=ShopService.getShop().getShopName()%>
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                            <%if (acc == null) {%>
                            <a href="login.jsp">ĐĂNG NHẬP</a>
                            <% }
                                if (acc != null) {
                                    if (!acc.mediumPower()) { %>
                            <a href="profile?command=profile"> Xin chào <%=acc.getName()%>
                            </a>
                            <%} else {%>
                            <a href="admin-home"> Xin chào
                                ADMIN </a>
                            <% }
                            } %>
                            <a href="faqs">FAQs</a>
                        </div>
                        <div class="header__top__hover">
                            <span>Usd <i class="arrow_carrot-down"></i></span>
                            <ul>
                                <li>USD</li>
                                <li>EUR</li>
                                <li>USD</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="navbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 pading-profile">
                    <div class="header__logo">
                        <a href="home"><img src="<%=ShopService.getShop().getLogo_header()%>" alt="Logo QST"></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 pading-profile">
                    <nav class="header__menu mobile-menu">
                        <% String activeHome = (String) request.getAttribute("activeHome");
                            String activeProduct = (String) request.getAttribute("activeProduct");
                            String activePage = (String) request.getAttribute("activePage");
                            String activeBlog = (String) request.getAttribute("activeBlog");
                            String activeContact = (String) request.getAttribute("activeContact");
                        %>
                        <ul>
                            <li class="<%=activeHome%>"><a href="./home">Trang chủ</a></li>
                            <li class="<%=activeProduct%>"><a href="product?command=product">Sản phẩm</a></li>
                            <li class="<%=activePage%>"><a href="#">Trang</a>
                                <ul class="dropdown">
                                    <li><a href="auto-load?command=show"> Giỏ hàng</a></li>
                                    <li><a href="product?command=favorite">Sản phẩm yêu thích</a></li>
                                    <li><a href="profile?command=profile">Trang cá nhân</a></li>
                                    <li><a href="voucher">Kho voucher</a></li>
                                </ul>
                            </li>
                            <li class="<%=activeBlog%>"><a href="./blog">Blog</a></li>
                            <li class="<%=activeContact%>"><a href="./contact">Liên hệ </a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3 pading-profile">
                    <div class="header__nav__option">
                        <a href="javascript:void(0);" style="margin-right: 10px;">
                            <form action="product" method="get">
                                <div class="search-box">
                                    <button class="btn-search" type="submit"><i
                                            class="fa-light fa-magnifying-glass"></i></button>
                                    <input type="text" class="input-search" name="name-product"
                                           placeholder="Tìm kiếm...">
                                    <input type="hidden" value="search-header" name="command">
                                </div>
                            </form>
                        </a>
                        <% if (acc != null) {
                            List<ListProductByCart> list = acc.getProductCart();
                            List<Product> productList = acc.getFavoriteProduct();
                        %>
                        <a href="product?command=favorite"><i class="fa-light fa-heart"></i>
                            <span style="left: 9px; top: -2px" id="favorite-count"><%=productList.size()%></span></a>
                        <a href="auto-load?command=show"><i class="fa-light fa-cart-shopping"></i>
                            <span style="left: 12px; top: -4px" id="cart-count"><%=list.size()%></span></a>
                        <%} else {%>
                        <a href="login.jsp"><i class="fa-light fa-heart"></i>
                            <span style="left: 9px; top: -2px">0</span></a>
                        <a href="login.jsp"><i class="fa-light fa-cart-shopping"></i>
                            <span style="left: 12px; top: -4px">0</span></a>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </div>
</header>
