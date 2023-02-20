package com.project.fruitfruit.support;

import java.sql.Date;

public class Support {

	private int support_num;
	private int support_parent_num;
	private int support_product_num;
	private String support_writer;
	private String support_title;
	private String support_content;
	private Date support_date;
	
	public Support() {
		super();
	}

	public Support(int support_num, int support_parent_num, int support_product_num, String support_writer,
			String support_title, String support_content, Date support_date) {
		super();
		this.support_num = support_num;
		this.support_parent_num = support_parent_num;
		this.support_product_num = support_product_num;
		this.support_writer = support_writer;
		this.support_title = support_title;
		this.support_content = support_content;
		this.support_date = support_date;
	}

	public int getSupport_num() {
		return support_num;
	}

	public void setSupport_num(int support_num) {
		this.support_num = support_num;
	}

	public int getSupport_parent_num() {
		return support_parent_num;
	}

	public void setSupport_parent_num(int support_parent_num) {
		this.support_parent_num = support_parent_num;
	}

	public int getSupport_product_num() {
		return support_product_num;
	}

	public void setSupport_product_num(int support_product_num) {
		this.support_product_num = support_product_num;
	}

	public String getSupport_writer() {
		return support_writer;
	}

	public void setSupport_writer(String support_writer) {
		this.support_writer = support_writer;
	}

	public String getSupport_title() {
		return support_title;
	}

	public void setSupport_title(String support_title) {
		this.support_title = support_title;
	}

	public String getSupport_content() {
		return support_content;
	}

	public void setSupport_content(String support_content) {
		this.support_content = support_content;
	}

	public Date getSupport_date() {
		return support_date;
	}

	public void setSupport_date(Date support_date) {
		this.support_date = support_date;
	}

	@Override
	public String toString() {
		return "Support [support_num=" + support_num + ", support_parent_num=" + support_parent_num
				+ ", support_product_num=" + support_product_num + ", support_writer=" + support_writer
				+ ", support_title=" + support_title + ", support_content=" + support_content + ", support_date="
				+ support_date + "]";
	}
	
	
		
}
