package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Home implements Serializable {
    int id, idC1, idC2,idC3, quantityProP,quantityProN,quantityProS,quantityBlog;

    public Home() {
    }

    public Home(int id, int idC1, int idC2, int idC3, int quantityProP, int quantityProN, int quantityProS, int quantityBlog) {
        this.id = id;
        this.idC1 = idC1;
        this.idC2 = idC2;
        this.idC3 = idC3;
        this.quantityProP = quantityProP;
        this.quantityProN = quantityProN;
        this.quantityProS = quantityProS;
        this.quantityBlog = quantityBlog;
    }

    @Override
    public String toString() {
        return "Home{" +
                "id=" + id +
                ", idC1=" + idC1 +
                ", idC2=" + idC2 +
                ", idC3=" + idC3 +
                ", quantityProP=" + quantityProP +
                ", quantityProN=" + quantityProN +
                ", quantityProS=" + quantityProS +
                ", quantityBlog=" + quantityBlog +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdC1() {
        return idC1;
    }

    public void setIdC1(int idC1) {
        this.idC1 = idC1;
    }

    public int getIdC2() {
        return idC2;
    }

    public void setIdC2(int idC2) {
        this.idC2 = idC2;
    }

    public int getIdC3() {
        return idC3;
    }

    public void setIdC3(int idC3) {
        this.idC3 = idC3;
    }

    public int getQuantityProP() {
        return quantityProP;
    }

    public void setQuantityProP(int quantityProP) {
        this.quantityProP = quantityProP;
    }

    public int getQuantityProN() {
        return quantityProN;
    }

    public void setQuantityProN(int quantityProN) {
        this.quantityProN = quantityProN;
    }

    public int getQuantityProS() {
        return quantityProS;
    }

    public void setQuantityProS(int quantityProS) {
        this.quantityProS = quantityProS;
    }

    public int getQuantityBlog() {
        return quantityBlog;
    }

    public void setQuantityBlog(int quantityBlog) {
        this.quantityBlog = quantityBlog;
    }
}
