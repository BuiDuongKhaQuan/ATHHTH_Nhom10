package qht.shopmypham.com.vn.service;

import qht.shopmypham.com.vn.db.JDBiConnector;

import qht.shopmypham.com.vn.model.Contact;
import qht.shopmypham.com.vn.model.Product;

import java.util.List;
import java.util.stream.Collectors;

public class ContactService {
    public static void addContact(String idA, String email, String content, String fullName) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into contact(idA,email,content,fullName,status) values (?,?,?,?,?)")
                        .bind(0, idA)
                        .bind(1, email)
                        .bind(2, content)
                        .bind(3, fullName)
                        .bind(4, 0)
                        .execute()
        );
    }

    public static void editContactById(String idCt) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update contact set status = ? where idCt =?")
                        .bind(0, 1)
                        .bind(1, idCt)
                        .execute()
        );
    }

    public static List<Contact> getAllContact() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from contact").mapToBean(Contact.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static Contact getContactById(String idCt) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from contact where idCt = ?")
                    .bind(0, idCt)
                    .mapToBean(Contact.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }

    public static void deleteContactById(String idCt) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from contact where idCt = ?")
                        .bind(0, idCt)
                        .execute()
        );
    }

    public static List<Contact> getContactByName(String name) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM contact WHERE fullName LIKE ? ")
                        .bind(0, "%" + name + "%")
                        .mapToBean(Contact.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }
}
