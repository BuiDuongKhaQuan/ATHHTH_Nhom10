package qht.shopmypham.com.vn.service;


import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.ListProductByCheckOut;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductCheckoutService {
    public static void addProductToProductCheckout(String idCk, String idP, String quantity) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO listproductbycheckout(idCk,idP,quantity) " +
                                "VALUES (?,?,?)")
                        .bind(0, idCk)
                        .bind(1, idP)
                        .bind(2, quantity)
                        .execute()
        );
    }

    public static List<ListProductByCheckOut> getProductProductCheckout() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM listproductbycheckout ")
                    .mapToBean(ListProductByCheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }



    public static List<ListProductByCheckOut> getProductProductCheckoutByIdCk(String idCk) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM listproductbycheckout where  idCk=?")
                    .bind(0, idCk)
                    .mapToBean(ListProductByCheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<ListProductByCheckOut> getProductProductCheckout(int idA, int idP) {
        List<ListProductByCheckOut> listProductByCheckOuts = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT listproductbycheckout.* FROM `listproductbycheckout` INNER JOIN " +
                            "`checkout` ON listproductbycheckout.idCk = checkout.idCk WHERE checkout.idA = ?  " +
                            "AND listproductbycheckout.idP = ?")
                    .bind(0, idA)
                    .bind(1, idP)
                    .mapToBean(ListProductByCheckOut.class)
                    .stream().collect(Collectors.toList());
        });
        if (listProductByCheckOuts.size() == 0) return null;
        return listProductByCheckOuts;
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
    public static List<ListProductByCheckOut> getProductProductCheckoutByIdP(int idP) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM listproductbycheckout  where idP=?").bind(0, idP)
                    .mapToBean(ListProductByCheckOut.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static int quantitySold(int idP) {

        int quantity = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT sum(quantity) from listproductbycheckout WHERE idP =?")
                    .bind(0, idP)
                    .mapTo(Integer.class)
                    .one();
        });
        return quantity;
    }



    public static void main(String[] args) {
        System.out.println(quantitySold(1));
    }
}
