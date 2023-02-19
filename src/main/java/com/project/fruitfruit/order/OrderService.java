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
	
	public Order selectOrderByOrderNum(int order_num){
		return mapper.selectOrderByOrderNum(order_num);
	}
	
	public ArrayList<Order> selectOrderByProductNum(int product_num){
		return mapper.selectOrderByProductNum(product_num);
	}
	
	public void updateOrderType(int order_num){
		mapper.updateOrderType(order_num);
	}
	
	public void cancelOrder(int order_num){
		mapper.cancelOrder(order_num);
	}
	
	public void deleteOrder(int order_num){
		mapper.deleteOrder(order_num);
	}
	
	public int selectSeqCurrval() {
		return mapper.selectSeqCurrval();
	}
}
