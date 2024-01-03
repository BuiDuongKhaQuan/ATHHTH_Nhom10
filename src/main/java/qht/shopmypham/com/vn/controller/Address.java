package qht.shopmypham.com.vn.controller;

import com.google.gson.Gson;
import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.CheckOutService;
import qht.shopmypham.com.vn.service.ProductCheckoutService;
import qht.shopmypham.com.vn.service.ProductService;
import qht.shopmypham.com.vn.tools.Format;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Address", value = "/Address")
public class Address extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command.equals("province")) {
            // Lấy mã tỉnh/thành phố từ tham số truy vấn
            String provinceID = request.getParameter("provinceID");
            // Xử lý yêu cầu và trả về danh sách quận/huyện tương ứng dưới dạng chuỗi JSON
            List<District> districts = api.getDistrict(Integer.parseInt(provinceID));
            String li = "", option = "";
            for (District district : districts) {
                li += "<li data-value=\"" + district.getDistrictID() + "\" class=\"option\">" + district.getDistrictName() + "</li>";
                option += "<option value=\"" + district.getDistrictID() + "\">" + district.getDistrictName() + "</option>";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<select id=\"districtID\" onchange=\"getWards()\" name=\"districtID\" style=\"display: none;\">\n" +
                    "                                                <option value=\"\">--Chọn Huyện--</option>\n" + option +
                    "                                            </select>" +
                    "<div class=\"nice-select\" tabindex=\"0\">" +
                    "<span class=\"current\">--Chọn Huyện--</span>" +
                    "<ul class=\"list\">" +
                    "<li data-value=\"\" class=\"option selected\">--Chọn Huyện--</li>" + li +
                    "</ul>" +
                    "</div>");
        }
        if (command.equals("ward")) {
            String wardID = request.getParameter("wardID");
            List<Ward> wards = api.getWard(Integer.parseInt(wardID));
            String li = "", option = "";
            for (Ward ward : wards) {
                li += "<li data-value=\"" + ward.getWardCode() + "\" class=\"option\">" + ward.getWardName() + "</li>";
                option += "<option value=\"" + ward.getWardCode() + "\">" + ward.getWardName() + "</option>";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<select name=\"wardID\" onchange=\"getCalculateFee()\" id=\"wardID\" style=\"display: none;\">\n" +
                    "                                                <option value=\"\">--Chọn Xã/Ấp--</option>\n" + option +
                    "                                            </select>" +
                    "<div class=\"nice-select\" tabindex=\"0\">" +
                    "<span class=\"current\">--Chọn Xã/Ấp--</span>" +
                    "<ul class=\"list\">" +
                    "<li data-value=\"\" class=\"option selected\">--Chọn Xã/Ấp--</li>" + li +
                    "</ul>" +
                    "</div>");
        }
        if (command.equals("provincei")) {
            // Lấy mã tỉnh/thành phố từ tham số truy vấn
            String provinceID = request.getParameter("provinceID");
            List<District> districts = api.getDistrict(Integer.parseInt(provinceID));
            String option = "";
            for (District district : districts) {
                option += "<option value=\"" + district.getDistrictID() + "\">" + district.getDistrictName() + "</option>";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<select id=\"districtID\"\n" +
                    "                                                        class=\"form-control show-tick ms select2\"\n" +
                    "                                                        data-placeholder=\"Select\"\n" +
                    "                                                        onchange=\"getWards()\">\n" +
                    "                                                    <option value=\"\">--Chọn Huyện--</option>\n" + option +
                    "                                                </select>");
        }
        if (command.equals("wardi")) {
            String wardID = request.getParameter("wardID");
            List<Ward> wards = api.getWard(Integer.parseInt(wardID));
            String option = "";
            for (Ward ward : wards) {
                option += "<option value=\"" + ward.getWardCode() + "\">" + ward.getWardName() + "</option>";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<select class=\"form-control show-tick ms select2\"\n" +
                    "                                                        data-placeholder=\"Select\"\n" +
                    "                                                        id=\"wardID\">\n" +
                    "                                                    <option value=\"\">--Chọn Xã/Ấp--</option>\n" + option +
                    "                                                </select>");
        }
        if (command.equals("change")) {
            String idCk = request.getParameter("idCk");
            CheckOut checkOut = CheckOutService.getCheckOutByIdCk(idCk);
            List<ListProductByCheckOut> list = ProductCheckoutService.getProductProductCheckoutByIdCk(idCk);
            request.setAttribute("checkOut", checkOut);
            request.setAttribute("list", list);
            request.setAttribute("activePage", "active");
            request.getRequestDispatcher("user-template/change-address.jsp").forward(request, response);
        }
        if (command.equals("total-change")) {
            String wardID = request.getParameter("wardID");
            String districtID = request.getParameter("districtID");
            int calculateFee = api.calculateFee(districtID, wardID);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<li>Phí vận chuyển sau thay đổi<span>" + Format.formatPrice(calculateFee) + "đ</span></li>\n");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command.equals("change")) {
            String address_detail = request.getParameter("address_detail");
            String provinceID = request.getParameter("provinceID");
            String districtID = request.getParameter("districtID");
            String wardID = request.getParameter("wardID");
            String idCk = request.getParameter("idCk");
            CheckOutService.editAddress(wardID, districtID, idCk, "62de2c8249bf428fa738b40355a2316a", provinceID, address_detail);
        }
    }

}
