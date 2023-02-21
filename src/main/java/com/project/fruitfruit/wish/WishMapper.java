package com.project.fruitfruit.wish;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface WishMapper {

	public ArrayList<Wish> selectAllWish();
	public ArrayList<Wish> selectWishByUserId(String wish_user_id);
	public ArrayList<Wish> selectWishByProductNum(int wish_product_num);
	public Wish selectWishByUserIdAndProductNum(int wish_product_num, String wish_user_id);
	public void insertWish(Wish w);
	public void deleteWish(int wish_num);
	public void deleteAllWish();
	public void deleteWishByProductNum(int product_num, String user_id);

	public int selectSeqWishCurrval();
	public void deleteAllWishByUserId(String user_id);
	public Wish selectWishByUserIdAndProductNum(Wish w);
}
