package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

@WebServlet(name = "AdminHome", value = "/admin-home")
public class AdminHome extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            if (acc.powerAccount().getGeneralManage() == 1 || acc.powerAccount().getOrderManage() == 1 || acc.powerAccount().getAccountManage() == 1
                    || acc.powerAccount().getBlogManage() == 1 || acc.powerAccount().getProductManage() == 1 || acc.powerAccount().getHomeManage() == 1) {
                idA = acc.getId();
                List<Product> productList = ProductService.getAllProduct();
                List<Account> accountList = AccountService.getAllAccount();
                List<Review> reviewList = ReviewService.getAllReview();
                List<CheckOut> checkOutList = CheckOutService.getAllCheckOut();
                request.setAttribute("checkOutList", checkOutList);
                request.setAttribute("active1", "active");
                request.setAttribute("accountList", accountList);
                request.setAttribute("productList", productList);
                request.setAttribute("reviewList", reviewList);
                request.getRequestDispatcher("/admin-template/index.jsp").forward(request, response);
                content="Truy cập trang chủ quản trị viên";
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
