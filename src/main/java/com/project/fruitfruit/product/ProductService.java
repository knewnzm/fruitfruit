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
		return mapper.selectProduct(product_num);
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
	
	public ArrayList<Product> orderByProductHitDesc(int start, int end) {
		return mapper.orderByProductHitDesc(start, end);
	}
	
	public ArrayList<Product> orderByProductPriceDesc(int start, int end) {
		return mapper.orderByProductPriceDesc(start, end);
	}
	
	public ArrayList<Product> orderByProductPriceAsc(int start, int end) {
		return mapper.orderByProductPriceAsc(start, end);
	}
	
	public ArrayList<Product> orderByProductDate(int start, int end) {
		return mapper.orderByProductDate(start, end);
	}
	
	public ArrayList<Product> onlyProductPick(int start, int end) {
		return mapper.onlyProductPick(start, end);
	}
	
	public ArrayList<Product> onlyProductViewTypeBlind(int start, int end) {
		return mapper.onlyProductViewTypeBlind(start, end);
	}
	
//	public ArrayList<Product> selectProductListByLimit(int start, int end){
//		return mapper.selectProductListByLimit(start, end);
//	}

	public int selectSeqProductCurrval() {
		return mapper.selectSeqProductCurrval();
	}
	
	public ArrayList<Product> selectProductBySellerId(int start, int end){
		return mapper.selectProductBySellerId(start, end);
	}
	
	
	private String getFile(int product_num) {
		File dir = new File(projectPath + webPath + product_num);
		String file = dir.toString();
		if (file != null) {
			file = webPath.replace("\\", "/") + product_num + "/" + file;
		} else {
			file = "";
		}
		return file;
	}
	
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
	
}
