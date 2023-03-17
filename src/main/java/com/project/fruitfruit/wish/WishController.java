package com.project.fruitfruit.wish;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.product.Product;
import com.project.fruitfruit.product.ProductService;
import com.project.fruitfruit.util.Page;

@Controller
public class WishController {

	@Autowired
	private WishService wService;
	@Autowired
	private ProductService pService;
	@Autowired
	private HttpSession session;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/wish/wishList")
	public String wishList(Model model) {
		String user_id = (String) session.getAttribute("user_id");
		
		if (user_id != null) {
			ArrayList<Wish> list = (ArrayList<Wish>) wService.selectWishByUserId(user_id);
			ArrayList<Product> plist = new ArrayList<Product>();
			for (int i = 0; i < list.size(); i++) {
				Wish w = list.get(i);
				Product product = pService.selectProduct(w.getWish_product_num());
				w.setP(product);
				plist.add(product);
			}
			model.addAttribute("list", list);
			model.addAttribute("plist", plist);
		}
		
		return "wish/wishList";
	}
	
	// 있는지 확인 가능기능
		@RequestMapping("/wish/check")
		@ResponseBody
		public boolean check(@RequestParam int product_num) {
			String user_id = (String) session.getAttribute("user_id");
			Wish w = wService.selectWishByUserIdAndProductNum(product_num, user_id);
			if (w == null) {
				return false;
			} else {
				return true;
			}
		}

		// 찜 추가
		@RequestMapping("/wish/add")
		public String addWish(
				@RequestParam int product_num, 
				@RequestParam String isWished) {
			
			if (isWished.equals("false")) {
				String user_id = (String) session.getAttribute("user_id");
				System.out.println("addWish : " + user_id + " " + product_num);

				Wish w = new Wish();

				w.setWish_user_id(user_id);
				w.setWish_product_num(product_num);

				System.out.println("addWish w : " + w);
				wService.insertWish(w);
			}

			return "redirect:/wish/wishList";
			
		}

		// 찜 삭제
		@RequestMapping("/wish/delete")
		public String delWish(@RequestParam(required = false, defaultValue = "-1") int wish_num,
				@RequestParam(required = false, defaultValue = "-1") int product_num) {

			String user_id = (String) session.getAttribute("user_id");
			if (wish_num != -1) {
				wService.deleteWish(wish_num);
			} else if (product_num != -1) {
				wService.deleteWishByProductNum(product_num, user_id);
			}
			return "redirect:/wish/wishList";
		}

		// 찜 리스트 전체 삭제
		@RequestMapping("/wish/wishDelAll")
		public String delAll() {
			String user_id = (String) session.getAttribute("user_id");
			wService.deleteAllWishByUserId(user_id);
			return "redirect:/wish/wishList";
		}

		@RequestMapping("/wish/count")
		@ResponseBody
		public int wishListCount() {
			String user_id = (String) session.getAttribute("user_id");
			if (user_id != null) {
				int count = wService.selectWishByUserId(user_id).size();
				return count;
			} else {
				return 0;
			}
		}

		@RequestMapping("/wish/countProduct")
		@ResponseBody
		public String wishProductCount(@RequestParam int product_num) {
			return Integer.toString(wService.selectWishByProductNum(product_num).size());
		}
	
}
