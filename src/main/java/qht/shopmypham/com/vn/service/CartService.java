package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.ListProductByCart;

import java.util.List;
import java.util.stream.Collectors;

public class CartService {
    public static void addProductToCart(String idp, String quantity, String ida) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO listproductbycart(idP,quantity,idA) " +
                                "VALUES (?,?,?)")
                        .bind(0, idp).bind(1, quantity).bind(2, ida)
                        .execute()
        );
    }

    public static List<ListProductByCart> getAllByIda(int ida) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from listproductbycart where idA = ?")
                    .bind(0, ida)
                    .mapToBean(ListProductByCart.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<ListProductByCart> getAll() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from listproductbycart").mapToBean(ListProductByCart.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static ListProductByCart checkProduct(String idp, String ida) {

        List<ListProductByCart> ListProductByCarts = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from listproductbycart where idP = ? and idA = ?")
                    .bind(0, idp)
                    .bind(1, ida)
                    .mapToBean(ListProductByCart.class)
                    .stream().collect(Collectors.toList());
        });
        if (ListProductByCarts.size() == 0)
            return null;
        return ListProductByCarts.get(0);
    }

    public static void upQuantityProductListProductByCart(String quantity, String idp, String ida) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update listproductbycart set quantity =? where idP = ? and idA= ?")
                        .bind(0, quantity)
                        .bind(1, idp)
                        .bind(2, ida)
                        .execute()
        );
    }

    public static void deleteProductByIdpAndIda(String idp, String ida) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from listproductbycart where idP = ? and idA = ?")
                        .bind(0, idp)
                        .bind(1, ida)
                        .execute()
        );
    }

    public static void deleteProductByIda(String ida) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from listproductbycart where idA = ?")
                        .bind(0, ida)
                        .execute()
        );
    }

    public static void main(String[] args) {
        deleteProductByIdpAndIda("5", "1");
    }
}
