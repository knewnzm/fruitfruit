package com.project.fruitfruit.wish;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishService {

	@Autowired
	private WishMapper mapper;
	
	public ArrayList<Wish> selectAllWish() {
		return mapper.selectAllWish();
	}
	
	public ArrayList<Wish> selectWishByUserId(String user_id) {
		return mapper.selectWishByUserId(user_id);
	}
	
	public void insertWish(Wish w) {
		mapper.insertWish(w);
	}
	
	public void deleteWish(int wish_num) {
		mapper.deleteWish(wish_num);
	}

	public Wish selectWishByUserIdAndProductNum(int wish_product_num, String wish_user_id) {
		return mapper.selectWishByUserIdAndProductNum(wish_product_num, wish_user_id);
	}

	public int selectSeqWishCurrval() {
		return mapper.selectSeqWishCurrval();
	}

	public void deleteWishByProductNum(int product_num, String user_id) {
		mapper.deleteWishByProductNum(product_num, user_id);
	}

	public void deleteAllWish(String user_id) {
		mapper.deleteAllWish();
	}

	public ArrayList<Wish> selectWishByProductNum(int product_num) {
		return mapper.selectWishByProductNum(product_num);
	}

	public void deleteAllWishByUserId(String user_id) {
		mapper.deleteAllWishByUserId(user_id);
		
	}

	public Wish selectWishByUserIdAndProductNum(Wish w) {
		return mapper.selectWishByUserIdAndProductNum(w);
	}

	
}
