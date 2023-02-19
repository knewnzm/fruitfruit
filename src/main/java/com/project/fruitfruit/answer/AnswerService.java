package com.project.fruitfruit.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerService {
	@Autowired
	private AnswerMapper mapper;
	public void insertAnswer(Answer a) {
		mapper.insertAnswer(a);
	}
	public Answer selectAnswer(int help_num){
		return mapper.selectAnswer(help_num);
	}
	public void updateAnswer(Answer a){
		mapper.updateAnswer(a);
	}
	public void deleteAnswer(int answer_num){
		mapper.deleteAnswer(answer_num);
	}
	public int selectSeqCurrval(){
		return mapper.selectSeqCurrval();
		}
}