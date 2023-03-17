package com.project.fruitfruit.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	public ArrayList<Review> selectAllReview();
//	public ArrayList<Review> selectReviewByWriter(String writer_id);
	public void insertReview(Review r);
	public void updateReview(Review r);
	public void deleteReview(int review_num);
	public void increaseReviewLikeHit(int review_num);
	public void decreaseReviewLikeHit(int review_num);
	public int countReviewLike(int review_num);
	public ArrayList<Review> orderReviewByReviewLike();
	public ArrayList<Review> orderReviewByReviewScore();
	public ArrayList<Review> orderReviewByReviewDate();
	public List<Review> selectReviewAllByProductNum(int product_num);
	
	public int selectSeqReviewCurrval();
    public Review selectReview(int review_num);
	
	
}
