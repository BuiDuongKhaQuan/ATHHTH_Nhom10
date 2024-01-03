package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.ContactService;
import qht.shopmypham.com.vn.service.FAQsService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.TrademarkService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.EmailUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

@WebServlet(name = "AdminGeneral", value = "/admin-general")
public class AdminGeneral extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        Account acc = (Account) request.getSession().getAttribute("a");
        request.setAttribute("general1","toggled");
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
            if (acc.powerAccount().getGeneralManage() == 1) {
                idA = acc.getId();
                if (command.equals("list")) {
                    List<Contact> contact = ContactService.getAllContact();
                    request.setAttribute("contact", contact);
                    request.getRequestDispatcher("/admin-template/co-contact.jsp").forward(request, response);
                    content = "Truy cập trang danh sách liên hệ";
                }
                if (command.equals("question")) {
                    List<FAQs> faQsList = FAQsService.getAllFQAs();
                    request.setAttribute("faQsList", faQsList);
                    request.getRequestDispatcher("/admin-template/co-FAQs-list.jsp").forward(request, response);
                    content = "Truy cập trang danh sách FAQs";
                }
                if (command.equals("addQ")) {
                    request.getRequestDispatcher("/admin-template/co-FAQs-add.jsp").forward(request, response);
                    content = "Truy cập trang thêm FAQs";
                }
                if (command.equals("trademark")) {
                    List<Trademark> trademarkList = TrademarkService.getTrademarkAll();
                    request.setAttribute("trademarkList", trademarkList);
                    request.getRequestDispatcher("/admin-template/co-trademark-list.jsp").forward(request, response);
                    content = "Truy cập trang danh sách thương hiệu";
                }
                if (command.equals("editTrademark")) {
                    String idT = request.getParameter("idT");
                    Trademark trademark = TrademarkService.getTrademark(idT);
                    request.setAttribute("trademark", trademark);
                    request.getRequestDispatcher("/admin-template/co-trademark-edit.jsp").forward(request, response);
                    content = "Truy cập trang chỉnh sửa thương hiệu " + idT;
                }
                if (command.equals("addTrademark")) {
                    request.getRequestDispatcher("/admin-template/co-trademark-add.jsp").forward(request, response);
                    content = "Truy cập trang thêm thương hiệu";
                }
                if (command.equals("deleteTrademark")) {
                    String idT = request.getParameter("idT");
                    TrademarkService.deleteTrademarkById(idT);
                    response.sendRedirect("admin-general?command=trademark");
                    content = "Xóa thương hiệu " + idT;
                    level = 3;
                    action = 3;
                }
                if (command.equals("deleteContact")) {
                    String idCt = request.getParameter("idCt");
                    ContactService.deleteContactById(idCt);
                    response.sendRedirect("admin-general?command=list");
                    content = "Xóa liên hệ " + idCt;
                    level = 3;
                    action = 3;
                }
                if (command.equals("deleteFQAs")) {
                    String idF = request.getParameter("idF");
                    FAQsService.deleteFQAsById(idF);
                    response.sendRedirect("admin-general?command=question");
                    content = "Xóa FAQs " + idF;
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
            if (acc.powerAccount().getGeneralManage() == 1) {
                idA = acc.getId();
                HttpSession session = request.getSession();
                if (command.equals("answer")) {
                    String idCt = request.getParameter("idCt");
                    String reply = request.getParameter("reply");
                    try {
                        Contact contact = ContactService.getContactById(idCt);
                        Email email1 = new Email();
                        email1.setFrom("khaquan9a2.2016@gmail.com");
                        email1.setFromPasswork("xowopqrkiyjsdsbf");
                        email1.setTo(contact.getEmail());
                        email1.setSubject("Cửa hàng Mỹ Phẩm QST");
                        StringBuffer sb = new StringBuffer();
                        sb.append("Xin chào " + contact.getFullName() + "\n");
                        sb.append("Cám ơn bạn đã liên hệ với chúng tôi. \n");
                        sb.append(reply + "\n");
                        sb.append("Thân chào \n");
                        sb.append("Nhân viên chăm sóc khách hàng \n");
                        email1.setContent(sb.toString());
                        EmailUtil.send(email1);
                        ContactService.editContactById(idCt);
                    } catch (Exception e) {
                        request.setAttribute("message", e.getMessage());
                    }
                    content = "Quản trị viên đã trả lời liên hệ " + idCt;
                    level = 2;
                    action = 2;
                }
                if (command.equals("edit")) {
                    String question = request.getParameter("question");
                    String idF = request.getParameter("idF");
                    String answer = request.getParameter("answer");
                    String status = request.getParameter("status");
                    FAQsService.editFQAsById(idF, question, answer, status);
                    content = "Quản trị viên đã chỉnh sửa liên hệ " + idF;
                    level = 2;
                    action = 2;
                }
                if (command.equals("add")) {
                    String question = request.getParameter("question");
                    String answer = request.getParameter("answer");
                    String status = request.getParameter("status");
                    FAQsService.addFQAs(question, answer, status);

                }
                if (command.equals("editTrademark")) {
                    String name = request.getParameter("name");
                    String idT = request.getParameter("idT");
                    String address = request.getParameter("address");
                    String logo = request.getParameter("logo");
                    String status = request.getParameter("status");
                    String phone = request.getParameter("phone");
                    TrademarkService.editTrademarkById(idT, logo, name, address, phone, status);
                    session.removeAttribute("imgsTrademark");

                }
                if (command.equals("addTrademark")) {
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String logo = request.getParameter("logo");
                    String status = request.getParameter("status");
                    String phone = request.getParameter("phone");
                    TrademarkService.addTrademark(logo, name, address, phone, status);
                    session.removeAttribute("imgsTrademark");

                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
}
