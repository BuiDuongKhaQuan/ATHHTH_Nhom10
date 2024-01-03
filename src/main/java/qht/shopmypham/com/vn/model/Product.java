package qht.shopmypham.com.vn.model;

import qht.shopmypham.com.vn.service.ProductCheckoutService;
import qht.shopmypham.com.vn.service.ProductService;
import qht.shopmypham.com.vn.service.WareHouseService;
import qht.shopmypham.com.vn.tools.DateUtil;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Product implements Serializable {
    int idP;
    String name;
    int price;
    int idT;
    String information;
    int idC, status;


    public Product() {
    }

    public Product(int idP, String name, int price, int idT, String information, int idC, int status) {
        this.idP = idP;
        this.name = name;
        this.price = price;
        this.idT = idT;
        this.information = information;
        this.idC = idC;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        int price = this.getPriceDefault();
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        List<PromotionProduct> promotionProductList = ProductService.getPromotion();
        for (PromotionProduct pp : promotionProductList) {
            try {
                Date date1 = formatter.parse(pp.getStartDay());
                Date date2 = formatter.parse(pp.getEndDay());
                Date dateNow1 = formatter.parse(DateUtil.getDateNow());
                if (dateNow1.after(date1) && dateNow1.before(date2) && pp.getIdP() == this.getIdP()) {
                    price = pp.getPrice();
                }
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

        }
        return price;
    }

    public int getPriceDefault() {
        return price;
    }

    public boolean isPromotion() {
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        List<PromotionProduct> promotionProductList = ProductService.getPromotion();
        for (PromotionProduct pp : promotionProductList) {
            try {
                Date date1 = formatter.parse(pp.getStartDay());
                Date date2 = formatter.parse(pp.getEndDay());
                Date dateNow1 = formatter.parse(DateUtil.getDateNow());
                if (dateNow1.after(date1) && dateNow1.before(date2) && pp.getIdP() == this.getIdP()) {
                    return true;
                }
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

        }
        return false;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getIdT() {
        return idT;
    }

    public void setIdT(int idT) {
        this.idT = idT;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public int getIdC() {
        return idC;
    }

    public void setIdC(int idC) {
        this.idC = idC;
    }

    public static long revenue() {
        long revenues = 0;
        ArrayList<Product> pr = (ArrayList<Product>) ProductService.getAllProduct();
        ArrayList<ListProductByCheckOut> ls = (ArrayList<ListProductByCheckOut>) ProductCheckoutService.getProductProductCheckout();
        for (int i = 0; i < pr.size(); i++) {
            for (int j = 0; j < ls.size(); j++) {
                if (pr.get(i).getIdP() == ls.get(j).getIdP()) {
                    revenues += pr.get(i).getPrice() * ls.get(j).getQuantity();
                }
            }
        }
        return revenues;
    }

    public String wareHouseStatus() {
        int quantity = WareHouseService.getWareHouse(this.getIdP()).getQuantity();
        String status = "";
        if (quantity > 0) {
            status = "<span class=\"col-green\">Còn hàng</span>";
        }
        if (quantity > 0 && quantity <= 15) {
            status = "<span class=\"col-yellow\">Sắp hết</span>";
        }
        if (quantity == 0) {
            status = "<span class=\"col-red\">Hết hàng</span>";
        }
        return status;
    }

    public String statusIsSell() {
        String status = "";
        if (this.getStatus() == 0) {
            status = "<span class=\"col-red\">Không bán</span>";
        }
        if (this.getStatus() == 1) {
            status = "<span class=\"col-green\">Đang bán</span>";
        }
        return status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idP=" + idP +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", idT=" + idT +
                ", information='" + information + '\'' +
                ", idC=" + idC +
                '}';
    }

    // sl đã bán
    public static int sold() {
        int s = 0;
//        Product p = ProductService.getProductById()
        return s;

    }

    public static void main(String[] args) {
        System.out.println(ProductService.getProductById(30).getPriceDefault());
    }
}