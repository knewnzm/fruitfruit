package com.project.fruitfruit.order;

public class Order {

	private int order_num;
	private String order_id;
	private String product_seller_id;
	private int order_count;
	private int order_type;
	
	public Order() {
		super();
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getProduct_seller_id() {
		return product_seller_id;
	}

	public void setProduct_seller_id(String product_seller_id) {
		this.product_seller_id = product_seller_id;
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

	@Override
	public String toString() {
		return "Order [order_num=" + order_num + ", order_id=" + order_id + ", product_seller_id=" + product_seller_id
				+ ", order_count=" + order_count + ", order_type=" + order_type + "]";
	}

	
	
}
