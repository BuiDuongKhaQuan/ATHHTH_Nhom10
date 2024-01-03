package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.GooglePojo;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.GoogleUtils;
import qht.shopmypham.com.vn.service.LoginService;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login-google")
public class LoginGoogle extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginGoogle() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            Account acc = LoginService.checkIdGoogle(googlePojo.getId());
            if (acc == null) {
                List<Account> accountList = AccountService.getAllAccount();
                int id = accountList.get(accountList.size()-1).getId() + 1;
                LoginService.signUpGoogle(googlePojo.getId(),googlePojo.getEmail(), id);
                acc = LoginService.getAccoutGoogle(googlePojo.getId());
                HttpSession session = request.getSession();
                session.setAttribute("a", acc);
//                response.sendRedirect("home");
                RequestDispatcher dis = request.getRequestDispatcher("home");
                dis.forward(request, response);
                level=2;
                action=2;
                content ="Đăng nhập tào khoản Google thất bại";
            }
            if (acc != null) {
                HttpSession session = request.getSession();
                session.setAttribute("a", acc);
                response.sendRedirect("home");
                level=2;
                action=2;
                content ="Đăng nhập tào khoản Google thành công";
            }
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
    }

}
