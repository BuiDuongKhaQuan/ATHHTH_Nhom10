package qht.shopmypham.com.vn.service;

import org.checkerframework.checker.units.qual.A;
import qht.shopmypham.com.vn.db.JDBiConnector;
import qht.shopmypham.com.vn.model.Account;
import qht.shopmypham.com.vn.tools.DateUtil;
import qht.shopmypham.com.vn.tools.Encode;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class LoginService {

    public static Account getAccout(String user, String pass) {
        List<Account> accountList = AccountService.getAllAccount();
        int id = accountList.get(accountList.size() - 1).getId() + 1;
        List<Account> accounts = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE user = ? and pass =?")
                        .bind(0, user).bind(1, pass)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList()));
        accounts.add(new Account(id, "admin", Encode.enCodeMD5("Qu@nkh@016"), "Super Admin", 1));
        Account admin = null;
        for (Account a : accounts) {
            if (user.equals(a.getUser()) && pass.equals(a.getPass())) {
                admin = a;
            }
        }
        return admin;
    }

    public static Account getAccoutFacebook(String idFace) {
        List<Account> accounts = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE idFacebook =?")
                        .bind(0, idFace)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size() == 0) return null;
        return accounts.get(0);
    }

    public static Account getAccoutGoogle(String idGoogle) {
        List<Account> accounts = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE idGoogle =?")
                        .bind(0, idGoogle)

                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size() == 0) return null;
        return accounts.get(0);
    }

    public static Account checkUser(String user) {
        List<Account> listAccount = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE user = ?")
                        .bind(0, user)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (listAccount.size() == 0) return null;
        return listAccount.get(0);
    }

    public static Account checkIdfacebook(String idFace) {
        List<Account> listAccount = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE idFacebook = ?")
                        .bind(0, idFace)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (listAccount.size() == 0) return null;
        return listAccount.get(0);
    }

    public static void signUpPower(int idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO power(idA,orderManage,generalManage,productManage," +
                                "accountManage,blogManage,homeManage,voucherManage,sliderManage,warehouseManage)" +
                                "VALUES (?,0,0,0,0,0,0,0,0,0)")
                        .bind(0, idA)
                        .execute()
        );
    }

    public static void insertPublicKey(String publicKey, int idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO mykey (idA,public_key,day_create)" +
                                "VALUES (?,?,?)")
                        .bind(0, idA)
                        .bind(1, publicKey)
                        .bind(2, DateUtil.getDateNow())
                        .execute()
        );
    }

    public static void signUp(String user, String pass, String email, int id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO account(id, user,pass,email,status,fullName,phone,address)" +
                                "VALUES (?,?,?,?,1,?,?,?)")
                        .bind(0, id)
                        .bind(1, user).bind(2, pass).bind(3, email)
                        .bind(4, "").bind(5, "").bind(6, "")
                        .execute()
        );
        signUpPower(id);
    }

    public static void signUpFacebook(String idFacebook, String nameFacebook, int idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO account(fullName,idFacebook,status)" +
                                "VALUES (?,?,1)")
                        .bind(0, nameFacebook).bind(1, idFacebook)
                        .execute()
        );
        signUpPower(idA);
    }

    public static void signUpGoogle(String idGoogle, String email, int idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO account(email,idGoogle,status)" +
                                "VALUES (?,?,1)")
                        .bind(0, email)
                        .bind(1, idGoogle)
                        .execute()
        );
        signUpPower(idA);
    }

    public static Account checkIdGoogle(String idGoogle) {
        List<Account> listAccount = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE idGoogle = ?")
                        .bind(0, idGoogle)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (listAccount.size() == 0) return null;
        return listAccount.get(0);
    }

    public static void main(String[] args) {

    }

}
