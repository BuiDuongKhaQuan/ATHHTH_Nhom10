package qht.shopmypham.com.vn.model;

public class TransportS {
    private String email;
    private String fromDistrictId;
    private String fromWardId;
    private String toDistrictId;
    private String toWardId;
    private int height;
    private int length;
    private int width;
    private int weight;
    private int fee;
    private long leadTime;
    private boolean active;
    private String id;
    private String updated_at;
    private String created_at;

    public TransportS() {
    }

    public TransportS(String email, String fromDistrictId, String fromWardId, String toDistrictId, String toWardId, int height, int length, int width, int weight, int fee, long leadTime, boolean active, String id, String updated_at, String created_at) {
        this.email = email;
        this.fromDistrictId = fromDistrictId;
        this.fromWardId = fromWardId;
        this.toDistrictId = toDistrictId;
        this.toWardId = toWardId;
        this.height = height;
        this.length = length;
        this.width = width;
        this.weight = weight;
        this.fee = fee;
        this.leadTime = leadTime;
        this.active = active;
        this.id = id;
        this.updated_at = updated_at;
        this.created_at = created_at;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFromDistrictId() {
        return fromDistrictId;
    }

    public void setFromDistrictId(String fromDistrictId) {
        this.fromDistrictId = fromDistrictId;
    }

    public String getFromWardId() {
        return fromWardId;
    }

    public void setFromWardId(String fromWardId) {
        this.fromWardId = fromWardId;
    }

    public String getToDistrictId() {
        return toDistrictId;
    }

    public void setToDistrictId(String toDistrictId) {
        this.toDistrictId = toDistrictId;
    }

    public String getToWardId() {
        return toWardId;
    }

    public void setToWardId(String toWardId) {
        this.toWardId = toWardId;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public long getLeadTime() {
        return leadTime;
    }

    public void setLeadTime(long leadTime) {
        this.leadTime = leadTime;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "TransportS{" +
                "email='" + email + '\'' +
                ", fromDistrictId='" + fromDistrictId + '\'' +
                ", fromWardId='" + fromWardId + '\'' +
                ", toDistrictId='" + toDistrictId + '\'' +
                ", toWardId='" + toWardId + '\'' +
                ", height=" + height +
                ", length=" + length +
                ", width=" + width +
                ", weight=" + weight +
                ", fee=" + fee +
                ", leadTime=" + leadTime +
                ", active=" + active +
                ", id='" + id + '\'' +
                ", updated_at='" + updated_at + '\'' +
                ", created_at='" + created_at + '\'' +
                '}';
    }
}
