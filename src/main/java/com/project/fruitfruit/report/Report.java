package com.project.fruitfruit.report;

import java.sql.Date;

import com.project.fruitfruit.product.Product;

public class Report {
	private int report_num; //신고번호
	private int product_num; //판매글 번호
	private String report_title; //신고 제목	
	private String report_content; //신고 내용
	private String report_writer_id; //신고글 작성자 id
	private String report_seller_id; //신고글 판매자 id
	private Date report_date; //신고 날짜
	Product p;
	public Report() {
		super();
	}
	public Report(int report_num, int product_num, String report_title, String report_content, String report_writer_id,
			String report_seller_id, Date report_date, Product p) {
		super();
		this.report_num = report_num;
		this.product_num = product_num;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_writer_id = report_writer_id;
		this.report_seller_id = report_seller_id;
		this.report_date = report_date;
		this.p = p;
	}
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getReport_writer_id() {
		return report_writer_id;
	}
	public void setReport_writer_id(String report_writer_id) {
		this.report_writer_id = report_writer_id;
	}
	public String getReport_seller_id() {
		return report_seller_id;
	}
	public void setReport_seller_id(String report_seller_id) {
		this.report_seller_id = report_seller_id;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public Product getP() {
		return p;
	}
	public void setP(Product p) {
		this.p = p;
	}
	@Override
	public String toString() {
		return "Report [report_num=" + report_num + ", product_num=" + product_num + ", report_title=" + report_title
				+ ", report_content=" + report_content + ", report_writer_id=" + report_writer_id
				+ ", report_seller_id=" + report_seller_id + ", report_date=" + report_date + ", p=" + p + "]";
	}
	
	
}
