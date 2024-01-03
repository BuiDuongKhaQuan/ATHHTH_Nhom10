package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Image;
import qht.shopmypham.com.vn.model.ListProductByCart;
import qht.shopmypham.com.vn.model.Product;
import qht.shopmypham.com.vn.service.CartService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.ProductService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.text.NumberFormat;
import java.util.List;

@WebServlet(name = "AutoLoadCart", value = "/auto-load")
public class AutoLoadCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            List<ListProductByCart> list = CartService.getAllByIda(acc.getId());
            List<Product> productList = ProductService.getFavoriteProductByIdA(acc.getId());
            idA = acc.getId();
            if (command.equals("show")) {
                request.setAttribute("activePage", "active");
                request.setAttribute("list", list);
                request.getRequestDispatcher("/user-template/shopping-cart.jsp").forward(request, response);
                action = 4;
                level = 1;
                content = "Truy cập trang giỏ hàng";
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

            }
            if (command.equals("load_quantity")) {
                String cartQuantity = String.valueOf(list.size());
                if (acc != null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(cartQuantity);

                }
            }
            if (command.equals("load_quantity_favorite")) {
                String cartQuantity = String.valueOf(productList.size());
                if (acc != null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(cartQuantity);
                }
            }
            if (command.equals("quantity")) {
                for (ListProductByCart l : list) {
                    Product p = ProductService.getProductById(l.getIdP());
                    List<Image> imageList = ProductService.getImages(String.valueOf(p.getIdP()));
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("<tr>\n" + "                            <td class=\"product__cart__item\">\n" + "                                <div class=\"product__cart__item__pic\"\n" + "                                     style=\"width: 70px;height: 70px; margin-top: 15px;\">\n" + "                                    <img src=\"" + imageList.get(0).getImg() + "\" alt=\"\">\n" + "                                </div>\n" + "                                <div class=\"product__cart__item__text\">\n" + "                                    <h6>" + p.getName() + "\n" + "                                    </h6>\n" + "\n" + "                                </div>\n" + "                            </td>\n" + "                            <td class=\"cart__price\" style=\"    width: 340px;\">" + Format.formatPrice(p.getPrice()) + "đ</td>\n" + "                            <td class=\"quantity__item\">\n" + "                                <div class=\"quantity\" style=\" display: flex\">\n" + "                                    <div class=\"input-group-btn\" style=\"background-color: #111111; color: #FFFFFF\">\n" + "                                        <button onclick=\"upDateQuantity(" + p.getIdP() + ",'subItem')\"\n" + "                                                class=\"btn btn-sm btn-minus\" style=\"text-decoration: none\">\n" + "                                            <i class=\"fa fa-minus\"\n" + "                                               style=\"background-color: #111111; color: #FFFFFF\"></i>\n" + "                                        </button>\n" + "                                    </div>\n" + "                                    <span id=\"quantity-product\"\n" + "                                          class=\"form-control form-control-sm text-center  item-table\"\n" + "                                          style=\"width: 30px; \">" + l.getQuantity() + "</span>\n" + "                                    <div class=\"input-group-btn\" style=\"background-color: #111111; color: #FFFFFF\">\n" + "                                        <button onclick=\"upDateQuantity(" + p.getIdP() + ",'addItem')\"\n" + "                                                class=\"btn btn-sm btn-minus\" style=\"text-decoration: none\">\n" + "                                            <i class=\"fa fa-plus\"\n" + "                                               style=\"background-color: #111111; color: #FFFFFF\"></i>\n" + "                                        </button>\n" + "                                    </div>\n" + "                                </div>\n" + "                            </td>\n" + "                            <td class=\"cart__price__total\">" + Format.formatPrice(p.getPrice() * l.getQuantity()) + "đ</td>\n" + "                            <td class=\"cart__close\">\n" + "\n" + "                                <button style=\"background-color: rgba(38,255,0,0)\">\n" + "                                    <i onclick=\"upDateQuantity(" + p.getIdP() + ",'deleteItem')\"\n" + "                                               class=\"fa fa-close\" style=\"margin-left: 10px\"></i>\n" + "                                </button>\n" + "                            </td>\n" + "                        </tr>");

                }
            }
            if (command.equals("total")) {
                double totalPrice = 0;
                for (ListProductByCart l : list) {
                    Product p = ProductService.getProductById(l.getIdP());
                    totalPrice += (p.getPrice() * l.getQuantity());
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                if (list.size() != 0) {
                    response.getWriter().write(" <ul>\n" + "                        <li>Đơn giá <span>" + Format.formatPrice(totalPrice) + "đ</span></li>\n" + "                        <li>Phí vận chuyển <span>Chưa có thông tin</span></li>\n" + "<li>Giảm giá <span id=\"voucher\">- 0đ</span></li>" +"                        <li>Tổng cộng <span>" + Format.formatPrice(totalPrice) + "đ</span></li>\n" + "                    </ul>\n" + "                    <a href=\"checkout?command=checkout\" class=\"primary-btn\">THANH TOÁN</a>");
                } else {
                    response.getWriter().write(" <ul>\n" + "                        <li><span>Giỏ hàng trống mời bạn tiếp tục mua sắm</span></li>\n" + "                    </ul>\n" + "                    <a href=\"product\" class=\"primary-btn\">Tiếp tục mua hàng</a>");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}
