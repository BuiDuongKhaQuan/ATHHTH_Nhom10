package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Categories;
import qht.shopmypham.com.vn.model.Slider;
import qht.shopmypham.com.vn.model.Trademark;

import java.util.List;
import java.util.stream.Collectors;

public class TrademarkService {

    public static Trademark getTrademarkByIdT(String id) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM trademark where id = ?")
                        .bind(0, id)
                        .mapToBean(Trademark.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }
    public static List<Trademark> getTrademarkAll() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM trademark ")
                        .mapToBean(Trademark.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static void editTrademarkById(String id, String logo, String name, String address, String phone, String status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update trademark set logo = ?,name = ?,address = ?,phone = ?, status = ? where id = ?")
                        .bind(0, logo)
                        .bind(1, name)
                        .bind(2, address)
                        .bind(3, phone)
                        .bind(4, status)
                        .bind(5, id)
                        .execute()
        );
    }

    public static void addTrademark(String logo, String name, String address, String phone,String status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into trademark(logo,name,address,phone, status) values (?,?,?,?,?)")
                        .bind(0, logo)
                        .bind(1, name)
                        .bind(2, address)
                        .bind(3, phone)
                        .bind(4, status)
                        .execute()
        );
    }
    public static void addImageByIdT(String idT, String logo) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into images(id,logo) VALUES (?,?)")
                        .bind(0, idT)
                        .bind(1, logo)
                        .execute()
        );

    }
    public static void deleteTrademarkById(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from trademark where id = ?")
                        .bind(0, id)
                        .execute()
        );
    }
    public static Trademark getTrademark(String idT) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM trademark WHERE id = ?")
                        .bind(0, idT)
                        .mapToBean(Trademark.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }

}
