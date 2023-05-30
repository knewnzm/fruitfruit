package com.project.fruitfruit.notice;

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

import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.member.MemberService;

@Controller
public class NoticeController {
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\notice\\";
	
	@Autowired
	private NoticeService nService;
	@Autowired
	private MemberService mService;
	@Autowired
	private HttpSession session;

	// 공지사항 작성 폼 페이지 가기
	@GetMapping(value = "/notice/noticeForm")
	public void noticeForm() {
	}

	// 공지사항 작성
	@PostMapping(value = "/notice/noticeForm")
	public String insert(Notice n) {
		String path = "redirect:/member/loginForm";
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			Member m = mService.select(user_id);
			if (m.getUser_type() == 3) {
				nService.addNotice(n);
				int notice_num = nService.getNoticeSeqCurrval();
				uploadFile(n.getFile1(), notice_num, 1);
				path = "redirect:/notice/noticeList";
			}
		}
		return path;
	}
	
	//프로젝트 파일에 파일 업로드하기
	private void uploadFile(MultipartFile file, int notice_num, int img_num) {
		File dir = new File(projectPath + webPath + notice_num);
		System.out.println(projectPath);
		System.out.println(webPath);
		
		if (!dir.exists()) {
			dir.mkdir();
		}
		if (!file.isEmpty()) {
			String uploadPath = webPath + notice_num + "\\" + img_num + "_" + file.getOriginalFilename();
			File f = new File(projectPath + uploadPath);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 상세페이지로 이동
	@RequestMapping(value = "/notice/noticeDetail")
	public ModelAndView content(@RequestParam(value = "notice_num") int notice_num) {
		ModelAndView mav = new ModelAndView("/notice/noticeDetail");
		Notice n = nService.getNotice(notice_num);
		/* Notice n = nService.selectNoticeByNum(notice_num); */
		mav.addObject("n", n);
		nService.noticeHits(notice_num);
		return mav;

	}

	// 공지사항 전체 출력
	@RequestMapping(value = "/notice/noticeList")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/notice/noticeList");
		ArrayList<Notice> list = (ArrayList<Notice>) nService.selectAllNotice();
		Collections.reverse(list);
		mav.addObject("list", list);
		return mav;
	}

	// 공지사항 수정페이지로 이동
	@RequestMapping(value = "/notice/noticeEdit")
	public ModelAndView editform(@RequestParam(value = "notice_num") int notice_num) {
		ModelAndView mav = new ModelAndView("/notice/noticeEdit");
		Notice n = nService.getNotice(notice_num);
		/* Notice n = nService.selectNoticeByNum(notice_num); */
		System.out.println(n);
		mav.addObject("n", n);
		nService.noticeHits(notice_num);
		return mav;
	}

	//공지사항 수정
	@PostMapping(value = "/notice/Edit")
	public String edit(Notice n) {
		System.out.println(n);
		String path = "redirect:/member/loginForm";
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			Member m = mService.select(user_id);
			if (m.getUser_type() == 3) {
				nService.editNotice(n);
				path = "redirect:/notice/noticeList";
			}
		}
		return path;
	} 
	
	// 공지사항 삭제
	@RequestMapping(value = "/notice/noticeDelete")
	public String delete(@RequestParam(value = "notice_num") int notice_num) {
		nService.delete(notice_num);
		return "redirect:/notice/noticeList";
	}

}
