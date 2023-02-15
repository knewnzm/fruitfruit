package com.project.fruitfruit.product;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Product {

	private int product_num;
	private String product_seller_id;
	private String product_title;
	private String product_content;
	private int product_price;
	private int product_quantity;
	private Date product_date;
	private int product_hit;
	private int product_pick;
	private int product_view_type;
	private String frfr_category1;
	private String frfr_category2;

	private String product_path;
	private String product_inner_path1;
	private String product_inner_path2;
	private String product_inner_path3;
	
	private MultipartFile file;
	private MultipartFile inner_file1;
	private MultipartFile inner_file2;
	private MultipartFile inner_file3;
	
	
	public Product() {
		super();
	}

	public Product(int product_num, String product_seller_id, String product_title, String product_path,
			String product_content, String product_inner_path1, String product_inner_path2, String product_inner_path3,
			int product_price, int product_quantity, Date product_date, int product_hit, int product_pick,
			int product_view_type, String frfr_category1, String frfr_category2) {
		super();
		this.product_num = product_num;
		this.product_seller_id = product_seller_id;
		this.product_title = product_title;
		this.product_path = product_path;
		this.product_content = product_content;
		this.product_inner_path1 = product_inner_path1;
		this.product_inner_path2 = product_inner_path2;
		this.product_inner_path3 = product_inner_path3;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_date = product_date;
		this.product_hit = product_hit;
		this.product_pick = product_pick;
		this.product_view_type = product_view_type;
		this.frfr_category1 = frfr_category1;
		this.frfr_category2 = frfr_category2;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_seller_id() {
		return product_seller_id;
	}

	public void setProduct_seller_id(String product_seller_id) {
		this.product_seller_id = product_seller_id;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public String getProduct_path() {
		return product_path;
	}

	public void setProduct_path(String product_path) {
		this.product_path = product_path;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_inner_path1() {
		return product_inner_path1;
	}

	public void setProduct_inner_path1(String product_inner_path1) {
		this.product_inner_path1 = product_inner_path1;
	}

	public String getProduct_inner_path2() {
		return product_inner_path2;
	}

	public void setProduct_inner_path2(String product_inner_path2) {
		this.product_inner_path2 = product_inner_path2;
	}

	public String getProduct_inner_path3() {
		return product_inner_path3;
	}

	public void setProduct_inner_path3(String product_inner_path3) {
		this.product_inner_path3 = product_inner_path3;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity() {
		return this.product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public int getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}

	public int getProduct_pick() {
		return product_pick;
	}

	public void setProduct_pick(int product_pick) {
		this.product_pick = product_pick;
	}

	public int getProduct_view_type() {
		return product_view_type;
	}

	public void setProduct_view_type(int product_view_type) {
		this.product_view_type = product_view_type;
	}

	public String getFrfr_category1() {
		return frfr_category1;
	}

	public void setFrfr_category1(String frfr_category1) {
		this.frfr_category1 = frfr_category1;
	}

	public String getFrfr_category2() {
		return frfr_category2;
	}

	public void setFrfr_category2(String frfr_category2) {
		this.frfr_category2 = frfr_category2;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public MultipartFile getInnerFile1() {
		return inner_file1;
	}

	public void setInner_file1(MultipartFile inner_file1) {
		this.inner_file1 = inner_file1;
	}

	public MultipartFile getInnerFile2() {
		return inner_file2;
	}

	public void setInner_file2(MultipartFile inner_file2) {
		this.inner_file2 = inner_file2;
	}

	public MultipartFile getInnerFile3() {
		return inner_file3;
	}

	public void setInner_file3(MultipartFile inner_file3) {
		this.inner_file3 = inner_file3;
	}

	@Override
	public String toString() {
		return "Product [product_num=" + product_num + ", product_seller_id=" + product_seller_id + ", product_title="
				+ product_title + ", product_path=" + product_path + ", product_content=" + product_content
				+ ", product_inner_path1=" + product_inner_path1 + ", product_inner_path2=" + product_inner_path2
				+ ", product_inner_path3=" + product_inner_path3 + ", product_price=" + product_price
				+ ", product_quantity=" + product_quantity + ", product_date=" + product_date + ", product_hit="
				+ product_hit + ", product_pick=" + product_pick + ", product_view_type=" + product_view_type
				+ ", frfr_category1=" + frfr_category1 + ", frfr_category2=" + frfr_category2 + ", file=" + file
				+ ", inner_file1=" + inner_file1 + ", inner_file2=" + inner_file2 + ", inner_file3=" + inner_file3
				+ "]";
	}


	
}
