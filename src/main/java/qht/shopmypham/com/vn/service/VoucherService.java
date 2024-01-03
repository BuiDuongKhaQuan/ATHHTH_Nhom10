package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Contact;
import qht.shopmypham.com.vn.model.Voucher;

import java.util.List;
import java.util.stream.Collectors;

public class VoucherService {
    public static void addVoucher(String price, String quantity, String name, String code) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into voucher(price, quantity,name, code, status) values (?,?,?,?,?)")
                        .bind(0, price)
                        .bind(1, quantity)
                        .bind(2, name)
                        .bind(3, code)
                        .bind(4, 1)
                        .execute()
        );
    }

    public static void editVouchertById(String id, String name, String price, String status, String quantity, String code) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update voucher set status = ?, code =? ,price =? , quantity = ?, name = ? where id =?")
                        .bind(0, status)
                        .bind(1, code)
                        .bind(2, price)
                        .bind(3, quantity)
                        .bind(4, name)
                        .bind(5, id)
                        .execute()
        );
    }

    public static void editQuantityVouchert(int id, int quantity) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update voucher set quantity = ? where id =?")
                        .bind(0, quantity)
                        .bind(1, id)
                        .execute()
        );
    }

    public static void editStatusVouchert(int id, int status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update voucher set status = ? where id =?")
                        .bind(0, status)
                        .bind(1, id)
                        .execute()
        );
    }

    public static List<Voucher> getAllVoucher() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from voucher").mapToBean(Voucher.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Voucher> getAllVoucherByStatusAndQuantity() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from voucher where status = 1 AND quantity > 0").mapToBean(Voucher.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static Voucher getVoucherById(String id) {
        List<Voucher> voucherList = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from voucher where id = ?")
                    .bind(0, id)
                    .mapToBean(Voucher.class)
                    .stream().collect(Collectors.toList());
        });
        if (voucherList.size() == 0) return null;
        return voucherList.get(0);
    }

    public static Voucher getVoucherByCode(String code) {
        List<Voucher> voucherList = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from voucher where code = ?")
                    .bind(0, code)
                    .mapToBean(Voucher.class)
                    .stream().collect(Collectors.toList());
        });
        if (voucherList.size() == 0) return null;
        return voucherList.get(0);
    }

    public static void deleteVoucherById(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from voucher where id = ?")
                        .bind(0, id)
                        .execute()
        );
    }

    public static List<Voucher> getVoucherByName(String name) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM voucher WHERE name LIKE ? ")
                        .bind(0, "%" + name + "%")
                        .mapToBean(Voucher.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static void main(String[] args) {
        System.out.println(getVoucherByCode("qwer1tyuiop"));
    }

}
