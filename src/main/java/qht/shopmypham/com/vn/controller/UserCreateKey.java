package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.LoginService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "UserCreateKey", value = "/createKey")
public class UserCreateKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String repass = request.getParameter("repass");
        session.setAttribute("user", user);
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        if(password.equals(repass)){
            request.getRequestDispatcher("/user-template/createKey.jsp").forward(request, response);
        }else{
            response.sendRedirect("user-template/login.jsp");
        }



        // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính của ứng dụng


    }
}
