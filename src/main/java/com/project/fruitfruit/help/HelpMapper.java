package com.project.fruitfruit.help;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HelpMapper {

	void insertHelp(Help h);
	
	List selectAllHelp();
	
	Help selectHelp(int help_num);
	
	int selectSeqCurrval(); //현재 시퀀스 값 가져오기
	
	void updateHelp(Help n);
	
	void deleteHelp(int help_num);
	
}
