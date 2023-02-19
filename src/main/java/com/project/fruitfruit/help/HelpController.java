package com.project.fruitfruit.help;

<<<<<<< HEAD
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.answer.Answer;
import com.project.fruitfruit.answer.AnswerService;
import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.member.MemberService;

@Controller
public class HelpController {
	private String projectPath = new File("").getAbsolutePath().toString()+"\\src\\main\\webapp";
	private String webPath ="\\static\\help\\";
	
	@Autowired 
	private HelpService hService;
	
	@Autowired
	private AnswerService aService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HttpSession session;
	
	/* helpForm 이동 */
	@GetMapping(value ="/help/helpForm")
	public void helpForm() {
	}
	
	/* helpForm 작성 */
	@PostMapping(value ="/help/helpForm")
	public String insert(Help h) {
			 String path = "redirect:/member/loginForm";
			 String user_id = (String) session.getAttribute("user_id");
			 
			 if(user_id != null) {
					Member m = mService.select(user_id);
					if(m.getUser_type() ==1 || m.getUser_type() ==2) {
						hService.addHelp(h);
						int help_num = hService.getHelpSeqCurrval();
						uploadFile(h.getFile1(), help_num,1);
						path ="redirect:/help/helpList";
					}
			}
			return path;
	}

	/* 프로젝트에 파일 업로드 하기 */
	private void uploadFile(MultipartFile file, int help_num, int img_num) {
					 File hpfile = new File(projectPath + webPath + help_num);	
					 System.out.println(projectPath);
					 System.out.println(webPath);
		
					 if(!hpfile.exists()) {
						 hpfile.mkdir();
					 }
					 if(!file.isEmpty()) {
						 String uploadPath = webPath + help_num + "\\"+img_num+ "_"+file.getOriginalFilename();
						 File f = new File(projectPath + uploadPath);
						 try {
							  file.transferTo(f);
						 }catch(Exception e) {
							    e.printStackTrace();
						 }
					 }
	}
	
	/*1:1 문의 상세페이지*/
	@RequestMapping(value = "/help/helpDetail")
	public ModelAndView content(@RequestParam(value = "help_num") int help_num) {
			 ModelAndView mav = new ModelAndView("/help/helpDetail");
			 Help h = hService.getHelp(help_num);
			 mav.addObject("h",h);
			 Answer a = aService.selectAnswer(help_num);
			 if(a!=null) {
			 String id = a.getUser_id();
			 Member m = mService.select(id);
			 mav.addObject("a",a);
			 mav.addObject("m",m);
			 }
			 return mav;
	}
	
	/* 1:1 문의 전체 출력 */
	@RequestMapping(value="/help/helpList")
	public ModelAndView list() {
		 	 ModelAndView mav = new ModelAndView("/help/helpList");
		 
		 	 ArrayList<Help> list = (ArrayList<Help>)hService.selectAllHelp();
		 	 for (Help h : list) {
		 		 if(list != null) {
		 				 if (aService.selectAnswer(h.getHelp_num()) == null) { 
		 					 h.setAnswer_status(0);
		 				 } else {
		 					 h.setAnswer_status(1);
		 			 }
		 		 }
		 }
		 Collections.reverse(list);
		 mav.addObject("list",list);
		 return mav;
	}

	/* 1:1 문의 수정페이지 이동 */
	@RequestMapping(value = "/help/helpEdit")
	public ModelAndView ediform(@RequestParam(value = "help_num") int help_num) {
			 ModelAndView mav = new ModelAndView("help/helpEdit");
			 Help h = hService.selectHelpByNum(help_num);
			 System.out.println(h);
			 mav.addObject("h",h);
			 hService.selectHelpByNum(help_num);
			 return mav;
	}
	
	@PostMapping(value = "/help/Edit")
	public String edit(Help h) {
			 System.out.println(h);
			 String path = "redirect:/member/loginForm";
			 String user_id = (String)session.getAttribute("user_id");
			 
			 if(user_id != null) {
				 Member m = mService.select(user_id);
				 if(m.getUser_type() ==1 || m.getUser_type() ==2) {
					 hService.editHelp(h);
					 path = "redirect:/help/helpList";
				 }
			 }
			 return path;
	}
	
	/* 1:1 문의글 삭제 */
	@RequestMapping(value = "/help/helpDelete")
	public String deleteHelp(@RequestParam(value = "help_num") int help_num) {
			 hService.deleteHelp(help_num);
			 return "redirect:/help/helpList";
	}
//	
=======
public class HelpController {

>>>>>>> refs/remotes/daegyu/daegyu
}
