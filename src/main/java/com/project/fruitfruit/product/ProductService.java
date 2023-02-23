package com.project.fruitfruit.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.fruitfruit.util.Page;

@Service
public class ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\product\\";
	
	public Product selectProduct(int product_num) {
		System.out.println(product_num);
		Product p = mapper.selectProduct(product_num);
		System.out.println(p);
		p = setProductPath(p);
//		p = setProductInnerPath(p);
		return p;
	}
	
//	public ArrayList<Product> selectAllProduct() {
//		return mapper.selectAllProduct();
//	}
	
	public void insertProduct(Product p) {
		mapper.insertProduct(p);
	}
	
	public void updateProduct(Product p) {
		mapper.updateProduct(p);
	}
	
	public void deleteProduct(int product_num) {
		mapper.deleteProduct(product_num);
	}
	
	public void updateProductPickTrue(int product_num) {
		mapper.updateProductPickTrue(product_num);
	}
	
	public void updateProductPickFalse(int product_num) {
		mapper.updateProductPickFalse(product_num);
	}
	
	public void updateProductViewTypeBlind(int product_num) {
		mapper.updateProductViewTypeBlind(product_num);
	}
	
	public void updateProductViewTypeUnblind(int product_num) {
		mapper.updateProductViewTypeUnblind(product_num);
	}
	
	public void addProductHit(int product_num) {
		mapper.addProductHit(product_num);
	}
	
	public void updateProdutQuantity(Product p) {
		mapper.updateProduct(p);
	}
	
	private ArrayList<Product> setProductData(ArrayList<Product> list) {
		for (int i = 0; i < list.size(); i++) {
			Product p = list.get(i);
			p = setProductPath(p);
			list.set(i, p);
		}
		return list;
	}
	
	public ArrayList<Product> orderByProductHitDesc(int start, int end) {
		return setProductData(mapper.orderByProductHitDesc(start, end));
	}
	
	public ArrayList<Product> orderByProductPriceDesc(int start, int end) {
		return setProductData(mapper.orderByProductPriceDesc(start, end));
	}
	
	public ArrayList<Product> orderByProductPriceAsc(int start, int end) {
		return setProductData(mapper.orderByProductPriceAsc(start, end));
	}
	
	public ArrayList<Product> orderByProductDate(int start, int end) {
		return setProductData(mapper.orderByProductDate(start, end));
	}
	
	public ArrayList<Product> onlyProductPick(int start, int end) {
		return setProductData(mapper.onlyProductPick(start, end));
	}
	
	public ArrayList<Product> onlyProductViewTypeBlind(int start, int end) {
		return setProductData(mapper.onlyProductViewTypeBlind(start, end));
	}
	
	public ArrayList<Product> selectProductListByLimit(int start, int end){
		return setProductData(mapper.selectProductListByLimit(start, end));
	}
	
	public ArrayList<Product> selectProductBySellerId(int start, int end, String seller_id){
		return setProductData(mapper.selectProductBySellerId(start, end, seller_id));
	}
	
	public int selectSeqProductCurrval() {
		return mapper.selectSeqProductCurrval();
	}
	
	
	private String getFile(int product_num) {
		File dir = new File(projectPath + webPath + product_num);
		try {
			String file = dir.list()[0];
			if (file != null) {
				file = webPath.replace("\\", "/") + product_num + "/" + file;
			} else {
				file = "";
			}
			return file;
		} catch (Exception e) {
			return "";
		}
		
	}
//	private Product setProductPath(Product p) {
////		String file = getFile(p.getProduct_num());
//		p.setProduct_path(("C:\\Users\\home\\git\\fruitfruit\\src\\main\\webapp\\static\\product\\1\\펭권.jpg"));
////		p.setProduct_path((projectPath + webPath + "1/펭권.jpg").replace("\\", "/"));
//		return p;
//	}
	private Product setProductPath(Product p) {
		String file = getFile(p.getProduct_num());
		if (!file.equals("")) {
			p.setProduct_path(file);
		} else {
			p.setProduct_path("https://dummyimage.com/286x150/fff/000.png&text=No+Image");
		}
		return p;
	}
	
	private String[] getInnerFileList(int product_num) {
		File dir = new File(projectPath + webPath + product_num + "_inner");
		String[] files = dir.list();
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				files[i] = webPath.replace("\\", "/") + product_num + "_inner" + "/" + files[i];
			}
		} else {
			files = new String[1];
			files[0] = "";
		}
		return files;
	}

	private Product setProductInnerPath(Product p) {
		String[] files = getInnerFileList(p.getProduct_num());
		if (files.length >= 1 && !files[0].equals("")) {
			p.setProduct_inner_path1(files[0]);
			if (files.length >= 2) {
				p.setProduct_inner_path2(files[1]);
				if (files.length >= 3) {
					p.setProduct_inner_path3(files[2]);
				}
			}
		} else {
			p.setProduct_inner_path1("https://dummyimage.com/286x150/fff/000.png&text=No+Image");
		}
		return p;
	}

	public int getProductListSize() {
		return mapper.selectListSize();
	}


	public ArrayList<Product> selectProductListByCategory1_num(int c1) {
		return setProductData(mapper.selectProductListByCategory1_num(c1));
	}

	public ArrayList<Product> selectProductListByCategory2_num(int c2) {
		return setProductData(mapper.selectProductListByCategory2_num(c2));
	}

	public ArrayList<Product> selectProductListByTitleOrUserId(String keyword){
		return setProductData(mapper.selectProductListByTitleOrUserId(keyword));
	}
	
}