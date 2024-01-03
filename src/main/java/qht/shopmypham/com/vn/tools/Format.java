package qht.shopmypham.com.vn.tools;

import java.text.NumberFormat;

public class Format {
    public static String formatPrice(Object price) {
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumFractionDigits(0);
        return nf.format(price);
    }
}
