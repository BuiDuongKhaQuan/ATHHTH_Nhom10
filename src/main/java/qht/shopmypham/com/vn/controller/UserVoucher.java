package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Voucher;
import qht.shopmypham.com.vn.model.api;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.VoucherService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;

@WebServlet(name = "UserVoucher", value = "/voucher")
public class UserVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voucher> voucherList = VoucherService.getAllVoucherByStatusAndQuantity();
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        request.setAttribute("voucherList", voucherList);
        request.getRequestDispatcher("user-template/voucher.jsp").forward(request, response);
        content= "Truy cập trang danh sách voucher";
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        HttpSession session = request.getSession();
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (command.equals("voucher")) {
            int price = Integer.parseInt(request.getParameter("total"));
            String code = request.getParameter("code");
            Voucher voucher = VoucherService.getVoucherByCode(code);
            String rs = "";
            if (voucher != null) {
                if (voucher.getQuantity() > 0 && voucher.getStatus() == 1) {
                    int reduction = price * voucher.getPrice() / 100;
                    int priceLast = price - reduction;
                    rs = "<ul>\n" +
                            "                            <li>Đơn giá <span>" + Format.formatPrice(price) + "đ</span></li>\n" +
                            "                            <li>Phí vận chuyển <span>Chưa có thông tin</span></li>\n" +
                            "                            <li>Giảm giá <span>- " + Format.formatPrice(reduction) + "đ</span></li>\n" +
                            "                            <li>Tổng cộng <span>" + Format.formatPrice(priceLast) + "đ</span></li>\n" +
                            "                        </ul>\n" +
                            "                        <a href=\"checkout?command=checkout\" class=\"primary-btn\">THANH TOÁN</a>";
                    session.setAttribute("voucher", voucher);
                } else {
                    rs = "<ul>\n" +
                            "                            <li>Đơn giá <span>" + Format.formatPrice(price) + "đ</span></li>\n" +
                            "                            <li>Phí vận chuyển <span>Chưa có thông tin</span></li>\n" +
                            "                            <li>Giảm giá <span>0đ</span></li>\n" +
                            "                            <li>Tổng cộng <span>" + Format.formatPrice(price) + "đ</span></li>\n" +
                            "                        </ul>\n" +
                            "                        <a href=\"checkout?command=checkout\" class=\"primary-btn\">THANH TOÁN</a>";
                    session.removeAttribute("voucher");
                }
            }
            if (voucher == null) {
                session.removeAttribute("voucher");
                rs = "<ul>\n" +
                        "                            <li>Đơn giá <span>" + Format.formatPrice(price) + "đ</span></li>\n" +
                        "                            <li>Phí vận chuyển <span>Chưa có thông tin</span></li>\n" +
                        "                            <li>Giảm giá <span>0đ</span></li>\n" +
                        "                            <li>Tổng cộng <span>" + Format.formatPrice(price) + "đ</span></li>\n" +
                        "                        </ul>\n" +
                        "                        <a href=\"checkout?command=checkout\" class=\"primary-btn\">THANH TOÁN</a>";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(rs);
        }
        if (command.equals("mess")) {
            String code = request.getParameter("code");
            Voucher voucher = VoucherService.getVoucherByCode(code);
            String rs = "";
            if (voucher != null) {
                if (voucher.getQuantity() > 0 && voucher.getStatus() == 1) {
                    rs = "<p style=\"color: #1fdc0a\">Áp dụng thành công!</p>";
                    content ="Áp dụng mã thành công trong đơn hàng";
                    level=2;
                } else {
                    rs = "<p style=\"color: red\">Mã đã hết số lượng sử dụng!</p>";
                    content ="Áp dụng mã không thành công";
                    level=2;
                }
            }
            if (voucher == null) {
                rs = "<p style=\"color: red\">Mã giảm giá không hợp lệ!</p>\n";
                content ="Mã không hợp lệ";
                level=2;
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(rs);
        }

        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }
}
