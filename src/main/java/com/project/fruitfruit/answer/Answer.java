package com.project.fruitfruit.answer;

import java.sql.Date;

public class Answer {

	private int answer_num;
    private int help_num;
    private String user_id;
    private String answer_content;
    private Date answer_date;
	public Answer() {
		super();
	}
	public Answer(int answer_num, int help_num, String user_id, String answer_content,
			Date answer_date) {
		super();
		this.answer_num = answer_num;
		this.help_num = help_num;
		this.user_id = user_id;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
	}
	
	public int getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
	}
	public int getHelp_num() {
		return help_num;
	}
	public void setHelp_num(int help_num) {
		this.help_num = help_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
		return "Answer [answer_num=" + answer_num + ", help_num=" + help_num + ", user_id=" + user_id
				+ ", answer_content=" + answer_content + ", answer_date="
				+ answer_date + "]";
	}
	
}
