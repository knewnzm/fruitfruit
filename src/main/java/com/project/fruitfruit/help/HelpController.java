package com.project.fruitfruit.help;

import java.io.File;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.answer.Answer;
import com.project.fruitfruit.answer.AnswerService;
import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.member.MemberService;

@Controller
public class HelpController {
	private String projectPath = new File("").getAbsolutePath().toString()+"\\src\\main\\webapp"; //웹자원이 위치하는 경로
	private String webPath ="\\static\\help\\"; //<img> src에 넣을 값
	
	@Autowired 
	private HelpService hService;
	
	@Autowired
	private AnswerService aService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HttpSession session;
	
	/* 문의글 작성페이지 이동 */
	@GetMapping(value ="/help/helpForm")
	public void helpForm() {
	}
	
	/* 문의글 작성 */
	@PostMapping(value ="/help/helpForm")
	public String insert(Help h) { //클라이언트에서 보낸 정보를 Help객체로 받음
		System.out.println(h);
			 String path = "redirect:/member/loginForm"; //세션이 만료되었을때 반환 경로
			 int user_type = (int) session.getAttribute("user_type");
			 
			 if(user_type != 0) { //세션에 있으면
					if(user_type ==1 || user_type ==2) { //구매자 혹은 판매자이면
						hService.addHelp(h); //이미지를 제외한 내용을 db에 저장
						int help_num = hService.getHelpSeqCurrval(); //글번호 = 현재 help의 시퀀스 번호
						uploadFiles(h.getFiles(), help_num); //MultipartFile[] , 글 번호
						path ="redirect:/help/helpList"; //글목록조회로 리다이렉트
					}
			}
			return path;
	}

	/* 프로젝트에 폴더에 파일 업로드 하기 */
	private void uploadFiles(MultipartFile[] files, int help_num) {
	    File fileDir = new File(projectPath + webPath + help_num); //폴더의 메타데이터 객체 생성
	    fileDir.mkdir(); //폴더 새로 만들기
	    int img_num = 1; // 이미지 번호 초기화

	    for (MultipartFile file : files) { 
	        if (!file.isEmpty()) { //클라이언트로부터 이미지를 받았다면
	            String uploadPath = projectPath + webPath + help_num + "\\" + img_num + "_" + file.getOriginalFilename(); //이미지 경로
	            System.out.println(uploadPath);
	            File f = new File(uploadPath); //이미지 파일의 메타데이터 객체 생성
	            try {
	                file.transferTo(f); // file의 내용을 f로 복사 //이 순간 이미지 파일이 실제로 생성됨
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            img_num++; // 다음 이미지 등록을 위해 이미지 번호 증가
	        }
	    }
	}
	
	/*1:1 문의 상세페이지*/
	@GetMapping(value = "/help/helpDetail")
	public String content(Model model, int help_num) {
			 Help h = hService.getHelp(help_num); //이미지는 서비스에서 처리
			 Answer a = aService.selectAnswer(help_num); //글 번호에 해당하는 답글 
			 model.addAttribute("h",h); 
			 if(a != null) {
			 String id = a.getUser_id(); //답글 작성자 아이디 
			 Member m = mService.select(id); //아이디에 해당하는 회원 정보
			 model.addAttribute("a",a);
			 model.addAttribute("m",m);
			 }
			 return "/help/helpDetail";
	}
	
	/* 1:1 문의 전체 출력 */
	@GetMapping(value="/help/helpList")
	public String list(Model model) {
		 	 List<Help> list = hService.selectAllHelp();
		 	 for (Help h : list) { //게시글 리스트의 모든 요소에 답글 여부 확인
		 		 if(list != null) {
		 			Answer answer = aService.selectAnswer(h.getHelp_num()); //글번호에 해당하는 답글
		 				 if ( answer == null) { //글번호에 해당하는 답글이 존재하는지 확인
		 					 h.setAnswer_status(0); //답글 상태를 0으로
		 				 } else { //답글이 존재하면
		 					 h.setAnswer_status(1); //답글 상태를 1로
		 			 }
		 		 }
		 }
		 model.addAttribute("list",list);
		 return "/help/helpList";
	}

	/* 1:1 문의 수정페이지 이동 */
	@GetMapping(value = "/help/helpEdit")
	public String ediform(Model model, int help_num) {
			 Help h = hService.getHelp(help_num); //글번호에 해당하는 이미지 경로까지 같이
			 System.out.println(h);
			 model.addAttribute("h",h);
			 hService.selectHelpByNum(help_num);
			 return "help/helpEdit";
	}
	
	@PostMapping(value = "/help/Edit")
	public String edit(Help h, String flag) {
			 String path = "redirect:/member/loginForm";
			 String user_id = (String)session.getAttribute("user_id");
			 if(user_id != null) {
				 hService.editHelp(h); //이미지를 제외한 나머지만 수정
				 if(flag.equals("true")) { //이미지가 수정되었다면
					 int help_num = h.getHelp_num(); 
					 hService.helpDeletePath(help_num); //글번호에 해당하는 파일,디렉토리를 지우고
					 uploadFiles(h.getFiles(), help_num); //다시 디렉토리,파일 생성
					 path = "redirect:/help/helpList";
				 } 
			 }
			 return path;
	}
	
	/* 1:1 문의글 삭제 */
	@RequestMapping(value = "/help/helpDelete")
	public String deleteHelp(int help_num) {
			 hService.deleteHelp(help_num);
			 return "redirect:/help/helpList";
	}
//	
}
