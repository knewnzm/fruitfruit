package com.project.fruitfruit.notice;

import org.springframework.web.multipart.MultipartFile;

public class Notice {

	private int notice_num;
	private int notice_type;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_path;
	private int notice_hit;
	private MultipartFile file1;
	public Notice() {
		super();
	}
	public Notice(int notice_num, int notice_type, String notice_title, String notice_content, String notice_date,
			String notice_path, int notice_hit, MultipartFile file1) {
		super();
		this.notice_num = notice_num;
		this.notice_type = notice_type;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_path = notice_path;
		this.notice_hit = notice_hit;
		this.file1 = file1;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(int notice_type) {
		this.notice_type = notice_type;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_path() {
		return notice_path;
	}
	public void setNotice_path(String notice_path) {
		this.notice_path = notice_path;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "Notice [notice_num=" + notice_num + ", notice_type=" + notice_type + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", notice_path=" + notice_path
				+ ", notice_hit=" + notice_hit + ", file1=" + file1 + "]";
	}
	
	
	
}
