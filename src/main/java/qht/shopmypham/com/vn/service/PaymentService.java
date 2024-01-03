package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.CheckOut;
import qht.shopmypham.com.vn.model.Payment;

import java.util.List;
import java.util.stream.Collectors;

public class PaymentService {

    public static void addPayment(String namePayment, String iconPayment) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO payment(namePayment,iconPayment) " +
                                "VALUES (?,?)")
                        .bind(0, namePayment)
                        .bind(1, iconPayment)
                        .execute()

        );
    }

    public static Payment getPaymentByIdCk(String idPm) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from payment where idPm = ?")
                    .bind(0, idPm)
                    .mapToBean(Payment.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }

    public static List<Payment> getAllPayment() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from payment").mapToBean(Payment.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void editPaymentByidCk(String idPm, String namePayment, String iconPayment) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update payment set namePayment=?,iconPayment=? where idPm = ?")
                        .bind(0, namePayment)
                        .bind(1, iconPayment)
                        .bind(2, idPm)
                        .execute()
        );
    }

    public static void deletePaymentById(String idPm) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from payment where idPm = ?")
                        .bind(0, idPm)
                        .execute()
        );
    }


}
