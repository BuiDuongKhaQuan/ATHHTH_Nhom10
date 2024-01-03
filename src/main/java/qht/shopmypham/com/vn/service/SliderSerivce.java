package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Product;
import qht.shopmypham.com.vn.model.Slider;
import qht.shopmypham.com.vn.model.Trademark;

import java.util.List;
import java.util.stream.Collectors;

public class SliderSerivce {
    public static List<Slider> getListSlider() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from slider ").mapToBean(Slider.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Slider> getAllSlider() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM slider")
                        .mapToBean(Slider.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Slider> getSliderByStatusAll() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT distinct status  FROM slider ")
                        .mapToBean(Slider.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Slider> getSliderByStatus() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM slider where status = 1")
                        .mapToBean(Slider.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Trademark> getAllTrademark() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM trademark")
                        .mapToBean(Trademark.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }


    public static void editSliderById(String idSl, String img, String text) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update slider set img = ?, text=? where idSl = ?")
                        .bind(0, img)
                        .bind(1, text)
                        .bind(2, idSl)
                        .execute()
        );
    }
    public static void editSliderByIdAll(String idSl, String img, String text,String status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update slider set img = ?, text=?, status =? where idSl = ? ")
                        .bind(0, img)
                        .bind(1, text)
                        .bind(2, status)
                        .bind(3, idSl)
                        .execute()
        );
    }
    public static List<Slider> getAllStatus() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT  distinct status FROM slider")
                        .mapToBean(Slider.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static void editSliderStatusById(String idSl, String status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update slider set status = ? where idSl = ?")
                        .bind(0, status)
                        .bind(1, idSl)
                        .execute()
        );
    }
    public static void addSlider(String img, String text) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into slider(img,text,status) values (?,?,?)")
                        .bind(0, img)
                        .bind(1, text)
                        .bind(2,1)
                        .execute()
        );
    }

    public static void deleteSliderById(String idSl) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from slider where idSl = ?")
                        .bind(0, idSl)
                        .execute()
        );
    }

    public static Slider getSliderById(String idSl) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM slider where idSl = ?")
                        .bind(0, idSl)
                        .mapToBean(Slider.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }

    public static void main(String[] args) {
        System.out.println( getAllStatus());

    }
}
