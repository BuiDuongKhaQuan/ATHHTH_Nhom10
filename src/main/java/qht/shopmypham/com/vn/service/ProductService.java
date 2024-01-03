package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {
    public static List<Product> getAllProduct() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getProductIsSell(int status) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product where status = ?")
                    .bind(0, status)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void editProductIsSell(int status, String idP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update product set status = ? where idP = ?")
                        .bind(0, status)
                        .bind(1, idP)
                        .execute()
        );
    }

    public static List<Product> getTop10ProductByIdC(String idC) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product where idC = ? LIMIT 10")
                    .bind(0, idC)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getTopProductPage(int item, int offset) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product LIMIT ? OFFSET ?")
                    .bind(0, item)
                    .bind(1, offset)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getTop12Product() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product LIMIT 12").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getNextTop12Product(int amount) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product LIMIT ?,12")
                    .bind(0, amount)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static Product getProductById(int pid) {
        List<Product> products = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE idP = ?")
                        .bind(0, pid)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return products.get(0);
    }

    public static List<Product> getListProductById(int pid) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE idP = ?")
                        .bind(0, pid)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static WareHouse getProductById1(int pid) {
        List<WareHouse> products = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM warehouse WHERE idP = ?")
                        .bind(0, pid)
                        .mapToBean(WareHouse.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return products.get(0);
    }

    public static List<Product> getProductByIdC(String cid) {
        List<Product> products = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE idC = ? LIMIT 4")
                        .bind(0, cid)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return products;
    }

    public static List<Product> getTop5ProductByIdC(String cid) {
        List<Product> products = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE idC = ? LIMIT 5")
                        .bind(0, cid)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return products;
    }

    public static List<Product> getTop8ProductIsNew() {
        List<Product> products = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE isNew = 1 LIMIT 8")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return products;
    }

    public static List<Product> getTop8IsPromotion() {
        List<Product> products = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE isPro = 1 LIMIT 8")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return products;
    }

    public static List<Product> getProductByPrice(String price1, String price2) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE price>? AND price<?")
                        .bind(0, price1)
                        .bind(1, price2)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }


    public static List<Product> getProductSortDescendingByPrice() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product ORDER BY price")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static List<Product> getProductByIsNew() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product where isNew = 1")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static List<Product> getProductSortAscendingByPrice() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product ORDER BY price DESC ")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static List<Product> getProductByName(String name) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product WHERE name LIKE ? ")
                        .bind(0, "%" + name + "%")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static void deleteProductById(String pid) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from product where idP = ?")
                        .bind(0, pid)
                        .execute()
        );
    }

    public static void addProduct(String idP, String name, String trademark, String information,
                                  String idC, String price) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into product(idP,name,idT,price,information, idC) values (?,?,?,?,?,?)")
                        .bind(0, idP)
                        .bind(1, name)
                        .bind(2, trademark)
                        .bind(3, price)
                        .bind(4, information)
                        .bind(5, idC)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into product(idP,name,idT,price,information, idC) values (?,?,?,?,?,?)")
                        .bind(0, idP)
                        .bind(1, name)
                        .bind(2, trademark)
                        .bind(3, price)
                        .bind(4, information)
                        .bind(5, idC)
                        .execute()
        );
    }


    public static void editProductById(String name, String trademark, String information,
                                       String idC, String price, String idP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update product set name = ?, idT= ?,price= ?,information= ?, idC= ? where idP = ?")
                        .bind(0, name)
                        .bind(1, trademark)
                        .bind(2, price)
                        .bind(3, information)
                        .bind(4, idC)
                        .bind(5, idP)
                        .execute()
        );
    }

    public static void editImgProductById(String img, String idImg) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update images set img = ? where id = ? ")
                        .bind(0, img)
                        .bind(1, idImg)
                        .execute()
        );
    }

    public static void upQuantityProductById(String quantity, String idP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update warehouse set quantity= ? where idP = ?")
                        .bind(0, quantity)
                        .bind(1, idP)
                        .execute()
        );
    }

    public static List<Image> getImages(String idP) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM images where idP=? ")
                        .bind(0, idP)
                        .mapToBean(Image.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static void addImageByIdP(String idP, String img) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into images(idP,img) VALUES (?,?)")
                        .bind(0, idP)
                        .bind(1, img)
                        .execute()
        );

    }

    public static void deleteImgProductById(String idImg) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from images where id = ?")
                        .bind(0, idImg)
                        .execute()
        );
    }

    public static void deleteImgProduct(String idP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from images where idP = ?")
                        .bind(0, idP)
                        .execute()
        );
    }

    // lấy tên theo id Sp
    public static Product getName(String idP) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT name FROM product where idP=? ")
                        .bind(0, idP)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );

    }

    //lấy giá theo id
    public static Product getPrice(String idP) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT price FROM product where idP=? ")
                        .bind(0, idP)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );

    }

    public static Product getP(String idP) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM product where idP=? ")
                        .bind(0, idP)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );

    }

    public static void addProductPromotion(String idP, String price, String startDay, String endDay) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into promotionproduct(startDay, endDay, price, idP) " +
                                "VALUES (?,?,?,?)")
                        .bind(0, startDay)
                        .bind(1, endDay)
                        .bind(2, price)
                        .bind(3, idP)
                        .execute()
        );
    }

    public static List<PromotionProduct> getPromotionProduct(int quantity) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM promotionproduct ORDER BY id DESC LIMIT ?")
                        .bind(0, quantity)
                        .mapToBean(PromotionProduct.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static List<PromotionProduct> getPromotion() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM promotionproduct ORDER BY id DESC")
                        .mapToBean(PromotionProduct.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static void deletePromotion(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from promotionproduct where id = ?")
                        .bind(0, id)
                        .execute()
        );
    }

    public static PromotionProduct getPricePromotion(String idP) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT promotionproduct.price FROM `promotionproduct` INNER JOIN `product` ON promotionproduct.idP = product.idP WHERE product.idP = ?")
                        .bind(0, idP)
                        .mapToBean(PromotionProduct.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );

    }

    public static void addProductNew(String idP, String countDay) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into newproduct(countDay, idP) " +
                                "VALUES (?,?)")
                        .bind(0, countDay)
                        .bind(1, idP)
                        .execute()
        );
    }

    public static List<NewProduct> getAllNewProduct() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM newproduct")
                        .mapToBean(NewProduct.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static List<NewProduct> getNewProduct(int quantity) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM newproduct ORDER BY id DESC LIMIT ?")
                        .bind(0, quantity)
                        .mapToBean(NewProduct.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static void deleteNew(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from newproduct where id = ?")
                        .bind(0, id)
                        .execute()
        );
    }
    // lấy tt các các hình ảnh fs

    public static Selling getSelling() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM selling")
                        .mapToBean(Selling.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }

    public static void editSelling(String text, String text1, String text2, String text3, String idP) {
        if (idP == null && text != null && text1 != null && text2 != null && text3 != null) {
            JDBiConnector.me().withHandle(h ->
                    h.createUpdate("update selling set text=?, text1 = ?, text2 =?,  text3= ?  where id = 1")
                            .bind(0, text)
                            .bind(1, text1)
                            .bind(2, text2)
                            .bind(3, text3)
                            .execute()
            );
        }
        if (idP != null && text == null && text1 == null && text2 == null && text3 == null) {
            JDBiConnector.me().withHandle(h ->
                    h.createUpdate("update selling set idP= ?  where id = 1")
                            .bind(0, idP)
                            .execute()
            );
        }
    }

    public static List<Product> getproductbyCata(String idC) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product where idC = ? and status = ?")
                    .bind(0, idC)
                    .bind(1, 1)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // lay san pham theo idT
    public static List<Product> getProductByIdT(String idT) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product where idT = ?")
                    .bind(0, idT)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void addFavoriteProduct(String idP, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into favoriteproduct(idP, idA) " +
                                "VALUES (?,?)")
                        .bind(0, idP)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static List<Product> getFavoriteProductByIdA(int idA) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT `product`.* FROM `favoriteproduct` INNER JOIN `product` ON favoriteproduct.idP = product.idP WHERE favoriteproduct.idA = ?")
                    .bind(0, idA)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static Favorite getFavoriteProduct(String idP, String idA) {

        List<Favorite> favoriteList = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM favoriteproduct where idA = ? and idP = ?")
                    .bind(0, idA)
                    .bind(1, idP)
                    .mapToBean(Favorite.class)
                    .stream().collect(Collectors.toList());
        });
        if (favoriteList.size() == 0) return null;
        return favoriteList.get(0);
    }

    public static void deleteFavoriteProduct(String idP, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from favoriteproduct where idA = ? and idP = ?")
                        .bind(0, idA)
                        .bind(1, idP)
                        .execute()
        );
    }

    public static List<Product> getProductByPrice(int price1, int price2) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from product where price > ? and price<= ?")
                    .bind(0, price1)
                    .bind(1, price2)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getProductByPrice600(int price1) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from product where price > ?")
                    .bind(0, price1)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }


    public static List<Product> get9Product(int startIndex) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product where status = 1 LIMIT 9 OFFSET ?")
                    .bind(0, startIndex)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> filterAll(String cate, String trade, String minprice, String maxprice) {
        List<Product> filteredList = new ArrayList<>();
        if (cate != null && trade == null ) {
            filteredList = JDBiConnector.me().withHandle(handle -> {
                return handle.createQuery("SELECT * FROM product where idC=? and price > ? and price <= ?")
                        .bind(0, cate)
                        .bind(1, minprice)
                        .bind(2, maxprice)
                        .mapToBean(Product.class)
                        .stream().collect(Collectors.toList());
            });

        }
        if (cate == null && trade != null ) {
            filteredList = JDBiConnector.me().withHandle(handle -> {
                return handle.createQuery("SELECT * FROM product where idT=? and price > ? and price <= ?")
                        .bind(0, trade)
                        .bind(1, minprice)
                        .bind(2, maxprice)
                        .mapToBean(Product.class)
                        .stream().collect(Collectors.toList());
            });

        }
        if (cate != null && trade !=null ) {
            filteredList = JDBiConnector.me().withHandle(handle -> {
                return handle.createQuery("SELECT * FROM product where idC=? and idT =? and price > ? and price <= ?")
                        .bind(0, cate)
                        .bind(1, trade)
                        .bind(2, minprice)
                        .bind(3, maxprice)
                        .mapToBean(Product.class)
                        .stream().collect(Collectors.toList());
            });
        }

        return filteredList;

    }

    public static void main(String[] args) {
        System.out.println(filterAll("2", "0", String.valueOf(0), String.valueOf(100000000)));
    }
}
