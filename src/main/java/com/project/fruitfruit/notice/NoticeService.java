package com.project.fruitfruit.notice;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\notice\\";
	
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
	
//	제품 상세보기
	public Notice getNotice(int notice_num) {
		Notice n = mapper.selectNotice(notice_num);
		n = noticeSetPath(n);
		return n;
	}
//	프로덕트에 파일 이미지 붙이기
	private Notice noticeSetPath(Notice n) {
		String[] files = getFileList(n.getNotice_num());
		if (files.length >= 1 && !files[0].equals("")) {
			n.setNotice_path(files[0]);
			
		} else {
			n.setNotice_path("https://dummyimage.com/286x150/fff/000.png&text=No+Image");
		}
		return n;
	}
//	프로덕트 위치의 이미지 목록 불러오기
	private String[] getFileList(int notice_num) {
		File dir = new File(projectPath + webPath + notice_num);
		String[] files = dir.list();
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				files[i] = webPath.replace("\\", "/") + notice_num + "/" + files[i];
			}
		} else {
			files = new String[1];
			files[0] = "";
		}
		return files;
	}
//	현재 시퀀스 값 가져오기
	public int getNoticeSeqCurrval() {
		return mapper.selectSeqCurrval();
	}
}
