package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Favorite implements Serializable {
    int id, idA, idP;

    public Favorite() {
    }

    public Favorite(int id, int idA, int idP) {
        this.id = id;
        this.idA = idA;
        this.idP = idP;
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

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "id=" + id +
                ", idA=" + idA +
                ", idP=" + idP +
                '}';
    }
}
