package com.project.fruitfruit.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fruitfruit.support.Support;

@Controller
public class ReviewController {
	
	@Autowired 
	ReviewService rService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/review/list")
	public void selectReviewByWriter(Model model) {
		ArrayList<Review> li = rService.selectAllReview();
		model.addAttribute("li", li);
	}
	
	private ArrayList<Review> selectReviewList(@RequestParam int type){
		
		ArrayList<Review> list = null;
		switch (type) {
		case 0: {
			list = rService.selectAllReview();
			break;
		}
		case 1: {
			list = rService.orderReviewByReviewLike();
			break;
		}
		case 2: {
			list = rService.orderReviewByReviewScore();
			break;
		}
		case 3: {
			list = rService.orderReviewByReviewDate();
			break;
		}
		
		default:
			list = rService.selectAllReview();
		}
		return list;
	}
	
	@GetMapping("review/reviewForm")
	public void addForm(Review r) {
	}
	
	@PostMapping("review/reviewForm")
	public String addReview(Review r) {
		rService.insertReview(r);
		return "redirect:/product/productDetail?product_num=" + r.getReview_product_num();
	}
	
	@GetMapping("review/reviewEdit")
	public void editForm(Review r) {
	}
	
	@PostMapping("review/reviewEdit")
	public String editReview(Review r) {
		rService.updateReview(r);
		return "redirect:/product/productDetail?product_num=" + r.getReview_product_num();
	}
	
	@PostMapping("review/reviewDelete")
	public String deleteReview(int review_num) {
		rService.deleteReview(review_num);
		return "redirect:/product/productList";
	}
	
	
}
