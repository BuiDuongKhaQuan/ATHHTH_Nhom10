package qht.shopmypham.com.vn.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.ProductService;

import javax.servlet.ServletContext;
import javax.servlet.http.*;
import java.io.IOException;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpLoadImgPro")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpLoadImgPro extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameImg = "";
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
            nameImg = fileName;
        }
        String parthImg = "user-template/img/product/" + nameImg;
        Map<String, String> map = new HashMap<>();
        byte[] imageData = Files.readAllBytes(Paths.get(this.getFolderUpload().getAbsolutePath() + File.separator + nameImg));
        String base64Image = javax.xml.bind.DatatypeConverter.printBase64Binary(imageData);
        map.put(parthImg, base64Image);
        HttpSession session = request.getSession();
        if (session.getAttribute("imgs") == null) {
            session.setAttribute("imgs", map);
        } else {
            Map<String, String> map1 = (Map<String, String>) request.getSession().getAttribute("imgs");
            map1.put(parthImg,base64Image);
            session.setAttribute("imgs", map1);
        }


    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        String avatarPath = "/user-template/img/product"; // đường dẫn tương đối của tài nguyên
        ServletContext context = getServletContext();
        String absolutePath = context.getRealPath(avatarPath);
        File folderUpload = new File(absolutePath);
//        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
