package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.CountStar;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.*;

@WebServlet(name = "ProductAdminController", value = "/admin-product")
public class AdminProduct extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = ProductService.getAllProduct();
        List<Categories> listCategories = CategoryService.getAllCategory();
        List<Trademark> trademarks = TrademarkService.getTrademarkAll();
        String command = request.getParameter("command");
        Account acc = (Account) request.getSession().getAttribute("a");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            if (acc.powerAccount().getProductManage() == 1) {
                idA = acc.getId();
                if (command.equals("dashboard")) {
                    List<Product> unsold = WareHouseService.unsoldProduct();
                    List<WareHouse> wareHouseList = WareHouseService.warehouseProduct();
                    List<Product> inventoryProduct = WareHouseService.inventoryProduct();
                    List<Product> soldout = WareHouseService.soldout();
                    List<Product> soutProduct = WareHouseService.getProductSold();
                    request.setAttribute("productList1", productList);
                    request.setAttribute("soldout", soldout);
                    request.setAttribute("unsold", unsold);
                    request.setAttribute("inventoryProduct", inventoryProduct);
                    request.setAttribute("wareHouseList", wareHouseList);
                    request.setAttribute("soutProduct", soutProduct);
                    request.getRequestDispatcher("/admin-template/ec-dashboard.jsp").forward(request, response);
                    content = "Truy cập trang quản lý tổng quan sản phẩm";
                }
                if (command.equals("category")) {
                    request.setAttribute("listCategories", listCategories);
                    request.getRequestDispatcher("/admin-template/ec-category-list.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh mục sản phẩm";
                }
                if (command.equals("list")) {
                    List<Product> productListSell = ProductService.getProductIsSell(1);
                    request.setAttribute("productList", productListSell);
                    request.getRequestDispatcher("/admin-template/ec-product-list.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách sản phẩm";
                }
                if (command.equals("listPromotion")) {
                    List<PromotionProduct> promotionProductList = ProductService.getPromotion();
                    request.setAttribute("promotionProducts", promotionProductList);
                    request.getRequestDispatcher("/admin-template/ec-product-promotion.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách sản phẩm khuyến mãi";
                }
                if (command.equals("deletePromotion")) {
                    String id = request.getParameter("id");
                    ProductService.deletePromotion(id);
                    response.sendRedirect("admin-product?command=listPromotion");
                    content = "Xóa sản phẩm khuyến mãi" + id;
                }
                if (command.equals("listNew")) {
                    List<NewProduct> newProducts = ProductService.getAllNewProduct();
                    request.setAttribute("newProducts", newProducts);
                    request.getRequestDispatcher("/admin-template/ec-product-new.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách sản phẩm mới";
                }
                if (command.equals("deleteNew")) {
                    String id = request.getParameter("id");
                    ProductService.deleteNew(id);
                    response.sendRedirect("admin-product?command=listNew");
                    content = "Xóa sản phẩm mới" + id;
                }
                if (command.equals("edit")) {
                    request.setAttribute("product", "toggled");
                    String idP = request.getParameter("IdP");
                    Product product = ProductService.getProductById(Integer.parseInt(idP));
                    List<Review> reviewList = ReviewService.getAllReviewByIdP(idP);
                    Collections.reverse(reviewList);
                    request.setAttribute("product", product);
                    request.setAttribute("reviewList", reviewList);
                    request.setAttribute("trademarks", trademarks);
                    request.setAttribute("listCategories", listCategories);
                    request.getRequestDispatcher("/admin-template/ec-product-edit.jsp").forward(request, response);
                    content = "Truy cập trang quản lý chỉnh sửa sản phẩm";
                }
                if (command.equals("deleteReview")) {
                    String id = request.getParameter("id");
                    String idP = request.getParameter("idP");
                    ReviewService.deleteReview(id);
                    List<Review> reviewList = ReviewService.getAllReviewByIdP(idP);
                    Collections.reverse(reviewList);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    for (Review r : reviewList) {
                        Account account = AccountService.getAccountById(r.getIdA());
                        String start = CountStar.starReview(r.getStar());
                        response.getWriter().write("<li class=\"col-12\" id=\"review_item\">\n" +
                                "                                                <div class=\"avatar\">\n" +
                                "                                                    <a href=\"javascript:void(0);\"><img class=\"rounded\"\n" +
                                "                                                                                       src=\"" + account.getImg() + "\"\n" +
                                "                                                                                       alt=\"user\"\n" +
                                "                                                                                       width=\"60\"></a>\n" +
                                "                                                </div>\n" +
                                "                                                <div class=\"comment-action\">\n" +
                                "                                                    <h5 class=\"c_name\">" + acc.getName() + " <small\n" +
                                "                                                            class=\"comment-date float-sm-right\">" + r.getDate() + "\n" +
                                "                                                    </small></h5>\n" +
                                "                                                    <p class=\"c_msg mb-0\">" + r.getInfomation() + "\n" +
                                "                                                    </p>\n" +
                                "                                                    <span class=\"m-l-10\" id=\"admin_start_product\">\n" +
                                "                                                        " + start + "\n" +
                                "                                                    </span>\n" +
                                "                                                </div>\n" +
                                "                                                <small class=\"comment-date float-sm-right\"\n" +
                                "                                                       onclick=\"deleteReview(" + r.getIdR() + ")\"> Xóa\n" +
                                "                                                </small>\n" +
                                "                                            </li>");

                    }
                    level = 3;
                    action = 3;
                    content = "Xóa đánh giá sản phẩm" + idP;
                }
                if (command.equals("size")) {
                    String idP = request.getParameter("idP");
                    List<Review> reviewList = ReviewService.getAllReviewByIdP(idP);
                    response.getWriter().write("Có " + reviewList.size() + " đánh giá về sản phẩm");

                }
                if (command.equals("editC")) {
                    String IdC = request.getParameter("IdC");
                    Categories categories = CategoryService.getCategoriesById(IdC);
                    request.setAttribute("categories", categories);
                    request.getRequestDispatcher("/admin-template/ec-category-edit.jsp").forward(request, response);
                    level = 2;
                    action = 2;
                    content = "Chỉnh sửa danh mục sản phẩm" + IdC;
                }
                if (command.equals("add")) {
                    List<Product> productListSell = ProductService.getProductIsSell(0);
                    request.setAttribute("productList", productListSell);
                    request.getRequestDispatcher("/admin-template/ec-product-add.jsp").forward(request, response);
                    action = 1;
                    level = 2;
                    content = "Thêm sản phẩm";
                }
                if (command.equals("addC")) {
                    request.getRequestDispatcher("/admin-template/ec-category-add.jsp").forward(request, response);
                    action = 1;
                    level = 2;
                    content = "Thêm danh mục sản phẩm";
                }
                if (command.equals("delete")) {
                    String IdP = request.getParameter("IdP");
                    ProductService.editProductIsSell(0, IdP);
                    response.sendRedirect("admin-product?command=list");
                    action = 3;
                    level = 3;
                    content = "Xóa sản phẩm " + IdP;
                }
                if (command.equals("deleteC")) {
                    String IdC = request.getParameter("IdC");
                    CategoryService.deleteCategoryById(IdC);
                    response.sendRedirect("admin-product?command=category");
                    action = 3;
                    level = 3;
                    content = "Xóa danh mục sản phẩm " + IdC;
                }
                request.setAttribute("product1", "toggled");
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            if (acc.powerAccount().getProductManage() == 1) {
                idA = acc.getId();
                HttpSession session = request.getSession();
                String command = request.getParameter("command");
                String idP = request.getParameter("idP");
                String name = request.getParameter("name");
                String price = request.getParameter("price");
                String description = request.getParameter("description");
                String trademark = request.getParameter("trademark");
                String idC = request.getParameter("idC");

                if (command.equals("edit")) {
                    List<Image> imageList = ProductService.getImages(idP);
                    List<String> listImgPro = new ArrayList<>();
                    Map<String, String> mapImg = (Map<String, String>) request.getSession().getAttribute("imgs");
                    if (mapImg != null) {
                        for (int i = 0; i < mapImg.size(); i++) {
                            String img = request.getParameter("img" + (i + 1));
                            listImgPro.add(img);

                        }
                    }
                    if (imageList.size() >= listImgPro.size()) {
                        for (int i = 0; i < listImgPro.size(); i++) {
                            ProductService.editImgProductById(listImgPro.get(i), String.valueOf(imageList.get(i).getId()));
                        }
                    }
                    if (imageList.size() < listImgPro.size()) {
                        ProductService.deleteImgProduct(idP);
                        for (int i = 0; i < listImgPro.size(); i++) {
                            ProductService.addImageByIdP(idP, listImgPro.get(i));
                        }
                    }

                    ProductService.editProductById(name, trademark, description, idC, price, idP);
                    session.removeAttribute("imgs");
                    action = 2;
                    level = 2;
                    content = "Chỉnh sửa ảnh sản phẩm " + idP;

                }
                if (command.equals("add")) {
                    String idP1 = request.getParameter("idP1");
                    ProductService.editProductIsSell(1, idP1);
                    action = 1;
                    level = 2;
                    content = "Thêm sản phẩm " + idP;
                }
                if (command.equals("promotion")) {
                    String date1 = request.getParameter("date1");
                    String date2 = request.getParameter("date2");
                    String price1 = request.getParameter("price");
                    String idP1 = request.getParameter("idP");
                    ProductService.addProductPromotion(idP1, price1, date1, date2);
                    action = 1;
                    level = 2;
                    content = "Thêm sản phẩm khuyến mãi " + idP;
                }
                if (command.equals("new")) {
                    String date_new = request.getParameter("date-new");
                    String idP1 = request.getParameter("idP");
                    ProductService.addProductNew(idP1, date_new);
                    action = 1;
                    level = 2;
                    content = "Thêm sản phẩm mới";
                }
                if (command.equals("editC")) {
                    String IdC = request.getParameter("idC");
                    String img = request.getParameter("imgC");
                    String nameC = request.getParameter("nameC");
                    CategoryService.editCategoryById(IdC, nameC, img);
                    session.removeAttribute("imgsCategory");
                    action = 2;
                    level = 2;
                    content = "Chỉnh sửa danh mục sản phẩm " + idC;
                }
                if (command.equals("addC")) {
                    String nameC = request.getParameter("nameC");
                    String imgC = request.getParameter("imgC");
                    CategoryService.addCategory(nameC, imgC);
                    session.removeAttribute("imgsCategory");
                    action = 1;
                    level = 2;
                    content = "Thêm danh mục sản phẩm ";
                }
                if (command.equals("deleteImg")) {
                    String idImg = request.getParameter("idImg");
                    ProductService.deleteImgProductById(idImg);
                    action = 3;
                    level = 3;
                    content = "Xóa hình ảnh sản phẩm " + idP;
                }
                if (command.equals("loadImgP")) {
                    List<Image> imageList = ProductService.getImages(idP);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    for (Image img : imageList) {
                        response.getWriter().write("<div class=\"img-item\">\n" +
                                "                                                    <i class=\"zmdi zmdi-delete icon-remove\"\n" +
                                "                                                       onclick=\"removeImg" + img.getId() + "(" + img.getId() + ")\"></i>\n" +
                                "                                                    <img src=\"" + img.getImg() + "\" style=\"border-radius: 5px;\">\n" +
                                "                                                </div>");
                    }
                    action = 1;
                    level = 2;
                    content = "Thêm hình ảnh sản phẩm " + idP;
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
}
