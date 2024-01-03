package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Voucher implements Serializable {
    String code, name;
    int id, price, quantity, status;

    public Voucher() {
    }

    public Voucher(String name, String code, int id, int price, int quantity, int status) {
        this.name = name;
        this.code = code;
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
