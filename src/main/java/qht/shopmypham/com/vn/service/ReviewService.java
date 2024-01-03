package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Review;

import java.util.List;
import java.util.stream.Collectors;

public class ReviewService {
    public static void addReview(String idP, String idA, String information, String star, String date) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into review(idP,idA,infomation,star, date) VALUES (?,?,?,?,?)")
                        .bind(0, idP)
                        .bind(1, idA)
                        .bind(2, information)
                        .bind(3, star)
                        .bind(4, date)
                        .execute()
        );
    }

    public static List<Review> getAllReviewByIdP(String idP) {
       return JDBiConnector.me().withHandle(h ->
                h.createQuery("select * from review where idP = ? ")
                        .bind(0, idP)
                        .mapToBean(Review.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static Review getReviewByIdA(String idA) {
         List<Review> reviewList = JDBiConnector.me().withHandle(h ->
                h.createQuery("select * from review where idA = ? ")
                        .bind(0, idA)
                        .mapToBean(Review.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (reviewList.size() ==0) return null;
        return reviewList.get(0);
    }
    public static void updateReview(String idP, String information, String star, String date, String idR) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update review set idP = ?,infomation = ?,star = ?, date = ? where idR = ?")
                        .bind(0, idP)
                        .bind(1, information)
                        .bind(2, star)
                        .bind(3, date)
                        .bind(4, idR)
                        .execute()
        );
    }
    public static List<Review> getAllReview() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("select * from review")
                        .mapToBean(Review.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Review> getReviewByIdName(String idP) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("select a.user, r.infomation from review r join Account a on r.idA = a.idA where idP =?")
                        .bind(0,idP)
                        .mapToBean(Review.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static void deleteReview(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from review where idR = ?")
                        .bind(0, id)
                        .execute()
        );
    }

}
