package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Home;
import qht.shopmypham.com.vn.model.ImageTrend;

import java.util.List;
import java.util.stream.Collectors;

public class HomeService {

    public static Home getHome() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM home")
                    .mapToBean(Home.class)
                    .stream()
                    .collect(Collectors.toList()).get(0);
        });
    }

    public static void edit(String idC1, String idC2, String idC3) {
        if (idC2 == null && idC3 == null) {
            JDBiConnector.me().withHandle(h ->
                    h.createUpdate("update home set idC1=? where id =1")
                            .bind(0, idC1)
                            .execute()
            );
        }
        if (idC1 == null && idC3 == null) {
            JDBiConnector.me().withHandle(h ->
                    h.createUpdate("update home set idC2=? where id =1")
                            .bind(0, idC2)
                            .execute()
            );
        }
        if (idC1 == null && idC2 == null) {
            JDBiConnector.me().withHandle(h ->
                    h.createUpdate("update home set idC3=? where id =1")
                            .bind(0, idC3)
                            .execute()
            );
        }
    }

    public static void editQuantity(String quantityProP, String quantityProN, String quantityProS, String quantityBlog) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update home set quantityProP=?,quantityProN=?,quantityProS=?,quantityBlog=? where id =1")
                        .bind(0, quantityProP)
                        .bind(1, quantityProN)
                        .bind(2, quantityProS)
                        .bind(3, quantityBlog)
                        .execute()
        );
    }

    public static List<ImageTrend> getImageFs() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from imgtrends").mapToBean(ImageTrend.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static ImageTrend getImageTrendById(String idT) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from imgtrends where id = ?")
                    .bind(0, idT)
                    .mapToBean(ImageTrend.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }


    public static void editImgTrends(String img, String id, String status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update imgtrends set img=? , status = ? where id = ?")
                        .bind(0, img)
                        .bind(1, status)
                        .bind(2, id)
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(getHome().getQuantityProN());
        System.out.println(getHome().getQuantityProP());
        System.out.println(getHome().getQuantityBlog());
        System.out.println(getHome().getQuantityProS());
    }
}
