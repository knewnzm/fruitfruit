package com.project.fruitfruit.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	
@Autowired
private MemberService service;

@GetMapping(value="/member/joinForm")
public void joinForm() { //회원가입페이지 가기
	
}
@PostMapping(value="/member/joinForm")
public String join(Member m) { //회원가입하기
	service.insert(m);
	return "redirect:/member/loginForm";
}
@GetMapping(value="/member/loginForm")
public void loginForm() { //로그인 페이지 가기
	
}

@RequestMapping(value = "/member/idCheck")
public ModelAndView idCheck(HttpServletRequest req, 
		@RequestParam(value = "user_id") String user_id) {
	ModelAndView mav = new ModelAndView("member/idCheck");
	String result = "";
	Member m = service.select(user_id);
	if (user_id!=""&&m == null) {
		result = "사용 가능한 이메일입니다";
	} else if(user_id==""){
		result = "이메일을 입력해주세요";
	} else {
		result = "중복된 이메일이 존재합니다";
	}
	mav.addObject("result", result);
	return mav;
}
@GetMapping(value="/member/NewFile")
public void go() { //로그인 페이지 가기
	
}
@GetMapping(value="/member/editForm")
public void editForm() { //회원정보 수정 페이지 가기
	
}
}
