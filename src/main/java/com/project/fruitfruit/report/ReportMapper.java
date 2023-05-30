package com.project.fruitfruit.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
void insertReport(Report r);
	
	List<Report> selectAll();
	
	Report select(int report_num);

	void delete(int report_num);
}
