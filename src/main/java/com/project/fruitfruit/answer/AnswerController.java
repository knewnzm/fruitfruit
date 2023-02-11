package com.project.fruitfruit.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnswerController {
@Autowired
private AnswerService service;

@PostMapping (value="/answer/insert")
public ModelAndView insert(Answer a) {
	ModelAndView mav=new ModelAndView("redirect:/help/helpDetail?help_num="+a.getHelp_num());
	service.insertAnswer(a);
	return mav;
}
@PostMapping (value="/answer/edit")
public ModelAndView edit(Answer a) {
	ModelAndView mav=new ModelAndView("redirect:/help/helpDetail?help_num="+a.getHelp_num());
	service.updateAnswer(a);
	return mav;
}
@RequestMapping (value="/answer/delete")
public String delete(int answer_num) {
	service.deleteAnswer(answer_num);
	return "redirect:/help/helpList";
}
}
