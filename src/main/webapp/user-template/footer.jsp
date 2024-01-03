<%@ page import="qht.shopmypham.com.vn.service.ShopService" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Footer Section Begin -->
<% Account acc = (Account) request.getSession().getAttribute("a");
    Shop shop = ShopService.getShop(); %>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="home"><img src="<%=shop.getLogo_footer()%>" alt=""></a>
                    </div>
                    <p>Cảm ơn bạn đã đến với chúng tôi.</p>
                </div>
            </div>
            <div class="col-lg-3  col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Thông tin liên lạc</h6>
                    <ul style=" color: #ccc;">
                        <% Province province = api.getProvinceById(shop.getProvinceID());
                            District district = api.getDistrictById(province.getProvinceID(), shop.getDistrictID());
                            Ward ward = api.getWardById(district.getDistrictID(), shop.getWardID());
                            String address = ward.getWardName() + ", " + district.getDistrictName() + ", " + province.getProvinceName();%>
                        <li><i class="fa fa-home" aria-hidden="true"></i> <%=address%>
                        </li>
                        <li><i class="fa fa-phone" aria-hidden="true"></i> <%=shop.getPhone()%>
                        </li>
                        <li><i class="fa fa-envelope" aria-hidden="true"></i> <%=shop.getEmail()%>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Truy cập nhanh</h6>
                    <ul style=" color: #ccc;">
                        <li><a href="home">Trang chủ</a></li>
                        <li><a href="product?command=product">Sản Phẩm</a></li>
                        <li><a href="profile?command=profile">Trang cá nhân</a></li>
                        <li><a href="blog">Blog</a></li>
                        <li><a href="contact">Liên hệ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>Nhập thông tin để cập nhật tin tức thường xuyên</h6>
                    <div class="footer__newslatter">
                        <form action="" style=" color: #ccc;">
                            <input type="text" name="email" id="email" required="required" placeholder="Email của bạn"
                                   style="color: #b7b7b7">
                            <br>
                        </form>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit" style="    height: 30px;
                                margin-top: 10px;
                                line-height: 7px;background-color: #ccc;" onclick="contact()">
                                OK
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer__copyright__text">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <p>© <%=shop.getShopName()%>
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        .Đã đăng ký bản quyền<i class="fa fa-heart-o" aria-hidden="true"></i>Designed by<a
                                href="https://colorlib.com" target="_blank"><%=shop.getDesignerBy()%>
                        </a>
                    </p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"
><i class="fa fa-angle-double-up"></i
></a>

<% if (acc != null) {%>
<script src="user-template/js/auto-load-cart.js"></script>
<%}%>
<script>

    function contact() {
        var email = document.getElementById("email").value;
        if (email.trim() === '') {
            showAlert('Vui lòng nhập đầy đủ thông tin!');
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "contact", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showNotification("Gửi thành công");
                }
            };
            xhr.send("email=" + encodeURIComponent(email));
        }
    }
</script>
