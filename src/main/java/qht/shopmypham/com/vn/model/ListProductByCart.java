package qht.shopmypham.com.vn.model;

public class ListProductByCart {
    int idLp;
    int idP;
    int idA;
    int quantity;

    public ListProductByCart(int idLp, int idP, int idCart, int quantity) {
        super();
        this.idLp = idLp;
        this.idP = idP;
        this.idA = idCart;
        this.quantity = quantity;
    }

    public ListProductByCart() {
        super();
    }

    public int getIdLp() {
        return idLp;
    }

    public void setIdLp(int idLp) {
        this.idLp = idLp;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idCart) {
        this.idA = idA;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
