package com.project.fruitfruit.support;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fruitfruit.product.Product;

@Controller
public class SupportController {

	@Autowired
	private SupportService sService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@PostMapping("/support/add")
	public String addReply(Support s) {
		System.out.println("result"+s);
		sService.insertSupport(s);
		return "redirect:" + request.getHeader("REFERER") + "#reply-" + sService.getSeqCurrentValue();
	}
	
	@RequestMapping("/support/list")
	public void selectReplyByProductNum(@RequestParam int product_num, Model model) {
		ArrayList<Support> li = sService.selectSupportByProductNum(product_num);
		model.addAttribute("li", li);
	}
	
	@PostMapping("/support/edit")
	public String editReply(Support s) {
		String user_id = (String) session.getAttribute("user_id");
		s.setSupport_writer(user_id);
		sService.updateSupport(s);
		return "redirect:" + request.getHeader("REFERER") + "#reply-" + s.getSupport_num();
	}
	
	@RequestMapping("/support/delete")
	public String deleteReply(@RequestParam int support_num) {
		String user_id = (String) session.getAttribute("user_id");
		Support s = sService.selectSupport(support_num);
		if (user_id.equals(s.getSupport_writer())) {
			if (sService.selectSupportListByParentNum(support_num).size() > 0) {
				sService.deleteSupportByParentNum(support_num);
			}
			sService.deleteSupport(support_num);
		}
		return "redirect:" + request.getHeader("REFERER");
	}
	
}
