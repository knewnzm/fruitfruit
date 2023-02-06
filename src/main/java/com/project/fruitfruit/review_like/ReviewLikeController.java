package com.project.fruitfruit.review_like;

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
