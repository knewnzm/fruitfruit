package com.project.fruitfruit.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping(value = "/order/orderResult")
public ModelAndView content(@RequestParam int product_num,@RequestParam int order_count) {
	ModelAndView mav = new ModelAndView();
	Product p=pservice.selectProduct(product_num);
	System.out.println(p);
	mav.addObject("count", order_count);
	mav.addObject("p", p);
	return mav;

}

@RequestMapping(value="/product/mylist")
public void go(Model model) {
	String user_id = (String) session.getAttribute("user_id");
	int user_type = (int) session.getAttribute("user_type");
	if(user_type==1) {
		ArrayList<Order> o=service.selectOrderByOrderId(user_id);
		model.addAttribute("olist", o);
	} else if(user_type==2) {
		ArrayList<Product> p=pservice.selectProductBySellerId(1, 10, user_id);
		model.addAttribute("plist", p);
	}
}

}
