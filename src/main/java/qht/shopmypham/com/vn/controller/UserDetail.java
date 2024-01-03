package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.*;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "DetailController", value = "/detail")
public class UserDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        Account acc = (Account) request.getSession().getAttribute("a");
        Product product = ProductService.getProductById(Integer.parseInt(id));
        Categories cate = CategoryService.getCategoriesById(String.valueOf(product.getIdC()));
        Trademark trademark = TrademarkService.getTrademarkByIdT(String.valueOf(product.getIdT()));
        List<Product> listProduct = ProductService.getProductByIdC(String.valueOf(product.getIdC()));
        List<Review> reviewList = ReviewService.getAllReviewByIdP(id);
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        Collections.reverse(reviewList);
        double avgStart = 0;
        double sum = 0;
        for(Review r : reviewList){
            sum += r.getStar();

        }
        avgStart = sum/reviewList.size();
        request.setAttribute("avgStart",avgStart);
        request.setAttribute("cate", cate);
        request.setAttribute("trademark", trademark);
        request.setAttribute("reviewList", reviewList);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/user-template/product-details.jsp").forward(request, response);
        if (acc != null) idA = acc.getId();
        content = "Truy cập trang sản phẩm chi tiết "+id;
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
