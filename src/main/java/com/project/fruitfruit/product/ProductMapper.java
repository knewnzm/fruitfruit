package com.project.fruitfruit.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

	public Product selectProduct(int product_num);
//	public ArrayList<Product> selectAllProduct();
	public void insertProduct(Product p);
	public void updateProduct(Product p);
	public void deleteProduct(int product_num);
	
	public void updateProductPickTrue(int product_num);
	public void updateProductPickFalse(int product_num);
	public void updateProductViewTypeBlind(int product_num);
	public void updateProductViewTypeUnblind(int product_num);
	public void addProductHit(int product_num);
	public void updateProductQuantity(Product p);
	
	public ArrayList<Product> orderByProductHitDesc(int start, int end);
	public ArrayList<Product> orderByProductPriceDesc(int start, int end);
	public ArrayList<Product> orderByProductPriceAsc(int start, int end);
	public ArrayList<Product> orderByProductDate(int start, int end);
	public ArrayList<Product> onlyProductPick(int start, int end);
	public ArrayList<Product> onlyProductViewTypeBlind(int start, int end);
	public ArrayList<Product> selectProductBySellerId(int start, int end, String product_seller_id);
	
	
	public ArrayList<Product> selectProductListByLimit(int start, int end);
	
	public int selectSeqProductCurrval();
	
	public int selectListSize();
	
	public ArrayList<Product> selectProductListByProduct_title(String title);
	public ArrayList<Product> selectProductListByCategory1_num(int c1);
	public ArrayList<Product> selectProductListByCategory2_num(int c2);
	public ArrayList<Product> selectProductListByCategory3_num(int c3);
	public ArrayList<Product> selectProductListByUser_id(String seller_id);
	
	public ArrayList<Product> selectProductListByTitleOrUserId(String keyword);
	

	
}
