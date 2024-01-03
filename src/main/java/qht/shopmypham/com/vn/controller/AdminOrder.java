package qht.shopmypham.com.vn.controller;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.EmailUtil;
import qht.shopmypham.com.vn.tools.Format;
import qht.shopmypham.com.vn.tools.RSA;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminOrder", value = "/admin-order")
public class AdminOrder extends HttpServlet {
    String error404 = "404.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CheckOut> checkOuts = CheckOutService.getAllCheckOut();
        request.setAttribute("oder1", "toggled");
        Collections.reverse(checkOuts);
        String command = request.getParameter("command");
        String nowDate = DateUtil.getDateNow();
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
            if (acc.powerAccount().getOrderManage() == 1) {
                idA = acc.getId();
                if (command.equals("dashboard")) {
                    List<CheckOut> listOrderYear = CheckOutService.getAllCheckOutByYear();
                    List<CheckOut> listOrderMonth = CheckOutService.getAllCheckOutByMonth();
                    List<CheckOut> listCancel = CheckOutService.getCancel();
                    List<CheckOut> checkOutListNew = CheckOutService.getAllCheckOutDesc();
                    request.setAttribute("checkOutListNew", checkOutListNew);
                    request.setAttribute("listCancel", listCancel);
                    request.setAttribute("checkOuts", checkOuts);
                    request.setAttribute("listOrderMonth", listOrderMonth);
                    request.setAttribute("listOrderYear", listOrderYear);

                    request.getRequestDispatcher("/admin-template/order-dashboard.jsp").forward(request, response);
                    content = "Truy cập trang quản lý tổng quan đơn hàng";
                }

                if (command.equals("list")) {
                    request.setAttribute("checkOuts", checkOuts);
                    request.getRequestDispatcher("/admin-template/order-List.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách đơn hàng";
                }
                if (command.equals("edit")) {
                    String idCk = request.getParameter("IdCk");
                    CheckOut checkOut = CheckOutService.getCheckOutByIdCk(idCk);
                    request.setAttribute("checkOut", checkOut);
                    request.getRequestDispatcher("/admin-template/order-edit.jsp").forward(request, response);
                    content = "Truy cập trang quản lí chỉnh sửa đơn hàng";
                }
                if (command.equals("detail")) {
                    String idCk = request.getParameter("IdCk");
                    List<ListProductByCheckOut> listProductByCheckOuts = ProductCheckoutService.getProductProductCheckoutByIdCk(idCk);
                    CheckOut checkOut = CheckOutService.getCheckOutByIdCk(idCk);
                    TransportS transport = api.getOrderById(checkOut.getIdTransport());
                    request.setAttribute("transport", transport);
                    request.setAttribute("checkOut", checkOut);
                    request.setAttribute("listProductByCheckOuts", listProductByCheckOuts);
                    request.getRequestDispatcher("admin-template/order-detail.jsp").forward(request, response);
                    content = "Truy cập trang quản lí chi tiết đơn hàng";
                }
                if (command.equals("ok")) {
                    String idCk = request.getParameter("idCk");
                    CheckOutService.confirmCheckOutByidCk(idCk, String.valueOf(acc.getId()), nowDate);
                    response.sendRedirect("admin-order?command=list");
                    content = "Xác nhận đơn hàng" + idCk;
                    action = 2;
                    level = 2;
                }
                if (command.equals("confirm")) {
                    String idCk = request.getParameter("idCk");
                    CheckOutService.completeCheckOutByidCk(idCk, String.valueOf(acc.getId()), nowDate);
                    response.sendRedirect("admin-order?command=list");
                    content = "Xác nhận vận chuyển đơn hàng" + idCk;
                    action = 2;
                    level = 2;
                }
                if (command.equals("authenticate")) {
                    String idCk = request.getParameter("idCk");
                    RSA rsa = new RSA();
                    CheckOut checkOut = CheckOutService.getCheckOutByIdCk(idCk);
                    Account a = AccountService.getAccountById(checkOut.getIdA());
                    try {
                        String mes = checkOut.getHashMessage();
                        List<ListProductByCheckOut> list = checkOut.getProductAll();
                        String listProduct = "";
                        for (ListProductByCheckOut l : list) {
                            listProduct = String.valueOf(l.getIdP()) + l.getQuantity();
                        }
                        String orderInfo = checkOut.getOrderDate() + checkOut.getName() + checkOut.getNote() + checkOut.getPhone() + checkOut.getDetailAddress() + checkOut.getIdProvince() + checkOut.getIdDistrict() + checkOut.getIdWard() + checkOut.getIdPm() + listProduct;
                        Key keyFind = Key.getKeyByOrder(checkOut);
                        String keyString = CheckOutService.getKeyByIdA(checkOut.getIdA());
                        if (keyFind != null) {
                            keyString = keyFind.getPublic_key();
                        }
                        System.out.println(keyFind);
                        String inf = rsa.decrypt(mes, keyString);
                        response.setCharacterEncoding("UTF-8");
                        if (!inf.equals(orderInfo)) {
                            CheckOutService.canceCheckOutByidCk(idCk, String.valueOf(acc.getId()));
                            response.getWriter().write(" <button\n" +
                                    "                                                    class=\"btn btn-primary\"\n" +
                                    "                                                    type=\"button\"\n" +
                                    "                                                    onclick=\"checkBill<%=idCk%>(<%=idCk%>)\"\n" +
                                    "                                                    style=\"padding: 10px;background-color: red;\">Đơn không hợp lệ\n" +
                                    "                                            </button>");

                            senMail(a, idCk);
                            action = 2;
                            level = 2;
                        } else {
                            response.getWriter().write(" <button\n" +
                                    "                                                    class=\"btn btn-primary\"\n" +
                                    "                                                    type=\"button\"\n" +
                                    "                                                    onclick=\"checkBill<%=idCk%>(<%=idCk%>)\"\n" +
                                    "                                                    style=\"padding: 10px;background-color: #1c9a1f;\">Đã xác thực\n" +
                                    "                                            </button>");
                        }
                    } catch (Exception e) {
                        CheckOutService.canceCheckOutByidCk(idCk, String.valueOf(acc.getId()));
                        response.getWriter().write(" <button\n" +
                                "                                                    class=\"btn btn-primary\"\n" +
                                "                                                    type=\"button\"\n" +
                                "                                                    onclick=\"checkBill<%=idCk%>(<%=idCk%>)\"\n" +
                                "                                                    style=\"padding: 10px;background-color: red;\">Đơn không hợp lệ\n" +
                                "                                            </button>");

                        try {
                            senMail(a, idCk);
                        } catch (MessagingException ex) {
                            throw new RuntimeException(ex);
                        }

                        action = 2;
                        level = 2;
                    }


                }
                if (command.equals("cance")) {
                    String idCk = request.getParameter("idCk");
                    CheckOutService.canceCheckOutByidCk(idCk, String.valueOf(acc.getId()));
                    response.sendRedirect("admin-order?command=list");
                    content = "Xác nhận hủy đơn hàng" + idCk;
                    action = 8;
                    level = 3;
                }
                if (command.equals("delete")) {
                    String IdCk = request.getParameter("IdCk");
                    CheckOutService.deleteCheckOutById(IdCk);
                    response.sendRedirect("admin-order?command=list");
                    content = "Xác nhận hủy đơn hàng" + IdCk;
                    action = 3;
                    level = 3;
                }
                if (command.equals("bill")) {
                    long total = 0;
                    String IdCk = request.getParameter("IdCk");
                    CheckOut checkOut = CheckOutService.getCheckOutByIdCk(IdCk);
                    Account account = AccountService.getAccountById(checkOut.getIdA());
                    Voucher voucher = VoucherService.getVoucherById(checkOut.getIdVoucher());
                    List<ListProductByCheckOut> list = ProductCheckoutService.getProductProductCheckoutByIdCk(String.valueOf(checkOut.getIdCk()));
                    Province province = api.getProvinceById(checkOut.getIdProvince());
                    District district = api.getDistrictById(checkOut.getIdProvince(), Integer.parseInt(checkOut.getIdDistrict()));
                    Ward ward = api.getWardById(Integer.parseInt(checkOut.getIdDistrict()), checkOut.getIdWard());
                    String address = ward.getWardName() + ", " + district.getDistrictName() + ", " + province.getProvinceName();
                    String payment = "";
                    if (checkOut.getIdPm() == 1) {
                        payment = "Thanh toán khi nhận hàng";
                    } else {
                        payment = "Paypal";
                    }
                    PDDocument document = new PDDocument();
                    // tạo trang
                    PDPage page = new PDPage(PDRectangle.A4);
                    document.addPage(page);
                    // thiết lập font chữ
                    String path = "admin-template/assets/fonts/TimesNewRoman400.ttf";
                    ServletContext context = getServletContext();
                    String absolutePath = context.getRealPath(path);
                    PDFont font = PDType0Font.load(document, new File(absolutePath));

                    // tạo content stream để vẽ trên trang
                    PDPageContentStream contentStream = new PDPageContentStream(document, page);

                    // vẽ nội dung hóa đơn
                    contentStream.beginText();
                    contentStream.setFont(font, 12);
                    contentStream.moveTextPositionByAmount(50, 750);
                    contentStream.drawString("HÓA ĐƠN");
                    contentStream.moveTextPositionByAmount(0, -50);
                    contentStream.drawString("Tên khách hàng: " + account.getName());
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Số hóa đơn: #" + checkOut.getIdCk());
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Thời gian: " + DateUtil.getDateNow());
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Số điện thoại: " + checkOut.getPhone());
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Địa chỉ: " + address);
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Địa chỉ chi tiết: " + address);
                    String[] lines = checkOut.getDetailAddress().split("\\n");
                    for (String line : lines) {
                        if (!line.isBlank()) {
                            contentStream.moveTextPositionByAmount(0, -20);
                            contentStream.showText(line);
                        }
                    }
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Phương thức thanh toán: " + payment);
                    contentStream.moveTextPositionByAmount(0, -50);
                    contentStream.drawString("Danh sách sản phẩm:");
                    String text = "";
                    int a = 0;
                    for (ListProductByCheckOut l : list) {
                        a++;
                        Product p = ProductService.getProductById(l.getIdP());
                        total += p.getPrice() * l.getQuantity();
                        text += a + ") " + p.getName() + ": " + Format.formatPrice(p.getPrice()) + "đ\n";
                        text += "x " + l.getQuantity() + ": " + Format.formatPrice(p.getPrice() * l.getQuantity()) + "đ\n";
                    }
                    String[] lines1 = text.split("\\n");
                    for (String line : lines1) {
                        if (!line.isBlank()) {
                            contentStream.moveTextPositionByAmount(0, -20);
                            contentStream.showText(line);
                        }
                    }
                    long reduction = 0;
                    if (voucher != null) {
                        reduction = total * voucher.getPrice() / 100;
                    }
                    long priceLast = total - reduction;
                    contentStream.moveTextPositionByAmount(0, -50);
                    contentStream.drawString("Tổng hàng: " + Format.formatPrice(total) + "đ");
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Phí vận chuyển: " + Format.formatPrice((priceLast >= 100000) ? 0 : 25000) + "đ");
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Giảm giá: - " + Format.formatPrice(reduction) + "đ");
                    contentStream.moveTextPositionByAmount(0, -20);
                    contentStream.drawString("Tổng đơn hàng: " + Format.formatPrice(priceLast + ((priceLast >= 100000) ? 0 : 25000)) + "đ");

                    contentStream.moveTextPositionByAmount(0, -50);
                    contentStream.drawString("Chú ý: " + checkOut.getNote());
                    contentStream.endText();

                    // đóng content stream
                    contentStream.close();

                    // thiết lập thông tin header để tải xuống file PDF
                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "attachment; filename=HoaDon.pdf");

                    // gửi document đến trình duyệt để tải xuống
                    OutputStream out = response.getOutputStream();
                    document.save(out);
                    out.flush();
                    out.close();

                    // đóng document
                    document.close();
                    content = "Xuất hóa đơn đơn hàng mã " + IdCk;
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect(error404);
            }
        }
    }
    public void senMail(Account a, String idCk) throws MessagingException, UnsupportedEncodingException {
        Email email1 = new Email();
        email1.setFrom("khaquan9a2.2016@gmail.com");
        email1.setFromPasswork("xowopqrkiyjsdsbf");
        email1.setTo(a.getEmail());
        email1.setSubject("Đơn hàng");
        StringBuffer sb = new StringBuffer();
        sb.append("Chào ").append(a.getName() + ". ");
        sb.append("Đơn hàng với mã ").append(idCk + " của bạn. ");
        sb.append("Chúng tôi đã phát hiện có lỗi trong vấn đề kiểm tra đơn đặt hàng của bạn không an toàn.\n");
        sb.append("Chúng tôi đã hủy đơn này và đã hoàn tiền lại cho đơn hàng. Nếu bạn muốn mua lại hãy thực hiện lại giao dịch trên website của chúng tôi. Trân trọng!");
        email1.setContent(sb.toString());
        EmailUtil.send(email1);
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
            if (acc.powerAccount().getOrderManage() == 1) {
                idA = acc.getId();
                String command = request.getParameter("command");
                String idCk = request.getParameter("idCk");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String name = request.getParameter("name");
                String note = request.getParameter("note");
                if (command.equals("edit")) {
                    CheckOutService.editCheckOut(idCk, String.valueOf(acc.getId()), note, phone, address, name);
                    level = 2;
                    action = 2;
                    content = "chỉnh sửa đơn hàng" + idCk;
                }
                response.sendRedirect("admin-order?command=list");
            } else {
                response.sendRedirect(error404);
            }
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }
}