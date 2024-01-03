package qht.shopmypham.com.vn.controller;

import com.google.gson.JsonObject;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.LoginService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;
import qht.shopmypham.com.vn.tools.RSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "SignupController", value = "/signup")
public class UserSignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String publicKey = request.getParameter("publicKey");
        if (publicKey.length() == 0 || publicKey == "") {
            publicKey = (String) session.getAttribute("publicKey");
        }
        String user = (String) session.getAttribute("user");
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        Account acc = LoginService.checkUser(user);

        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();

        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (user == null || password == null) {
            response.sendRedirect("/login.jsp");
        } else {
            if (acc == null) {
                List<Account> accountList = AccountService.getAllAccount();
                Collections.reverse(accountList);
                int idA1 = accountList.get(0).getId() + 1;
                LoginService.signUp(user, Encode.enCodeMD5(password), email, idA1);
                LoginService.insertPublicKey(publicKey, idA1);
                session.invalidate();
                request.setAttribute("success", "Đăng ký thành công, mời bạn đăng nhập!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                action = 5;
                level = 2;
                content = "Đăng kí tài khoản thành công";

            } else {
                request.setAttribute("error", "Tên tài khoản đã tồn tại!");
                request.setAttribute("active", "active");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                action = 5;
                level = 2;
                content = "Đăng kí tài khoản thất bại";
            }
        }


        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }
}
