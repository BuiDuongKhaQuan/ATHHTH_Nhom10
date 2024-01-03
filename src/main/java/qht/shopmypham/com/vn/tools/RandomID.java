package qht.shopmypham.com.vn.tools;

import java.io.*;
import java.util.UUID;

public class RandomID {
    public static String randomID(){
        UUID uuid = UUID.randomUUID();
        String randomUUIDString = uuid.toString().replace("-","");
        return randomUUIDString.substring(0, 15).toUpperCase();
    }

    public static void main(String[] args) {
        System.out.println(randomID());
    }
}
