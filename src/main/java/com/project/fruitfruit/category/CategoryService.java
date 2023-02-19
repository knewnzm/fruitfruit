package com.project.fruitfruit.category;

<<<<<<< HEAD
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryMapper mapper;

	public void addCategory(int type, Category c) {
		switch (type) {
		case 1:
			mapper.insertCategory1(c);
			break;
		case 2:
			mapper.insertCategory2(c);
			break;
		}
	}

	public Category getCategory(int type, int cate_num) {
		Category c = null;
		switch (type) {
		case 1:
			c = mapper.selectCategory1(cate_num);
			break;
		case 2:
			c = mapper.selectCategory2(cate_num);
			break;
		}
		return c;
	}

	public ArrayList<Category> getCategoryList(int type, int cate_parent_num) {
		ArrayList<Category> list = null;
		switch (type) {
		case 1:
			list = mapper.selectAllCategory1();
			break;
		case 2:
			list = mapper.selectAllCategory2(cate_parent_num);
			break;
		}
		return list;
	}

	public ArrayList<Category> Category2List(){
		return mapper.Category2All();
		
	}
	
	public void deleteCategory(int type, int num) {
		switch (type) {
		case 1:
			mapper.deleteCategory1(num);
			break;
		case 2:
			mapper.deleteCategory2(num);
			break;
		}
	}

	public int getNum(int type) {
		int cate_num = 0;
		switch (type) {
		case 1:
			cate_num = mapper.getNum1();
			break;
		case 2:
			cate_num = mapper.getNum2();
			break;
		}
		return cate_num;
	}
=======
public class CategoryService {

>>>>>>> refs/remotes/daegyu/daegyu
}
