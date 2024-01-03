package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Ward implements Serializable {
    int WardCode;
    String WardName;

    public Ward() {
    }

    public Ward(int wardCode, String wardName) {
        WardCode = wardCode;
        WardName = wardName;
    }

    @Override
    public String toString() {
        return "Ward{" +
                "WardCode=" + WardCode +
                ", WardName='" + WardName + '\'' +
                '}';
    }

    public int getWardCode() {
        return WardCode;
    }

    public void setWardCode(int wardCode) {
        WardCode = wardCode;
    }

    public String getWardName() {
        return WardName;
    }

    public void setWardName(String wardName) {
        WardName = wardName;
    }
}
