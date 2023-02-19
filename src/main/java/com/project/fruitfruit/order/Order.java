package com.project.fruitfruit.order;

<<<<<<< HEAD
import java.sql.Date;

import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.product.Product;

public class Order {

	private int order_num;
	private int product_num;
	private String order_id;
	private int order_count;
	private int order_type;
	private Date order_date;
	private Product p;
	private Member m;
	
	public Order() {
		super();
	}

	public Order(int order_num, int product_num, String order_id, int order_count, int order_type, Date order_date,
			Product p, Member m) {
		super();
		this.order_num = order_num;
		this.product_num = product_num;
		this.order_id = order_id;
		this.order_count = order_count;
		this.order_type = order_type;
		this.order_date = order_date;
		this.p = p;
		this.m = m;
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

	@Override
	public String toString() {
		return "Order [order_num=" + order_num + ", product_num=" + product_num + ", order_id=" + order_id
				+ ", order_count=" + order_count + ", order_type=" + order_type + ", order_date=" + order_date + ", p="
				+ p + ", m="+ m + "]";
	}

	


=======
public class Order {

	private int order_num;
	private String order_id;
	private int order_product_num;
	private int order_count;
	private int order_type;
	
	public Order() {
		super();
	}

	public Order(int order_num, String order_id, int order_product_num, int order_count, int order_type) {
		super();
		this.order_num = order_num;
		this.order_id = order_id;
		this.order_product_num = order_product_num;
		this.order_count = order_count;
		this.order_type = order_type;
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

	public int getOrder_product_num() {
		return order_product_num;
	}

	public void setOrder_product_num(int order_product_num) {
		this.order_product_num = order_product_num;
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
		return "Order [order_num=" + order_num + ", order_id=" + order_id + ", order_product_num=" + order_product_num
				+ ", order_count=" + order_count + ", order_type=" + order_type + "]";
	}
	
>>>>>>> refs/remotes/daegyu/daegyu
}
