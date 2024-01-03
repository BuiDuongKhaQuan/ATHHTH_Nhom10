package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class NewProduct implements Serializable {
    int id, idP;
    String countDay;

    public NewProduct() {
    }

    public NewProduct(int id, int idP, String countDay) {
        this.id = id;
        this.idP = idP;
        this.countDay = countDay;
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

    public String getCountDay() {
        return countDay;
    }

    public void setCountDay(String countDay) {
        this.countDay = countDay;
    }
}
