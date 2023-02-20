package com.project.fruitfruit.review;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

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
	public void addForm(
			Review r, 
			@RequestParam int product_num, 
			Model model) {
		
		model.addAttribute("product_num", product_num);
		
	}
	
	@PostMapping("review/reviewForm")
	public String addReview(Review r) {
		System.out.println("출력삾"+r);
		rService.insertReview(r);
		int review_num = rService.selectSeqReviewCurrval();
		uploadFile(r.getFile(), review_num);
		return "redirect:/product/productDetail?product_num=" + r.getReview_product_num();
	}
	
	@GetMapping("review/reviewEdit")
	public void editForm(Model model, @RequestParam int review_num) {
		Review review = rService.selectReview(review_num);
		model.addAttribute("review", review);


	}
	
	@PostMapping("review/reviewEdit")
	public String editReview(Review r) {
		System.out.println("r:"+r);
		rService.updateReview(r);
		return "redirect:/product/productDetail?product_num=" + r.getReview_product_num();
	}
	
	@PostMapping("review/reviewDelete")
	public String deleteReview(int review_num, HttpServletRequest request) {
		rService.deleteReview(review_num);
		String referer = request.getHeader("Referer");
    	return "redirect:"+ referer;
	}
	
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\review\\";
	
	private void uploadFile(MultipartFile file, int review_num) {
		File dir = new File(projectPath + webPath + review_num);
		if (!dir.exists()) {
			dir.mkdir();
		}
		
		if (!file.isEmpty()) {
			String uploadPath = webPath + review_num + "/" + file.getOriginalFilename();
			File f = new File(projectPath + uploadPath);
			if (!f.exists()) {
				try {
					f.createNewFile();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
}
