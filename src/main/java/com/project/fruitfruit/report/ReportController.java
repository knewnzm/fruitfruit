package com.project.fruitfruit.report;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReportController {
	@Autowired
	private ReportService rService;

	@Autowired
	private HttpSession session;
	
	//신고 등록하기
	@PostMapping(value = "/report/add")
	public String insertReport(Report r) {
		rService.insertReport(r);
		int product_num = r.getProduct_num();
		return "redirect:/product/productDetail?product_num="+product_num; //신고 완료후 해당 페이지로 다시 이동
	}
	
	/* 신고목록 불러오기 */
	@GetMapping(value = "/report/reportList")
	// 관리자 계정에서 보이는 신고접수된 list
	public String reportList(Model model) {
		String path = "/report/reportList";
		int user_type = (int) session.getAttribute("user_type");
		if (user_type == 3) { //관리자인 경우에만
			List<Report> reportList = rService.selectAll();
			model.addAttribute("list", reportList);
		} else {
			path = "redirect:/";
		}
		return path;
	}
	
	@GetMapping(value = "/report/delete")
	public void delete(int report_num) {
		rService.delReport(report_num);
	}
}
