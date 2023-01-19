package com.project.fruitfruit.help;

import java.sql.Date;

public class Help {

	private int help_num;
	private String help_title;
	private String help_content;
	private String help_path;
	private Date help_date;
	private String help_writer_id;
	private int help_type;
	
	public Help() {
		super();
	}

	public Help(int help_num, String help_title, String help_content, String help_path, Date help_date,
			String help_writer_id, int help_type) {
		super();
		this.help_num = help_num;
		this.help_title = help_title;
		this.help_content = help_content;
		this.help_path = help_path;
		this.help_date = help_date;
		this.help_writer_id = help_writer_id;
		this.help_type = help_type;
	}

	public int getHelp_num() {
		return help_num;
	}

	public void setHelp_num(int help_num) {
		this.help_num = help_num;
	}

	public String getHelp_title() {
		return help_title;
	}

	public void setHelp_title(String help_title) {
		this.help_title = help_title;
	}

	public String getHelp_content() {
		return help_content;
	}

	public void setHelp_content(String help_content) {
		this.help_content = help_content;
	}

	public String getHelp_path() {
		return help_path;
	}

	public void setHelp_path(String help_path) {
		this.help_path = help_path;
	}

	public Date getHelp_date() {
		return help_date;
	}

	public void setHelp_date(Date help_date) {
		this.help_date = help_date;
	}

	public String getHelp_writer_id() {
		return help_writer_id;
	}

	public void setHelp_writer_id(String help_writer_id) {
		this.help_writer_id = help_writer_id;
	}

	public int getHelp_type() {
		return help_type;
	}

	public void setHelp_type(int help_type) {
		this.help_type = help_type;
	}

	@Override
	public String toString() {
		return "Help [help_num=" + help_num + ", help_title=" + help_title + ", help_content=" + help_content
				+ ", help_path=" + help_path + ", help_date=" + help_date + ", help_writer_id=" + help_writer_id
				+ ", help_type=" + help_type + "]";
	}
	
}
