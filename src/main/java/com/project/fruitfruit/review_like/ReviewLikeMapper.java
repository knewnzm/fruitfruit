package com.project.fruitfruit.review_like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewLikeMapper {
	
	public void insertReviewLike(ReviewLike rl);
	public void deleteReviewLike(int review_like_num);
	
}
