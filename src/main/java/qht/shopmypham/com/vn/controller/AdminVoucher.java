package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Voucher;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.VoucherService;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminVoucher", value = "/AdminVoucher")
public class AdminVoucher extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        request.setAttribute("voucher1", "toggled");
        String command = request.getParameter("command");
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
            if (acc.powerAccount().getVoucherManage() == 1) {
                idA = acc.getId();
                if (command.equals("list")) {
                    List<Voucher> voucherList = VoucherService.getAllVoucher();
                    request.setAttribute("voucherList", voucherList);
                    request.getRequestDispatcher("admin-template/vc-voucher-list.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách voucher";
                }
                if (command.equals("edit")) {
                    String id = request.getParameter("id");
                    Voucher voucher = VoucherService.getVoucherById(id);
                    request.setAttribute("voucher", voucher);
                    request.getRequestDispatcher("admin-template/vc-voucher-edit.jsp").forward(request, response);
                    content = "Truy cập trang quản lý chỉnh sửa voucher " + id;
                    action = 2;
                }
                if (command.equals("add")) {
                    request.getRequestDispatcher("admin-template/vc-voucher-add.jsp").forward(request, response);
                    content = "Truy cập trang quản lý thêm voucher";
                }
                if (command.equals("delete")) {
                    String id = request.getParameter("id");
                    VoucherService.deleteVoucherById(id);
                    response.sendRedirect("AdminVoucher?command=list");
                    level = 3;
                    action = 3;
                    content = "Xóa mã giảm giá " + id;
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
                if (command.equals("edit")) {
                    String id = request.getParameter("id");
                    String name = request.getParameter("name");
                    String price = request.getParameter("price");
                    String quantity = request.getParameter("quantity");
                    String status = request.getParameter("status");
                    String code = request.getParameter("code");
                    VoucherService.editVouchertById(id, name, price, status, quantity, code);
                    level = 2;
                    action = 2;
                    content = "Chỉnh sửa voucher " + id;
                }
                if (command.equals("add")) {
                    String name = request.getParameter("name");
                    String price = request.getParameter("price");
                    String quantity = request.getParameter("quantity");
                    String code = request.getParameter("code");
                    VoucherService.addVoucher(price, quantity, name, code);
                    level = 2;
                    action = 1;
                    content = "Thêm voucher ";
                }
                if (command.equals("delete")) {
                    String id = request.getParameter("id");
                    VoucherService.deleteVoucherById(id);
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
}
