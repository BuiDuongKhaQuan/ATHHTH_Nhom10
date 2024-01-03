package qht.shopmypham.com.vn.model;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import qht.shopmypham.com.vn.service.ShopService;

import java.io.IOException;
import java.io.Serializable;
import java.util.*;


public class api implements Serializable {
    static String districtID = String.valueOf(ShopService.getShop().getDistrictID());
    static String wardID = String.valueOf(ShopService.getShop().getWardID());

    public static void signup() throws IOException {
        String url = "http://140.238.54.136/api/auth/register";
        HttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(url);

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("name", "quan"));
        params.add(new BasicNameValuePair("email", "buiduongkhaquan123456@gmail.com"));
        params.add(new BasicNameValuePair("password", "01654232535"));
        params.add(new BasicNameValuePair("password_confirmation", "01654232535"));
        httpPost.setEntity(new UrlEncodedFormEntity(params));

        HttpResponse response = httpClient.execute(httpPost);
        HttpEntity entity = response.getEntity();
        String responseString = EntityUtils.toString(entity, "UTF-8");

        System.out.println(responseString);
    }

    public static String getTokenAccess() throws IOException {
        String url = "http://140.238.54.136/api/auth/login";
        HttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(url);

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("email", "buiduongkhaquan123456@gmail.com"));
        params.add(new BasicNameValuePair("password", "01654232535"));
        httpPost.setEntity(new UrlEncodedFormEntity(params));

        HttpResponse response = httpClient.execute(httpPost);
        HttpEntity entity = response.getEntity();
        String responseString = EntityUtils.toString(entity, "UTF-8");
        JSONObject jsonObject = new JSONObject(responseString);
        return jsonObject.getString("access_token");
    }

    public static ArrayList<Province> getProvince() throws IOException {
        String url1 = "http://140.238.54.136/api/province";
        HttpClient httpClient1 = HttpClientBuilder.create().build();
        HttpGet request = new HttpGet(url1);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());

        HttpResponse response1 = httpClient1.execute(request);
        HttpEntity entity1 = response1.getEntity();
        String responseString1 = EntityUtils.toString(entity1, "UTF-8");
        JSONObject jsonObject = new JSONObject(responseString1);
        JSONArray provinceList = jsonObject.getJSONObject("original").getJSONArray("data");

        ArrayList<Province> provinces = new ArrayList<>();
        for (int i = 0; i < provinceList.length(); i++) {
            JSONObject provinceJson = provinceList.getJSONObject(i);
            int ProvinceID = provinceJson.getInt("ProvinceID");
            String ProvinceName = provinceJson.getString("ProvinceName");
            Province province = new Province(ProvinceID, ProvinceName);
            provinces.add(province);
        }
        return provinces;
    }

    public static ArrayList<District> getDistrict(int provinceID) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        String url = String.format("http://140.238.54.136/api/district?provinceID=%d", provinceID);
        HttpGet request = new HttpGet(url);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());
        HttpResponse response = client.execute(request);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        JSONObject jsonObject = new JSONObject(jsonResponse);
        JSONArray provinceList = jsonObject.getJSONObject("original").getJSONArray("data");

        ArrayList<District> provinces = new ArrayList<>();
        for (int i = 0; i < provinceList.length(); i++) {
            JSONObject provinceJson = provinceList.getJSONObject(i);
            int DistrictID = provinceJson.getInt("DistrictID");
            String DistrictName = provinceJson.getString("DistrictName");
            District province = new District(DistrictID, DistrictName);
            provinces.add(province);
        }
        return provinces;
    }

    public static ArrayList<Ward> getWard(int districtID) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        String url = String.format("http://140.238.54.136/api/ward?districtID=%d", districtID);
        HttpGet request = new HttpGet(url);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());
        HttpResponse response = client.execute(request);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        JSONObject jsonObject = new JSONObject(jsonResponse);
        JSONArray provinceList = jsonObject.getJSONObject("original").getJSONArray("data");
        ArrayList<Ward> wards = new ArrayList<>();
        for (int i = 0; i < provinceList.length(); i++) {
            JSONObject provinceJson = provinceList.getJSONObject(i);
            int WardCode = provinceJson.getInt("WardCode");
            String WardName = provinceJson.getString("WardName");
            Ward ward = new Ward(WardCode, WardName);
            wards.add(ward);
        }
        return wards;
    }

    public static ArrayList<LeadTime> leadTime(String to_district_id, String to_ward_id) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        String url = "http://140.238.54.136/api/leadTime";
        HttpPost request = new HttpPost(url);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("from_district_id", districtID));
        params.add(new BasicNameValuePair("from_ward_id", wardID));
        params.add(new BasicNameValuePair("to_district_id", to_district_id));
        params.add(new BasicNameValuePair("to_ward_id", to_ward_id));
        params.add(new BasicNameValuePair("height", "20"));
        params.add(new BasicNameValuePair("length", "20"));
        params.add(new BasicNameValuePair("width", "20"));
        params.add(new BasicNameValuePair("weight", "20"));
        request.setEntity(new UrlEncodedFormEntity(params));
        HttpResponse response = client.execute(request);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        JSONObject jsonObject = new JSONObject(jsonResponse);
        JSONArray provinceList = jsonObject.getJSONArray("data");
        ArrayList<LeadTime> leadTimes = new ArrayList<>();
        for (int i = 0; i < provinceList.length(); i++) {
            JSONObject provinceJson = provinceList.getJSONObject(i);
            int timestamp = provinceJson.getInt("timestamp");
            String formattedDate = provinceJson.getString("formattedDate");
            LeadTime leadTime = new LeadTime(timestamp, formattedDate);
            leadTimes.add(leadTime);
        }
        return leadTimes;
    }

    public static int calculateFee(String to_district_id, String to_ward_id) throws IOException {
        int calculateFee = 0;
        HttpClient client = HttpClientBuilder.create().build();
        String url = "http://140.238.54.136/api/calculateFee";
        HttpPost request = new HttpPost(url);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("from_district_id", districtID));
        params.add(new BasicNameValuePair("from_ward_id", wardID));
        params.add(new BasicNameValuePair("to_district_id", to_district_id));
        params.add(new BasicNameValuePair("to_ward_id", to_ward_id));
        params.add(new BasicNameValuePair("height", "20"));
        params.add(new BasicNameValuePair("length", "20"));
        params.add(new BasicNameValuePair("width", "20"));
        params.add(new BasicNameValuePair("weight", "20"));
        request.setEntity(new UrlEncodedFormEntity(params));
        HttpResponse response = client.execute(request);
        String jsonResponse = EntityUtils.toString(response.getEntity());
