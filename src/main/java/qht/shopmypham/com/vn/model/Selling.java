package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Selling implements Serializable {
    int id;
    int idP;
    String  text1,text2,text3,text;

    public Selling() {
    }

    public Selling(int id, int idP, String text1, String text2, String text3, String text) {
        this.id = id;
        this.idP = idP;
        this.text1 = text1;
        this.text2 = text2;
        this.text3 = text3;
        this.text = text;
    }

    @Override
    public String toString() {
        return "Selling{" +
                "id=" + id +
                ", idP=" + idP +
                ", text1='" + text1 + '\'' +
                ", text2='" + text2 + '\'' +
                ", text3='" + text3 + '\'' +
                ", text='" + text + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public String getText1() {
        return text1;
    }

    public void setText1(String text1) {
        this.text1 = text1;
    }

    public String getText2() {
        return text2;
    }

    public void setText2(String text2) {
        this.text2 = text2;
    }

    public String getText3() {
        return text3;
    }

    public void setText3(String text3) {
        this.text3 = text3;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
