package com.project.fruitfruit.order;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.product.Product;
import com.project.fruitfruit.product.ProductService;



@Controller
public class OrderController {
@Autowired
private OrderService service;
@Autowired
private ProductService pservice;
@Autowired
private HttpSession session;
@RequestMapping(value = "/order/orderResult") //주문 요청 하기
public ModelAndView insertOrder(Order o) {
	ModelAndView mav = new ModelAndView();	
	Product p=pservice.selectProduct(o.getProduct_num());
	o.setP(p);
	service.insertOrder(o);
	int num = service.selectSeqCurrval();
	Order o2 = service.selectOrderByOrderNum(num);
	mav.addObject("o", o2);
	mav.addObject("p", p);

	return mav;

}

@RequestMapping(value="/product/mylist") //id에 해당하는 전체 주문목록/판매목록 불러오기
public void go(Model model) {
	String user_id = (String) session.getAttribute("user_id");
	if(user_id!=null) {
	int user_type = (int) session.getAttribute("user_type");
	if(user_type==1) {
		ArrayList<Order> o=service.selectOrderByOrderId(user_id);
		for(int i=0;i<o.size();i++) {
			Order in_o = o.get(i);
			Product in_p = pservice.selectProduct(in_o.getProduct_num());
			in_o.setP(in_p);
		}
		Collections.reverse(o);
		model.addAttribute("olist", o);
		System.out.println(o);
	} else if(user_type==2) {
		ArrayList<Product> p=pservice.selectProductBySellerId(1, 10, user_id);	
		model.addAttribute("plist", p);
	}
}
}
@RequestMapping(value="/order/change") //주문타입 다음단계로 하나 올리기
public String change(@RequestParam int order_num) {
service.updateOrderType(order_num);		
	return "redirect:/product/mylist";
}

@RequestMapping(value="/order/cancel") //주문타입 다음단계로 하나 올리기
public String cancel(@RequestParam int order_num) {
service.cancelOrder(order_num);		
	return "redirect:/product/mylist";
}

@RequestMapping(value="/order/orderDelete") //주문타입 다음단계로 하나 올리기
public String delete(@RequestParam int order_num) {
service.deleteOrder(order_num);		
	return "redirect:/product/mylist";
}
}
