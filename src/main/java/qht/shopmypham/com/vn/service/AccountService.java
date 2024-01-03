package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.model.Log;
import qht.shopmypham.com.vn.model.Power;
import qht.shopmypham.com.vn.model.Product;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;

import javax.sound.midi.MidiFileFormat;
import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    public static void editProfileAcountById(String email,
                                             String phone, String fullName, String address, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set email = ?,phone =?,fullName=?,address =? where id = ?")
                        .bind(0, email)
                        .bind(1, phone)
                        .bind(2, fullName)
                        .bind(3, address)
                        .bind(4, id)
                        .execute()
        );
    }

    public static void lockUpAcountById(String status, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set status =? where id = ?")
                        .bind(0, status)
                        .bind(1, id)
                        .execute()
        );
    }

    public static List<Account> getAllAccount() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static Account getAccountById(int aid) {
        List<Account> accountList = AccountService.getAllAccount();
        int id = accountList.get(accountList.size() - 1).getId() + 1;
        List<Account> accounts = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account where id = ?")
                        .bind(0, aid)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList()));
        Account account = null;
        accounts.add(new Account(id, "admin", Encode.enCodeMD5("Qu@nkh@016"), "Super Admin", 1));
        for (Account a : accounts) {
            if (a.getId() == aid) {
                 account = a;
            }
        }
        return account;
    }


    public static Account getAccountByUserAndEmail(String user, String email) {
        List<Account> accountList = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account where user =? and email = ?")
                        .bind(0, user)
                        .bind(1, email)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accountList.size() == 0) return null;
        return accountList.get(0);
    }

    public static void updateImgAcountById(String img, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set img = ? where id= ?")
                        .bind(0, img)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updateImgAcountByIdAll(String fullName, String email, String phone, String address, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set fullName=?, email=?,phone=?,address=? where id= ?")
                        .bind(0, fullName)
                        .bind(1, email)
                        .bind(2, phone)
                        .bind(3, address)
                        .bind(4, idA)
                        .execute()
        );
    }

    public static void updateacountMana(String acountMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set accountManage=? where idA= ?")
                        .bind(0, acountMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updateproductMana(String productMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set productManage=? where idA = ?")
                        .bind(0, productMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updateorderMana(String orderMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set orderManage=? where idA= ?")
                        .bind(0, orderMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updateblogMana(String blogMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set blogManage =? where idA= ?")
                        .bind(0, blogMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updatehomeMana(String homeMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set homeManage =? where idA= ?")
                        .bind(0, homeMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updateSliderMana(String sliderMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set sliderManage =? where idA= ?")
                        .bind(0, sliderMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void reportByIdA(int idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update mykey set day_expired = ? where idA= ?")
                        .bind(0, DateUtil.getDateNow())
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updateVoucherMana(String voucherMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set voucherManage =? where idA= ?")
                        .bind(0, voucherMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void updategenaralMana(String genaralMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update power set generalManage=? where idA= ?")
                        .bind(0, genaralMana)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void resetPasswordAccountById(String idA, String pass) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set pass = ? where id= ?")
                        .bind(0, pass)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void changePasswordAccountById(String idA, String pass) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set pass = ? where id= ?")
                        .bind(0, pass)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void deleteAccountById(String idA) {

        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from account where id = ?")
                        .bind(0, idA)
                        .execute()
        );
    }

    public static List<Account> getAccountByUser(String user) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE user LIKE ? ")
                        .bind(0, "%" + user + "%")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static List<Power> getAllPower() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT p.* FROM power p join account a on p.idA= a.id ")
                        .mapToBean(Power.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static Power getPowerAccount(int idA) {
        List<Account> accountList = AccountService.getAllAccount();
        int id = accountList.get(accountList.size() - 1).getId() + 1;
        List<Power> powers = AccountService.getAllPower();
        int idPower = powers.get(powers.size() - 1).getId() + 1;
        List<Power> powerList = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT power.* FROM `power` INNER JOIN `account` ON power.idA = account.id WHERE account.id = ?")
                        .bind(0, idA)
                        .mapToBean(Power.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        powerList.add(new Power(idPower, id, 1, 1, 1, 1, 1, 1, 1, 1,1));
        if (powerList.size() == 0) return null;
        return powerList.get(0);
    }

    public static List<Account> getAccountCheckout() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("select a.*  FROM account  a  JOIN checkout c on a.id = c.idA GROUP BY a.id ")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static List<Account> getAccountNoCheckout() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("select a.*  FROM account a  WHERE a.id not  in (SELECT idA FROM checkout) ")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    // tổng số tk truy cập web trong tháng
    public static List<Account> getAccoutAccessByMonth() {
        String s = DateUtil.monthNow();
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT a.* from log l join account a on l.`idA` = a.id WHERE MONTH(STR_TO_DATE(l.time, '%r %d/%m/%Y'))=MONTH(CURRENT_DATE()) and YEAR(STR_TO_DATE(l.time, '%r %d/%m/%Y'))=YEAR(CURRENT_DATE()) group by l.idA")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    // khách hàng thân thiết
    public static List<Account> getAccoutLoyal() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("select a.*, sum(c.idA) as 'solanmua',c.idCk FROM account a join  checkout c on c.idA = a.id  JOIN listproductbycheckout l on c.idCk = l.idCk \n" +
                                " where  MONTH(STR_TO_DATE(c.orderDate, '%r %d/%m/%Y'))=MONTH(CURRENT_DATE()) and YEAR(STR_TO_DATE(c.orderDate, '%r %d/%m/%Y'))=year(CURRENT_DATE()) GROUP BY \n" +
                                " c.idA HAVING sum(c.idA) >5")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static List<Log> getSignByMonth() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("select l.* from log l where l.content like 'Đăng kí tài khoản thành công' and MONTH(STR_TO_DATE(l.time, '%r %d/%m/%Y'))=MONTH(CURRENT_DATE()) and YEAR(STR_TO_DATE(l.time, '%r %d/%m/%Y'))=year(CURRENT_DATE())")
                        .mapToBean(Log.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static void main(String[] args) {
//        System.out.println(getAccountCheckout());
//        System.out.println(getAccountNoCheckout());
        System.out.println(getSignByMonth());
//        System.out.println(getAccoutLoyal());
    }
}
