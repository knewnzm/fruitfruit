package com.project.fruitfruit.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService cService;
	@RequestMapping("/category/category")
	public void categoryView(Model model) {
		model.addAttribute("c1List", cService.getCategoryList(1, 0));
	}

//	카테고리 추가
	@RequestMapping(value = "/category/add")
	@ResponseBody
	public String addCategory(@RequestParam String cate_name, @RequestParam int cate_type,
			@RequestParam(required = false, defaultValue = "-1") int cate_parent_num) {
		Category c = null;
		if (cate_type == 1) {
			c = new Category(0, cate_name);
		} else if (cate_type == 2) {
			c = new Category(0, cate_name, cate_parent_num);
		}
		cService.addCategory(cate_type, c);
		return getCategory(cate_parent_num, cate_type);
	}

<<<<<<< HEAD
<<<<<<< HEAD
//	화면에 출력
=======
//	카테고리 리스트 생성
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
=======
//	카테고리 리스트 생성
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
	@RequestMapping(value = "/category/getCategory")
	@ResponseBody
	public String getCategory(@RequestParam(required = false, defaultValue = "-1") int cate_parent_num,
			@RequestParam int cate_type) {
		ArrayList<Category> cate_list = null;
		switch (cate_type) {
		case 1:
			cate_list = (ArrayList<Category>) cService.getCategoryList(1, 0);
			break;
		case 2:
			cate_list = (ArrayList<Category>) cService.getCategoryList(2, cate_parent_num);
			break;
		}
		Gson g = new Gson();
		System.out.println(g.toJson(cate_list));
		return g.toJson(cate_list);
		
	}


//	카테고리 삭제
	@RequestMapping(value = "/category/delete")
	@ResponseBody
	public String deleteCategory(@RequestParam int cate_type, @RequestParam int cate_num) {
		Category c = cService.getCategory(cate_type, cate_num);
		cService.deleteCategory(cate_type, cate_num);
		return getCategory(c.getCate_parent_num(), cate_type);
	}
}
