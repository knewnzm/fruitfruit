package com.project.fruitfruit.order;

import java.sql.Date;

import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.product.Product;

public class Order {

	private int order_num; //주문번호
	private int product_num; //주문상품번호
	private String order_id; //주문자 id
	private int order_count; //주문 개수
	private int order_type; //
	private Date order_date; //주문 시간
	private Product p;
	private Member m;
	private String reviewStatus; //리뷰상태
	
	public Order() {
		super();
	}

	public Order(int order_num, int product_num, String order_id, int order_count, int order_type, Date order_date,
			Product p, Member m, String reviewStatus) {
		super();
		this.order_num = order_num;
		this.product_num = product_num;
		this.order_id = order_id;
		this.order_count = order_count;
		this.order_type = order_type;
		this.order_date = order_date;
		this.p = p;
		this.m = m;
		this.reviewStatus = reviewStatus;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public int getOrder_count() {
		return order_count;
	}

	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}

	public int getOrder_type() {
		return order_type;
	}

	public void setOrder_type(int order_type) {
		this.order_type = order_type;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	public Member getM() {
		return m;
	}

	public void setM(Member m) {
		this.m = m;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "Order [order_num=" + order_num + ", product_num=" + product_num + ", order_id=" + order_id
				+ ", order_count=" + order_count + ", order_type=" + order_type + ", order_date=" + order_date + ", p="
				+ p + ", m=" + m + ", reviewStatus=" + reviewStatus + "]";
	}

	

	


}
