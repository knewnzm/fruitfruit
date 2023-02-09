package com.project.fruitfruit.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
	public void insertOrder(Order o);
	
	public List selectOrderByOrderId(String order_id);
	
	public List selectOrderBySellerId(String product_seller_id);
	
	public void updateOrderType(int order_num); 
	
	public void updateOrderType0(int order_num);
	
	public void deleteOrder(int order_num);
}
