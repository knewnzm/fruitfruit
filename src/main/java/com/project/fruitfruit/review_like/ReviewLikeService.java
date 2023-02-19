package com.project.fruitfruit.review_like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeService {

	@Autowired
	private ReviewLikeMapper mapper;
	
//	public int countReviewLikeByUserId(String review_like_user_id) {
//		return mapper.countReviewLikeByUserId(review_like_user_id);
//	}
	
	public void insertReviewLike(ReviewLike rl) {
		mapper.insertReviewLike(rl);
	}
	
	public void deleteReviewLike(int review_like_num) {
		mapper.deleteReviewLike(review_like_num);
	}
	
	public int selectSeqReviewLikeCurrval() {
		return mapper.selectSeqReviewLikeCurrval();
	}


	public ReviewLike selectReviewLikeByUserIdAndReviewNum(ReviewLike rl) {
		// TODO Auto-generated method stub
		return mapper.selectReviewLikeByUserIdAndReviewNum(rl);
	}
	
}
