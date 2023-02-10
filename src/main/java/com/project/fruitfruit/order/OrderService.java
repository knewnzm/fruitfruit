package com.project.fruitfruit.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	@Autowired 
	private OrderMapper mapper;
	
	public void insertOrder(Order o) {
		mapper.insertOrder(o);
	}
	
	public ArrayList<Order> selectOrderByOrderId(String order_id) {
		return mapper.selectOrderByOrderId(order_id);
		
	}
	
	public ArrayList<Order> selectOrderBySellerId(String product_seller_id){
		return mapper.selectOrderBySellerId(product_seller_id);
	}
	
	public void updateOrderType(int order_num){
		mapper.updateOrderType(order_num);
	}
	
	public void updateOrderType0(int order_num){
		mapper.updateOrderType(order_num);
	}
	
	public void deleteOrder(int order_num){
		mapper.deleteOrder(order_num);
	}
}
