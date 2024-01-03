package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class ImageTrend implements Serializable {
    int id,status;
    String img;

    public ImageTrend() {
    }

    @Override
    public String toString() {
        return "ImageTrend{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public ImageTrend(int id, int status, String img) {
        this.id = id;
        this.status = status;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
