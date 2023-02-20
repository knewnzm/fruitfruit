package com.project.fruitfruit.support;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SupportService {

	@Autowired
	private SupportMapper mapper;
	
	public ArrayList<Support> selectSupportByProductNum(int support_product_num) {
		return mapper.selectSupportByProductNum(support_product_num);
	}
	
	public Support selectSupport(int support_num) {
		return mapper.selectSupport(support_num);
	}
	
	public ArrayList<Support> selectSupportListByParentNum(int parent_num) {
		return mapper.selectSupportListByParentNum(parent_num);
	}
	
	
	public void insertSupport(Support s) {
		mapper.insertSupport(s);
	}
	
	public void updateSupport(Support s) {
		mapper.updateSupport(s);
	}
	
	public void deleteSupport(int support_num) {
		mapper.deleteSupport(support_num);
	}
	
	public void deleteSupportByParentNum(int support_parent_num) {
		mapper.deleteSupportByParentNum(support_parent_num);
	}

	public int getSeqCurrentValue() {
		return mapper.getSeqCurrentValue();
	}



}
