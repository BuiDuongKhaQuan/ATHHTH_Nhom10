package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.FAQs;
import qht.shopmypham.com.vn.service.FAQsService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

@WebServlet(name = "FAQsController", value = "/faqs")
public class UserFAQs extends HttpServlet {
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
        List<FAQs> FAQsList = FAQsService.getAllFQAsBy1();
        request.setAttribute("FAQsList", FAQsList);
        request.getRequestDispatcher("/user-template/FAQs.jsp").forward(request, response);

        if (acc != null) idA = acc.getId();
        content="Truy cập trang FAQs";
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
