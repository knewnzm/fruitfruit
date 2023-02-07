package com.project.fruitfruit.help;

import java.io.File;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HelpService {

	private String projectPath = new File("").getAbsolutePath().toString()+"\\src\\main\\webapp";
	private String webPath ="\\static\\help\\";
	
	@Autowired
	private HelpMapper mapper;
	
	/*1:1문의 작성*/
	public void addHelp(Help h) { 
					mapper.insertHelp(h);
	}
	
	/* 1:1 문의 전체 조회 */
	public List selectAllHelp() {
			 return mapper.selectAllHelp();
	}
	
	/*1:1문의 글 번호와 일치하는 행 불러오기*/
	public Help selectHelpByNum(int help_num) {
			return mapper.selectHelp(help_num);
	}
	
	/* 현재 시퀀스 값 불러오기 */
	public int getHelpSeqCurrval() {
				 return mapper.selectSeqCurrval();
	}
	
	/* 1:1 문의 수정*/
	public void editHelp(Help h) {
				   mapper.updateHelp(h);
	}
	
	/* 1:1문의 삭제 */
	public void deleteHelp(int help_num) {
				   mapper.deleteHelp(help_num);
	}
	
	/* 1:1 문의글 상세보기 */
	public Help getHelp(int help_num) {
			 Help h = mapper.selectHelp(help_num);
			 h = helpSetPath(h);
			 return h;
	}
	
	
	/* 1:1 문의글에 파일 이미지 삽입 */
	private Help helpSetPath(Help h) {
			  String []files = getFileList(h.getHelp_num());
			  if(files.length >= 1 && !files[0].equals("")) {
				 h.setHelp_path(files[0]);
			  }else {
				     h.setHelp_path("https://dummyimage.com/286x150/fff/000.png&text=No+Image");
			  }
			  return h;
	}
	
	/* 1:1문의글 위치의 이미지 불러오기 */
	private String[] getFileList(int help_num) {
			  File file = new File(projectPath + webPath + help_num);
			  String [] files = file.list();
			  if(files != null) {
				  for (int i = 0; i<files.length; i++) {
					   files[i] = webPath.replace("\\","/") + help_num + "/" + files[i];
				  }
			  }else {
				  	 files = new String[1];
				  	 files[0] = "";
			  }
			  return files;
	}
	
}