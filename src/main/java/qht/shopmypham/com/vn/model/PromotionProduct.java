package qht.shopmypham.com.vn.model;

import java.io.Serializable;
import java.util.List;

public class PromotionProduct implements Serializable {
	int id, idP;
	String startDay, endDay;
	int price;
	public PromotionProduct() {
	}

	public PromotionProduct(int id, int idP, String startDay, String endDay, int price) {
		this.id = id;
		this.idP = idP;
		this.startDay = startDay;
		this.endDay = endDay;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdP() {
		return idP;
	}

	public void setIdP(int idP) {
		this.idP = idP;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
