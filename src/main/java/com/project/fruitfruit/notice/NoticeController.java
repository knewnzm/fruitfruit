package com.project.fruitfruit.notice;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.member.Member;
import com.project.fruitfruit.member.MemberService;

@Controller
public class NoticeController {
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
				path = "redirect:/notice/noticeList";
			}
		}
		return path;
	}

	// 컨텐츠로 이동
	@RequestMapping(value = "/notice/noticeDetail")
	public ModelAndView content(@RequestParam(value = "notice_num") int notice_num) {
		ModelAndView mav = new ModelAndView("/notice/noticeDetail");
		Notice n = nService.selectNoticeByNum(notice_num);
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

	// 공지사항 수정
	@RequestMapping(value = "/notice/notice_edit")
	public String edit(Notice n) {
		nService.editNotice(n);
		return "redirect:/notice/noticeList";
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice/notice_delete")
	public String delete(@RequestParam(value = "notice_num") int notice_num) {
		nService.delete(notice_num);
		return "redirect:/notice/noticeList";
	}
	
	/*
	 * @GetMapping(value = "/notice/noticeDetail") public void noticeDetail() { }
	 */
	
	@GetMapping(value = "/notice/noticeEdit")
	public void noticeEdit() {
	}
}
