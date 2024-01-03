package qht.shopmypham.com.vn.service;

import org.jdbi.v3.core.Handle;
import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.*;
import qht.shopmypham.com.vn.tools.Encode;

import java.util.List;
import java.util.stream.Collectors;

public class CheckOutService {
    public static void addCheckOutByIdA(String idWard, String idDistrict, String phone, String idTransport, String idPm, String name, String note, String idA, String voucher, String orderDate, String provinceID, String address_detail, String hashMessage) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO checkout(phone,idTransport,idPm,idA,idStatus,idAdmin,orderDate" +
                                ", confirmDate, receivedDate,name,note,idVoucher,idProvince,detailAddress, idWard, idDistrict,hashMessage) " +
                                "VALUES (?,?,?,?,0,null,?,null,null,?,?,?,?,?,?,?,?)")
                        .bind(0, phone)
                        .bind(1, idTransport)
                        .bind(2, idPm)
                        .bind(3, idA)
                        .bind(4, orderDate)
                        .bind(5, name)
                        .bind(6, note)
                        .bind(7, voucher)
                        .bind(8, provinceID)
                        .bind(9, address_detail)
                        .bind(10, idWard)
                        .bind(11, idDistrict)
                        .bind(12, hashMessage)
                        .execute()

        );
    }

    public static void editAddress(String idWard, String idDistrict, String idCk, String idTransport, String provinceID, String address_detail) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idTransport = ?, idProvince = ?, detailAddress = ?, idWard=?,idDistrict=? where idCk = ?")
                        .bind(0, idTransport)
                        .bind(1, provinceID)
                        .bind(2, address_detail)
                        .bind(3, idWard)
                        .bind(4, idDistrict)
                        .bind(5, idCk)
                        .execute()

        );
    }

    public static List<CheckOut> getCheckOutByIdA(String idA) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout where idA = ?")
                    .bind(0, idA)
                    .mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static CheckOut getCheckOutByIdCk(String idCk) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout where idCk = ?")
                    .bind(0, idCk)
                    .mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }

    public static List<CheckOut> getCheckOutByStatus(String status) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout where idStatus = ?")
                    .bind(0, status)
                    .mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<CheckOut> getAllCheckOut() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout").mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void editCheckOutByidCk(String idCk, String idStatus, String isAdmin, String orderDate, String confirmDate, String receivedDate) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idStatus=?,isAdmin=?,orderDate=?,confirmDate = ?,receivedDate = ? where idCk = ?")
                        .bind(0, idStatus)
                        .bind(1, isAdmin)
                        .bind(2, orderDate)
                        .bind(3, confirmDate)
                        .bind(4, receivedDate)
                        .bind(5, idCk)
                        .execute()
        );
    }

    public static void editCheckOut(String idCk, String idAdmin, String note, String phone, String address, String name) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idAdmin=?,note=?,phone=?,address = ?,name = ? where idCk = ?")
                        .bind(0, idAdmin)
                        .bind(1, note)
                        .bind(2, phone)
                        .bind(3, address)
                        .bind(4, name)
                        .bind(5, idCk)
                        .execute()
        );
    }

    public static void confirmCheckOutByidCk(String idCk, String idAdmin, String confirmDate) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idStatus=?,idAdmin=?, confirmDate = ? where idCk = ?")
                        .bind(0, "1")
                        .bind(1, idAdmin)
                        .bind(2, confirmDate)
                        .bind(3, idCk)
                        .execute()
        );
    }

    public static void completeCheckOutByidCk(String idCk, String idAdmin, String receivedDate) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idStatus=?,idAdmin=?, receivedDate = ? where idCk = ?")
                        .bind(0, "3")
                        .bind(1, idAdmin)
                        .bind(2, receivedDate)
                        .bind(3, idCk)
                        .execute()
        );
    }

    public static void canceCheckOutByidCk(String idCk, String idAdmin) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idStatus=?,idAdmin=? where idCk = ?")
                        .bind(0, "5")
                        .bind(1, idAdmin)
                        .bind(2, idCk)
                        .execute()
        );
    }


    public static void deleteCheckOutById(String idCk) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from checkout where idCk = ?")
                        .bind(0, idCk)
                        .execute()
        );
    }

    public static List<CheckOut> getCheckOutById(String id) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM checkout WHERE idCk LIKE ? ")
                        .bind(0, "%" + id + "%")
                        .mapToBean(CheckOut.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static List<ListProductByCheckOut> getCancelAll() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from listproductbycheckout l join checkout c on l.idCk = c.idCk WHERE idStatus =5 ")
                    .mapToBean(ListProductByCheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void updateStatusCancel(String idCk) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update checkout set idStatus=? where idCk = ?")
                        .bind(0, "4")
                        .bind(1, idCk)
                        .execute()
        );
    }

    // tổng đơn hàng trong năm
    public static List<CheckOut> getAllCheckOutByYear() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout WHERE YEAR(STR_TO_DATE(orderDate, '%r %d/%m/%Y'))=year(CURRENT_DATE())").mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // tổng số đơn hàng tháng
    public static List<CheckOut> getAllCheckOutByMonth() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout WHERE  YEAR(STR_TO_DATE(orderDate, '%r %d/%m/%Y'))=year(CURRENT_DATE()) and month(STR_TO_DATE(orderDate, '%r %d/%m/%Y'))=month(CURRENT_DATE())").mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // ds don hàng hủy
    public static List<CheckOut> getCancel() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from checkout  WHERE idStatus =5 ")
                    .mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<CheckOut> getAllCheckOutDesc() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout ORDER by  orderDate asc  LIMIT 5").mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Key> getAllKey(int idA) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from mykey WHERE day_expired IS NOT NULL AND idA = ?")
                    .bind(0, idA)
                    .mapToBean(Key.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static String getKeyByIdA(int id) {
        try (Handle handle = JDBiConnector.me().open()) {
            List<String> resultList = handle.createQuery("SELECT public_key FROM mykey WHERE idA = ? AND day_expired IS NULL")
                    .bind(0, id)
                    .mapTo(String.class)
                    .list();

            return resultList.isEmpty() ? null : resultList.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<CheckOut> getCheckoutByStatus(int idA) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from checkout WHERE idA=? and idStatus !=2 ")
                    .bind(0, idA).mapToBean(CheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void main(String[] args) {
        System.out.println(getCancel());
    }
}


