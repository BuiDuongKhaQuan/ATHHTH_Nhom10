package qht.shopmypham.com.vn.model;

import qht.shopmypham.com.vn.service.ProductCheckoutService;
import qht.shopmypham.com.vn.service.ProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListProductByCheckOut {
    int idLc;
    int idCk;
    int idP;
    int quantity;


    public ListProductByCheckOut() {
        super();
    }

    public ListProductByCheckOut(int idLc, int idCk, int idP, int quantity) {
        this.idLc = idLc;
        this.idCk = idCk;
        this.idP = idP;
        this.quantity = quantity;
    }

    public int getIdLc() {
        return idLc;
    }

    public void setIdLc(int idLc) {
        this.idLc = idLc;
    }

    public int getIdCk() {
        return idCk;
    }

    public void setIdCk(int idCk) {
        this.idCk = idCk;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ListProductByCheckOut{" +
                "idLc=" + idLc +
                ", idCk=" + idCk +
                ", idP=" + idP +
                ", quantity=" + quantity +
                '}';
    }
    public static Map<Integer, Integer> sum_sale() {
        Map<Integer, Integer> map = new HashMap<>();
        int a = 0;
        List<ListProductByCheckOut> list = ProductCheckoutService.getProductProductCheckout();
        for (int i = 0; i < list.size(); i++) {
            int key = list.get(i).getIdP();
            int value = list.get(i).getQuantity();

            // Kiểm tra xem key của phần tử hiện tại đã tồn tại trong map chưa.
            if (map.containsKey(key)) {
                // Nếu key đã tồn tại trong map, cộng giá trị value hiện tại của key với giá trị value của phần tử mới.
                int oldValue = map.get(key);
                map.put(key, oldValue + value);
            } else {
                // Nếu key chưa tồn tại trong map, đưa phần tử mới vào map với giá trị value của nó.
                map.put(key, value);
            }
        }
        return map;
    }
//    public static  Product re(){
//
//        Map<Integer, Integer> map =sum_sale();
//        List<Product>productList = ProductService.inventoryProduct();
//        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
//            Integer key = entry.getKey();
//            if (productList.contains(key)) {
//                Integer v = map.get(key);
//                // key có tồn tại trong danh sách List
//
//            } else {
//                // key không tồn tại trong danh sách List
//            }
//
//    }
}
