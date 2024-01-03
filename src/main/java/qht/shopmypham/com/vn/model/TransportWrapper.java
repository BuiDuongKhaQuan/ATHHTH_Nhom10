package qht.shopmypham.com.vn.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TransportWrapper {
    private String message;
    @JsonProperty("Transport")
    private Transport transport;

    public TransportWrapper() {
    }

    public TransportWrapper(String message, Transport transport) {
        this.message = message;
        this.transport = transport;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }
}
