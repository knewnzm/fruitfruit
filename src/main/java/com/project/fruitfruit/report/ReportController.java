package com.project.fruitfruit.report;

<<<<<<< HEAD
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.product.Product;
import com.project.fruitfruit.product.ProductService;

@Controller
public class ReportController {
	@Autowired
	private ReportService rService;
	@Autowired
	private ProductService pService;

	@Autowired
	private HttpSession session;
	
	@GetMapping(value = "/report/add")
	public ModelAndView reportForm(@RequestParam int product_num, @RequestParam String product_seller_id) {
		ModelAndView mav= new ModelAndView();
		Product p=new Product();
		p.setProduct_num(product_num);
		p.setProduct_seller_id(product_seller_id);
		mav.addObject("p", p);
		return mav;
		
	}
	
	@PostMapping(value = "/report/add")
	public String insertReport(Report r) {
		System.out.println(r);
		String writer_id = (String) session.getAttribute("user_id");
		String seller_id = r.getReport_seller_id();
		r.setReport_writer_id(writer_id);
		r.setReport_seller_id(seller_id);
		rService.insertReport(r);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/report/reportList")
	// admin계정에서 보이는 신고접수된list
	public String reportList(Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			ArrayList<Report> list = (ArrayList<Report>) rService.selectAll();
			model.addAttribute("list", list);
		}
		return "/report/reportList";
	}
	@RequestMapping(value = "/report/delete")
	public void delete(int report_num) {
		rService.delReport(report_num);
	}
	@RequestMapping(value = "/report/reportValue")
	public ModelAndView reportValue(int report_num) {
		ModelAndView mav = new ModelAndView("report/reportValue");
		Report r = rService.getReport(report_num);
		mav.addObject("r", r);
		return mav;
	}
=======
public class ReportController {

>>>>>>> refs/remotes/daegyu/daegyu
}