//        JSONObject jsonObject = new JSONObject(jsonResponse);
//        JSONArray provinceList = jsonObject.getJSONArray("data");
//        calculateFee = provinceList.getJSONObject(0).getInt("service_fee");
        System.out.println(jsonResponse);
        return calculateFee;
    }

    public static Transport registerTransport(String to_district_id, String to_ward_id) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        String url = "http://140.238.54.136/api/registerTransport";
        HttpPost request = new HttpPost(url);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("from_district_id", districtID));
        params.add(new BasicNameValuePair("from_ward_id", wardID));
        params.add(new BasicNameValuePair("to_district_id", to_district_id));
        params.add(new BasicNameValuePair("to_ward_id", to_ward_id));
        params.add(new BasicNameValuePair("height", "20"));
        params.add(new BasicNameValuePair("length", "20"));
        params.add(new BasicNameValuePair("width", "20"));
        params.add(new BasicNameValuePair("weight", "20"));
        request.setEntity(new UrlEncodedFormEntity(params));
        HttpResponse response = client.execute(request);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        ObjectMapper objectMapper = new ObjectMapper();
        TransportWrapper transportWrapper = objectMapper.readValue(jsonResponse, TransportWrapper.class);
        return transportWrapper.getTransport();
    }

    public static ArrayList<TransportS> getAllOrder() throws IOException {
        String url = "http://140.238.54.136/api/allTransports";
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet request = new HttpGet(url);
        request.setHeader("Authorization", "Bearer " + getTokenAccess());
        HttpResponse response = client.execute(request);
        String responseBody = EntityUtils.toString(response.getEntity());
        ObjectMapper objectMapper = new ObjectMapper();

        TransportS[] myObjects = objectMapper.readValue(responseBody, TransportS[].class);
        ArrayList<TransportS> myObjectList = new ArrayList<>(Arrays.asList(myObjects));
        return myObjectList;
    }

    public static TransportS getOrderById(String id) throws IOException {
        TransportS transport = null;
        for (TransportS transportS : getAllOrder()) {
            if (transportS.getId().equals(id)) {
                transport = transportS;
            }
        }
        return transport;
    }

    public static Province getProvinceById(int idProvince) throws IOException {
        Province province = null;
        for (Province pro : getProvince()) {
            if (pro.getProvinceID() == idProvince) {
                province = pro;
            }
        }
        return province;
    }

    public static District getDistrictById(int idProvince, int idDistrict) throws IOException {
        District district = null;
        for (District di : getDistrict(idProvince)) {
            if (di.getDistrictID() == idDistrict) {
                district = di;
            }
        }
        return district;
    }

    public static Ward getWardById(int idDistrict, int idWard) throws IOException {
        Ward ward = null;
        for (Ward w : getWard(idDistrict)) {
            if (w.getWardCode() == idWard) {
                ward = w;
            }
        }
        return ward;
    }

    public static void main(String[] args) throws IOException {
        System.out.println(calculateFee("2264", "90816"));
//        getOrderById("42f70df5260242adbebe305f3645d7fd");
//        System.out.println(registerTransport("3695","90737").getId());
//        System.out.println(getOrderById("8787ebcfb0d0471aa3826bc01785c37a"));
//        System.out.println(getProvinceById(269));
    }

}
