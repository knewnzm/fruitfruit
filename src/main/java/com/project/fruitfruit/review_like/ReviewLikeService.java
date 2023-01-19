package com.project.fruitfruit.review_like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeService {

	@Autowired
	private ReviewLikeMapper mapper;
	
	public void insertReviewLike(ReviewLike rl) {
		mapper.insertReviewLike(rl);
	}
	
	public void deleteReviewLike(int review_like_num) {
		mapper.deleteReviewLike(review_like_num);
	}
	
}
