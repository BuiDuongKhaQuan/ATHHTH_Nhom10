package qht.shopmypham.com.vn.controller;


import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Log;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminAccount", value = "/admin-account")
public class AdminAccount extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        request.setAttribute("account1","toggled");
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
            if (acc.powerAccount().getAccountManage() == 1) {
                idA = acc.getId();
                List<Account> accountList = AccountService.getAllAccount();
                String command = request.getParameter("command");
                if (command.equals("dashboard")) {
                    List<Account> accountList1 = AccountService.getAccountCheckout();
                    List<Account> accountsNocheckout = AccountService.getAccountNoCheckout();
                    List<Account> accesMonth = AccountService.getAccoutAccessByMonth();
                    List<Account> listAccoutLoyal = AccountService.getAccoutLoyal();
                    List<Log> signbyMonth = AccountService.getSignByMonth();
                    request.setAttribute("signbyMonth",signbyMonth);
                    request.setAttribute("listAccoutLoyal", listAccoutLoyal);
                    request.setAttribute("accesMonth", accesMonth);
                    request.setAttribute("accountsNocheckout", accountsNocheckout);
                    request.setAttribute("accountList", accountList);
                    request.setAttribute("accountList1", accountList1);
                    request.getRequestDispatcher("/admin-template/ac-dashboard.jsp").forward(request, response);
                    content = "Truy cập trang tổng quan tài khoản";
                }
                if (command.equals("profile")) {
                    Account account = acc.getAccount();
                    request.setAttribute("acc", account);
                    request.getRequestDispatcher("/admin-template/profile.jsp").forward(request, response);
                    content = "Truy cập trang cá nhân";
                }
                if (command.equals("list")) {
                    request.setAttribute("accountList", accountList);
                    request.getRequestDispatcher("/admin-template/ac-account-list.jsp").forward(request, response);
                    content = "Truy cập trang danh sách tài khoản";
                }
                if (command.equals("edit")) {
                    String IdA = request.getParameter("IdA");
                    Account account = AccountService.getAccountById(Integer.parseInt(IdA));
                    request.setAttribute("account", account);
                    request.getRequestDispatcher("/admin-template/ac-account-edit.jsp").forward(request, response);
                    content = "Truy cập trang chỉnh sửa tài khoản";
                }

                if (command.equals("delete")) {
                    String IdA = request.getParameter("IdA");
                    AccountService.deleteAccountById(IdA);
                    response.sendRedirect("admin-account?command=list");
                    action = 3;
                    level = 4;
                    content = "Xóa tài khoản " + idA;
                }
                if (command.equals("lock")){
                    String IdA = request.getParameter("id");
                    AccountService.lockUpAcountById("0",IdA);
                    action = 3;
                    level = 4;
                    content = "Khóa tài khoản " + idA;
                }
                if (command.equals("unLock")){
                    String IdA = request.getParameter("id");
                    AccountService.lockUpAcountById("1",IdA);
                    action = 3;
                    level = 4;
                    content = "Mở khóa tài khoản " + idA;
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
            if (acc.powerAccount().getAccountManage() == 1) {
                idA = acc.getId();
                String command = request.getParameter("command");
                if (command.equals("edit")) {
                    String idA1 = request.getParameter("idA");
                    String fullName = request.getParameter("fullName");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    AccountService.updateImgAcountByIdAll(fullName, email, phone, address, idA1);
                    action = 2;
                    level = 2;
                    content = "Chỉnh sửa tài khoản " + idA1;
                }
                if (command.equals("resetPass")) {
                    String idA1 = request.getParameter("id");
                    AccountService.resetPasswordAccountById(idA1, Encode.enCodeMD5("000000"));
                    action = 2;
                    level = 3;
                    content = "Đặt lại mật khẩu tài khoản " + idA1;
                }
                if (command.equals("editAuthur")) {
                    String idA1 = request.getParameter("idA");
                    String acountMana = request.getParameter("acountMana");
                    String productMana = request.getParameter("productMana");
                    String orderMana = request.getParameter("orderMana");
                    String blogMana = request.getParameter("blogMana");
                    String genaralMana = request.getParameter("genaralMana");
                    String homeMana = request.getParameter("homeMana");
                    String sliderlMana = request.getParameter("sliderlMana");
                    String voucherMana = request.getParameter("voucherMana");
                    if (acountMana.equals("true")) {
                        AccountService.updateacountMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lý tài khoản";
                    } else {
                        AccountService.updateacountMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lý tài khoản";
                    }
                    if (productMana.equals("true")) {
                        AccountService.updateproductMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lý sản phẩm";
                    } else {
                        AccountService.updateproductMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lý sản phẩm";
                    }
                    if (orderMana.equals("true")) {
                        AccountService.updateorderMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lý đơn hàng";
                    } else {
                        AccountService.updateorderMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lý đơn hàng";
                    }
                    if (blogMana.equals("true")) {
                        AccountService.updateblogMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lí blog";
                    } else {
                        AccountService.updateblogMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lí blog";
                    }
                    if (genaralMana.equals("true")) {
                        AccountService.updategenaralMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lí chung";
                    } else {
                        AccountService.updategenaralMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lí chung";
                    }
                    if (homeMana.equals("true")) {
                        AccountService.updatehomeMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lí trang chủ";
                    } else {
                        AccountService.updatehomeMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lí trang chủ";
                    }
                    if (sliderlMana.equals("true")) {
                        AccountService.updateSliderMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lí slider";
                    } else {
                        AccountService.updateSliderMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lí slider";
                    }
                    if (voucherMana.equals("true")) {
                        AccountService.updateVoucherMana("1", idA1);
                        action = 2;
                        level = 3;
                        content = "Cấp quyền quản lí voucher";
                    } else {
                        AccountService.updateVoucherMana("0", idA1);
                        action = 2;
                        level = 3;
                        content = "Thu hồi quyền quản lí voucher";
                    }

                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
}
