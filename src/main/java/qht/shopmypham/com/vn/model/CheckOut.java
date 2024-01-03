package qht.shopmypham.com.vn.model;

import qht.shopmypham.com.vn.service.ProductCheckoutService;

import java.io.Serializable;
import java.util.List;

public class CheckOut implements Serializable {
    int idCk;
    String phone;
    String idTransport;
    String idVoucher;
    int idPm;
    int idA;
    int idStatus;
    int idAdmin, idProvince, idWard;
    String orderDate, detailAddress, idDistrict;
    String confirmDate;
    String receivedDate;
    String name;
    String note, hashMessage;

    public CheckOut() {
    }

    public CheckOut(int idCk, String phone, String idTransport, String idVoucher, int idPm, int idA, int idStatus, int idAdmin, int idProvince, int idWard, String idDistrict, String orderDate, String detailAddress, String confirmDate, String receivedDate, String name, String note, String hashMessage) {
        this.idCk = idCk;
        this.phone = phone;
        this.idTransport = idTransport;
        this.idVoucher = idVoucher;
        this.idPm = idPm;
        this.idA = idA;
        this.idStatus = idStatus;
        this.idAdmin = idAdmin;
        this.idProvince = idProvince;
        this.idWard = idWard;
        this.idDistrict = idDistrict;
        this.orderDate = orderDate;
        this.detailAddress = detailAddress;
        this.confirmDate = confirmDate;
        this.receivedDate = receivedDate;
        this.name = name;
        this.note = note;
        this.hashMessage = hashMessage;
    }

    public int getIdWard() {
        return idWard;
    }

    public void setIdWard(int idWard) {
        this.idWard = idWard;
    }

    public String getIdDistrict() {
        return idDistrict;
    }

    public void setIdDistrict(String idDistrict) {
        this.idDistrict = idDistrict;
    }

    @Override
    public String toString() {
        return "CheckOut{" +
                "idCk=" + idCk +
                ", phone='" + phone + '\'' +
                ", idTransport='" + idTransport + '\'' +
                ", idVoucher='" + idVoucher + '\'' +
                ", idPm=" + idPm +
                ", idA=" + idA +
                ", idStatus=" + idStatus +
                ", idAdmin=" + idAdmin +
                ", idProvince=" + idProvince +
                ", orderDate='" + orderDate + '\'' +
                ", detailAddress='" + detailAddress + '\'' +
                ", confirmDate='" + confirmDate + '\'' +
                ", receivedDate='" + receivedDate + '\'' +
                ", name='" + name + '\'' +
                ", note='" + note + '\'' +
                ", hashMessage='" + hashMessage + '\'' +
                '}';
    }

    public int getIdCk() {
        return idCk;
    }

    public void setIdCk(int idCk) {
        this.idCk = idCk;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdTransport() {
        return idTransport;
    }

    public void setIdTransport(String idTransport) {
        this.idTransport = idTransport;
    }

    public String getIdVoucher() {
        return idVoucher;
    }

    public void setIdVoucher(String idVoucher) {
        this.idVoucher = idVoucher;
    }

    public int getIdPm() {
        return idPm;
    }

    public void setIdPm(int idPm) {
        this.idPm = idPm;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public int getIdProvince() {
        return idProvince;
    }

    public void setIdProvince(int idProvince) {
        this.idProvince = idProvince;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getConfirmDate() {
        return confirmDate;
    }

    public void setConfirmDate(String confirmDate) {
        this.confirmDate = confirmDate;
    }

    public String getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(String receivedDate) {
        this.receivedDate = receivedDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getHashMessage() {
        return hashMessage;
    }

    public void setHashMessage(String hashMessage) {
        this.hashMessage = hashMessage;
    }

    public List<ListProductByCheckOut> getProductAll() {
        return ProductCheckoutService.getProductProductCheckoutByIdCk(String.valueOf(this.idCk));
    }

}
