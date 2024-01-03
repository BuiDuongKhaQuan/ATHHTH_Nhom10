package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Slider implements Serializable {
    int idSl, status;
    String img, text;

    public Slider() {
    }

    public Slider(int idSl, int status, String img, String text) {
        this.idSl = idSl;
        this.status = status;
        this.img = img;
        this.text = text;
    }

    public int getIdSl() {
        return idSl;
    }

    public void setIdSl(int idSl) {
        this.idSl = idSl;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
