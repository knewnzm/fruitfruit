package com.project.fruitfruit.help;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HelpMapper {

	void insertHelp(Help h);
	
	List<Help> selectAllHelp();
	
	Help selectHelp(int help_num);
	
	int selectSeqCurrval();
	
	void updateHelp(Help h);
	
	void deleteHelp(int help_num);

}