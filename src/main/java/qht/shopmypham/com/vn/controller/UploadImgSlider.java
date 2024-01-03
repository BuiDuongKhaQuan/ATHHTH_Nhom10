package qht.shopmypham.com.vn.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
@WebServlet("/UploadImgSlider")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UploadImgSlider extends HttpServlet {
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
        String parthImg = "user-template/img/slider/" + nameImg;

        HttpSession session = request.getSession();
        Map<String, String> map = new HashMap<>();
        map.put(nameImg, parthImg);
        session.setAttribute("imgSlider", map);
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
        String avatarPath = "user-template/img/slider"; // đường dẫn tương đối của tài nguyên
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
