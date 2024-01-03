package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class District implements Serializable {
    private  int DistrictID;
    private String DistrictName;

    public District() {
    }

    public District(int districtID, String districtName) {
        DistrictID = districtID;
        DistrictName = districtName;
    }

    @Override
    public String toString() {
        return "District{" +
                "DistrictID=" + DistrictID +
                ", DistrictName='" + DistrictName + '\'' +
                '}';
    }

    public int getDistrictID() {
        return DistrictID;
    }

    public void setDistrictID(int districtID) {
        DistrictID = districtID;
    }

    public String getDistrictName() {
        return DistrictName;
    }

    public void setDistrictName(String districtName) {
        DistrictName = districtName;
    }
}
