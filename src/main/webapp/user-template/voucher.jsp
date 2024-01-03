<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
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
    <title>Mỹ Phẩm QST || Voucher</title>
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
    <style>
        .voucher {
            display: flex;
            flex-direction: column;
            border-radius: 0.25rem;
            padding: 0;
        }

        .voucher-body,
        .voucher-footer {
            display: flex;
            position: relative;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            transition: box-shadow 0.3s ease;
        }

        .voucher-body {
            overflow: hidden;
            flex-direction: column;
            box-shadow: inset 0px 0px 0px 1px #e5e9ec;
            border-top-left-radius: 0.25rem;
            border-top-right-radius: 0.25rem;
        }

        .voucher-footer {
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem;
            box-shadow: inset 0px -1px 0px 1px #e5e9ec;
            border-bottom-left-radius: 0.25rem;
            border-bottom-right-radius: 0.25rem;
        }

        .voucher:hover .voucher-footer {
            box-shadow: inset 0px -1px 0px 1px #e5e9ec,
            0 0.125rem 0.25rem rgba(33, 37, 41, 0.075) !important;
        }

        .voucher-text {
            flex: 1 1 auto;
            padding: 1.25rem 2rem;
            min-height: 100px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }

        .voucher-img {
            display: block;
            -o-object-fit: cover;
            object-fit: cover;
            width: 100%;
            height: 100px;
            border-top-left-radius: 0.25rem;
            border-top-right-radius: 0.25rem;
        }

        .voucher-border-left,
        .voucher-border-right {
            position: absolute;
            top: 0;
            bottom: 0;
            z-index: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .voucher-border-right {
            right: 0;
        }

        .voucher-border-left:before,
        .voucher-border-right:before {
            content: "";
            position: absolute;
            width: 30px;
            height: 30px;
            border: 1px solid #e5e9ec;
            border-radius: 50%;
            background: #f8f9fa; /* Change THIS when changing container background color*/
        }

        .voucher-border-left:before {
            left: -15px;
        }

        .voucher-border-right:before {
            right: -15px;
        }

        .voucher-details .details-icon,
        .voucher-details .details-text {
            display: inline-block;
            vertical-align: middle;
            margin-right: -4px;
        }

        .voucher-details .details-icon {
            margin-right: 8px;
            width: 24px;
        }

        .voucher-details .text-title {
            font-size: 10px;
            font-weight: normal;
            font-style: normal;
            font-stretch: normal;
            line-height: normal;
            letter-spacing: normal;
            color: rgba(0, 0, 0, 0.38);
        }

        .voucher-details .text-description {
            display: flex;
            justify-content: flex-start;
            color: rgba(0, 0, 0, 0.7);
            font-size: 14px;
            font-weight: 600;
            font-style: normal;
            font-stretch: normal;
            line-height: normal;
            letter-spacing: normal;
        }

        .voucher-overlay {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1;
            background: rgba(0, 0, 0, 0.6);
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .voucher:hover .voucher-overlay {
            opacity: 1;
            visibility: visible;
        }

        .text-primary {
            color: #eb3833 !important;
        }

        .bg-orange-gradient {
            background: #eb3833;
            background-image: linear-gradient(
                    to right bottom,
                    #ff541e,
                    #ff4835,
                    #fc3d47,
                    #f63657
            ) !important;
        }

        .btn:hover {
            background: #ff541e;
            color: #FFFFFF !important;
        }

        @media (min-width: 576px) {
            .col-sm-6 {
                flex: 0 0 33.33%;
                max-width: 33.33%;
            }
        }

    </style>
</head>

<body>
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
                    <h4>Kho voucher</h4>
                    <div class="breadcrumb__links">
                        <a href="./home">Trang chủ</a>
                        <span>Mã giảm giá</span>
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
            <div class="col">
                <div class="row" >
                    <div class="row clearfix" id="product_list" style="width: 100%;">
                        <%
                            List<Voucher> voucherList = (List<Voucher>) request.getAttribute("voucherList");
                            for (Voucher v : voucherList) {
                        %>
                        <div class="col-sm-6" id="product_item" style="margin-bottom: 25px">
                            <div class="voucher">
                                <div class="voucher-body bg-orange-gradient">
                                    <div class="voucher-text">
                                        <h5 class="text-white mb-0 font-weight-bold"><%=v.getName()%>
                                        </h5>
                                        <p class="text-white mb-0" style="line-height: 1">
                                            <strong style="font-size: 1.25rem"><%=v.getPrice()%>%
                                            </strong>
                                        </p>
                                    </div>
                                    <div class="voucher-overlay d-none">
                                        <button class="btn btn-primary btn-sm">View Details</button>
                                    </div>
                                    <div class="voucher-border-left"></div>
                                    <div class="voucher-border-right"></div>
                                </div>
                                <div class="voucher-footer">
                                    <div class="voucher-details">
                                        <div class="details-icon">
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <svg
                                                    version="1.1"
                                                    id="time_icon"
                                                    width="24"
                                                    height="24"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    x="0px"
                                                    y="0px"
                                                    viewBox="0 0 24 24"
                                                    style="enable-background: new 0 0 24 24"
                                                    xml:space="preserve"
                                            >
                    <g>
                        <path fill="none" d="M0,0h24v24H0V0z"/>
                        <path
                                fill="#ffefed"
                                d="M12,2.5c-5.2,0-9.5,4.3-9.5,9.5s4.3,9.5,9.5,9.5"
                        />
                        <path
                                fill="#ff4933"
                                d="M12,2c5.5,0,10,4.5,10,10s-4.5,10-10,10S2,17.5,2,12S6.5,2,12,2z M12,3.5c-4.7,0-8.5,3.8-8.5,8.5 s3.8,8.5,8.5,8.5s8.5-3.8,8.5-8.5S16.7,3.5,12,3.5z"
                        />
                        <path
                                fill="#ff4933"
                                d="M12.7,5.5c0-0.4-0.3-0.8-0.7-0.8s-0.7,0.3-0.7,0.8v7.2c0,0.4,0.3,0.8,0.7,0.8h5.8c0.4,0,0.7-0.3,0.7-0.8 s-0.3-0.8-0.7-0.8h-5.1V5.5z"
                        />
                    </g>
                  </svg>
                                        </div>
                                        <div class="details-text">
                                            <div class="text-title">Số lượng</div>
                                            <div class="text-description text-primary"><%=v.getQuantity()%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="voucher-details">
                                        <div class="details-icon">
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <svg
                                                    version="1.1"
                                                    id="ringgit_icon"
                                                    width="28"
                                                    height="28"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    x="0px"
                                                    y="0px"
                                                    viewBox="0 0 24 24"
                                                    style="enable-background: new 0 0 24 24"
                                                    xml:space="preserve"
                                            >
                    <path
                            fill="#ffefed"
                            d="M19.7,5.3H4.2c-1.3,0-2.3,1-2.3,2.3v8.8c0,1.3,1,2.3,2.3,2.3h15.5c1.3,0,2.3-1,2.3-2.3V7.6 C22,6.3,21,5.3,19.7,5.3z"
                    />
                                                <path
                                                        fill="#ff4933"
                                                        d="M11.1,14.9c-0.1,0-0.3,0-0.4-0.1L9,13.5v0.8c0,0.3-0.3,0.6-0.6,0.6c-0.3,0-0.6-0.3-0.6-0.6v-2.1c0,0,0,0,0,0 V9.7c0-0.3,0.3-0.6,0.6-0.6h1.3c1,0,1.9,0.8,1.9,1.9c0,0.9-0.6,1.6-1.4,1.8l1.3,1c0.3,0.2,0.3,0.6,0.1,0.9 C11.5,14.9,11.3,14.9,11.1,14.9z M9,11.6h0.6c0.3,0,0.6-0.3,0.6-0.6s-0.3-0.6-0.6-0.6H9V11.6z"
                                                />
                                                <path
                                                        fill="#ff4933"
                                                        d="M15.5,14.9c-0.3,0-0.6-0.3-0.6-0.6v-1.9l-0.1,0.1c-0.2,0.4-0.9,0.4-1.1,0l-0.1-0.1v1.9c0,0.3-0.3,0.6-0.6,0.6 c-0.3,0-0.6-0.3-0.6-0.6V9.7c0-0.3,0.2-0.5,0.5-0.6c0.3-0.1,0.6,0.1,0.7,0.3l0.7,1.4l0.7-1.4c0.1-0.3,0.4-0.4,0.7-0.3 c0.3,0.1,0.5,0.3,0.5,0.6v4.6C16.1,14.7,15.8,14.9,15.5,14.9z"
                                                />
                                                <path
                                                        fill="#ff4933"
                                                        d="M19.7,18.7H4.2c-1.3,0-2.3-1-2.3-2.3V7.6c0-1.3,1-2.3,2.3-2.3h15.5c1.3,0,2.3,1,2.3,2.3v8.8 C22,17.7,21,18.7,19.7,18.7z M4.2,6.6c-0.6,0-1,0.5-1,1v8.8c0,0.6,0.5,1,1,1h15.5c0.6,0,1-0.5,1-1V7.6c0-0.6-0.5-1-1-1H4.2z"
                                                />
                                                <path
                                                        fill="#ff4933"
                                                        d="M7.1,9.1H5c-0.3,0-0.6-0.3-0.6-0.6c0-0.3,0.3-0.6,0.6-0.6h2.1c0.3,0,0.6,0.3,0.6,0.6C7.7,8.8,7.5,9.1,7.1,9.1z"
                                                />
                                                <path
                                                        fill="#ff4933"
                                                        d="M18.9,16.2h-2.1c-0.3,0-0.6-0.3-0.6-0.6c0-0.3,0.3-0.6,0.6-0.6h2.1c0.3,0,0.6,0.3,0.6,0.6 C19.5,15.9,19.2,16.2,18.9,16.2z"
                                                />
                  </svg>
                                        </div>
                                        <div class="details-text">
                                            <div class="text-primary"
                                                 style="padding: 0 7px; margin-right: 5px;"><%=v.getCode()%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
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

</body>

</html>