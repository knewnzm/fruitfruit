package com.project.fruitfruit.help;

import java.util.List;

public interface HelpMapper {

	void insertHelp(Help h);
	
	List selectAllHelp();
	Help selectHelp(int help_num);
	int selectSeqCurrval(); //현재 시퀀스 값
	
	void updateHelp(Help n);
	
	void deleteHelp(int help_num);
	
}
