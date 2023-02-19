package com.project.fruitfruit.category;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	// 카테고리 추가
	void insertCategory1(Category c);

	void insertCategory2(Category c);

	// 카테고리 선택
	Category selectCategory1(int cate_num);

	Category selectCategory2(int cate_num);

	// 카테고리 전체 선택
	ArrayList<Category> selectAllCategory1();

	ArrayList<Category> selectAllCategory2(int cate_parent_num);
	
	ArrayList<Category> Category2All();

	// 카테고리 삭제
	void deleteCategory1(int cate_num);

	void deleteCategory2(int cate_num);

	int getNum1();

	int getNum2();
}
