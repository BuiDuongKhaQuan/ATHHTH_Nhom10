package qht.shopmypham.com.vn.controller;

import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.service.ProductService;
import qht.shopmypham.com.vn.service.ReviewService;
import qht.shopmypham.com.vn.tools.CountStar;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "ReviewController", value = "/review")
public class UserReview extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("a");
        String information = request.getParameter("mess");
        String idP = request.getParameter("idP");
        String command = request.getParameter("command");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (acc != null) idA = acc.getId();
        if (command.equals("add")) {
            String rating = request.getParameter("start");
            if (rating == "") {
                rating = "0";
            }
            Review review = ReviewService.getReviewByIdA(String.valueOf(acc.getId()));
            if (review == null) {
                ReviewService.addReview(idP, String.valueOf(acc.getId()), information, rating, DateUtil.getDateNow());
                level=2;
                action=6;
                content="Thêm đánh giá cho sản phẩm "+idP;
            } else {
                ReviewService.updateReview(idP, information, rating, DateUtil.getDateNow(), String.valueOf(review.getIdR()));
                level=2;
                action=6;
                content="Chỉnh sửa đánh giá cho sản phẩm "+idP;
            }

        }
        Product product = ProductService.getProductById(Integer.parseInt(idP));
        List<Review> reviewList = ReviewService.getAllReviewByIdP(idP);
        if (command.equals("r")) {
            Collections.reverse(reviewList);
            for (Review r : reviewList) {
                Account account = AccountService.getAccountById(r.getIdA());
                String start = CountStar.starReview(r.getStar());
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("<div class=\"media mb-4\" id=\"comment_item\">\n" +
                        "                                                <img src=\"" + account.getImg() + "\" alt=\"Image\" class=\"img-fluid mr-3 mt-1\"\n" +
                        "                                                     style=\"width: 50px;border-radius: 50%; height: 50px;\">\n" +
                        "                                                <div class=\"media-body\">\n" +
                        "                                                    <h6>" + account.getName() + "<small>\n" +
                        "                                                        - <i>" + r.getDate() + "\n" +
                        "                                                    </i></small></h6>\n" +
                        "                                                    <div class=\"rating\">\n" + start +
                        "                                                    </div>\n" +
                        "                                                    <p>" + r.getInfomation() + "\n" +
                        "                                                    </p>\n" +
                        "                                                </div>\n" +
                        "                                            </div>");

            }
        }
        if (command.equals("s")) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<h4 class=\"mb-4\">" + reviewList.size() + " đánh giá về " + product.getName() + "\n" +
                    "                                                </h4> ");
        }
        if (command.equals("b")) {
            String button = "";
            if (acc == null) {
                button = "<div class=\"form-group mb-0\">\n" +
                        "                                                    <a href=\"login.jsp\"\n" +
                        "                                                       class=\"btn btn-primary px-3\"\n" +
                        "                                                       style=\"border-radius: 5px\"> Đăng nhập để đánh giá\n" +
                        "                                                    </a>\n" +
                        "                                                </div>";
            }
            if (acc != null) {
                button = "<div class=\"form-group mb-0\">\n" +
                        "                                                    <button type=\"button\" onclick=\"send(" + product.getIdP() + ")\"\n" +
                        "                                                            class=\"btn btn-primary px-3\"> Đánh giá\n" +
                        "                                                    </button>\n" +
                        "                                                </div>";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("<h4 class=\"mb-4\">Để lại đánh giá của bạn</h4>\n" +
                    "                                            <div class=\"d-flex my-3\">\n" +
                    "                                                <p class=\"mb-0 mr-2\">Đánh giá * :</p>\n" +
                    "                                                <form method=\"get\" id=\"rating\" class=\"text-primary\"\n" +
                    "                                                      style=\"margin-top: -10px\">\n" +
                    "                                                    <input type=\"radio\" id=\"star5\" name=\"star\" value=\"5\"/>\n" +
                    "                                                    <label class=\"full\" for=\"star5\"\n" +
                    "                                                           title=\"Rất tốt - 5 stars\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star4half\" name=\"star\" value=\"4.5\"/>\n" +
                    "                                                    <label class=\"half\" for=\"star4half\" title=\"4.5 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star4\" name=\"star\" value=\"4\"/>\n" +
                    "                                                    <label class=\"full\" for=\"star4\" title=\"Tốt - 4 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star3half\" name=\"star\" value=\"3.5\"/>\n" +
                    "                                                    <label class=\"half\" for=\"star3half\" title=\"3.5 stars\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star3\" name=\"star\" value=\"3\"/>\n" +
                    "                                                    <label class=\"full\" for=\"star3\"\n" +
                    "                                                           title=\"Bình thường - 3 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star2half\" name=\"star\" value=\"2.5\"/>\n" +
                    "                                                    <label class=\"half\" for=\"star2half\" title=\"2.5 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star2\" name=\"star\" value=\"2\"/>\n" +
                    "                                                    <label class=\"full\" for=\"star2\"\n" +
                    "                                                           title=\"Trung bình  - 2 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star1half\" name=\"star\" value=\"1\"/>\n" +
                    "                                                    <label class=\"half\" for=\"star1half\" title=\"1.5 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"star1\" name=\"star\" value=\"1\"/>\n" +
                    "                                                    <label class=\"full\" for=\"star1\" title=\"Tệ - 1 sao\"></label>\n" +
                    "\n" +
                    "                                                    <input type=\"radio\" id=\"starhalf\" name=\"star\" value=\"0.5\"/>\n" +
                    "                                                    <label class=\"half\" for=\"starhalf\"\n" +
                    "                                                           title=\"Rất tệ - 0.5 sao\"></label>\n" +
                    "                                                </form>\n" +
                    "\n" +
                    "                                            </div> <div class=\"form-group\">\n" +
                    "                                                    <label for=\"message\">Đánh giá của bạn *</label>\n" +
                    "                                                    <textarea id=\"message\"\n" +
                    "                                                              name=\"information\" cols=\"30\" rows=\"5\"\n" +
                    "                                                              class=\"form-control\" required></textarea>\n" +
                    "                                                </div>\n" + button + "</div>");
        }
        LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
    }


}
