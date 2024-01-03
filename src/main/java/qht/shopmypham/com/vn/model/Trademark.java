package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Trademark implements Serializable {
    int id, status;
    String logo, name, address, phone;

    public Trademark() {
    }

    public Trademark(int id, int status, String logo, String name, String address, String phone) {
        this.id = id;
        this.status = status;
        this.logo = logo;
        this.name = name;
        this.address = address;
        this.phone = phone;
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

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
