package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Contact implements Serializable {
    int idCt;
    int idA;
    String email;
    String content;
    String fullName;
    int status;

    public Contact() {
    }

    public Contact(int idCt, int idA, String email, String content, String fullName, int status) {
        this.idCt = idCt;
        this.idA = idA;
        this.email = email;
        this.content = content;
        this.fullName = fullName;
        this.status = status;
    }

    public int getIdCt() {
        return idCt;
    }

    public void setIdCt(int idCt) {
        this.idCt = idCt;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
