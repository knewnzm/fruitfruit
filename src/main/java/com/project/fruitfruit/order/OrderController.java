package com.project.fruitfruit.order;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		ArrayList<Order> o=service.selectOrderByOrderId(user_id); //구매자 아이디와 일치하는 행전체리스트를 o라 하자
		for(int i=0;i<o.size();i++) { //o안의 각각의 행들을 뽑아내기 위해 for문을 돌리고
			Order in_o = o.get(i); //arrayList o의 i번째 행을 순서대로 뽑을것이고 이것을 in_o라고 하자
			Product in_p = pservice.selectProduct(in_o.getProduct_num());//arrayList o안에 있는 하나의 행 in_o가 가지고 있는 상품번호를 가져온다
			                                                                                              //해당 상품번호와 일치하는 하나의 상품정보를 가져오고 이것을 in_p라 하자
			                                                                                              //arrayList o의 i번째 행인 in_o에 해당하는 하나의 상품정보를 저장한다
			                                                                                              //for문이므로 이것을 arrayList의 크기만큼 반복하고 모든 상품정보를 모든 in_o에
			                                                                                              //순서대로 넣어준다
			in_o.setP(in_p);
		}
		Collections.reverse(o);
		model.addAttribute("olist", o); //그렇게 만든 arrayList를 olist라는 이름으로 return 한다
		System.out.println(o);
	} else if(user_type==2) {
		ArrayList<Product> p=pservice.selectProductBySellerId(1, 10, user_id);	
		model.addAttribute("plist", p);
	}
}
}
@RequestMapping(value="/order/change") //주문타입 다음단계로 하나 올리기
public String change(@RequestParam int order_num,@RequestParam(value = "product_num", required = false) String product_num) {
	
service.updateOrderType(order_num);		
if((int)session.getAttribute("user_type")==2) {
	return "redirect:/product/orderList?product_num="+product_num;
}else {
	return "redirect:/product/mylist";
}
}

@RequestMapping(value="/order/cancel") //주문타입 3으로 만들기
public String cancel(@RequestParam int order_num,@RequestParam(value = "product_num", required = false) String product_num) {
service.cancelOrder(order_num);		
if((int)session.getAttribute("user_type")==2) {
	return "redirect:/product/orderList?product_num="+product_num;
}else {
	return "redirect:/product/mylist";
}
}

@RequestMapping(value="/order/orderDelete") //주문목록에서 삭제하기
public String delete(@RequestParam int order_num,@RequestParam(value = "product_num", required = false) String product_num) {
service.deleteOrder(order_num);		
if((int)session.getAttribute("user_type")==2) {
	return "redirect:/product/orderList?product_num="+product_num;
}else {
	return "redirect:/product/mylist";
}
}
@RequestMapping(value="/product/orderList") //id에 해당하는 전체 주문목록/판매목록 불러오기
public void orderList(int product_num, Model model) {
		ArrayList<Order> ol=service.selectOrderByProductNum(product_num); //판매글 번호와 일치하는 구매자행 전체리스트를 ol 이라 하자
		for(Order o:ol) {
			String user_id = o.getOrder_id();
			Member m = mservice.select(user_id);
			o.setM(m);
		}
			Product p = pservice.selectProduct(product_num);
			System.out.println(ol);
			System.out.println(p);
		model.addAttribute("olist", ol); //그렇게 만든 arrayList를 olist라는 이름으로 return 한다
		model.addAttribute("p", p); //그렇게 만든 arrayList를 olist라는 이름으로 return 한다

}
}

=======
public class OrderController {

}
>>>>>>> refs/remotes/daegyu/daegyu
