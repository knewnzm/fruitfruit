package com.project.fruitfruit.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
//	public ArrayList<Review> selectReviewByWriter(String writer_id) {
//		return mapper.selectReviewByWriter(writer_id);
//	}
	
	public void insertReview(Review r) {
		mapper.insertReview(r);
	}
	
	public void updateReview(Review r) {
		mapper.updateReview(r);
	}
	
	public void deleteReview(int review_num) {
		mapper.deleteReview(review_num);
	}
	
	public void increaseReviewLikeHit(int review_num) {
		mapper.increaseReviewLikeHit(review_num);
	}
	
	public void decreaseReviewLikeHit(int review_num) {
		mapper.decreaseReviewLikeHit(review_num);
	}
	
	public int countReviewLike(int review_num) {
		return mapper.countReviewLike(review_num);
	}
	
	public ArrayList<Review> orderReviewByReviewLike() {
		return mapper.orderReviewByReviewLike();
	}
	
	public ArrayList<Review> orderReviewByReviewScore() {
		return mapper.orderReviewByReviewScore();
	}
	
	public ArrayList<Review> orderReviewByReviewDate() {
		return mapper.orderReviewByReviewDate();
	}

	public ArrayList<Review> selectAllReview() {
		return mapper.selectAllReview();
	}

	public List<Review> selectReviewAllByProductNum(int product_num) {
		return mapper.selectReviewAllByProductNum(product_num);
	}

}
