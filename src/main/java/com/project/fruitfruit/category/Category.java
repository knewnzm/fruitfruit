package com.project.fruitfruit.category;

public class Category {

	private int cate_num;
	private String cate_name;
	private int cate_parent_num;
	
	public Category() {
		super();
	}

	public Category(int cate_num, String cate_name) {
		super();
		this.cate_num = cate_num;
		this.cate_name = cate_name;
	}

	public Category(int cate_num, String cate_name, int cate_parent_num) {
		super();
		this.cate_num = cate_num;
		this.cate_name = cate_name;
		this.cate_parent_num = cate_parent_num;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public int getCate_parent_num() {
		return cate_parent_num;
	}

	public void setCate_parent_num(int cate_parent_num) {
		this.cate_parent_num = cate_parent_num;
	}

	@Override
	public String toString() {
		return "Category [cate_num=" + cate_num + ", cate_name=" + cate_name + ", cate_parent_num=" + cate_parent_num
				+ "]";
	}
	
}
