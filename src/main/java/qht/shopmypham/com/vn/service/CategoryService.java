package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Categories;
import qht.shopmypham.com.vn.model.Product;

import java.util.List;
import java.util.stream.Collectors;

public class CategoryService {
    public static List<Categories> getAllCategory() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from categories").mapToBean(Categories.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Categories> getTop6Categories() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM categories LIMIT 6").mapToBean(Categories.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static Categories getCategoriesById(String cid) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM categories WHERE idC = ?")
                        .bind(0, cid)
                        .mapToBean(Categories.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }

    public static void addCategory(String name, String imgC) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into categories(nameC,imgC) VALUES (?,?)")
                        .bind(0, name)
                        .bind(1, imgC)
                        .execute()
        );
    }

    public static void deleteCategoryById(String cid) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from categories where idC = ?")
                        .bind(0, cid)
                        .execute()
        );
    }

    public static List<Product> getNextTop12ProductByIdC(int amount, String idC) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product where idC = ? LIMIT ?,5")
                    .bind(0, idC)
                    .bind(1, amount)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void editCategoryById(String idC, String name, String img) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update categories set nameC = ?, imgC = ? where idC =?")
                        .bind(0, name)
                        .bind(1,img)
                        .bind(2, idC)
                        .execute()
        );
    }
    public static List<Categories> getTop3() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM categories where idC =1 or idC = 2 or idC=3 LIMIT 3").mapToBean(Categories.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Categories> getTop3byId(String idC) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM categories where idC =? ")
                    .bind(0,idC)
                    .mapToBean(Categories.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static void main(String[] args) {
        getTop3();
    }
}
