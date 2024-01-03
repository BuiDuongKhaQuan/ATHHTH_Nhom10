package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Payment implements Serializable {
	int idPm;
	String namePayment;
	String iconPayment;
	public Payment(int idPm, String namePayment, String iconPayment) {
		super();
		this.idPm = idPm;
		this.namePayment = namePayment;
		this.iconPayment = iconPayment;
	}
	public Payment() {
		super();
	}
	public int getIdPm() {
		return idPm;
	}
	public void setIdPm(int idPm) {
		this.idPm = idPm;
	}
	public String getNamePayment() {
		return namePayment;
	}
	public void setNamePayment(String namePayment) {
		this.namePayment = namePayment;
	}
	public String getIconPayment() {
		return iconPayment;
	}
	public void setIconPayment(String iconPayment) {
		this.iconPayment = iconPayment;
	}
	
}
