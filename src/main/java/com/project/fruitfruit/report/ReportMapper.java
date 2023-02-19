package com.project.fruitfruit.report;

<<<<<<< HEAD
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
void insertReport(Report r);
	
	List selectAll();
	
	Report select(int report_num);

	void delete(int report_num);
=======
public interface ReportMapper {

>>>>>>> refs/remotes/daegyu/daegyu
}
