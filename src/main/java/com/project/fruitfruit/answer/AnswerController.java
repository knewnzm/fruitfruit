package com.project.fruitfruit.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnswerController {
@Autowired
private AnswerService service;

@PostMapping (value="/answer/insert")
public String insert(Answer a) {
	service.insertAnswer(a);
	return "redirect:/help/helpDetail?help_num="+a.getHelp_num();
}
@PostMapping (value="/answer/edit")
public String edit(Answer a) {
	service.updateAnswer(a);
	return "redirect:/help/helpDetail?help_num="+a.getHelp_num();
}
@RequestMapping (value="/answer/delete")
public String delete(int answer_num) {
	service.deleteAnswer(answer_num);
	return "redirect:/help/helpList";
}
}