package com.project.fruitfruit.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;
	
	public void addNotice(Notice n) { //공지사항&이벤트 작성
		mapper.insertNotice(n);
	}
	
	public List selectAllNotice() { //공지사항&이벤트 전체 가져오기
		return mapper.selectAllNotice();
	}
	
	public Notice selectNoticeByNum(int notice_num) { //글 번호와 일치하는 하나의 행 가져오기
		return mapper.selectNotice(notice_num);
	}
	
	public void noticeHits(int notice_num) { //글 번호와 일치하는 행의 조회수 1상승 시키기
		mapper.noticeHits(notice_num);
	}
	
	public void editNotice(Notice n) { //공지사항&이벤트 수정
		mapper.updateNotice(n);
	}
	
	public void delete(int notice_num) {//공지사항&이벤트 삭제
		mapper.deleteNotice(notice_num);
	}
}
