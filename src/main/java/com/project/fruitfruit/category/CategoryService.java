package com.project.fruitfruit.category;

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

	public ArrayList<Category> getCategoryList(int type, int cate_parent_num) { //type:1->대분류 2->소분류, cate_parent_num : 부모의 시퀀스번호
		ArrayList<Category> list = new ArrayList<>();
		switch (type) { //타입의 값에 따라 다른 작업을 수행
		case 1: //대분류인경우
			list = mapper.selectAllCategory1(); //대분류 전체 가져오기
			break;
		case 2:
			list = mapper.selectAllCategory2(cate_parent_num); //부모 시퀀스의 소분류 전체 가져오기
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
}
