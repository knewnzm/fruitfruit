package com.project.fruitfruit.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
	public void insertOrder(Order o);
	
	public ArrayList<Order> selectOrderByOrderId(String order_id);
	
	public Order selectOrderByOrderNum(int ordert_num);
	
	public ArrayList<Order> selectOrderByProductNum(int product_num);
	
	public void updateOrderType(int order_num); 
	
	public void cancelOrder(int order_num);
	
	public void deleteOrder(int order_num);
	
	public int selectSeqCurrval();
}
