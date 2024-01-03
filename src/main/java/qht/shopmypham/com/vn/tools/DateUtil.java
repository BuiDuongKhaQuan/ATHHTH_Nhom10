package qht.shopmypham.com.vn.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    public static String getDateNow() {
        ZoneId vietnamZone = ZoneId.of("Asia/Ho_Chi_Minh");
        ZonedDateTime nowInVietnam = ZonedDateTime.now(vietnamZone);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm:ss a dd/MM/yyyy");
        String formattedDate = nowInVietnam.format(formatter);
        return formattedDate;
    }

    public static String customDateTimeFormat(String date1) throws ParseException {
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        SimpleDateFormat outputDateFormat = new SimpleDateFormat(pattern);
        Date date = inputDateFormat.parse(date1);
        String outputDateString = outputDateFormat.format(date);
        return  outputDateString;
    }

    public static String between(String date) throws ParseException {
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        LocalDateTime date1 = LocalDateTime.parse(date, DateTimeFormatter.ofPattern(pattern));
        LocalDateTime dateNow = LocalDateTime.parse(getDateNow(), DateTimeFormatter.ofPattern(pattern));
        Duration duration = Duration.between(date1, dateNow);
        long seconds = duration.getSeconds();
        String time = "";
        if (seconds < 60) return time = seconds + " giây";
        if (seconds > 60 && seconds / 60 < 60) return time = seconds / 60 + " phút";
        if (seconds / 60 > 60) return time = seconds / 3600 + " giờ " + (seconds / 60 - 60) + " phút";
        return time;
    }
    public static String monthNow() {
        String res="";
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1; // Lấy tháng hiện tại
        int year = cal.get(Calendar.YEAR); // Lấy năm hiện tại
        res= month +"/" +year;
        return res;
    }

    public static int yearNow() {
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR); // Lấy năm hiện tại
        return year;
    }  public static int monNow() {
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1; // Lấy tháng hiện tại

        return month;
    }


    public static void main(String[] args) throws ParseException {
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        System.out.println(getDateNow());
        System.out.println(customDateTimeFormat("2023-04-23T23:59:59Z"));
    }
}
