package com.project.fruitfruit.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {
	void insert(Member m);
	Member select(String id);
	Member selectbyname(String name);
	List<Member> list();
	void update(Member m);
	void changePwd(Member m);
	void delete(String id);
}
