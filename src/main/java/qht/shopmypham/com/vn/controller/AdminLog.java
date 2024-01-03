package qht.shopmypham.com.vn.controller;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Log;
import qht.shopmypham.com.vn.service.LogService;
import qht.shopmypham.com.vn.tools.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLog", value = "/AdminLog")
public class AdminLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("a");
        String ipAddress = request.getRemoteAddr();
        String url = request.getRequestURI();
        String command = request.getParameter("command");
        int level = 1;
        int action = 4;
        String dateNow = DateUtil.getDateNow();
        String content = "";
        int idA = 0;
        if (account.maxPower()) {
            if (command.equals("log")) {
                List<Log> logList = LogService.getAllLog();
                request.setAttribute("logList", logList);
                request.getRequestDispatcher("/admin-template/log.jsp").forward(request, response);
                content = "Truy cập trang log";
                LogService.addLog(idA, action, level, ipAddress, url, content, dateNow);
            }
            if (command.equals("export")) {
                // Thiết lập loại và tiêu đề của phản hồi
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                response.setHeader("Content-disposition", "attachment; filename=SystemLog.xlsx");
                // Tạo Workbook và thêm dữ liệu vào đây
                Workbook workbook = new XSSFWorkbook();
                Sheet sheet = workbook.createSheet("Sheet1");
                Row headerRow = sheet.createRow(0);
                headerRow.createCell(0).setCellValue("STT");
                headerRow.createCell(1).setCellValue("IdA");
                headerRow.createCell(2).setCellValue("Action");
                headerRow.createCell(3).setCellValue("IP");
                headerRow.createCell(4).setCellValue("Src");
                headerRow.createCell(5).setCellValue("Content");
                headerRow.createCell(6).setCellValue("Time");
                headerRow.createCell(7).setCellValue("Level");
                List<Log> logList = LogService.getAllLog();
                int rowNum = 1;
                for (Log log : logList) {
                    Row row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(log.getId());
                    row.createCell(1).setCellValue((log.getIdA() == 0) ? "": String.valueOf(log.getIdA()));
                    row.createCell(2).setCellValue(log.actionLog());
                    row.createCell(3).setCellValue(log.getIp());
                    row.createCell(4).setCellValue(log.getSrc());
                    row.createCell(5).setCellValue(log.getContent());
                    row.createCell(6).setCellValue(log.getTime());
                    row.createCell(7).setCellValue(log.levelLog());
                }
                // Gửi dữ liệu file đến trình duyệt
                ServletOutputStream outputStream = response.getOutputStream();
                workbook.write(outputStream);
                outputStream.flush();
                outputStream.close();
                workbook.close();
            }
        } else {
            response.sendRedirect("404.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
