package qht.shopmypham.com.vn.tools;

public class CountStar {
    public static String star(double avgStar, int reviewList){
        String star = "";
        String s = "style=\"margin-right: 0;\"";
        String q = "style=\"margin-right: 0;\"";
        String f = "style=\"margin-right: -3px;\"";
        if (avgStar >= 0 && avgStar <0.5) {
            star = "<i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>";

        }
        if (avgStar >= 0.5 && avgStar < 1) {
            star = "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 1 && avgStar < 1.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"></i> " +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 1.5 && avgStar < 2) {
            star = "<i class=\"fa-solid fa-star-sharp\"></i> " +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 2 && avgStar < 2.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"></i> " +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 2.5 && avgStar < 3) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i> ";
        }
        if (avgStar >= 3 && avgStar < 3.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 3.5 && avgStar < 4) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 4 && avgStar < 4.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar >= 4.5 && avgStar < 5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>";
        }
        if (avgStar == 5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>";
        }
        if (reviewList == 0) {
            star = "Chưa có đánh giá";
        }
        return star;
    }
    public static String starReview(double avgStar){
        String star = "";
        String s = "style=\"margin-right: 0;\"";
        String q = "style=\"margin-right: 0;\"";
        String f = "style=\"margin-right: -3px;\"";
        if (avgStar == 0) {
            star = "<i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>" +
                    " <i class=\"fa-regular fa-star-sharp\"></i>";

        }
        if (avgStar == 0.5) {
            star = "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 1) {
            star = "<i class=\"fa-solid fa-star-sharp\"></i> " +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 1.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"></i> " +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 2) {
            star = "<i class=\"fa-solid fa-star-sharp\"></i> " +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 2.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i> ";
        }
        if (avgStar == 3) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 3.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 4) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp\"" + s + "></i>";
        }
        if (avgStar == 4.5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-regular fa-star-sharp-half-stroke\"" + q + "></i>";
        }
        if (avgStar == 5) {
            star = "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>" +
                    "<i class=\"fa-solid fa-star-sharp\"" + s + "></i>";
        }
        return star;
    }
}
