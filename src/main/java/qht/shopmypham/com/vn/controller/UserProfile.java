package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.CheckOutService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.ProductCheckoutService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

@WebServlet(name = "Servlet", value = "/profile")
public class UserProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
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
            if (command.equals("out")) {
                session.invalidate();
                request.getRequestDispatcher("home").forward(request, response);
                level = 2;
                action = 2;
                content = "Đăng xuất tài khoản " + idA;
            }
            if (command.equals("profile")) {
                request.getRequestDispatcher("user-template/profile.jsp").forward(request, response);
                content = "Truy cập trang cá nhân";
            }
            if (command.equals("cancel")) {
                String idCk = request.getParameter("idCk");
                CheckOutService.updateStatusCancel(idCk);
                request.getRequestDispatcher("user-template/profile.jsp").forward(request, response);
                action = 8;
                level = 2;
                content = "Hủy đơn hàng";
            }
            if (command.equals("order-detail")) {
                String idCk = request.getParameter("idCk");
                CheckOut checkOut = CheckOutService.getCheckOutByIdCk(idCk);
                List<ListProductByCheckOut> listProductByCheckOuts = ProductCheckoutService.getProductProductCheckoutByIdCk(idCk);
                request.setAttribute("listProductByCheckOuts", listProductByCheckOuts);
                request.setAttribute("checkOut", checkOut);
                request.getRequestDispatcher("user-template/order-detail.jsp").forward(request, response);
                content = "Truy cập trang đơn hàng";
            }
            LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        String command = request.getParameter("command");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc != null) {
            idA = acc.getId();
            if (command.equals("edit")) {
                String email = request.getParameter("email");
                String fullName = request.getParameter("fullName");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                AccountService.editProfileAcountById(email, phone, fullName, address, String.valueOf(acc.getId()));
                level = 2;
                action = 2;
                content = "Chỉnh sửa thông tin cá nhân";
            }
            if (command.equals("change_pass")) {
                String idA1 = request.getParameter("idA");
                String pass = request.getParameter("pass");
                String newPass = request.getParameter("newPass");
                if (acc.getPass().equals(Encode.enCodeMD5(pass))) {
                    AccountService.changePasswordAccountById(idA1, Encode.enCodeMD5(newPass));
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("ok");
                    content = "Đổi mật khẩu thành công";
                } else {
                    request.setAttribute("mess3", "Thành công");
                    content = "Đổi mật khẩu không thành công";
                }
                level = 2;
                action = 2;
            }
            LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
