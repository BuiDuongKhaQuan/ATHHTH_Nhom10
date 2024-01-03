package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Shop;
import qht.shopmypham.com.vn.service.ContactService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.ShopService;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;

@WebServlet(name = "Contact", value = "/contact")
public class UserContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        Shop shop = ShopService.getShop();
        request.setAttribute("activeContact", "active");
        request.setAttribute("shop", shop);
        request.getRequestDispatcher("/user-template/contact.jsp").forward(request, response);
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc != null) idA = acc.getId();
        content="Truy cập trang liên hệ";
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String content1 = request.getParameter("content");
        String ipAddress = request.getRemoteAddr();
        String command = request.getParameter("command");
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        String mess = "Cám ơn bạn đã liên hệ với chúng tôi, chúng tôi sẽ phản hồi tới bạn sớm nhất!";
        if (acc != null) {
            ContactService.addContact(String.valueOf(acc.getId()), email, content1, fullName);
        } else {
            ContactService.addContact(null, email, content1, fullName);
        }
        Shop shop = ShopService.getShop();
        if (command == null) {
            request.setAttribute("shop", shop);
            request.setAttribute("mess", mess);
            request.setAttribute("activeContact", "active");
            request.getRequestDispatcher("/user-template/contact.jsp").forward(request, response);
        } else {

        }
        if (acc != null) idA = acc.getId();
        content="Đã liên hệ thành công với cửa hàng";
        level=2;
        action=2;
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);


    }
}
