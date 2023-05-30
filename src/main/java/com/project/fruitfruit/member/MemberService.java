package com.project.fruitfruit.member;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	public void insert(Member m) {
		mapper.insert(m);
	}
	public Member select(String id) {
		return mapper.select(id);
		
	}
	public Member selectbyname(String name) {
		return mapper.select(name);
		
	}
	public List<Member> list() {
		return mapper.list();
		
	}
	public void update(Member m) {
		mapper.update(m);
	}
	public void changePwd(Member m) {
		mapper.changePwd(m);
	}
	public void delete(String id) {
		mapper.delete(id);
	}


}
