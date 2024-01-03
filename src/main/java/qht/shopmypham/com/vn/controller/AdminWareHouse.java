package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminWareHouse", value = "/AdminWareHouse")
public class AdminWareHouse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        String command = request.getParameter("command");
        request.setAttribute("warehouse1", "toggled");
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
            idA = acc.getId();
            if (acc.powerAccount().getWarehouseManage() == 1) {
                if (command.equals("list")) {
                    List<WareHouse> wareHouseList = WareHouseService.getAll();
                    List<WarehouseDetail> warehouseDetailList = WareHouseService.getAllWarehouseDetail();
                    request.setAttribute("warehouseDetailList", warehouseDetailList);
                    request.setAttribute("wareHouseList", wareHouseList);
                    request.getRequestDispatcher("admin-template/wh-warehouse-list.jsp").forward(request, response);
                    content = "Truy cập trang quản lý danh sách kho";
                }
                if (command.equals("add_warehouse")) {
                    List<Product> products = ProductService.getAllProduct();
                    request.setAttribute("products", products);
                    request.getRequestDispatcher("admin-template/wh-warehouse-number.jsp").forward(request, response);
                    action = 1;
                    content = "Thêm số lượng sản phẩm vào kho ";
                }
                if (command.equals("edit")) {
                    String id = request.getParameter("id");
                    String idL = request.getParameter("idL");
                    WarehouseDetail warehouseDetail = WareHouseService.getWareHouseDetail(Integer.parseInt(id));
                    request.setAttribute("warehouseDetail", warehouseDetail);
                    request.setAttribute("idL", idL);
                    request.getRequestDispatcher("admin-template/wh-warehouse-edit.jsp").forward(request, response);
                    content = "Truy cập trang chỉnh sửa kho";
                    action = 2;
                }
                if (command.equals("detail")) {
                    String id = request.getParameter("id");
                    List<WarehouseDetail> warehouseDetailList = WareHouseService.getListWarehouseDetailById(id);
                    Product product = ProductService.getProductById(Integer.parseInt(id));
                    request.setAttribute("warehouseDetailList", warehouseDetailList);
                    request.setAttribute("idL", id);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("admin-template/warehouse-detail-number.jsp").forward(request, response);
                    content = "Truy cập trang quản lí chi tiết đơn hàng";
                }
                if (command.equals("add")) {
                    List<Categories> listCategories = CategoryService.getAllCategory();
                    List<Trademark> trademarks = TrademarkService.getTrademarkAll();
                    request.setAttribute("trademarks", trademarks);
                    request.setAttribute("listCategories", listCategories);
                    request.setAttribute("img", "assets/images/sm/img.png");
                    request.getRequestDispatcher("/admin-template/wh-warehouse-add.jsp").forward(request, response);
                    action = 1;
                    level = 2;
                    content = "Thêm sản phẩm";
                }
                if (command.equals("delete")) {
                    String id = request.getParameter("id");
                    String idL = request.getParameter("idL");
                    WareHouseService.deleteWareHouseDetail(id);
                    response.sendRedirect("AdminWareHouse?command=detail&id=" + idL);
                    content = "Xóa lần nhập hàng " + id + " của danh sách " + idL;
                    action = 3;
                }
                if (command.equals("deleteP")) {
                    String idP = request.getParameter("idP");
                    WareHouseService.deleteWareHouse(idP);
                    response.sendRedirect("AdminWareHouse?command=list");
                    content = "Xóa hàng " + idP;
                    action = 3;
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect("404.jsp");
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
            idA = acc.getId();
            if (acc.powerAccount().getWarehouseManage() == 1) {
                if (command.equals("edit")) {
                    String id = request.getParameter("id");
                    String quantityInput = request.getParameter("quantityInput");
                    String dateinput = request.getParameter("dateInput");
                    WareHouseService.editWareHouseDetail(dateinput, quantityInput, id);
                    action = 2;
                    content = "Chỉnh sửa hàng " + id;
                }
                if (command.equals("add")) {
                    HttpSession session = request.getSession();
                    String quantity = request.getParameter("quantity");
                    String quantityInput = request.getParameter("quantityInput");
                    String dateInput = request.getParameter("dateInput");
                    String idP = request.getParameter("idP");
                    String name = request.getParameter("name");
                    String price = request.getParameter("price");
                    String description = request.getParameter("description");
                    String trademark = request.getParameter("trademark");
                    String idC = request.getParameter("idC");
                    int id = ProductService.getAllProduct().get(ProductService.getAllProduct().size() - 1).getIdP() + 1;
                    WareHouseService.addWareHouse(quantity, quantityInput, dateInput, String.valueOf(id), name, trademark, description, idC, price);
                    Map<String, String> mapImg = (Map<String, String>) request.getSession().getAttribute("imgs");
                    for (Map.Entry<String, String> entry : mapImg.entrySet()) {
                        ProductService.addImageByIdP(String.valueOf(id), entry.getKey());
                    }
                    session.removeAttribute("imgs");
                    action = 1;
                    level = 2;
                    content = "Thêm sản phẩm " + idP;
                }
                // nhập them sl sp da có trong dssp
                if (command.equals("warehouse")) {
                    String idP = request.getParameter("idP");
                    int quantityInput = Integer.parseInt(request.getParameter("quantityInput"));
                    String dateinput = request.getParameter("dateInput");
                    int quantity = Integer.parseInt(String.valueOf(WareHouseService.getquantityById(Integer.parseInt(idP))));
                    List<WareHouse> wareHouseList = WareHouseService.getAll();
                    Collections.reverse(wareHouseList);
                    WareHouseService.addNumberWarehouse(dateinput, quantityInput, idP, quantity);
                    action = 1;
                    content = "Thêm số lượng sản phẩm vào kho ";
                }
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            } else {
                response.sendRedirect("404.jsp");
            }
        }
    }
}
