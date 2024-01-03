package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Log implements Serializable {
    int id, idA, action, level;
    String ip, src, content, time;

    public Log() {
    }

    public Log(int id, int idA, int action, int level, String ip, String src, String content, String time) {
        this.id = id;
        this.idA = idA;
        this.action = action;
        this.level = level;
        this.ip = ip;
        this.src = src;
        this.content = content;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public int getAction() {
        return action;
    }

    public void setAction(int action) {
        this.action = action;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String actionLog() {
        String action = "";
        if (this.getAction() == 1) {
            action = "Thêm";
        }
        if (this.getAction() == 2) {
            action = "Sửa";
        }
        if (this.getAction() == 3) {
            action = "Xóa";
        }
        if (this.getAction() == 4) {
            action = "Truy cập";
        }
        if (this.getAction() == 5) {
            action = "Đăng ký tài khoản";
        }
        if (this.getAction() == 6) {
            action = "Nhận xét";
        }
        if (this.getAction() == 7) {
            action = "Thanh toán";
        }
        if (this.getAction() == 8) {
            action = "Hủy đơn";
        }
        if (this.getAction() == 9) {
            action = "Quên mật khẩu";
        }
        if (this.getAction() == 10) {
            action = "Đăng nhập";
        }
        return action;
    }
    public String levelLog(){
        String level = "";
        if (this.getLevel()==1){
            level = "Thông tin";
        }
        if (this.getLevel()==2){
            level = "Thông báo";
        }
        if (this.getLevel()==3){
            level = "Cảnh báo";
        }
        if (this.getLevel()==4){
            level = "Nguy hiểm";
        }
        return level;
    }
    public String actionIcon() {
        String action = "";
        if (this.getAction() == 1) {
            action = "<div class=\"icon-circle bg-green\"><i class=\"zmdi zmdi-plus\"></i></div>";
        }
        if (this.getAction() == 2) {
            action = "<div class=\"icon-circle bg-green\"><i class=\"zmdi zmdi-edit\"></i></div>";
        }
        if (this.getAction() == 3) {
            action = "<div class=\"icon-circle bg-red\"><i class=\"zmdi zmdi-delete\"></i></div>";
        }
        if (this.getAction() == 4) {
            action = "<div class=\"icon-circle bg-grey\"><i class=\"zmdi zmdi-swap-vertical\"></i></div>";
        }
        if (this.getAction() == 5) {
            action = "<div class=\"icon-circle bg-blue\"><i class=\"zmdi zmdi-account\"></i></div>";
        }
        if (this.getAction() == 6) {
            action = "<div class=\"icon-circle bg-grey\"><i class=\"zmdi zmdi-comment-text\"></i></div>";
        }
        if (this.getAction() == 7) {
            action = "<div class=\"icon-circle bg-amber\"><i class=\"zmdi zmdi-shopping-cart\"></i></div>\n";
        }
        if (this.getAction() == 8) {
            action = "<div class=\"icon-circle bg-red\"><i class=\"zmdi zmdi-close\"></i></div>";
        }
        return action;
    }
}
