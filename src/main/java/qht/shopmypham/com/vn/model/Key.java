package qht.shopmypham.com.vn.model;

import qht.shopmypham.com.vn.service.CheckOutService;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Key implements Serializable {
    int id, idA;
    String public_key, day_expired, day_create;

    public Key() {
    }

    public Key(int id, int idA, String public_key, String day_expired, String day_create) {
        this.id = id;
        this.idA = idA;
        this.public_key = public_key;
        this.day_expired = day_expired;
        this.day_create = day_create;
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

    public String getPublic_key() {
        return public_key;
    }

    public void setPublic_key(String public_key) {
        this.public_key = public_key;
    }

    public String getDay_expired() {
        return day_expired;
    }

    public void setDay_expired(String day_expired) {
        this.day_expired = day_expired;
    }

    public String getDay_create() {
        return day_create;
    }

    public void setDay_create(String day_create) {
        this.day_create = day_create;
    }

    public static Key getKeyByOrder(CheckOut checkOut) throws ParseException {
        Key key = null;
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        Date day_order = formatter.parse(checkOut.getOrderDate());
        for (Key k : CheckOutService.getAllKey(checkOut.getIdA())) {
            Date day_create = formatter.parse(k.getDay_create());
            Date day_expired = formatter.parse(k.getDay_expired());
            System.out.println(day_create);
            System.out.println(day_expired);
            System.out.println(day_order);
            if (day_order.after(day_create) && day_order.before(day_expired)) {
                key = k;
                break;
            }

        }
        return key;
    }

    @Override
    public String toString() {
        return "Key{" +
                "id=" + id +
                ", idA=" + idA +
                ", public_key='" + public_key + '\'' +
                ", day_expired='" + day_expired + '\'' +
                ", day_create='" + day_create + '\'' +
                '}';
    }

    public static void main(String[] args) throws ParseException {
        CheckOut checkOut = new CheckOut(1, "0000", "", "", 1, 34, 1, 1, 1, 1, "1", "09:08:04 PM 03/12/2023", "", "", "", "", "", "");
        System.out.println(getKeyByOrder(checkOut));
    }

}
