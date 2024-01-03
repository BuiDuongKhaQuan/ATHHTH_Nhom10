package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Product;
import qht.shopmypham.com.vn.model.WareHouse;
import qht.shopmypham.com.vn.model.WarehouseDetail;

import java.util.List;
import java.util.stream.Collectors;

public class WareHouseService {
    public static List<Product> inventoryProduct() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT p.* from product p join warehousedetails w on p.idP = w.idP WHERE p.idP  not in (SELECT idP from listproductbycheckout)AND `status`=1 and \n" +
                            "YEAR(STR_TO_DATE(w.dateInput, '%r %d/%m/%Y'))=year(CURRENT_DATE())")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // sp cần nhập kho
    public static List<WareHouse> warehouseProduct() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from warehouse where quantity < 100")
                    .mapToBean(WareHouse.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // sp chưa được bán trong năm hiên tại
    public static List<Product> unsoldProduct() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT p.* FROM product p join  warehousedetails w on p.idP=w.idP where status ='0' and YEAR(STR_TO_DATE(w.dateInput, '%r %d/%m/%Y'))=year(CURRENT_DATE()) and month(STR_TO_DATE(w.dateInput, '%r %d/%m/%Y'))=month(CURRENT_DATE())-1")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // số sp đã bán trong tháng hiện tại
    public static List<Product> getProductSold() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery(" \n" +
                            " SELECT p.* FROM product p WHERE p.idP in (SELECT l.idP from listproductbycheckout l join checkout c on l.idCk = c.idCk where YEAR(STR_TO_DATE(c.orderDate, '%r %d/%m/%Y'))=year(CURRENT_DATE()) and month(STR_TO_DATE(c.orderDate, '%r %d/%m/%Y'))=month(CURRENT_DATE())) ")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // top 2 sp bán chạy trong tháng trc
    public static List<Product> soldout() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT p.*, sum(l.quantity) from product p join listproductbycheckout l on p.idP = l.idP join checkout c on l.idCk = c.idCk WHERE\n" +
                            "YEAR(STR_TO_DATE(c.orderDate, '%r %d/%m/%Y'))=year(CURRENT_DATE()) and month(STR_TO_DATE(c.orderDate, '%r %d/%m/%Y'))=month(CURRENT_DATE())\n" +
                            " GROUP BY l.idP ORDER by  sum(l.quantity) DESC LIMIT 2")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }


    public static List<WareHouse> getAll() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from warehouse")
                    .mapToBean(WareHouse.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static WareHouse getWareHouse(int id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from warehouse where idP = ?")
                    .bind(0, id)
                    .mapToBean(WareHouse.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }

    public static WarehouseDetail getWareHouseDetail(int id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * from warehousedetails where id = ?")
                    .bind(0, id)
                    .mapToBean(WarehouseDetail.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }

    public static void addWareHouse(String quantity, String quantityInput, String dateInput, String idP, String name, String trademark, String information,
                                    String idC, String price) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into product(idP,name,idT,price,information, idC, status) values (?,?,?,?,?,?,?)")
                        .bind(0, idP)
                        .bind(1, name)
                        .bind(2, trademark)
                        .bind(3, price)
                        .bind(4, information)
                        .bind(5, idC)
                        .bind(6, 0)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into warehouse(quantity, idP) values (?,?)")
                        .bind(0, quantity)
                        .bind(1, idP)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into warehousedetails( idP, dateInput, quantityInput) values (?,?,?)")
                        .bind(0, idP)
                        .bind(1, dateInput)
                        .bind(2, quantityInput)
                        .execute()
        );
    }

    public static void addNumberWarehouse(String dateInput, int quantityInput, String idP, int quantity) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into warehousedetails( dateInput,quantityInput, idP) values (?,?,?)")
                        .bind(0, dateInput)
                        .bind(1, quantityInput)
                        .bind(2, idP)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update warehouse set quantity =? where idP = ?")
                        .bind(0, quantityInput + quantity)
                        .bind(1, idP)
                        .execute()
        );

    }

    public static void deleteWareHouseDetail(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from warehousedetails where id = ? ")
                        .bind(0, id)
                        .execute()
        );
    }

    public static void deleteWareHouse(String idP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from warehouse where idP = ? ")
                        .bind(0, idP)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from warehousedetails where idP = ? ")
                        .bind(0, idP)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from product where idP = ? ")
                        .bind(0, idP)
                        .execute()
        );
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from images where idP = ? ")
                        .bind(0, idP)
                        .execute()
        );
    }

    public static void editWareHouseDetail(String dateInput, String quantityInput, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update warehousedetails set dateInput= ?,quantityInput= ? where id = ?")
                        .bind(0, dateInput)
                        .bind(1, quantityInput)
                        .bind(2, id)
                        .execute()
        );
    }

    public static List<WarehouseDetail> getListWarehouseDetailById(String idP) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery(" select * from warehousedetails where idP=?")
                    .bind(0, idP)
                    .mapToBean(WarehouseDetail.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<WarehouseDetail> getAllWarehouseDetail() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery(" select * from warehousedetails ")
                    .mapToBean(WarehouseDetail.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static int getquantityById(int idP) {

        int quantity = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT quantity from warehouse WHERE idP =?")
                    .bind(0, idP)
                    .mapTo(Integer.class)
                    .one();
        });
        return quantity;
    }

    public static void main(String[] args) {
        System.out.println(getquantityById(1));
    }
}
