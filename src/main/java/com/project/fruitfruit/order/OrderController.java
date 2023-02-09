package com.project.fruitfruit.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
