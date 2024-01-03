package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class OTP implements Serializable {
    String idOTP, idA, OTP, time;
    public OTP() {
    }

    public OTP(String idOTP, String idA, String OTP, String time) {
        this.idOTP = idOTP;
        this.idA = idA;
        this.OTP = OTP;
        this.time = time;
    }

    public String getIdOTP() {
        return idOTP;
    }

    public void setIdOTP(String idOTP) {
        this.idOTP = idOTP;
    }

    public String getIdA() {
        return idA;
    }

    public void setIdA(String idA) {
        this.idA = idA;
    }

    public String getOTP() {
        return OTP;
    }

    public void setOTP(String OTP) {
        this.OTP = OTP;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
