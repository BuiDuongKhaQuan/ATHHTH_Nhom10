package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.OTP;

import java.util.List;
import java.util.stream.Collectors;

public class OTPService {
    public static void addOTP( String idA, String OTP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into otp(idA, OTP) VALUES (?,?)")
                        .bind(0, idA)
                        .bind(1, OTP)
                        .execute()
        );
    }

    public static List<OTP> getOTPByIdA(String idA) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM otp where idA = ?")
                        .bind(0,idA)
                        .mapToBean(OTP.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static void main(String[] args) {

    }
}
