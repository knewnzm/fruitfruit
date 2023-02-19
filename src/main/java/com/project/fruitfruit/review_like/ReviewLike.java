package com.project.fruitfruit.review_like;

public class ReviewLike {

	private int review_like_num;
	private String review_like_user_id;
	private int review_like_review_num;
	
	public ReviewLike() {
		super();
	}

	public ReviewLike(int review_like_num, String review_like_user_id, int review_like_review_num) {
		super();
		this.review_like_num = review_like_num;
		this.review_like_user_id = review_like_user_id;
		this.review_like_review_num = review_like_review_num;
	}

	public int getReview_like_num() {
		return review_like_num;
	}

	public void setReview_like_num(int review_like_num) {
		this.review_like_num = review_like_num;
	}

	public String getReview_like_user_id() {
		return review_like_user_id;
	}

	public void setReview_like_user_id(String review_like_user_id) {
		this.review_like_user_id = review_like_user_id;
	}

	public int getReview_like_review_num() {
		return review_like_review_num;
	}

	public void setReview_like_review_num(int review_like_review_num) {
		this.review_like_review_num = review_like_review_num;
	}

	@Override
	public String toString() {
		return "ReviewLike [review_like_num=" + review_like_num + ", review_like_user_id=" + review_like_user_id
				+ ", review_like_review_num=" + review_like_review_num + "]";
	}

}
