<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.service.ProductService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="qht.shopmypham.com.vn.model.*" %>
<%@ page import="qht.shopmypham.com.vn.service.AccountService" %>
<%@ page import="qht.shopmypham.com.vn.tools.CountStar" %>
<%@ page import="qht.shopmypham.com.vn.service.WareHouseService" %>
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
    <!-- Custom Css -->
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/dropify/css/dropify.min.css" type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.min.css">

</head>

<body class="theme-blush">
<jsp:include page="header.jsp"></jsp:include>


<section class="content">
    <div class="body_scroll">
        <% Product product = (Product) request.getAttribute("product");%>
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Chỉnh sửa sản phẩm</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i>Admin</a>
                        </li>
                        <li class="breadcrumb-item">Quản lí sản phẩm</li>
                        <li class="breadcrumb-item"><a href="admin-product?command=list"> Danh sách sản phẩm</a></li>
                        <li class="breadcrumb-item active">Chỉnh sửa sản phẩm</li>
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
                        <div class="body">
                            <div class="row">
                                <%
                                    Map<String, String> map = (Map<String, String>) request.getSession().getAttribute("imgs");
                                    String img = "";
                                    List<String> list1 = new ArrayList<>();
                                    if (map != null) {
                                        List<String> list = new ArrayList<>();
                                        for (Map.Entry<String, String> entry : map.entrySet()) {
                                            img = "data:image/jpeg;base64," + entry.getValue();
                                            list.add(img);
                                            list1.add(entry.getKey());
                                        }
                                %>
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1"><img
                                                src="<%=list.get(0)%>" style="height: 330px"
                                                class="img-fluid" alt=""/>
                                        </div>
                                        <% int a = 1;
                                            for (int i = 1; i < list.size(); i++) {
                                                a++;%>
                                        <div class="tab-pane" id="product_<%=a%>"><img
                                                src="<%=list.get(i)%>" class="img-fluid" style="height: 330px" alt=""/>
                                        </div>
                                        <%}%>
                                    </div>
                                    <ul class="preview thumbnail nav nav-tabs center-img">
                                        <li class="nav-item"><a class="nav-link active center-img" data-toggle="tab"
                                                                href="#product_1"><img
                                                src="<%=list.get(0)%>" style="height: 68px;"
                                                alt=""/></a></li>
                                        <% int b = 1;
                                            for (int i = 1; i < list.size(); i++) {
                                                b++;%>
                                        <li class="nav-item"><a class="nav-link center-img" data-toggle="tab"
                                                                href="#product_<%=b%>"><img
                                                src="<%=list.get(i)%>" style="height: 68px;"
                                                alt=""/></a></li>
                                        <%}%>
                                    </ul>
                                    <button class="btn-primary btn" style="margin-left: 10px;" onclick="show1()">Tải ảnh
                                        lên
                                    </button>
                                    <button class="btn-primary btn" onclick="show2()">Danh sách ảnh</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải lên ảnh sản phẩm</label>
                                            <img src="user-template/img/icon/close.png" width="22px"
                                                 class="zmdi zmdi-close icon-close"
                                                 onclick="closeNew1()">
                                            <div class="promotion-content">
                                                <form id="upload-form" method="post"
                                                      enctype="multipart/form-data">
                                                    <input type="file" name="file-input"
                                                           class="dropify" id="file-input">
                                                    <button type="submit">Tải lên</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} else {%>
                                <%
                                    List<Image> imageList = ProductService.getImages(String.valueOf(product.getIdP()));
                                %>
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1"><img style="height: 300px;"
                                                                                         src="<%=imageList.get(0).getImg()%>"
                                                                                         class="img-fluid"
                                                                                         alt=""/>
                                        </div>
                                        <%
                                            int a = 1;
                                            for (int i = 1; i < imageList.size(); i++) {
                                                a++;
                                        %>
                                        <div class="tab-pane" id="product_<%=a%>"><img style="height: 300px;"
                                                                                       src="<%=imageList.get(i).getImg()%>"
                                                                                       class="img-fluid" alt=""/>
                                        </div>
                                        <%}%>
                                        <ul class="preview thumbnail nav nav-tabs center-img">
                                            <li class="nav-item"><a class="nav-link active center-img" data-toggle="tab"
                                                                    href="#product_1"><img style="height: 100px;"
                                                                                           src="<%=imageList.get(0).getImg()%>"
                                                                                           alt=""/></a></li>
                                            <%
                                                int b = 1;
                                                for (int i = 1; i < imageList.size(); i++) {
                                                    b++;
                                            %>
                                            <li class="nav-item"><a class="nav-link center-img" data-toggle="tab"
                                                                    href="#product_<%=b%>"><img style="height: 100px;"
                                                                                                src="<%=imageList.get(i).getImg()%>"
                                                                                                alt=""/></a></li>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <button class="btn-primary btn" style="margin-left: 10px;" onclick="show1()">Tải ảnh
                                        lên
                                    </button>
                                    <button class="btn-primary btn" onclick="show2()">Danh sách ảnh</button>
                                    <div id="show" class="promotion">
                                        <div class="promotion-box">
                                            <label class="title">Tải lên ảnh sản phẩm</label>
                                            <img src="user-template/img/icon/close.png" width="22px"
                                                 class="zmdi zmdi-close icon-close"
                                                 onclick="closeNew1()">
                                            <div class="promotion-content">
                                                <form id="upload-form" method="post"
                                                      enctype="multipart/form-data">
                                                    <input type="file" name="file-input"
                                                           class="dropify" id="file-input">
                                                    <button type="submit">Tải lên</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="show2" class="promotion">
                                        <div class="promotion-box" style="height: auto;">
                                            <label class="title" style="margin-top: 10px; flex: 1">Danh sách hình ảnh
                                                sản phẩm</label>
                                            <i class="zmdi zmdi-close icon-close"
                                               onclick="closeNew2()"></i>
                                            <div class="promotion-content list-img" id="list-img">
                                                <%
                                                    for (Image img1 : imageList) {
                                                %>
                                                <div class="img-item">
                                                    <i class="zmdi zmdi-delete icon-remove"
                                                       onclick="removeImg<%=img1.getId()%>(<%=img1.getId()%>)"></i>
                                                    <img src="<%=img1.getImg()%>" style="border-radius: 5px;">
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <%
                                    List<Categories> categoriesList = (List<Categories>) request.getAttribute("listCategories");
                                    List<Trademark> trademarks = (List<Trademark>) request.getAttribute("trademarks");
                                %>
                                <div class="col-xl-9 col-lg-8 col-md-12">
                                    <input value="<%=product.getIdP()%>" type="hidden" name="IdP" id="IdP">
                                    <label for="product_name">Tên sản phẩm</label>
                                    <div class="form-group">
                                        <input type="text" id="product_name" class="form-control"
                                               value="<%=product.getName()%>">
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="product_price">Giá sản phẩm</label>
                                            <div class="form-group">
                                                <input type="text" id="product_price" class="form-control"
                                                       value="<%=product.getPrice()%>">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="ware_quantity">Số lượng kho</label>
                                            <div class="form-group">
                                                <input type="text" id="ware_quantity" readonly class="form-control"
                                                       value="<%=WareHouseService.getWareHouse(product.getIdP()).getQuantity()%>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <label for="product_category">Phân loại sản phẩm</label>
                                            <div class="form-group">
                                                <select id="product_category"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <%
                                                        for (Categories category : categoriesList) {
                                                            String selected = "";
                                                            if (category.getIdC() == product.getIdC()) {
                                                                selected = "selected";
                                                            }
                                                    %>
                                                    <option value="<%=category.getIdC()%>" <%=selected%>><%=category.getNameC()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="product_trademark">Thương hiệu</label>
                                            <div class="form-group">
                                                <select id="product_trademark"
                                                        class="form-control show-tick ms select2"
                                                        data-placeholder="Select">
                                                    <%
                                                        for (Trademark trademark : trademarks) {
                                                            String selected = "";
                                                            if (trademark.getId() == product.getIdT()) {
                                                                selected = "selected";
                                                            }
                                                    %>
                                                    <option value="<%=trademark.getId()%>" <%=selected%>><%=trademark.getName()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <button class="btn-primary btn" onclick="show('promotion')">Cài đặt
                                                khuyến mãi
                                            </button>
                                            <button class="btn-primary btn" onclick="show('new')">Cài đặt sản phẩm
                                                mới
                                            </button>
                                        </div>
                                        <div class="col-sm-6"></div>
                                    </div>
                                    <div id="new-show" class="promotion">
                                        <div class="promotion-box">
                                            <label for="product_price" class="title">Cài đặt sản phẩm mới</label>
                                            <i class="zmdi zmdi-close icon-close"
                                               onclick="closeNew()"></i>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Ngày kết thúc</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="datetime-local" id="date-new"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <button onclick="newProduct(<%=product.getIdP()%>)"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">
                                                Cài đặt
                                            </button>
                                        </div>
                                    </div>
                                    <div id="promotion-show" class="promotion">
                                        <div class="promotion-box">
                                            <label for="product_price" class="title">Cài đặt sản phẩm khuyến
                                                mãi</label>
                                            <i class="zmdi zmdi-close icon-close"
                                               onclick="closePromotion()"></i>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Ngày bắt đầu</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="datetime-local" id="date1"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Ngày kết thúc</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="datetime-local" id="date2"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="promotion-content">
                                                <div class="label-text">
                                                    <label>Giá khuyến mãi</label>
                                                </div>
                                                <div class="form-group-date">
                                                    <input type="number" id="promotion-price"
                                                           class="form-control"
                                                           placeholder="Nhập giá khuyến mãi">
                                                </div>
                                            </div>
                                            <button onclick="promotionProduct(<%=product.getIdP()%>)"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">
                                                Cài đặt
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="body">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab"
                                                            href="#description">Mô tả</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#review">Đánh
                                        giá</a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class="card">
                            <div class="body">
                                <div class="tab-content tab-content1">
                                    <div class="tab-pane active" id="description">
                                        <div class="row clearfix">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <div class="form-line" style="width: 100%;">
                                                        <textarea rows="6" class="form-control no-resize"
                                                                  id="product_description"
                                                                  name="description"><%=product.getInformation()%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" onclick="saveProduct(<%=product.getIdP()%>)"
                                                class="btn btn-raised btn-primary btn-round waves-effect">Lưu
                                        </button>
                                        <a href="admin-product?command=delete&IdP=<%=product.getIdP()%>"
                                           class="btn btn-default waves-effect waves-float btn-sm waves-red"><i
                                                class="zmdi zmdi-delete"></i></a>
                                    </div>
                                    <div class="tab-pane" id="review">
                                        <% List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");%>
                                        <p id="size_review">Có <%=reviewList.size()%> đánh giá về sản phẩm</p>
                                        <ul class="row list-unstyled c_review mt-4" id="review1">
                                            <% for (Review review : reviewList) {
                                                Account acc = AccountService.getAccountById(review.getIdA());
                                            %>
                                            <li class="col-12" id="review_item">
                                                <div class="avatar">
                                                    <a href="javascript:void(0);"><img class="rounded"
                                                                                       src="<%=acc.getImg()%>"
                                                                                       alt="user"
                                                                                       width="60"></a>
                                                </div>
                                                <div class="comment-action">
                                                    <h5 class="c_name"><%=acc.getName()%> - <small
                                                            class="comment-date float-sm-right"><%=review.getDate()%>
                                                    </small></h5>
                                                    <p class="c_msg mb-0"><%=review.getInfomation()%>
                                                    </p>
                                                    <span class="m-l-10" id="admin_start_product">
                                                        <%=CountStar.starReview(review.getStar())%>
                                                    </span>
                                                </div>
                                                <small class="comment-date float-sm-right" style="cursor: pointer"
                                                       onclick="deleteReview(<%=review.getIdR()%>)"> Xóa
                                                </small>
                                            </li>
                                            <%}%>

                                        </ul>
                                        <div id="pagination"></div>
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
<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="admin-template/assets/plugins/dropify/js/dropify.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>

<%----%>
<script>
    function pagination() {
        $(document).ready(function () {
            var itemsPerPage = 5;
            var itemsCount = $('#review1 #review_item').length;
            var totalPages = Math.ceil(itemsCount / itemsPerPage);

            $('#pagination').pagination({
                items: itemsCount,
                itemsOnPage: itemsPerPage,
                cssStyle: 'light-theme',
                onPageClick: function (pageNumber) {
                    var startIndex = (pageNumber - 1) * itemsPerPage;
                    var endIndex = startIndex + itemsPerPage;
                    $('#review1 #review_item').hide().slice(startIndex, endIndex).show();
                }
            });

            $('#review1 #review_item').hide().slice(0, itemsPerPage).show();
        });
    }

    pagination();


    function deleteReview(id) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("review1").innerHTML = this.responseText;
                sizeReview();
                pagination();
            }
        };
        xhr.open("GET", "admin-product?command=deleteReview&action=size&id=" + id + "&idP=<%=product.getIdP()%>", true);
        xhr.send();
    }

    function sizeReview() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("size_review").innerHTML = this.responseText;
            }
        };
        xhr.open("GET", "admin-product?command=size&idP=<%=product.getIdP()%>", true);
        xhr.send();
    }


    $('.dropify').dropify();
    const form = document.getElementById('upload-form');
    const fileInput = document.getElementById('file-input');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const formData = new FormData();
        formData.append('file', fileInput.files[0]);
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'UpLoadImgPro', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                console.log('File uploaded successfully.');
                window.location.href = "admin-product?command=edit&IdP=<%=product.getIdP()%>";
            } else {
                console.log('An error occurred while uploading the file.');
            }
        };
        xhr.send(formData);
    });

    function saveProduct(idP) {
        var product_name = document.getElementById("product_name").value;
        var product_price = document.getElementById("product_price").value;
        var product_category = document.getElementById("product_category").value;
        var product_description = document.getElementById("product_description").value;
        var product_trademark = document.getElementById("product_trademark").value;
        if (product_name.trim() === '' || product_price.trim() === '' || product_category.trim() === ''
            || product_description.trim() === '' || product_trademark.trim() === '') {
            showAlert("Vui lòng nhập đầy đủ thông tin");
        } else {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "admin-product", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showNotification("Sản phẩm đã được cập nhật thành công");
                }
            };
            xhr.send("name=" + encodeURIComponent(product_name)
                + "&price=" + encodeURIComponent(product_price)
                + "&description=" + encodeURIComponent(product_description)
                + "&idC=" + encodeURIComponent(product_category)
                + "&trademark=" + encodeURIComponent(product_trademark)
                <% if (map != null){
                    int a = 0;
                    for (String img1:list1){ a++;%>
                + "&img<%=a%>=<%=img1%>" <%}}%>
                + "&idP=" + idP
                + "&command=edit");
        }
    }

    const notification = document.getElementById("notification");
    const alert = document.getElementById("alert");
    var box = document.getElementById('promotion-show');
    var box1 = document.getElementById('new-show');

    function showNotification(txt) {
        notification.innerHTML = txt;
        notification.style.display = "block";
        setTimeout(function () {
            notification.style.display = "none";
        }, 2000);
    }

    function showNotificationBox(txt) {
        notification.innerHTML = txt;
        notification.style.display = "block";
        box.style.display = 'none';
        setTimeout(function () {
            notification.style.display = "none";
        }, 2000);
    }

    function showNotificationBox1(txt) {
        notification.innerHTML = txt;
        notification.style.display = "block";
        box1.style.display = 'none';
        setTimeout(function () {
            notification.style.display = "none";
        }, 2000);
    }

    function showAlert(txt) {
        alert.innerHTML = txt;
        alert.style.display = "block";
        setTimeout(function () {
            alert.style.display = "none";
        }, 2000);
    }

    function promotionProduct(idP) {
        var date1 = document.getElementById("date1").value;
        var date2 = document.getElementById("date2").value;
        var price = document.getElementById("promotion-price").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-product", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotificationBox("Cập nhật khuyến mãi thành công");
            }
        };
        xhr.send("idP=" + idP
            + "&command=promotion"
            + "&date1=" + encodeURIComponent(formatDate(date1))
            + "&date2=" + encodeURIComponent(formatDate(date2))
            + "&price=" + encodeURIComponent(price));
    }

    function newProduct(idP) {
        var date1 = document.getElementById("date-new").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-product", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                showNotificationBox1("Cập nhật sản phẩm mới thành công");
            }
        };
        xhr.send("idP=" + idP
            + "&command=new"
            + "&date-new=" + encodeURIComponent(formatDate(date1)));
    }

    function formatDate(date) {
        let currentDate = new Date(date);
        let hours = currentDate.getHours();
        let minutes = currentDate.getMinutes();
        let seconds = currentDate.getSeconds();
        let ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12;
        let day = currentDate.getDate();
        let month = currentDate.getMonth() + 1;
        let year = currentDate.getFullYear();

        if (hours < 12) {
            hours = "0" + hours;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (month < 10) {
            month = "0" + month;
        }
        let formattedDate = hours + ":" + minutes + ":" + seconds + " " + ampm + " " + day + "/" + month + "/" + year;
        return formattedDate;
    }

    function show(command) {
        if (command == 'promotion') {
            var box = document.getElementById('promotion-show');
            box.style.display = 'flex';
        }
        if (command == 'new') {
            var box = document.getElementById('new-show');
            box.style.display = 'flex';
        }
    }

    function closePromotion() {

        var box = document.getElementById('promotion-show');
        box.style.display = 'none';
    }

    function closeNew() {

        var box = document.getElementById('new-show');
        box.style.display = 'none';

    }

    function show1() {
        var box = document.getElementById('show');
        box.style.display = 'flex';
    }

    function show2() {
        var box = document.getElementById('show2');
        box.style.display = 'flex';
    }

    function closeNew1() {

        var box = document.getElementById('show');
        box.style.display = 'none';

    }

    function closeNew2() {

        var box = document.getElementById('show2');
        box.style.display = 'none';

    }

    <%List<Image> imageList = ProductService.getImages(String.valueOf(product.getIdP()));
    for (Image item : imageList) {%>

    function removeImg<%=item.getId()%>(id) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "admin-product", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                loadImgList();
                window.location.href = "admin-product?command=edit&IdP=<%=product.getIdP()%>";
            }
        };
        xhr.send("idImg=" + id
            + "&command=deleteImg");
    }

    <%}%>

    function loadImgList() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("list-img").innerHTML = this.responseText;
            }
        };
        xhr.open("POST", "admin-product?command=loadImgP&idP=<%=product.getIdP()%>", true);
        xhr.send();
    }

</script><!-- Custom Js -->

</body>

</html>