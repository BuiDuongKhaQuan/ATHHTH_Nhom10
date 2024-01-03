package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Blog;
import qht.shopmypham.com.vn.service.BlogService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

@WebServlet(name = "BlogController", value = "/blog")
public class UserBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        List<Blog> blogList = BlogService.get8Blog();
        Account acc = (Account) request.getSession().getAttribute("a");
        request.setAttribute("activeBlog", "active");
        request.setAttribute("blogList", blogList);
        request.getRequestDispatcher("/user-template/blog.jsp").forward(request, response);
        if (acc != null) idA = acc.getId();
        content="Truy cập trang blog";
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
