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

@WebServlet(name = "AdminBlogController", value = "/admin-blog")
public class AdmintBlog extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        request.setAttribute("blog1","toggled");
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
            if (acc.powerAccount().getBlogManage() == 1) {
                idA = acc.getId();
                List<Blog> blogList = BlogService.getAllBlog();
                String command = request.getParameter("command");

                if (command.equals("list")) {
                    request.setAttribute("blogList", blogList);
                    request.getRequestDispatcher("/admin-template/bl-blog-list.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách blog";
                }
                if (command.equals("add")) {
                    request.getRequestDispatcher("/admin-template/bl-blog-post.jsp").forward(request, response);
                    content = "Truy cập trang quản lý thêm  blog";
                }
                if (command.equals("edit")) {
                    String IdBl = request.getParameter("IdBl");
                    Blog blog = BlogService.getBlogByIdBl(IdBl);
                    request.setAttribute("blog", blog);
                    request.getRequestDispatcher("/admin-template/bl-blog-edit.jsp").forward(request, response);
                    action = 2;
                    content = "Truy cập trang quản lý chỉnh sửa blog " + IdBl;
                }
                if (command.equals("delete")) {
                    String IdBl = request.getParameter("IdBl");
                    BlogService.deleteBlogByIdBl(IdBl);
                    response.sendRedirect("admin-blog?command=list");
                    content = "Xóa Blog " + IdBl;
                    level = 3;
                    action = 3;
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            if (acc.powerAccount().getBlogManage() == 1) {
                idA = acc.getId();
                String command = request.getParameter("command");
                HttpSession session = request.getSession();
                String topic = request.getParameter("topic");
                String img = request.getParameter("img");
                String link = request.getParameter("link");
                Account account = (Account) request.getSession().getAttribute("a");
                String content1 = request.getParameter("content");
                String date = DateUtil.getDateNow();

                if (command.equals("add")) {
                    BlogService.addBlogByIdBl(img, link, date, String.valueOf(account.getId()), topic, content1);
                    session.removeAttribute("imgBlog");
                    level=2;
                    action=1;
                    content="Thêm blog ";
                }
                if (command.equals("edit")) {
                    String IdBl = request.getParameter("IdBl");
                    BlogService.editBlogByIdBl(IdBl, img, link, String.valueOf(account.getId()), topic, content1);
                    session.removeAttribute("imgBlog");
                    level=2;
                    action=2;
                    content="Chỉnh sửa blog "+IdBl;
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
}
