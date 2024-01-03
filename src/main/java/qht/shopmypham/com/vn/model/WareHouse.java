package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class WareHouse implements Serializable {
    int id;
    int idP;
    int quantity;


    public WareHouse() {
    }

    public WareHouse(int id, int idP, int quantity) {
        this.id = id;
        this.idP = idP;
        this.quantity = quantity;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "WareHouse{" +
                "id=" + id +
                ", idP=" + idP +
                ", quantity=" + quantity +
                '}';
    }
}
