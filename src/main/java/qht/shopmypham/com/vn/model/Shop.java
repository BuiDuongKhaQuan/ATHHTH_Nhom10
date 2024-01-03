package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Shop implements Serializable {
    int idS, provinceID, districtID, wardID;
    String logo_header, logo_footer, aboutShop, designerBy, textInHelp, shopName, phone, email;

    public Shop() {
    }

    public Shop(int idS, int provinceID, int districtID, int wardID, String logo_header, String logo_footer, String aboutShop, String designerBy, String textInHelp, String shopName, String phone, String email) {
        this.idS = idS;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.wardID = wardID;
        this.logo_header = logo_header;
        this.logo_footer = logo_footer;
        this.aboutShop = aboutShop;
        this.designerBy = designerBy;
        this.textInHelp = textInHelp;
        this.shopName = shopName;
        this.phone = phone;
        this.email = email;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "idS=" + idS +
                ", provinceID=" + provinceID +
                ", districtID=" + districtID +
                ", wardID=" + wardID +
                ", logo_header='" + logo_header + '\'' +
                ", logo_footer='" + logo_footer + '\'' +
                ", aboutShop='" + aboutShop + '\'' +
                ", designerBy='" + designerBy + '\'' +
                ", textInHelp='" + textInHelp + '\'' +
                ", shopName='" + shopName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public int getIdS() {
        return idS;
    }

    public void setIdS(int idS) {
        this.idS = idS;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public int getWardID() {
        return wardID;
    }

    public void setWardID(int wardID) {
        this.wardID = wardID;
    }

    public String getLogo_header() {
        return logo_header;
    }

    public void setLogo_header(String logo_header) {
        this.logo_header = logo_header;
    }

    public String getLogo_footer() {
        return logo_footer;
    }

    public void setLogo_footer(String logo_footer) {
        this.logo_footer = logo_footer;
    }

    public String getAboutShop() {
        return aboutShop;
    }

    public void setAboutShop(String aboutShop) {
        this.aboutShop = aboutShop;
    }

    public String getDesignerBy() {
        return designerBy;
    }

    public void setDesignerBy(String designerBy) {
        this.designerBy = designerBy;
    }

    public String getTextInHelp() {
        return textInHelp;
    }

    public void setTextInHelp(String textInHelp) {
        this.textInHelp = textInHelp;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
