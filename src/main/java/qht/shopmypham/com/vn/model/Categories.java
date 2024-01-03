package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Categories implements Serializable {
    private int idC;
    private String nameC;

    private String imgC;

    public Categories() {
    }

    public Categories(int idC, String nameC, String imgC) {
        this.idC = idC;
        this.nameC = nameC;
        this.imgC = imgC;
    }

    @Override
    public String toString() {
        return "Categories{" +
                "idC=" + idC +
                ", nameC='" + nameC + '\'' +
                ", imgC='" + imgC + '\'' +
                '}';
    }

    public int getIdC() {
        return idC;
    }

    public void setIdC(int idC) {
        this.idC = idC;
    }

    public String getNameC() {
        return nameC;
    }

    public void setNameC(String nameC) {
        this.nameC = nameC;
    }

    public String getImgC() {
        return imgC;
    }

    public void setImgC(String imgC) {
        this.imgC = imgC;
    }
}
