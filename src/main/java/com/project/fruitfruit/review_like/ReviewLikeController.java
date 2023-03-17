package com.project.fruitfruit.review_like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fruitfruit.review.ReviewService;

@Controller
public class ReviewLikeController {

	@Autowired
	private ReviewLikeService rlService;
	@Autowired
	private ReviewService rService;
	
	@RequestMapping("/review_like/hit")
	public String hitReviewLike(ReviewLike rl, HttpServletRequest req) {
	    String referer = req.getHeader("Referer");
	    
		if(rl.getReview_like_user_id() == "") {
			return "redirect:"+ referer; 
		}
		ReviewLike reviewLike = rlService.selectReviewLikeByUserIdAndReviewNum(rl);
		if (reviewLike != null) {
			rService.decreaseReviewLikeHit(reviewLike.getReview_like_review_num());
			rlService.deleteReviewLike(reviewLike.getReview_like_num());
		}
		else {
			rlService.insertReviewLike(rl);
			rService.increaseReviewLikeHit(rl.getReview_like_review_num());
		}
	    return "redirect:"+ referer;
	}
	
	@RequestMapping("/review_like/add")
	public void addReviewLike(ReviewLike rl) {
		rlService.insertReviewLike(rl);
		rService.increaseReviewLikeHit(rl.getReview_like_review_num());
	}
	
	@RequestMapping("/review_like/delete")
	public void deleteReviewLike(int review_like_num) {
		rlService.deleteReviewLike(review_like_num);
		rService.decreaseReviewLikeHit(review_like_num);
	}
	
	
}
