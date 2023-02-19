package com.project.fruitfruit.review;

import java.sql.Date;

<<<<<<< HEAD
import org.springframework.web.multipart.MultipartFile;

public class Review {

	private int review_num;
	private String review_title;
	private String review_content;
	private String review_writer;
	private Date review_date;
	private int review_product_num;
	private int review_like_hit;
	
	private String review_path;
	private MultipartFile file;
	
	public Review() {
		super();
	}
	
	

	public Review(int review_num, String review_title, String review_content, String review_writer, Date review_date,
			int review_product_num, int review_like_hit, String review_path, MultipartFile file) {
		super();
		this.review_num = review_num;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_writer = review_writer;
		this.review_date = review_date;
		this.review_product_num = review_product_num;
		this.review_like_hit = review_like_hit;
		this.review_path = review_path;
		this.file = file;
	}



	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_product_num() {
		return review_product_num;
	}

	public void setReview_product_num(int review_product_num) {
		this.review_product_num = review_product_num;
	}

	public int getReview_like_hit() {
		return review_like_hit;
	}

	public void setReview_like_hit(int review_like_hit) {
		this.review_like_hit = review_like_hit;
	}
	
	public String getReview_path() {
		return review_path;
	}

	public void setReview_path(String review_path) {
		this.review_path = review_path;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Review [review_num=" + review_num + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_writer=" + review_writer + ", review_date=" + review_date
				+ ", review_product_num=" + review_product_num + ", review_like_hit=" + review_like_hit
				+ ", review_path=" + review_path + ", file=" + file + "]";
=======
public class Review {

	private int review_num;
	private String review_title;
	private String review_content;
	private String review_path;
	private String review_writer;
	private Date review_date;
	private int review_product_num;
	private int review_score;
	private int review_like;
	private int review_like_hit;
	
	public Review() {
		super();
	}
	
	public Review(int review_num, String review_title, String review_content, String review_path, String review_writer,
			Date review_date, int review_product_num, int review_score, int review_like, int review_like_hit) {
		super();
		this.review_num = review_num;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_path = review_path;
		this.review_writer = review_writer;
		this.review_date = review_date;
		this.review_product_num = review_product_num;
		this.review_score = review_score;
		this.review_like = review_like;
		this.review_like_hit = review_like_hit;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_path() {
		return review_path;
	}

	public void setReview_path(String review_path) {
		this.review_path = review_path;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_product_num() {
		return review_product_num;
	}

	public void setReview_product_num(int review_product_num) {
		this.review_product_num = review_product_num;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	public int getReview_like_hit() {
		return review_like_hit;
	}

	public void setReview_like_hit(int review_like_hit) {
		this.review_like_hit = review_like_hit;
	}

	@Override
	public String toString() {
		return "Review [review_num=" + review_num + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_path=" + review_path + ", review_writer=" + review_writer
				+ ", review_date=" + review_date + ", review_product_num=" + review_product_num + ", review_score="
				+ review_score + ", review_like=" + review_like + ", review_like_hit=" + review_like_hit + "]";
>>>>>>> refs/remotes/daegyu/daegyu
	}

}
