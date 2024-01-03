package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Slider;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.SliderSerivce;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

@WebServlet(name = "AddBlogController", value = "/admin-slider")
public class AdminSlider extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Slider> sliderList = SliderSerivce.getAllSlider();
        request.setAttribute("slider1","toggled");
        String command = request.getParameter("command");
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
            if (acc.powerAccount().getSliderManage() == 1) {
                idA = acc.getId();

                if (command.equals("list")) {
                    request.setAttribute("sliderList", sliderList);
                    request.getRequestDispatcher("/admin-template/slider-list.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách slider";
                }
                if (command.equals("add")) {
                    request.getRequestDispatcher("/admin-template/slider-post.jsp").forward(request, response);
                    content = "Truy cập trang quản lý thêm slider";
                }
                if (command.equals("edit")) {
                    String IdSl = request.getParameter("IdSl");
                    Slider slider = SliderSerivce.getSliderById(IdSl);
                    request.setAttribute("slider", slider);
                    request.getRequestDispatcher("/admin-template/slider-edit.jsp").forward(request, response);
                    action = 2;
                    content = "Truy cập trang quản lý chỉnh sửa slider";
                }
                if (command.equals("delete")) {
                    String IdSl = request.getParameter("IdSl");
                    SliderSerivce.deleteSliderById(IdSl);
                    response.sendRedirect("admin-slider?command=list");
                    action = 3;
                    content="Xóa slider "+IdSl;

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
        String command = request.getParameter("command");
        String topic = request.getParameter("text");
        String img = request.getParameter("img");
        String status = request.getParameter("status");
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
            if (acc.powerAccount().getSliderManage() == 1) {
                idA = acc.getId();
                if (command.equals("add")) {
                    SliderSerivce.addSlider(img, topic);
                    level=2;
                    action=1;
                    content="Thêm slider ";
                }
                if (command.equals("edit")) {
                    String IdSl = request.getParameter("IdSl");
                    SliderSerivce.editSliderByIdAll(IdSl, img, topic, status);
                    level=2;
                    action=2;
                    content="Chỉnh sửa sản slider " +IdSl;
                }
                response.sendRedirect("admin-slider?command=list");
            } else {
                response.sendRedirect(error404);
            }
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }

}
