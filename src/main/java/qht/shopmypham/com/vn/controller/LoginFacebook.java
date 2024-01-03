package qht.shopmypham.com.vn.controller;

import com.restfb.types.User;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.RestFB;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.LoginService;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginFB", value = "/login-facebook")
public class LoginFacebook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginFacebook() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            String accessToken = RestFB.getToken(code);
            User user = RestFB.getUserInfo(accessToken);
            Account acc = LoginService.checkIdfacebook(user.getId());
            if (acc == null) {
                List<Account> accountList = AccountService.getAllAccount();
                int id = accountList.get(accountList.size()-1).getId() + 1;
                LoginService.signUpFacebook(user.getId(), user.getName(), id);
                acc = LoginService.getAccoutFacebook(user.getId());
                HttpSession session = request.getSession();
                session.setAttribute("a", acc);
                response.sendRedirect("home");
                level=2;
                action=2;
                content="Đăng kí bằng facebook thất bại";
            } else {
                acc = LoginService.getAccoutFacebook(user.getId());
                HttpSession session = request.getSession();
                session.setAttribute("a", acc);
                response.sendRedirect("home");
                content="Đăng kí bằng facebook thành công";
            }
            LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
