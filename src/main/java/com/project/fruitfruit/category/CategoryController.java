package com.project.fruitfruit.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService cService;
	@GetMapping("/category/category")
	public void categoryView(Model model) {
		model.addAttribute("c1List", cService.getCategoryList(1, 0));
	}

//	카테고리 추가
	@PostMapping(value = "/category/add")
	@ResponseBody
	public String addCategory(String cate_name, int cate_type, @RequestParam(required = false, defaultValue = "0") int cate_parent_num) {
		Category c = null;
		switch (cate_type) {
		case 1:
			c = new Category(0, cate_name); //cate_parent_num이 없는 객체로 생성
			break;
		case 2:
			c = new Category(0, cate_name, cate_parent_num); //cate_parent_num이 있는 객체로 생성
			break;
		}
		cService.addCategory(cate_type, c);
		String gson = getCategory(cate_type,c.getCate_parent_num()); //타입에 해당하는 카테고리 리스트 저장
		return gson;
	}


//	카테고리 리스트 생성
	@GetMapping(value = "/category/getCategory")
	@ResponseBody //반환타입이 View에서 HTTP응답 본문이 됨
	public String getCategory(int cate_type, @RequestParam(required = false, defaultValue = "0") int cate_parent_num) { 
		// required = false : 파라미터가 HTTP 요청에 포함되지 않아도 컨트롤러 메소드가 실행
		//defaultValue : HTTP 요청에서 cate_parent_num 파라미터를 받지 못했을 경우, 기본값으로 사용할 값을 설정
		ArrayList<Category> cate_list = new ArrayList<>();
		cate_list = (ArrayList<Category>) cService.getCategoryList(cate_type, cate_parent_num); //대분류 전체리스트 불러오기
		Gson g = new Gson();
		String gson = g.toJson(cate_list); //List를 Json객체배열 문자열로 변환
		return gson;
		
	}


//	카테고리 삭제
	@GetMapping(value = "/category/delete")
	@ResponseBody
	public String deleteCategory(int cate_type, int cate_num) {
		Category c = cService.getCategory(cate_type, cate_num);
		cService.deleteCategory(cate_type, cate_num);
		return getCategory(cate_type,c.getCate_parent_num());
	}
}
