package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Shop;

import java.util.stream.Collectors;

public class ShopService {
    public static Shop getShop() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM shop")
                        .mapToBean(Shop.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }

    public static void editShop(String idS, String shopName, String logo_header, String aboutShop, String phone, String email,
                                String designerBy, String textInHelp, String provinceID, String districtID, String wardID) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update shop set  shopName=?,  aboutShop=?, logo_header=? ," +
                                " phone=?,  email=?, designerBy=?,  textInHelp=?, provinceID=?, districtID=?, wardID=? where idS = ?")
                        .bind(0, shopName)
                        .bind(1, aboutShop)
                        .bind(2, logo_header)
                        .bind(3, phone)
                        .bind(4, email)
                        .bind(5, designerBy)
                        .bind(6, textInHelp)
                        .bind(7, provinceID)
                        .bind(8, districtID)
                        .bind(9, wardID)
                        .bind(10, idS)
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(getShop());
    }
}
