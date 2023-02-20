package com.project.fruitfruit.review;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fruitfruit.product.Product;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\review\\";
	
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

	private List<Review> setReviewData(List<Review> list) {
		for (int i = 0; i < list.size(); i++) {
			Review r = list.get(i);
			r = setReviewPath(r);
			list.set(i, r);
		}
		return list;
	}
	
	private Review setReviewPath(Review r) {
		String file = getFile(r.getReview_num());
		if (!file.equals("")) {
			r.setReview_path(file);
		} else {
			r.setReview_path("https://dummyimage.com/286x150/fff/000.png&text=No+Image");
		}
		return r;
	}
	
	private String getFile(int review_num) {
		File dir = new File(projectPath + webPath + review_num);
		String file = dir.list()[0];
		if (file != null) {
			file = webPath.replace("\\", "/") + review_num + "/" + file;
		} else {
			file = "";
		}
		return file;
	}
	
	public List<Review> selectReviewAllByProductNum(int product_num) {
		return setReviewData(mapper.selectReviewAllByProductNum(product_num));
	}
	
	public int selectSeqReviewCurrval() {
		return mapper.selectSeqReviewCurrval();
	}

    public Review selectReview(int review_num) {
        return mapper.selectReview(review_num);
    }

}
