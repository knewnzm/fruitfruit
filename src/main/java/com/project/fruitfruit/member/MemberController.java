package com.project.fruitfruit.member;



import java.util.List;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	private String emailRegEx = //이메일 정규식
	        "^[a-zA-Z0-9_+&*-]+(?:\\." +
	        "[a-zA-Z0-9_+&*-]+)*@" +
	        "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
	        "A-Z]{2,7}$";
	
@Autowired
private MemberService service;
@Autowired
private HttpSession session; 

@GetMapping(value = "/member/joinForm")//회원가입 페이지 가기
public String joinForm() {
	String path = "/member/joinForm";
	String id = (String) session.getAttribute("user_id");
	if (id != null) { //세션에 이미 아이디가 있으면
		path = "redirect:/";
	}
	return path;
}

@SuppressWarnings("unchecked")
@GetMapping(value = "/member/idCheck")
@ResponseBody
public JSONObject idCheck(String user_id) {
	JSONObject jsonObject = new JSONObject();
	String result = "";
	Member m = service.select(user_id); //해당하는 아이디로 등록된 회원이 있는지 조회
	if (m != null) { //회원이 이미 존재
		result = "중복된 이메일이 존재합니다";
	} else if(user_id==""){
		result = "이메일을 입력해주세요";
	} else if (!user_id.matches(emailRegEx)) {
        result = "올바른 이메일 형식이 아닙니다";
    } else {
		result = "사용 가능한 이메일입니다";
	}
	
	jsonObject.put("result", result);
	return jsonObject;
}

@PostMapping(value = "/member/joinForm")//회원가입 하기
public String join(Member m) {
	service.insert(m);
	return "redirect:/member/loginForm";
}

@GetMapping(value = "/member/loginForm") //로그인 페이지로 가기
public String loginForm() {
	String path = "/member/loginForm";
		if (session.getAttribute("user_id") != null) {
			path = "redirect:/";
		}
		return path;
}

@SuppressWarnings("unchecked")
@PostMapping(value = "/member/loginChk") //로그인 계정 확인
@ResponseBody
public JSONObject loginChk(String user_id, String user_pwd) {
	JSONObject jsonObject = new JSONObject();
	Member m = service.select(user_id);
	if(user_id.equals("") || user_pwd.equals("")){
		jsonObject.put("res", "empty");
	}else if (m == null || !m.getUser_pwd().equals(user_pwd)) {
		jsonObject.put("res", "fail");
	}
	return jsonObject;
}

@PostMapping(value = "/member/login") //로그인 하기
public String login(String user_id, String user_pwd) {
	String path = "redirect:/";				
	Member m = service.select(user_id);
	System.out.println("회원로그인 : " + m );
		if(session != null) {
			session.setAttribute("user_id", m.getUser_id());
			session.setAttribute("user_type", m.getUser_type());
			System.out.println("로그인 확인" + session.getAttribute("user_id"));
		}
		return path;
}

@GetMapping(value = "/member/logout") //로그아웃하기
public String logout() {
	String id = (String) session.getAttribute("user_id");
	System.out.println(id + " 로그아웃");
	session.removeAttribute("user_id");
	session.invalidate();
	return "redirect:/";
}

@GetMapping(value = "/member/editForm") //회원정보 수정 페이지 가기
public String editForm(Model model) {
	String path = "/member/editForm";
	if(session !=null) {
		if (session.getAttribute("user_id") != null) {
			String user_id = (String) session.getAttribute("user_id");
			Member m = service.select(user_id);
			model.addAttribute("m", m);
		} else {
			path = "redirect:/member/loginForm";
	}
	}
	return path;
}
@PostMapping(value = "/member/edit") //회원정보 수정하기
public String edit(Member m) {
	service.update(m);
	return "redirect:/";
}

@GetMapping(value = "/member/out") //회원탈퇴&회원삭제
public String out(@RequestParam(required = false) String user_id) {
	System.out.println(user_id + " 아이디 확인");
	String sessionId = (String) session.getAttribute("user_id"); 
	if (user_id == null) { //직접 아이디를 받지 않은 경우는 회원탈퇴
		System.out.println(sessionId + " 회원 탈퇴");
		service.delete(sessionId);
		session.removeAttribute("user_id");
		session.invalidate();

	} else { //아이디를 받았다면 않았다면 회원삭제
		System.out.println(user_id + " 관리자 권한으로 회원 탈퇴");
		service.delete(user_id);
	}

	return "redirect:/member/loginForm";
}

/* 회원목록 페이지로 가기 */
@GetMapping(value="/member/userList")
public void userList() {
}

/* 회원목록 불러오기*/
@SuppressWarnings("unchecked")
@GetMapping(value = "/member/list")
@ResponseBody
public JSONArray list() {
	JSONArray jsonArray = new JSONArray();
	List<Member> members = service.list();
	for (Member member : members) {
		jsonArray.add(member);
	}
	System.out.println(jsonArray);
	return jsonArray;
}

@GetMapping(value = "/member/findId")   //아이디 찾기 가기
public String findId() {
	String path = "/member/findId";
	String id = (String) session.getAttribute("user_id");
	if (id != null) {
		path =  "redirect:/";
	}
	return path;
}
	@PostMapping(value = "/member/findId") //아이디 찾기
	public String findId(Model model, String user_name, int user_tel) {
		String path = "/member/findIdResult";
		Member m = service.selectbyname(user_name);
		if (m!=null) {
			if(m.getUser_tel() == user_tel) {
				model.addAttribute("user_id", m.getUser_id());
			}			
		} else {
			model.addAttribute("fail", "fail");
			path ="/member/findId";
		}
		return path;
	
}
	@GetMapping(value = "/member/findPwd")   //비밀번호 찾기 가기
	public String findPwd() {
		String path = "/member/findPwd";
		String id = (String) session.getAttribute("user_id");
		if (id != null) {
			path =  "redirect:/";
		} else {
			path = "/member/findPwd";
		}
		return path;
	}
	
	@PostMapping(value = "/member/findPwd") //비밀번호 재설정
	public String findPwd(Model model, String user_id, String user_name, int user_tel) {
		String path = "/member/changePwd";
		Member m = service.select(user_id);
		if (m != null) {
			if(m.getUser_name().equals(user_name) && m.getUser_tel() == user_tel){
				model.addAttribute("user_id", user_id);
			}
		}else {
			model.addAttribute("fail", "fail");
			 path = "/member/findPwd";
		}
		return path;
	}
	
	@PostMapping(value = "/member/changePwd") //비밀번호 변경하기
	public String changePwd(Member m) {
		service.changePwd(m);
		return "redirect:/member/loginForm";
	}
	
	@GetMapping(value = "/member/social")
	public void socialPage() {
		
	}
}
