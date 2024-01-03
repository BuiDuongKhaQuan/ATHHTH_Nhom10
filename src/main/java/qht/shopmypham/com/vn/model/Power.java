package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Power implements Serializable {
    int id, idA;
    int orderManage, generalManage, productManage, accountManage, blogManage, homeManage, voucherManage, sliderManage,warehouseManage;

    public Power() {
    }

    public Power(int id, int idA, int orderManage, int generalManage, int productManage, int accountManage, int blogManage, int homeManage, int voucherManage, int sliderManage, int warehouseManage) {
        this.id = id;
        this.idA = idA;
        this.orderManage = orderManage;
        this.generalManage = generalManage;
        this.productManage = productManage;
        this.accountManage = accountManage;
        this.blogManage = blogManage;
        this.homeManage = homeManage;
        this.voucherManage = voucherManage;
        this.sliderManage = sliderManage;
        this.warehouseManage = warehouseManage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public int getOrderManage() {
        return orderManage;
    }

    public void setOrderManage(int orderManage) {
        this.orderManage = orderManage;
    }

    public int getGeneralManage() {
        return generalManage;
    }

    public void setGeneralManage(int generalManage) {
        this.generalManage = generalManage;
    }

    public int getProductManage() {
        return productManage;
    }

    public void setProductManage(int productManage) {
        this.productManage = productManage;
    }

    public int getAccountManage() {
        return accountManage;
    }

    public void setAccountManage(int accountManage) {
        this.accountManage = accountManage;
    }

    public int getBlogManage() {
        return blogManage;
    }

    public void setBlogManage(int blogManage) {
        this.blogManage = blogManage;
    }

    public int getHomeManage() {
        return homeManage;
    }

    public void setHomeManage(int homeManage) {
        this.homeManage = homeManage;
    }

    public int getVoucherManage() {
        return voucherManage;
    }

    public void setVoucherManage(int voucherManage) {
        this.voucherManage = voucherManage;
    }

    public int getSliderManage() {
        return sliderManage;
    }

    public void setSliderManage(int sliderManage) {
        this.sliderManage = sliderManage;
    }

    public int getWarehouseManage() {
        return warehouseManage;
    }

    public void setWarehouseManage(int warehouseManage) {
        this.warehouseManage = warehouseManage;
    }
}
