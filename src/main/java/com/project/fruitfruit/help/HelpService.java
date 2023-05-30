package com.project.fruitfruit.help;

import java.io.File;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HelpService {

	private String projectPath = new File("").getAbsolutePath().toString()+"\\src\\main\\webapp"; //File("")은 현재 작업중인 디렉토리
	private String webPath ="\\static\\help\\";
	
	@Autowired
	private HelpMapper mapper;
	
	/*1:1문의 작성*/
	public void addHelp(Help h) { 
					mapper.insertHelp(h);
	}
	
	/* 1:1 문의 전체 조회 */
	public List<Help> selectAllHelp() {
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
				   helpDeletePath(help_num);
	}

	/* 1:1 문의글 상세보기 */
	public Help getHelp(int help_num) {
			 Help h = mapper.selectHelp(help_num);
			 h = helpSetPath(h);
			 return h;
	}
	
	
	/* Help객체에 이미지 저장 */
	private Help helpSetPath(Help h) {
			String[] files = getFileList(h.getHelp_num());
			  if(files.length > 0 && !files[0].equals("")) { //파일 배열에 이미지가 들어있는지 확인
				 h.setHelp_path(files); //파일배열을 help_path에 할당
			  }else { //이미지가 없는 경우
				  files[0] = "https://dummyimage.com/286x150/fff/000.png&text=No+Image";
				     h.setHelp_path(files); //더미이미지를 저장
			  }
			  return h; //이미지가 삽입된 h 반환
	}
	
	/* 저장 폴더의 이미지 경로 배열 가져오기 */
	private String[] getFileList(int help_num) {
			  File file = new File(projectPath + webPath + help_num); //문의 글번호에 해당하는 이미지 파일 폴더 객체 생성
			  String [] files = file.list(); //폴더 안의 파일 이름들을 files에 저장
			  if(files != null && files.length>0) { //폴더안에 파일이 존재하는지 확인
				  for (int i = 0; i<files.length; i++) {
					   files[i] = webPath.replace("\\","/") + help_num + "/" + files[i]; //webPath의 역슬래시를 슬래시로 변경하고 글번호와 파일 이름을 조합해 저장
				  } 
			  } else { //폴더에 파일이 없으면 빈문자열이 든 배열 하나를 생성
				  files = new String[1];
				  files[0]="";
			  }
			  return files;
	}
	
	//1:1문의글 삭제시 이미지 삭제
	public void helpDeletePath(int help_num) {
		File dir = new File(projectPath + webPath + help_num);
		File[] files = dir.listFiles();
		for(File file : files) {
			if (file.delete()) {
			    System.out.println("파일이 삭제되었습니다.");
			} else {
			    System.out.println("파일 삭제에 실패했습니다.");
			}
		}
		if (dir.delete()) {
		    System.out.println("파일이 삭제되었습니다.");
		} else {
		    System.out.println("파일 삭제에 실패했습니다.");
		}
		
		
	}
	
}