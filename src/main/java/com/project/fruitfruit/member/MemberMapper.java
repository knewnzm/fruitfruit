package com.project.fruitfruit.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


<<<<<<< HEAD
=======


>>>>>>> refs/remotes/daegyu/daegyu
@Mapper
public interface MemberMapper {
	void insert(Member m);
	Member select(String id);
	Member selectbyname(String name);
	List list();
	void update(Member m);
	void changePwd(Member m);
	void delete(String id);
}
