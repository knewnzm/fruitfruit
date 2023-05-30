package com.project.fruitfruit.help;

import org.springframework.web.multipart.MultipartFile;

public class Help {
	private int help_num;
	private int help_type;
	private String help_writer_id;
	private String help_date;
	private String help_title;
	private String help_content;
	private String[] help_path;
	private MultipartFile[] files;
	private int answer_status;
	public Help() {
		super();
	}
	public Help(int help_num, int help_type, String help_writer_id, String help_date, String help_title,
			String help_content, String[] help_path, MultipartFile[] files, int answer_status) {
		super();
		this.help_num = help_num;
		this.help_type = help_type;
		this.help_writer_id = help_writer_id;
		this.help_date = help_date;
		this.help_title = help_title;
		this.help_content = help_content;
		this.help_path = help_path;
		this.files = files;
		this.answer_status = answer_status;
	}
	public int getHelp_num() {
		return help_num;
	}
	public void setHelp_num(int help_num) {
		this.help_num = help_num;
	}
	public int getHelp_type() {
		return help_type;
	}
	public void setHelp_type(int help_type) {
		this.help_type = help_type;
	}
	public String getHelp_writer_id() {
		return help_writer_id;
	}
	public void setHelp_writer_id(String help_writer_id) {
		this.help_writer_id = help_writer_id;
	}
	public String getHelp_date() {
		return help_date;
	}
	public void setHelp_date(String help_date) {
		this.help_date = help_date;
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
	public String[] getHelp_path() {
		return help_path;
	}
	public void setHelp_path(String[] help_path) {
		this.help_path = help_path;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFile1(MultipartFile[] file1) {
		this.files = file1;
	}
	public int getAnswer_status() {
		return answer_status;
	}
	public void setAnswer_status(int answer_status) {
		this.answer_status = answer_status;
	}
	@Override
	public String toString() {
		return "Help [help_num=" + help_num + ", help_type=" + help_type + ", help_writer_id=" + help_writer_id
				+ ", help_date=" + help_date + ", help_title=" + help_title + ", help_content=" + help_content
				+ ", help_path=" + help_path + ", files=" + files + ", answer_status=" + answer_status + "]";
	}
	
	
}