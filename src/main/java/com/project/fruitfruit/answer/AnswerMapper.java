package com.project.fruitfruit.answer;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnswerMapper {
	public void insertAnswer(Answer a);
	public Answer selectAnswer(int help_num);
	public void updateAnswer(Answer a);
	public void deleteAnswer(int answer_num);
	public int selectSeqCurrval();
}