package qht.shopmypham.com.vn.tools;

import qht.shopmypham.com.vn.model.CheckOut;
import qht.shopmypham.com.vn.model.Key;
import qht.shopmypham.com.vn.service.CheckOutService;

import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.*;


public class RSA {
    private KeyPair keyPair;
    private PublicKey publicKey;
    private PrivateKey privateKey;

    public void generateKeyPair(int keySize) throws Exception {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(keySize);
        keyPair = keyPairGenerator.generateKeyPair();
        publicKey = keyPair.getPublic();
        privateKey = keyPair.getPrivate();
    }

    public PublicKey importPublicKey(String publicKeyBase64) {
        try {
            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyBase64);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePublic(keySpec);
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid Public Key");
        }
    }

    public PrivateKey importPrivateKey(String privateKeyBase64) {
        try {
            byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyBase64);
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePrivate(keySpec);

        } catch (Exception e) {

            throw new IllegalArgumentException("Invalid Private Key");
        }
    }

    public String exportPublicKey() {
        byte[] publicKeyBytes = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(publicKeyBytes);
    }

    public String exportPrivateKey() {
        byte[] privateKeyBytes = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(privateKeyBytes);
    }

    public String encrypt(String data, String key) throws Exception {

        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, importPrivateKey(key));
        byte[] output = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(output);

    }

    public String decrypt(String data, String key) throws Exception {

        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, importPublicKey(key));
        byte[] output = cipher.doFinal(Base64.getDecoder().decode(data));
        return new String(output, StandardCharsets.UTF_8);

    }

    public boolean checkKeyLength(String publicKey, String privateKey) {
        // Lấy khóa công khai và riêng tư từ cặp khóa
        java.security.interfaces.RSAPublicKey publicKeyCheck = (java.security.interfaces.RSAPublicKey) importPublicKey(publicKey);
        java.security.interfaces.RSAPrivateKey privateKeyCheck = (java.security.interfaces.RSAPrivateKey) importPrivateKey(privateKey);

        // Kiểm tra độ dài của khóa công khai và khóa riêng tư
        int publicKeyLength = publicKeyCheck.getModulus().bitLength();
        int privateKeyLength = privateKeyCheck.getModulus().bitLength();

        // Kiểm tra xem độ dài có lớn hơn hoặc bằng 2024 bit không
        if (publicKeyLength >= 2024 && privateKeyLength >= 2024)
            return true;

        return false;
    }

    public static void main(String[] args) throws Exception {
//        RSA rsa = new RSA();
//        String data = "cwAi6hcv5fGWgjKHbT2IVBTHdOcz5X2n7/upbyFEdFQ/gZ9xx+Q+Eputqq0awKkGCe1qLoPQ7Nr7tJPPzZQGL6qfIqooUNB4dMkEv08ATk5inAN/4MMqgjMZdS6c7mLXo5358AwovOJw7MVP0DiJ9AD+ExCgrOsoUru1DctQJf+TEtW3ow3/SgVw3Q3ZkxJyDCJ5XWog+yMVH2adsE7dM8IeX70v6d0rr6Lz4sKb/sBc+NQ0L959KxVoXd1c9ZaBJhQM3WRuJd9+AcpeJ7pYc/X7MPDoKr9tFmRH2HbTNnkflU9mJKax0WFvT1eUxW8e9PmeX5VHgx+za3NTc7zb6Q==";
//        String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAihxDNPGj6hKVtJsWnc01jvgnig8YbJerM9AIvv3miFEgWKXBpnJGpwsGUUh4iW7tvClP8+ziOe9SvAcYP9W3bIrULtn62QNOoa+kUyB8HIbV7R9qozx7b+fNVnwhHXsQUpyHM7FcUVXKsMeTN+jKASxJAYCpUWwqgwxOhsxCeg9S8WxTWQXIzn27duwLqX902pu7mW0H/6eZS1Odg0b/VK4GPInXeAZwIHPjJQ00Nc5G7RRKA4/AfUggs8kQVPl91X9+5mP0EKqgxzfbfk/I8xMAvPo6bjEkcHd2hWfqAWDE16gFXUsxoChJulvVvGoHosjy6HkkR6+XchlKAq0k8wIDAQAB";
//        String a = rsa.decrypt(data, publicKey);
//        String b = "01:50:06 PM 07/12/2023Bùi Dương khả quânĐóng gối cẩn thận giúp mình0328216787Vình Long, Huyện Bình Tân, Xã Tân An Thạnh, Số 10 tổ 10.2682046220910121";
//        System.out.println(a.equals(b));
//        System.out.println(a);

        CheckOut checkOut = CheckOutService.getCheckOutByIdCk("108");
        qht.shopmypham.com.vn.model.Key keyFind = Key.getKeyByOrder(checkOut);
        String keyString = CheckOutService.getKeyByIdA(checkOut.getIdA());
        if (keyFind != null) {
            keyString = keyFind.getPublic_key();
        }
        System.out.println(keyString);
//        String publicKey ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtR86By4Fx8qbLSch4tXwuUBCrz46BX8WveJOOGED02+mSiXi9uV235fnKvC4LiIKQ6m+2YCpLlUd1BXDLz/wcCeR2wSZ4yNt0hdyjM8F9sqqN+sZw37P7tX3W6ADmax5zWZyTk68CWLdO5S2rY7XvHOPmmdo8L5MGURDTJCoxk+DXs3xt3EezZs4h9l/uNQWoosVf/wDsR6/8omuIp/1pRVokpmOY1htwpsro5vjQHsRElajf9607MaGZLTHfJaBz3ZwJOx7e86x/vcoTkcH5LZBoUmpQ3PlW3Nq5VFEZzro+T74k/zqwAeJ5MQb7/eP4d5UqQVSkl595SO1aQhFxwIDAQAB";
//        String privateKey = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC1HzoHLgXHypstJyHi1fC5QEKvPjoFfxa94k44YQPTb6ZKJeL25Xbfl+cq8LguIgpDqb7ZgKkuVR3UFcMvP/BwJ5HbBJnjI23SF3KMzwX2yqo36xnDfs/u1fdboAOZrHnNZnJOTrwJYt07lLatjte8c4+aZ2jwvkwZRENMkKjGT4NezfG3cR7NmziH2X+41BaiixV//AOxHr/yia4in/WlFWiSmY5jWG3Cmyujm+NAexESVqN/3rTsxoZktMd8loHPdnAk7Ht7zrH+9yhORwfktkGhSalDc+Vbc2rlUURnOuj5PviT/OrAB4nkxBvv94/h3lSpBVKSXn3lI7VpCEXHAgMBAAECggEAQwsrDKtRgnIR3LXmijPNJpWN2ZZ8Hbq8bU9OyvnGU8a5VCsQB3pK9VsiO7fdRV5eVEuKFLLWbQsevnnLxTqywqEzEVJzsCtWJHV/dnXPbFn6hjZlVAMl7u+O34CstH6um4R3fVsRqZvJ7psOv9HnM5/HIU1z/+FBA/1LuBS4FKeKdSUId/1zmbdo9IunuRNXpcALNoD7eTs68cMh0XCy+gcMr+1fwQg9mXTxmJ3+t8s12ElFpgW8ybu8cLo6+aJ5HWv5OuHFUJkOREbaTbpR893+echzlE5EwmNzBN6JmFXrtc+7BacxBkx9jl1A9niuWDM7u9OIOx1DN88x3eVGiQKBgQD+7zNaQV/d1ze1snD/rdcJyjMi8rMMmkQ94Vl1EvOo2umhWdgjN8ilzLkubzUhaKxF1dcoZxgyn3/bXV0SmlUPMh18Hz8yHk98oqx7EnTnaNXY6IA9zYeS1FSUgDwd3dPrTEUVofylqlJPsc9qKYI1udzGtylxK6772XhFJXpcbQKBgQC14QqHc89Ya2XbdNVOndRsxNhiw7FwIKDovDoi6lpaapAAQn6/34H+FA7ZMVMFG9I859pUmNxt2yx+zsBh/jymGlAHe6gytFpcCyO4YcBhZxPfEtsHToVIx9laiJDVttu2/EPdAANNSikOZV5VvJsZ9wZFsyQSS7/qABQP7+aigwKBgC43XR7qpR+Jib7114hykn5i2rxmNVF+kgqJ1PbldajR7vLiX82aqlRsddHWNVKWME0ExFm9vuRGiB5TobDiq7LyiefbnlBOsGhO8WfqY6kkF0iYdc8+eGqE9cRqLvvXIDkS/Z87W5sI8p0iBhEf70wgIscfo3Kx0ao0tZoLflBNAoGATXCECyhEIGGZ/NbB+7c3uxgVCfhIlHVQDcgW+MbPsa+toG6viQKhVo0zxUY7EvHFkiklzN9I+31WdKeTQiX9rLuHV6hO9UfVMVuM2fTE9LPuwgxFNdc46MQux11eTaCN7Ft8iZx3y3DIClke0WJ8p5GGGicsNJ4MGJXv9NkwWgECgYAHD/CWnZglDdb1HCYYhVaNO4uDEFfNNd6T7pUeQGJa63kpRB6X8LdeRTpUOlZgbsduyfgFQb8MSWl1+9EP6LOkiMws100gAk04a22c0DFv+7A8BGqllINR7aMHZi7JUNQSNFQOPLI+BfnvySCC626UDcoIzEDoNITHnHz0VZKU7A==";
//        System.out.println(rsa.checkKeyLength(publicKey, privateKey));
    }

}