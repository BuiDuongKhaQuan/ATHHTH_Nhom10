package qht.shopmypham.com.vn.controller;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.CountStar;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@WebServlet(name = "Categories", value = "/product")
public class UserProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        HttpSession session = request.getSession();
        session.removeAttribute("voucher");
        Account acc = (Account) request.getSession().getAttribute("a");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc != null) idA = acc.getId();
        if (command.equals("product")) {
            String checked = "checked";
            List<Product> productList = ProductService.get9Product(0);
            List<Product> productList1 = ProductService.getProductIsSell(1);
            request.setAttribute("size", productList1.size());
            request.setAttribute("listProduct", productList);
            request.setAttribute("activeProduct", "active");
            request.setAttribute("checked0", checked);
            request.getRequestDispatcher("/user-template/product.jsp").forward(request, response);
            content = "Truy cập trang sản phẩm";
        }
        if (command.equals("category")) {
            String cid = request.getParameter("cid");
            System.out.println(cid);
            List<Product> productListByIdC = ProductService.getproductbyCata(cid);
            Categories categories = CategoryService.getCategoriesById(cid);
            request.setAttribute("size", productListByIdC.size());
            request.setAttribute("activeProduct", "active");
            request.setAttribute("categories", categories);
            request.setAttribute("listProduct", productListByIdC);
            request.getRequestDispatcher("/user-template/product.jsp").forward(request, response);
            content = "Lọc sản phẩm theo danh mục";
        }
        if (command.equals("trademark")) {
            String idT = request.getParameter("idT");
            List<Product> productList = ProductService.getProductByIdT(idT);
            Trademark trademark = TrademarkService.getTrademarkByIdT(idT);
            request.setAttribute("size", productList.size());
            request.setAttribute("listProduct", productList);
            request.setAttribute("trademark", trademark);
            request.getRequestDispatcher("/user-template/product.jsp").forward(request, response);
            content = "Lọc sản phẩm theo thương hiệu";
        }
        if (command.equals("favorite")) {
            if (acc == null) request.getRequestDispatcher("login.jsp").forward(request, response);
            if (acc != null) idA = acc.getId();
            List<Product> productList = ProductService.getFavoriteProductByIdA(acc.getId());
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/user-template/favorite-product.jsp").forward(request, response);
            content = "Truy cập trang sản phẩm yêu thích";
        }
        if (command.equals("search-header")) {
            String name = request.getParameter("name-product");
            request.setCharacterEncoding("UTF-8");
            List<Product> productList = ProductService.getProductByName(name);
            request.setAttribute("size", productList.size());
            request.setAttribute("activeProduct", "active");
            request.setAttribute("checked0", "checked");
            request.setAttribute("listProduct", productList);
            request.getRequestDispatcher("/user-template/product.jsp").forward(request, response);
            content = "Tìm kiếm sản phẩm trên menu";
        }
        if (command.equals("search")) {
            String name = request.getParameter("name");
            request.setCharacterEncoding("UTF-8");
            List<Product> listProductBySearch = ProductService.getProductByName(name);
            request.setAttribute("txtSearch", name);
            request.setAttribute("txtSearch1", name);
            request.setAttribute("size", listProductBySearch.size());
            content = "Tìm kiếm sản phẩm trong trang sản phẩm";
            for (Product p : listProductBySearch) {
                List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                List<Review> reviewList = ReviewService.getAllReviewByIdP(String.valueOf(p.getIdP()));
                double avgStart = 0;
                double sum = 0;
                String chr = "";
                if (acc != null) {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"insertItem(" + p.getIdP() + ")\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                } else {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"inform()\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                }
                for (Review r : reviewList) {
                    sum += r.getStar();
                }
                avgStart = sum / reviewList.size();
                response.setContentType("application/json");
                response.getWriter().write("<div class=\"col-lg-4 col-md-6 col-sm-6\" id=\"product_item\">\n" +
                        "                        <div class=\"product__item\" style=\"background-color: rgba(130,140,230,0.11)\">\n" +
                        "                            <div class=\"product__item__pic set-bg\" style=\"background-image: url(" + imageList.get(0).getImg() + ");\"> \n" +
                        "                                <ul class=\"product__hover\">\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"addFavorite(" + p.getIdP() + ")\"\n" +
                        "                                                                            src=\"user-template/img/icon/heart.png\"\n" +
                        "                                                                           alt=\"\"><span>Yêu thích</span></a></li>\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"category(" + p.getIdC() + ")\"\n" +
                        "                                                                            src=\"user-template/img/icon/compare.png\"\n" +
                        "                                                                           alt=\"\">\n" +
                        "                                        <span>Cùng loại</span></a></li>\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"detailProduct(" + p.getIdP() + ")\"\n" +
                        "                                                                           src=\"user-template/img/icon/view.png\"\n" +
                        "                                                                           alt=\"\"><span>Chi tiết</span></a></li>\n" +
                        "                                   " + chr + "\n" +
                        "                                </ul>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"product__item__text\">\n" +
                        "                                <h6 onclick=\"detailProduct(" + p.getIdP() + ")\" style=\"cursor: pointer\">" + p.getName() + "\n" +
                        "                                </h6>\n" +
                        "                                <div class=\"rating\" >\n" +
                        "                                    " + CountStar.star(avgStart, reviewList.size()) + "\n" +
                        "                                </div>\n" +
                        "                                <h5>" + Format.formatPrice(p.getPrice()) + "đ</h5>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>");
            }

        }
        if (command.equals("arrange")) {
            String action1 = request.getParameter("action");
            List<Product> productList = new ArrayList<>();
            if (action1.equals("ascending")) {
                productList = ProductService.getProductSortDescendingByPrice();
                content = "Sắp xếp sản phẩm theo giá tăng dần";
            }
            if (action1.equals("decrease")) {
                productList = ProductService.getProductSortAscendingByPrice();
                content = "Sắp xếp sản phẩm theo giá giảm dần";
            }
            request.setAttribute("size", productList.size());
            for (Product p : productList) {
                List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                List<Review> reviewList = ReviewService.getAllReviewByIdP(String.valueOf(p.getIdP()));
                double avgStart = 0;
                double sum = 0;
                String chr = "";
                if (acc != null) {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"insertItem(" + p.getIdP() + ")\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                } else {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"inform()\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                }
                for (Review r : reviewList) {
                    sum += r.getStar();
                }
                avgStart = sum / reviewList.size();
                response.setContentType("application/json");
                response.getWriter().write("<div class=\"col-lg-4 col-md-6 col-sm-6\" id=\"product_item\">\n" +
                        "                        <div class=\"product__item\" style=\"background-color: rgba(130,140,230,0.11)\">\n" +
                        "                            <div class=\"product__item__pic set-bg\" style=\"background-image: url(" + imageList.get(0).getImg() + ");\"> \n" +
                        "                                <ul class=\"product__hover\">\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"addFavorite(" + p.getIdP() + ")\"\n" +
                        "                                                                            src=\"user-template/img/icon/heart.png\"\n" +
                        "                                                                           alt=\"\"><span>Yêu thích</span></a></li>\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"category(" + p.getIdC() + ")\"\n" +
                        "                                                                            src=\"user-template/img/icon/compare.png\"\n" +
                        "                                                                           alt=\"\">\n" +
                        "                                        <span>Cùng loại</span></a></li>\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"detailProduct(" + p.getIdP() + ")\"\n" +
                        "                                                                           src=\"user-template/img/icon/view.png\"\n" +
                        "                                                                           alt=\"\"><span>Chi tiết</span></a></li>\n" +
                        "                                   " + chr + "\n" +
                        "                                </ul>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"product__item__text\">\n" +
                        "                                <h6 onclick=\"detailProduct(" + p.getIdP() + ")\" style=\"cursor: pointer\">" + p.getName() + "\n" +
                        "                                </h6>\n" +
                        "                                <div class=\"rating\" >\n" +
                        "                                    " + CountStar.star(avgStart, reviewList.size()) + "\n" +
                        "                                </div>\n" +
                        "                                <h5>" + Format.formatPrice(p.getPrice()) + "đ</h5>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>");
            }
        }
        if (command.equals("filterPrice")) {
            int price1 = Integer.parseInt(request.getParameter("price1"));
            int price2 = Integer.parseInt(request.getParameter("price2"));
            List<Product> productList = new ArrayList<>();
            if (price2 == 600000) {
                List<Product> list = ProductService.getProductByPrice600(price2);
                for (Product p : list) {
                    productList.add(p);
                }
            } else {
                List<Product> list = ProductService.getProductByPrice(price1, price2);
                for (Product p : list) {
                    productList.add(p);
                }
            }
            request.setAttribute("size", productList.size());
            request.setAttribute("listProduct", productList);
            request.getRequestDispatcher("/user-template/product.jsp").forward(request, response);
            content = "Lọc sản phẩm theo giá";

        }
        if (command.equals("pagination")) {
            int startIndex = Integer.parseInt(request.getParameter("startIndex"));
            List<Product> productList = ProductService.get9Product(startIndex);
            for (Product p : productList) {
                List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                List<Review> reviewList = ReviewService.getAllReviewByIdP(String.valueOf(p.getIdP()));
                double avgStart = 0;
                double sum = 0;
                String chr = "";
                if (acc != null) {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"insertItem(" + p.getIdP() + ")\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                } else {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"inform()\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                }
                for (Review r : reviewList) {
                    sum += r.getStar();
                }
                avgStart = sum / reviewList.size();
                response.getWriter().write("<div class=\"col-lg-4 col-md-6 col-sm-6\" id=\"product_item\">\n" +
                        "                        <div class=\"product__item\" style=\"background-color: rgba(130,140,230,0.11)\">\n" +
                        "                            <div class=\"product__item__pic set-bg\" style=\"background-image: url(" + imageList.get(0).getImg() + ");\"> \n" +
                        "                                <ul class=\"product__hover\">\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"addFavorite(" + p.getIdP() + ")\"\n" +
                        "                                                                            src=\"user-template/img/icon/heart.png\"\n" +
                        "                                                                           alt=\"\"><span>Yêu thích</span></a></li>\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"category(" + p.getIdC() + ")\"\n" +
                        "                                                                            src=\"user-template/img/icon/compare.png\"\n" +
                        "                                                                           alt=\"\">\n" +
                        "                                        <span>Cùng loại</span></a></li>\n" +
                        "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"detailProduct(" + p.getIdP() + ")\"\n" +
                        "                                                                           src=\"user-template/img/icon/view.png\"\n" +
                        "                                                                           alt=\"\"><span>Chi tiết</span></a></li>\n" +
                        "                                   " + chr + "\n" +
                        "                                </ul>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"product__item__text\">\n" +
                        "                                <h6 onclick=\"detailProduct(" + p.getIdP() + ")\" style=\"cursor: pointer\">" + p.getName() + "\n" +
                        "                                </h6>\n" +
                        "                                <div class=\"rating\" >\n" +
                        "                                    " + CountStar.star(avgStart, reviewList.size()) + "\n" +
                        "                                </div>\n" +
                        "                                <h5>" + Format.formatPrice(p.getPrice()) + "đ</h5>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>");
            }
        }

        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
        if (command.equals("filter")) {
            String cate = request.getParameter("cate");
            String trade = request.getParameter("trade");
            String minPrice = request.getParameter("minPrice");
            String maxPrice = request.getParameter("maxPrice");

            System.out.println(cate);
            System.out.println(minPrice);
            System.out.println(maxPrice);
            System.out.println(trade);
            System.out.println("----------");

            List<Product> listProduct = ProductService.filterAll(cate, trade, minPrice, maxPrice);
            request.setAttribute("size", listProduct.size());
            for (Product p : listProduct) {
                List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                List<Review> reviewList = ReviewService.getAllReviewByIdP(String.valueOf(p.getIdP()));
                double avgStart = 0;
                double sum = 0;
                String chr = "";
                if (acc != null) {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"insertItem(" + p.getIdP() + ")\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                } else {
                    chr = "<li><a href=\"javascript:void(0);\"><img onclick=\"inform()\"\n" +
                            "                                                                           src=\"user-template/img/icon/add-to-basket.png\"\n" +
                            "                                                                           alt=\"\"><span>Thêm vào giỏ</span></a></li>";
                }
                if (listProduct.size() > 0) {
                    for (Review r : reviewList) {
                        sum += r.getStar();
                    }
                    avgStart = sum / reviewList.size();
                    response.setContentType("application/json");
                    response.getWriter().write("<div class=\"col-lg-4 col-md-6 col-sm-6\" id=\"product_item\">\n" +
                            "                        <div class=\"product__item\" style=\"background-color: rgba(130,140,230,0.11)\">\n" +
                            "                            <div class=\"product__item__pic set-bg\" style=\"background-image: url(" + imageList.get(0).getImg() + ");\"> \n" +
                            "                                <ul class=\"product__hover\">\n" +
                            "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"addFavorite(" + p.getIdP() + ")\"\n" +
                            "                                                                            src=\"user-template/img/icon/heart.png\"\n" +
                            "                                                                           alt=\"\"><span>Yêu thích</span></a></li>\n" +
                            "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"category(" + p.getIdC() + ")\"\n" +
                            "                                                                            src=\"user-template/img/icon/compare.png\"\n" +
                            "                                                                           alt=\"\">\n" +
                            "                                        <span>Cùng loại</span></a></li>\n" +
                            "                                    <li><a href=\"javascript:void(0);\"><img onclick=\"detailProduct(" + p.getIdP() + ")\"\n" +
                            "                                                                           src=\"user-template/img/icon/view.png\"\n" +
                            "                                                                           alt=\"\"><span>Chi tiết</span></a></li>\n" +
                            "                                   " + chr + "\n" +
                            "                                </ul>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"product__item__text\">\n" +
                            "                                <h6 onclick=\"detailProduct(" + p.getIdP() + ")\" style=\"cursor: pointer\">" + p.getName() + "\n" +
                            "                                </h6>\n" +
                            "                                <div class=\"rating\" >\n" +
                            "                                    " + CountStar.star(avgStart, reviewList.size()) + "\n" +
                            "                                </div>\n" +
                            "                                <h5>" + Format.formatPrice(p.getPrice()) + "đ</h5>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>");
                } else {
                    response.setContentType("application/json");
                    response.getWriter().write("  <div class=\"col-lg-9\">Trống</div>");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_id = request.getParameter("IdP");
        String quantity = "1";
        String command = request.getParameter("command");
        Account acc = (Account) request.getSession().getAttribute("a");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;

        if (acc != null) {
            idA = acc.getId();
            ListProductByCart byCart = CartService.checkProduct(product_id, String.valueOf(acc.getId()));
            if (command.equals("insertItem")) {
                if (byCart == null) {
                    CartService.addProductToCart(product_id, quantity, String.valueOf(acc.getId()));
                    level = 2;
                    action = 1;
                    content = "Thêm sản phẩm vào giỏ hàng " + product_id;
                } else {
                    int quantity1 = byCart.getQuantity();
                    CartService.upQuantityProductListProductByCart(String.valueOf(quantity1 + 1), product_id, String.valueOf(acc.getId()));
                    level = 2;
                    action = 1;
                    content = "Cập nhật số lượng sản phẩm vào giỏ hàng " + product_id;
                }
            }
            if (command.equals("addItem")) {
                if (byCart != null) {
                    int quantity1 = byCart.getQuantity();
                    CartService.upQuantityProductListProductByCart(String.valueOf(quantity1 + 1), product_id, String.valueOf(acc.getId()));
                    level = 2;
                    action = 1;
                    content = "Thêm sản phẩm vào giỏ hàng " + product_id;
                }
            }
            if (command.equals("subItem")) {
                int quantity1 = byCart.getQuantity();
                if (quantity1 > 1) {
                    CartService.upQuantityProductListProductByCart(String.valueOf(quantity1 - 1), product_id, String.valueOf(acc.getId()));
                    level = 2;
                    action = 1;
                    content = "Xóa 1 sản phẩm ra khỏi giỏ hàng " + product_id;
                }
                if (quantity1 == 1) {
                    CartService.deleteProductByIdpAndIda(product_id, String.valueOf(acc.getId()));
                    level = 2;
                    action = 2;
                    content = "Xóa sản phẩm ra khỏi giỏ hàng " + product_id;
                }
            }
            if (command.equals("deleteItem")) {
                CartService.deleteProductByIdpAndIda(product_id, String.valueOf(acc.getId()));
                level = 3;
                action = 3;
                content = "Xóa sản phẩm ra khỏi giỏ hàng " + product_id;

            }
            if (command.equals("favorite")) {
                Favorite favorite = ProductService.getFavoriteProduct(product_id, String.valueOf(acc.getId()));
                if (favorite == null) {
                    ProductService.addFavoriteProduct(product_id, String.valueOf(acc.getId()));
                    level = 2;
                    action = 1;
                    content = "Thêm sản phẩm vào danh sách sản phẩm yêu thích " + product_id;
                }
            }
            if (command.equals("delete-favorite")) {
                ProductService.deleteFavoriteProduct(product_id, String.valueOf(acc.getId()));
                level = 3;
                action = 3;
                content = "Xóa sản phẩm khỏi danh sách sản phẩm yêu thích " + product_id;
            }
            if (command.equals("load_list_favorite")) {
                List<Product> productList = ProductService.getFavoriteProductByIdA(acc.getId());
                level = 2;
                action = 1;
                content = "Cập nhật số lượng sản phẩm yêu thích " + product_id;
                if (productList.size() != 0) {
                    for (Product p : productList) {
                        List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                        Categories category = CategoryService.getCategoriesById(String.valueOf(p.getIdC()));
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write("<tr>\n" +
                                "                                        <th scope=\"row\" class=\"border-0\">\n" +
                                "                                            <div class=\"p-2\">\n" +
                                "                                                <img src=\"" + imageList.get(0).getImg() + "\"\n" +
                                "                                                     alt=\"\"\n" +
                                "                                                     width=\"70\" class=\"img-fluid rounded shadow-sm\">\n" +
                                "                                                <div class=\"ml-3 d-inline-block align-middle\">\n" +
                                "                                                    <h5 class=\"mb-0\"><a href=\"javascript:void(0);\"\n" +
                                "                                                                        onclick=\"detailProduct(" + p.getIdP() + ")\"\n" +
                                "                                                                        class=\"text-dark d-inline-block align-middle\"\n" +
                                "                                                                        style=\"width: 500px;overflow: hidden;white-space: nowrap;\n" +
                                "                                                                        text-overflow: ellipsis;\">" + p.getName() + "\n" +
                                "                                                    </a></h5><span onclick=\"category(" + p.getIdC() + ")\"\n" +
                                "                                                                   class=\"text-muted font-weight-normal font-italic d-block\">Danh mục: " + category.getNameC() + "</span>\n" +
                                "                                                </div>\n" +
                                "                                            </div>\n" +
                                "                                        </th>\n" +
                                "                                        <td class=\"border-0 align-middle\"><strong>" + Format.formatPrice(p.getPrice()) + "đ</strong>\n" +
                                "                                        </td>\n" +
                                "                                        <td class=\"border-0 align-middle\"><a href=\"javascript:void(0);\"\n" +
                                "                                                                             onclick=\"insertItem(" + p.getIdP() + ")\"\n" +
                                "                                                                             class=\"text-dark flex-table\">\n" +
                                "                                            <i class=\"fa fa-shopping-cart\"></i>\n" +
                                "                                        </a></td>\n" +
                                "                                        <td class=\"border-0 align-middle\"><a href=\"javascript:void(0);\"\n" +
                                "                                                                             onclick=\"deleteFavorite(" + p.getIdP() + ")\"\n" +
                                "                                                                             class=\"text-dark\"\n" +
                                "                                                                             style=\"margin-left: 10px;\"><i\n" +
                                "                                                class=\"fa fa-trash\"></i></a></td>\n" +
                                "                                    </tr>");

                    }
                } else {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("<tr>\n" +
                            "                                        <th>\n" +
                            "                                        Không có sản phẩm yêu thích!\n" +
                            "                                        </th>\n" +
                            "                                    </tr>");
                }
            }
            LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

        }
    }
}