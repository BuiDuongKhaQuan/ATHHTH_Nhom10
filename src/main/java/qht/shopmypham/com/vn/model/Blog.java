package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class Blog implements Serializable {
	int idBl;
	int idA;
	String img;
	String topic;
	String time;
	int view;
	String shortContent;
	String linkBlog;
	public Blog(int idBl, int idA, String img, String topic, String time, int view, String shortContent,
			String linkBlog) {
		super();
		this.idBl = idBl;
		this.idA = idA;
		this.img = img;
		this.topic = topic;
		this.time = time;
		this.view = view;
		this.shortContent = shortContent;
		this.linkBlog = linkBlog;
	}
	public Blog() {
		super();
	}
	public int getIdBl() {
		return idBl;
	}
	public void setIdBl(int idBl) {
		this.idBl = idBl;
	}
	public int getIdA() {
		return idA;
	}
	public void setIdA(int idA) {
		this.idA = idA;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getShortContent() {
		return shortContent;
	}
	public void setShortContent(String shortContent) {
		this.shortContent = shortContent;
	}
	public String getLinkBlog() {
		return linkBlog;
	}
	public void setLinkBlog(String linkBlog) {
		this.linkBlog = linkBlog;
	}

}
