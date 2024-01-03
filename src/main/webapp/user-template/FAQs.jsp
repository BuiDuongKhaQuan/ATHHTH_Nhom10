<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mỹ Phẩm QST || FAQs</title>
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

<body>
<!-- Page Preloder -->

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<jsp:include page="header.jsp"></jsp:include>

<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Câu hỏi thường gặp</h4>
                    <div class="breadcrumb__links">
                        <a href="home">Trang chủ</a>
                        <span>Câu hỏi thường gặp</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="row px-xl-5" style="justify-content: center;">
    <% List<FAQs> FAQsList = (List<FAQs>) request.getAttribute("FAQsList");
    %>
    <div class="col-lg-7 mb-5" style="margin-top: 40px;margin-bottom: 15px!important; border-bottom: 1px solid rgba(0,0,0,0.08);font-weight: 800;">

        <h5 class="font-weight-semi-bold mb-3 magin-top" style="font-weight: 800;"><%=FAQsList.get(0).getQuestion()%>
        </h5>
        <p><%=FAQsList.get(0).getAnswer()%>
        </p>
    </div>
    <%
        for (int i = 1; i < FAQsList.size(); i++) {
    %>
    <div class="col-lg-7 mb-5"
         style="margin-top: 10px; margin-bottom: 15px!important; border-bottom: 1px solid rgba(0,0,0,0.08);">
        <h5 class="font-weight-semi-bold mb-3" style="font-weight: 800;"><%=FAQsList.get(i).getQuestion()%>
        </h5>
        <p><%=FAQsList.get(i).getAnswer()%>
        </p>
    </div>
    <%}%>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Search Begin -->

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

</body>

</html>