package com.project.fruitfruit.support;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SupportMapper {
	
	public ArrayList<Support> selectSupportByProductNum(int support_product_num);
	public Support selectSupport(int support_num);
	public ArrayList<Support> selectSupportListByParentNum(int support_parent_num);
	public void insertSupport(Support s);
	public void updateSupport(Support s);
	public void deleteSupport(int support_num);
	public void deleteSupportByParentNum(int support_parent_num);
	public int getSeqCurrentValue();
	
}
