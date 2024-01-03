package qht.shopmypham.com.vn.model;

import java.io.Serializable;
import java.util.List;

public class Review implements Serializable {
    int idR, idP, idA;
    String infomation,date;
    double star;

    public Review() {
    }

    public Review(int idR, int idP, int idA, String infomation, String date, double star) {
        this.idR = idR;
        this.idP = idP;
        this.idA = idA;
        this.infomation = infomation;
        this.date = date;
        this.star = star;
    }

    public int getIdR() {
        return idR;
    }

    public void setIdR(int idR) {
        this.idR = idR;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public String getInfomation() {
        return infomation;
    }

    public void setInfomation(String infomation) {
        this.infomation = infomation;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getStar() {
        return star;
    }

    public void setStar(double star) {
        this.star = star;
    }

    @Override
    public String toString() {
        return "Review{" +
                "idR=" + idR +
                ", idP=" + idP +
                ", idA=" + idA +
                ", infomation='" + infomation + '\'' +
                ", date='" + date + '\'' +
                ", star=" + star +
                '}';
    }
    public double avgStart(List<Review> reviewList){
        double avgStart = 0;
        for (Review r:reviewList){
            avgStart += r.getStar();
        }

        return  avgStart/ reviewList.size();
    }

}
