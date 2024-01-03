package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Email;
import qht.shopmypham.com.vn.model.OTP;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.OTPService;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.EmailUtil;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@WebServlet(name = "ForgotPassController", value = "/forgot-password")
public class UserForgotPass extends HttpServlet {
    int count = 1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        HttpSession session = request.getSession();
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (command.equals("forgot")) {
            try {

                String email = request.getParameter("email");
                String user = request.getParameter("user");
                String number = String.format("%06d", new Random().nextInt(999999));
                Account acc = AccountService.getAccountByUserAndEmail(user, email);
                session.setAttribute("account_forgot_pass", acc);
                if (acc == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("<i class=\"bx bx-error-circle\"></i>\n" +
                            "                <label>Tài khoản hoặc email không đúng!</label>");
                } else {
                    idA = acc.getId();
                    Email email1 = new Email();
                    email1.setFrom("khaquan9a2.2016@gmail.com");
                    email1.setFromPasswork("xowopqrkiyjsdsbf");
                    email1.setTo(email);
                    email1.setSubject("Quên mật khẩu");
                    StringBuffer sb = new StringBuffer();
                    sb.append("Chào ").append(user + ". ");
                    sb.append("Bạn đang sử dụng chức năng quên mật khẩu.\n");
                    sb.append("Mật mã OTP của bạn là ").append(number + ".\n");
                    sb.append("Mã có hiệu lực trong 3 phút!");
                    email1.setContent(sb.toString());
                    EmailUtil.send(email1);
                    OTPService.addOTP(String.valueOf(acc.getId()), String.valueOf(number));
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("active");
                    content ="Quên mật khẩu gửi otp thành công";
                    level= 3;
                    action= 9;
                }
            } catch (Exception e) {
                request.setAttribute("mess", e.getMessage());
            }
        }
        if (command.equals("forgot_otp")) {
            String reOtp = request.getParameter("otp");
            String pass = request.getParameter("pass");
            String repass = request.getParameter("repass");
            Account acc = (Account) request.getSession().getAttribute("account_forgot_pass");
            String idA1 = String.valueOf(acc.getId());
            List<OTP> otpList = OTPService.getOTPByIdA(idA1);
            Collections.reverse(otpList);
            String otp = String.valueOf(otpList.get(0).getOTP());
            if (count < 3) {
                if (reOtp.equals(otp) && pass.equals(repass)) {
                    AccountService.changePasswordAccountById(idA1, Encode.enCodeMD5(pass));
                    request.getSession().removeAttribute("account_forgot_pass");
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("<div class=\"remember-forgot\"\n" +
                            "                     style=\"justify-content: space-evenly; color: #009d0c; font-size: 0.96em;\">\n" +
                            "                    <i class=\"fa-light fa-check\"></i>\n" +
                            "                    <label>Đổi mật khẩu thành công! <a href=\"login.jsp\">Đăng nhập</a></label>\n" +
                            "                </div>");
                    content ="Cập nhật mật khẩu mới thành công "+ idA1;
                    level= 3;
                    action= 2;
                }
                if (!reOtp.equals(otp)) {
                    count++;
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(" <div class=\"remember-forgot\"\n" +
                            "                     style=\"justify-content: space-evenly; color: #ff0000; font-size: 0.96em; margin-right: 4px;\">\n" +
                            "                    <i class=\"bx bx-error-circle\"></i>\n" +
                            "                    <label>Sai mã OTP, nhập sai quá 3 lần tài khoản của bạn sẽ bị khóa!</label>\n" +
                            "                </div>");
                    content = "Sai otp";
                    level=3;
                    action=3;
                }
            } else {
                AccountService.lockUpAcountById("0", String.valueOf(acc.getId()));
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(" <div class=\"remember-forgot\"\n" +
                        "                     style=\"justify-content: flex-start; color: #ff0000; font-size: 0.96em; margin-right: 4px;\">\n" +
                        "                    <i class=\"bx bx-error-circle\" style=\"margin-right: 2px;\"></i>\n" +
                        "                    <label>Tài khoản của bạn đã bị khóa! <a href=\"contact\">Trợ giúp</a></label>\n" +
                        "                </div>");
                content = "tài khoản đã bị khóa "+idA1;
                level=3;
                action=3;
            }
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
    }
}
