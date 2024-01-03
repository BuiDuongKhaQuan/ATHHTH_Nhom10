package qht.shopmypham.com.vn.model;

import java.io.Serializable;

public class FAQs implements Serializable {
	int idF;
	String question;
	String answer;
	int status;

	public FAQs() {
	}

	public FAQs(int idF, String question, String answer, int status) {
		this.idF = idF;
		this.question = question;
		this.answer = answer;
		this.status = status;
	}

	public int getIdF() {
		return idF;
	}

	public void setIdF(int idF) {
		this.idF = idF;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "FAQs{" +
				"idF=" + idF +
				", question='" + question + '\'' +
				", answer='" + answer + '\'' +
				", status=" + status +
				'}';
	}
}
