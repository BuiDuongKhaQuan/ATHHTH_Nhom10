package qht.shopmypham.com.vn.model;

public class LeadTime {
    int timestamp;
    String formattedDate;

    public LeadTime() {
    }

    public LeadTime(int timestamp, String formattedDate) {
        this.timestamp = timestamp;
        this.formattedDate = formattedDate;
    }

    @Override
    public String toString() {
        return "LeadTime{" +
                "timestamp=" + timestamp +
                ", formattedDate='" + formattedDate + '\'' +
                '}';
    }

    public int getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(int timestamp) {
        this.timestamp = timestamp;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }
}
