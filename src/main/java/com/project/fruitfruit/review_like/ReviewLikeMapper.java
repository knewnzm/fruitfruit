package com.project.fruitfruit.review_like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewLikeMapper {
	
<<<<<<< HEAD
//	public int countReviewLikeByUserId(String review_like_user_id);
	public void insertReviewLike(ReviewLike rl);
	public void deleteReviewLike(int review_like_num);
	public int selectSeqReviewLikeCurrval();
	public ReviewLike selectReviewLikeByUserIdAndReviewNum(ReviewLike rl);
=======
	public void insertReviewLike(ReviewLike rl);
	public void deleteReviewLike(int review_like_num);
>>>>>>> refs/remotes/daegyu/daegyu
	
}
