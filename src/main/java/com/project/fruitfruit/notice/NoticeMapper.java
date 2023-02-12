package com.project.fruitfruit.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	
void insertNotice(Notice n);
	
	List selectAllNotice();	
	
	Notice selectNotice(int notice_num);
	
	void updateNotice(Notice n);
	
	void noticeHits(int notice_num);
	
	void deleteNotice(int notice_num);
//	현재 시퀀스 값 가져오기
	int selectSeqCurrval();
}
