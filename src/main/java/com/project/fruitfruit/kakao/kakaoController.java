package com.project.fruitfruit.kakao;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.kakao.kakaoService;
import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.member.MemberService;



@Controller
public class kakaoController {
	
	@Autowired
	private kakaoService kakaoService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/kakao_callback", method=RequestMethod.GET)
	public String kakaoLogin(HttpServletRequest req, Model model, @RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		
		String access_Token = kakaoService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		
		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		

		String nickname = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("email", email);
		
//		if (userInfo.get("nickname") != null && !userInfo.get("nickname").equals("")) {
//		    String nickname = (String) userInfo.get("nickname");
//		    model.addAttribute("nickname", nickname);
//		}
//
//		if (userInfo.get("email") != null && !userInfo.get("email").equals("")) {
//		    String email = (String) userInfo.get("email");
//		    model.addAttribute("email", email);
//		}

		Member m =  memberService.select(email);
		
		
		if (m != null) {	//가입되어 있었을 경우
				HttpSession session = req.getSession();
				session.setAttribute("user_id", m.getUser_id());
				session.setAttribute("user_type", m.getUser_type());
				
				return "redirect:/ ";
		}

		return "/member/social";
	}
	


}