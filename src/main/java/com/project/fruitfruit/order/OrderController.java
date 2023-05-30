package com.project.fruitfruit.order;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.member.MemberService;
import com.project.fruitfruit.product.Product;
import com.project.fruitfruit.product.ProductService;



@Controller
public class OrderController {
@Autowired
private OrderService service;
@Autowired
private ProductService pservice;
@Autowired
private MemberService mservice;
@Autowired
private HttpSession session;

//주문 등록 하기
@PostMapping(value = "/order/orderResult") 
public String insertOrder(Model model, Order o) {
	String path = "/order/orderResult";
	String user_id = (String)session.getAttribute("user_id");
	if(user_id != null) { //세션 만료 확인
		service.insertOrder(o); //주문 등록
		
		int orderNum = service.selectSeqCurrval(); //현재 주문번호를 저장(방금 등록된 주문번호)
		o = service.selectOrderByOrderNum(orderNum); //DB에서 주문날짜와 주문 번호를 얻은 o객체
		Product p=pservice.selectProduct(o.getProduct_num()); //판매 번호에 해당하는 판매자 정보
		o.setP(p); //o객체에 저장
		model.addAttribute("o", o);
	} else {
		path = "redirect:/member/loginForm";
	}
	return path;

}

//구매자 or 판매자 id에 해당하는 전체 주문목록 or 판매목록 불러오기(마이페이지 가기)
@GetMapping(value="/product/mylist") 
public void go(Model model) {
	String user_id = (String) session.getAttribute("user_id");
	if(user_id!=null) { //세션 만료 확인
	int user_type = (int) session.getAttribute("user_type");
	
	if(user_type==1) { //현재 구매자일경우
		ArrayList<Order> orderList = service.selectOrderByOrderId(user_id); //구매자가 구매한 list 조회
		for(int i=0; i<orderList.size(); i++) { 
			Order o = orderList.get(i); 
			Product p = pservice.selectProduct(o.getProduct_num());//상품번호로 판매자 정보 조회
			o.setP(p); //o객체에 판매자 정보를 등록
		}
		model.addAttribute("olist", orderList);
	} else if(user_type==2) {
		ArrayList<Product> p=pservice.selectProductBySellerId(1, 10, user_id); //판매자가 판매한 list 조회
		model.addAttribute("plist", p);
	}
}
}

//주문타입 +1하기
@GetMapping(value="/order/change") 
public String change(int order_num, @RequestParam(required = false) String product_num) { 
	//판매자가 주문자조회에서 주문수락이나 거래확정을 했을경우 원래 있던 페이지로 가기위해 product_num을 받음
service.updateOrderType(order_num);	
int user_type = (int)session.getAttribute("user_type");
if( user_type == 2 ) {
	return "redirect:/product/orderList?product_num="+product_num; //주문자 조회 페이지로
}else {
	return "redirect:/product/mylist"; //마이페이지로
}
}

@GetMapping(value="/order/cancel") //주문타입 3으로 만들기
public String cancel(int order_num, @RequestParam(required = false) String product_num) {
service.cancelOrder(order_num);		
int user_type = (int)session.getAttribute("user_type");
if( user_type == 2 ) {
	return "redirect:/product/orderList?product_num="+product_num; //주문자 조회 페이지로
}else {
	return "redirect:/product/mylist"; //마이페이지로
}
}

@GetMapping(value="/order/orderDelete") //주문목록에서 삭제하기
public String delete(int order_num,@RequestParam(required = false) String product_num) {
service.deleteOrder(order_num);		
int user_type = (int)session.getAttribute("user_type");
if( user_type == 2 ) {
	return "redirect:/product/orderList?product_num="+product_num; //주문자 조회 페이지로
}else {
	return "redirect:/product/mylist"; //마이페이지로
}
}

//구매자 목록 불러오기
@GetMapping(value="/product/orderList") 
public void orderList(Model model, int product_num) {
		ArrayList<Order> orderList=service.selectOrderByProductNum(product_num); //판매글 번호에 해당하는 전체 order 리스트
		Order o = null;
		for(int i=0; i<orderList.size(); i++) {
			o = orderList.get(i);
			String user_id = o.getOrder_id(); //각각의 주문 목록에서 구매자의 아이디를 조회
			Member m = mservice.select(user_id); //구매자의 정보를 조회
			o.setM(m); //구매자 정보를 o객체에 등록
		}
			Product p = pservice.selectProduct(product_num);
		model.addAttribute("olist", orderList); 
		model.addAttribute("p", p);

}
}

