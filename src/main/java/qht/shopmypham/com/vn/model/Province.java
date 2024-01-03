package qht.shopmypham.com.vn.model;

public class Province {
    int ProvinceID ;
    String ProvinceName ;

    public Province() {
    }

    public Province(int provinceID, String provinceName) {
        ProvinceID = provinceID;
        ProvinceName = provinceName;
    }

    @Override
    public String toString() {
        return "Province{" +
                "ProvinceID=" + ProvinceID +
                ", ProvinceName='" + ProvinceName + '\'' +
                '}';
    }

    public int getProvinceID() {
        return ProvinceID;
    }

    public void setProvinceID(int provinceID) {
        ProvinceID = provinceID;
    }

    public String getProvinceName() {
        return ProvinceName;
    }

    public void setProvinceName(String provinceName) {
        ProvinceName = provinceName;
    }
}
