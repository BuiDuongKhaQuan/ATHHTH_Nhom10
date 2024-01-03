package qht.shopmypham.com.vn.controller;


import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.LoginService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;

@WebServlet(name = "LoginController", value = "/login")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user");
        String passWord = request.getParameter("pass");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 10;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        Account acc = LoginService.getAccout(userName, Encode.enCodeMD5(passWord));
        if (acc == null) {
            request.setAttribute("mess", "Sai user hoặc mật khẩu!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            level = 3;
            content = "Đăng nhập thất bại";
        } else if (acc.getStatus() == 0) {
            idA = acc.getId();
            request.setAttribute("mess1", "Tài khoản của bạn đã bị khóa, vui lòng liên hệ với chúng tôi qua 'khaquan9a2.2016@gmail.com' !");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            level = 3;
            content = "Đăng nhập bằng tài khoản bị khóa";

        } else {
            idA = acc.getId();
            HttpSession session = request.getSession();
            session.setAttribute("a", acc);
            response.sendRedirect("home");
            level = 2;
            content = "Đăng nhập thành công";
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }
}
