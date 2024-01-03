package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "AdminHomeAll", value = "/AdminHomeAll")
public class AdminHomeAll extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        Account acc = (Account) request.getSession().getAttribute("a");
        request.setAttribute("home1", "toggled");
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
            if (acc.powerAccount().getHomeManage() == 1) {
                idA = acc.getId();
                if (command.equals("productHome")) {
                    request.getRequestDispatcher("/admin-template/home-product.jsp").forward(request, response);
                    content = "Truy cập trang quản lí sản phẩm trên trang chủ";
                }
                if (command.equals("cate")) {
                    Home home = HomeService.getHome();
                    List<Categories> categoriesList = CategoryService.getAllCategory();
                    List<Categories> categoriesHome = new ArrayList<>();
                    categoriesHome.add(CategoryService.getCategoriesById(String.valueOf(home.getIdC1())));
                    categoriesHome.add(CategoryService.getCategoriesById(String.valueOf(home.getIdC2())));
                    categoriesHome.add(CategoryService.getCategoriesById(String.valueOf(home.getIdC3())));
                    request.setAttribute("categoriesList", categoriesList);
                    request.setAttribute("categoriesHome", categoriesHome);
                    request.getRequestDispatcher("/admin-template/home-catagory.jsp").forward(request, response);
                    content = "Truy cập trang quản lí danh mục của trang chủ";
                }
                if (command.equals("selling")) {
                    List<Product> promotionProducts = new ArrayList<>();
                    List<PromotionProduct> promotionProductList = ProductService.getPromotion();
                    Selling selling = ProductService.getSelling();
                    String pattern = "hh:mm:ss a dd/MM/yyyy";
                    SimpleDateFormat formatter = new SimpleDateFormat(pattern);
                    for (PromotionProduct pp : promotionProductList) {
                        try {
                            Date date1 = formatter.parse(pp.getStartDay());
                            Date date2 = formatter.parse(pp.getEndDay());
                            Date dateNow1 = formatter.parse(DateUtil.getDateNow());
                            if (dateNow1.after(date1) && dateNow1.before(date2)) {
                                promotionProducts.add(ProductService.getProductById(pp.getIdP()));
                            }
                        } catch (ParseException e) {
                            throw new RuntimeException(e);
                        }
                    }
                    request.setAttribute("selling", selling);
                    request.setAttribute("promotionProducts", promotionProducts);
                    request.getRequestDispatcher("/admin-template/home-selling.jsp").forward(request, response);
                    content = "Truy cập trang quản lí sản phẩm ưu đãi";
                }
                if (command.equals("imageTrend")) {
                    List<String> content1 = new ArrayList<>();
                    List<String> img = new ArrayList<>();
                    List<ImageTrend> imageTrendList = HomeService.getImageFs();
                    for (int i = 0; i < 3; i++) {
                        content1.add(imageTrendList.get(i).getImg());
                    }
                    for (int i = 3; i < imageTrendList.size(); i++) {
                        img.add(imageTrendList.get(i).getImg());
                    }
                    request.setAttribute("contentTrends", content1);
                    request.setAttribute("imgTrends", img);
                    request.setAttribute("imageTrendList", imageTrendList);
                    request.getRequestDispatcher("/admin-template/home-image-trends.jsp").forward(request, response);
                    content = "Truy cập trang quản lí hình ảnh trend trong trang chủ";
                }
                if (command.equals("information")) {
                    Shop shop = ShopService.getShop();
                    request.setAttribute("shop", shop);
                    request.getRequestDispatcher("/admin-template/home-information.jsp").forward(request, response);
                    content = "Truy cập trang quản lí thông tin trên trang chủ";
                }
                if (command.equals("editTrend")) {
                    String idT = request.getParameter("idT");
                    ImageTrend imageTrend = HomeService.getImageTrendById(idT);
                    request.setAttribute("imgTrend", imageTrend);
                    request.getRequestDispatcher("/admin-template/home-image-trends-edit.jsp").forward(request, response);
                    content = "Truy cập trang quản lí chỉnh sửa hình ảnh trend";
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            if (acc.powerAccount().getHomeManage() == 1) {
                idA = acc.getId();
                if (command.equals("information")) {
                    String idS = request.getParameter("idS");
                    String phone = request.getParameter("phone");
                    String slogan = request.getParameter("slogan");
                    String contact = request.getParameter("contact");
                    String email = request.getParameter("email");
                    String name = request.getParameter("name");
                    String desginer = request.getParameter("desginer");
                    String logo_header = request.getParameter("logo_header");
                    String provinceID = request.getParameter("provinceID");
                    String districtID = request.getParameter("districtID");
                    String wardID = request.getParameter("wardID");

                    ShopService.editShop(idS, name, logo_header, slogan, phone, email, desginer, contact, provinceID, districtID, wardID);
                    HttpSession session = request.getSession();
                    session.removeAttribute("logo");
                    level = 2;
                    action = 2;
                    content = "Chỉnh sửa thông tin trên trang chủ " + idS;
                }
                if (command.equals("category")) {
                    String idC1 = request.getParameter("idC1");
                    String idC2 = request.getParameter("idC2");
                    String idC3 = request.getParameter("idC3");
                    HomeService.edit(idC1, idC2, idC3);
                    level = 2;
                    action = 2;
                    content = "Chỉnh sửa danh mục trên trang chủ " + idC1 + idC2 + idC3;
                }
                if (command.equals("quantity")) {
                    String quantityProS = request.getParameter("quantityProS");
                    String quantityProN = request.getParameter("quantityProN");
                    String quantityProP = request.getParameter("quantityProP");
                    String quantityBlog = request.getParameter("quantityBlog");
                    HomeService.editQuantity(quantityProP, quantityProN, quantityProS, quantityBlog);
                    level = 2;
                    action = 2;
                    content = "Chỉnh sửa sản phẩm khuyến mãi trên trang chủ";
                }
                if (command.equals("selling")) {
                    String idP = request.getParameter("idP");
                    String text = request.getParameter("text");
                    String text1 = request.getParameter("text1");
                    String text2 = request.getParameter("text2");
                    String text3 = request.getParameter("text3");
                    ProductService.editSelling(text, text1, text2, text3, idP);
                    level = 2;
                    action = 2;
                    content = "Chỉnh sửa sản phẩm ưu đãi  trên trang chủ";
                }
                if (command.equals("imgtrend")) {
                    String action1 = request.getParameter("action");
                    if (action1.equals("text")) {
                        String id = request.getParameter("id");
                        String topic = request.getParameter("topic");
                        String status = request.getParameter("status");
                        HomeService.editImgTrends(topic, id, status);
                        level = 2;
                        action = 2;
                        content = "Chỉnh sửa hình ảnh trend trong trang chủ";
                    }
                    if (action1.equals("trend")) {
                        String idT = request.getParameter("idT");
                        String imgT = request.getParameter("imgT");
                        String status = request.getParameter("status");
                        HomeService.editImgTrends(imgT, idT, status);
                        HttpSession session = request.getSession();
                        session.removeAttribute("imgsTrends");
                        level = 2;
                        action = 2;
                        content = "Chỉnh sửa sản phẩm khuyến mãi trên trang chủ";
                    }
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
}
