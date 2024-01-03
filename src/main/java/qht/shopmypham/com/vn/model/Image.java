package qht.shopmypham.com.vn.model;

public class Image {
    int id;
    int idP;
    String img;

    public Image() {
    }

    public Image(int id, int idP, String img) {
        this.id = id;
        this.idP = idP;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", idP=" + idP +
                ", img='" + img + '\'' +
                '}';
    }
}
