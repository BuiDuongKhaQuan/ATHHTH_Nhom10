package qht.shopmypham.com.vn.model;

import qht.shopmypham.com.vn.service.WareHouseService;

import java.io.Serializable;
import java.util.List;

public class WarehouseDetail implements Serializable {
    int id;
    int idP;

    String dateInput;
    int quantityInput;

    public WarehouseDetail() {
    }

    public WarehouseDetail(int id, int idP, String dateInput, int quantityInput) {
        this.id = id;
        this.idP = idP;

        this.dateInput = dateInput;
        this.quantityInput = quantityInput;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }


    public String getDateInput() {
        return dateInput;
    }

    public void setDateInput(String dateInput) {
        this.dateInput = dateInput;
    }

    public int getQuantityInput() {
        return quantityInput;
    }

    public void setQuantityInput(int quantityInput) {
        this.quantityInput = quantityInput;
    }

    @Override
    public String toString() {
        return "WarehouseDetail{" +
                "id=" + id +
                ", idP=" + idP +

                ", dateInput='" + dateInput + '\'' +
                ", quantityInput=" + quantityInput +
                '}';
    }

    // tính tổng số lần nhâpj kho
    public static int calculateTotal() {
        int total =0;
        List<WareHouse> wareHouseList = WareHouseService.getAll();
        for (int i = 0; i < wareHouseList.size(); i++) {
            List<WarehouseDetail>list = WareHouseService.getListWarehouseDetailById(String.valueOf(wareHouseList.get(i).getIdP()));
            for (WarehouseDetail d : list) {
                total =+ d.getQuantityInput();
            }
        }
        return total;
    }

    public static void main(String[] args) {

    }
}
