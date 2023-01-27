package com.project.fruitfruit.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	
@Autowired
private MemberService service;

@GetMapping(value = "/member/joinForm")
public String joinForm(HttpServletRequest req) {
	HttpSession session = req.getSession(false);
	String id = (String) session.getAttribute("user_id");
	if (id != null) {
		return "redirect:/index";
	} else {
		return req.getRequestURI();
	}
}

@GetMapping(value = "/member/loginForm") //로그인 페이지로 가기
public String loginForm(HttpServletRequest req) {
//	model.addAttribute("r", "로그인");

//	sessionChk(req);
	HttpSession session = req.getSession(false);
	if (session != null) {
		if (session.getAttribute("user_id") != null) {
			return "redirect:/index";
		} else {
			return req.getRequestURI();
//			return "/member/loginForm";
		}

	} else {
		return req.getRequestURI();
//		return "/member/loginForm";
	}
}

@RequestMapping(value = "/member/idCheck")
public ModelAndView idCheck(HttpServletRequest req, //아이디 중복확인
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
@PostMapping(value = "/member/joinForm")
public String join(Member m) {
	System.out.println(m);

	service.insert(m);
	return "redirect:/member/loginForm";
}
@PostMapping(value = "/member/login")
//@ResponseBody
public ModelAndView login(HttpServletRequest req, String user_id, String user_pwd) {
//	@RequestParam(value="refer", required=false) 
	ModelAndView mav = new ModelAndView();

	Member m = service.select(user_id);
	System.out.println("login() : " + m + "\n");

	if (m != null && m.getUser_pwd().equals(user_pwd)) {
		HttpSession session = req.getSession();
		session.setAttribute("user_id", m.getUser_id());
		session.setAttribute("user_type", m.getUser_type());

		String destination = "/index";
		System.out.println("로그인 확인" + m.getUser_id());
		mav.setViewName("redirect:" + destination);

	} else if (req.getSession(false) != null) {
		if (req.getSession(false).getAttribute("user_id") != null) {
			mav.setViewName("redirect:/index");
		} else {
			mav.setViewName("redirect:/member/loginForm");
		}
	}
	return mav;
}

@PostMapping(value = "/member/loginChk")
@ResponseBody
public JSONObject loginChk(@RequestParam String id, @RequestParam String pwd) {
	JSONObject jo = new JSONObject();
	Member m = service.select(id);
	if (m == null || !m.getUser_pwd().equals(pwd)) {
		jo.put("res", "fail");
	} else {
		jo.put("res", "ok");
	}
	return jo;
}

@GetMapping(value = "/index")
public void index() {}

}
