package qht.shopmypham.com.vn.model;

import qht.shopmypham.com.vn.service.AccountService;
import qht.shopmypham.com.vn.service.CartService;
import qht.shopmypham.com.vn.service.ProductService;

import java.io.Serializable;
import java.util.List;

public class Account implements Serializable {
    int id;
    String user;
    String pass;
    String fullName;
    String phone;
    String address;
    String email;
    String img;
    String idFacebook;
    String idGoogle;
    int status;

    public Account() {
    }

    public Account(int id, String user, String pass, String fullName, int status) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.fullName = fullName;
        this.status = status;
    }

    public Account(int id, String user, String pass, String fullName, String phone, String address, String email, String img, String idFacebook, String idGoogle, int status) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.img = img;
        this.idFacebook = idFacebook;
        this.idGoogle = idGoogle;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIdFacebook() {
        return idFacebook;
    }

    public void setIdFacebook(String idFacebook) {
        this.idFacebook = idFacebook;
    }

    public String getIdGoogle() {
        return idGoogle;
    }

    public void setIdGoogle(String idGoogle) {
        this.idGoogle = idGoogle;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Power powerAccount() {
        return AccountService.getPowerAccount(this.getId());
    }

    public String getName() {
        String name = "";
        if (this.getIdGoogle() != null) {
            name = this.getEmail();
        }
        if (this.getIdGoogle() == null) {
            name = this.getFullName();
        }
        if (this.getFullName() == null && this.getIdGoogle() == null) {
            name = this.getUser();
        }
        return name;
    }

    public boolean maxPower() {
        return AccountService.getPowerAccount(this.getId()).getAccountManage() == 1
                && AccountService.getPowerAccount(this.getId()).getSliderManage() == 1
                && AccountService.getPowerAccount(this.getId()).getBlogManage() == 1
                && AccountService.getPowerAccount(this.getId()).getGeneralManage() == 1
                && AccountService.getPowerAccount(this.getId()).getHomeManage() == 1
                && AccountService.getPowerAccount(this.getId()).getOrderManage() == 1
                && AccountService.getPowerAccount(this.getId()).getProductManage() == 1
                && AccountService.getPowerAccount(this.getId()).getVoucherManage() == 1
                && AccountService.getPowerAccount(this.getId()).getWarehouseManage() == 1;
    }

    public boolean mediumPower() {
        return AccountService.getPowerAccount(this.getId()).getAccountManage() == 1
                || AccountService.getPowerAccount(this.getId()).getSliderManage() == 1
                || AccountService.getPowerAccount(this.getId()).getBlogManage() == 1
                || AccountService.getPowerAccount(this.getId()).getGeneralManage() == 1
                || AccountService.getPowerAccount(this.getId()).getHomeManage() == 1
                || AccountService.getPowerAccount(this.getId()).getOrderManage() == 1
                || AccountService.getPowerAccount(this.getId()).getProductManage() == 1
                || AccountService.getPowerAccount(this.getId()).getVoucherManage() == 1
                || AccountService.getPowerAccount(this.getId()).getWarehouseManage() == 1;
    }
    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", pass='" + pass + '\'' +
                ", fullName='" + fullName + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", img='" + img + '\'' +
                ", idFacebook='" + idFacebook + '\'' +
                ", idGoogle='" + idGoogle + '\'' +
                ", status=" + status +
                '}';
    }

    public List<ListProductByCart> getProductCart() {
        return CartService.getAllByIda(this.getId());
    }

    public List<Product> getFavoriteProduct() {
        return ProductService.getFavoriteProductByIdA(this.getId());
    }

    public Account getAccount() {
        return AccountService.getAccountById(this.getId());
    }


}
