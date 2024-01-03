package qht.shopmypham.com.vn.controller;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.text.PDFTextStripper;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.CheckOut;
import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.CheckOutService;
import qht.shopmypham.com.vn.service.LoginService;
import qht.shopmypham.com.vn.tools.Encode;
import qht.shopmypham.com.vn.tools.RSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.Collections;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@WebServlet(name = "setKeyRandom", value = "/setKey")
public class UserSetKeyRandom extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        HttpSession session = request.getSession();

        if (command.equals("setKey")) {
            RSA rsa = new RSA();
            try {
                rsa.generateKeyPair(2048);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            String publicKey = rsa.exportPublicKey();
            String privateKey = rsa.exportPrivateKey();

            // Create a zip file
            response.setContentType("application/zip");
            response.setHeader("Content-Disposition", "attachment; filename=keys.zip");
            response.addHeader("Keys-Info", "{ \"publicKey\": \"" + publicKey + "\", \"privateKey\": \"" + privateKey + "\" }");

            try (ZipOutputStream zipOut = new ZipOutputStream(response.getOutputStream())) {
                // Add public key to the zip file
                addFileToZip(zipOut, "publickey.pdf", publicKey);

                // Add private key to the zip file
                addFileToZip(zipOut, "privatekey.pdf", privateKey);

            } catch (IOException e) {
                throw new ServletException("Error creating zip file", e);
            }
        }

        if (command.equals("changeNewkey")) {
            request.getRequestDispatcher("/user-template/renew-key.jsp").forward(request, response);
        }
    }

    // Helper method to add a file to a zip stream
    private void addFileToZip(ZipOutputStream zipOut, String entryName, String content) throws IOException {
        PDDocument document = new PDDocument();
        PDPage page = new PDPage(PDRectangle.A4);
        document.addPage(page);

        try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
            // Set font and font size
            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);

            // Write content to the PDF
            contentStream.beginText();
            contentStream.newLineAtOffset(50, 700);
            contentStream.showText(content);
            contentStream.endText();
        }

        // Create a zip entry for the file
        ZipEntry zipEntry = new ZipEntry(entryName);
        zipOut.putNextEntry(zipEntry);

        // Write the PDF content to the zip stream
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            document.save(baos);
            zipOut.write(baos.toByteArray());
        } finally {
            document.close();
        }

        zipOut.closeEntry();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if ("readKey".equals(command)) {
            try (InputStream inputStream = request.getInputStream()) {
                PDDocument document = PDDocument.load(inputStream);
                PDFTextStripper pdfTextStripper = new PDFTextStripper();
                String text = pdfTextStripper.getText(document);
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(text);
                document.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if ("checkKey".equals(command)) {
            RSA rsa = new RSA();
            String publicKey = request.getParameter("publicKey").replaceAll("\\s", "");
            String privateKey = request.getParameter("privateKey").replaceAll("\\s", "");
            String dataTest = "Kiểm tra sự hợp lệ của 2 khóa!";
            String textEncrypt = "";
            String textDecrypt = "";
            String responseText = "";
            if (rsa.checkKeyLength(publicKey, privateKey)) {
                try {
                    textEncrypt = rsa.encrypt(dataTest, privateKey);
                    textDecrypt = rsa.decrypt(textEncrypt, publicKey);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                if (textDecrypt.equals(dataTest)) {
                    responseText = "ok";
                }
            } else {
                responseText = "Invalid long key";
            }
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(responseText);
        }
        if ("reportComplete".equals(command)) {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("a");
            String publicKey = request.getParameter("publicKey");
            if (publicKey.length() == 0 || publicKey == "") {
                publicKey = (String) session.getAttribute("publicKey");
            }
            AccountService.reportByIdA(acc.getId());
            LoginService.insertPublicKey(publicKey, acc.getId());
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("ok");
        }
    }
}
