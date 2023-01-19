package com.project.fruitfruit.wish;

import com.project.fruitfruit.product.Product;

public class Wish {

	private int wish_num;
	private int wish_product_num;
	private String wish_user_id;
	private Product p;
	
	public Wish() {
		super();
	}

	public Wish(int wish_num, int wish_product_num, String wish_user_id, Product p) {
		super();
		this.wish_num = wish_num;
		this.wish_product_num = wish_product_num;
		this.wish_user_id = wish_user_id;
		this.p = p;
	}

	public int getWish_num() {
		return wish_num;
	}

	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}

	public int getWish_product_num() {
		return wish_product_num;
	}

	public void setWish_product_num(int wish_product_num) {
		this.wish_product_num = wish_product_num;
	}

	public String getWish_user_id() {
		return wish_user_id;
	}

	public void setWish_user_id(String wish_user_id) {
		this.wish_user_id = wish_user_id;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	@Override
	public String toString() {
		return "Wish [wish_num=" + wish_num + ", wish_product_num=" + wish_product_num + ", wish_user_id="
				+ wish_user_id + ", p=" + p + "]";
	}

}
