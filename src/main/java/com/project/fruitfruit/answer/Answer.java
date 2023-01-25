package com.project.fruitfruit.answer;

import java.sql.Date;

public class Answer {

	private int answer_num;
	private int answer_product_num;
	private String answer_writer;
	private String answer_content;
	private Date answer_date;
	
	public Answer() {
		super();
	}

	public Answer(int answer_num, int answer_product_num, String answer_writer, String answer_content,
			Date answer_date) {
		super();
		this.answer_num = answer_num;
		this.answer_product_num = answer_product_num;
		this.answer_writer = answer_writer;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
	}

	public int getAnswer_num() {
		return answer_num;
	}

	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
	}

	public int getAnswer_product_num() {
		return answer_product_num;
	}

	public void setAnswer_product_num(int answer_product_num) {
		this.answer_product_num = answer_product_num;
	}

	public String getAnswer_writer() {
		return answer_writer;
	}

	public void setAnswer_writer(String answer_writer) {
		this.answer_writer = answer_writer;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public Date getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}

	@Override
	public String toString() {
		return "Answer [answer_num=" + answer_num + ", answer_product_num=" + answer_product_num + ", answer_writer="
				+ answer_writer + ", answer_content=" + answer_content + ", answer_date=" + answer_date + "]";
	}
	
}
