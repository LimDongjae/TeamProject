package org.zerock.service;

import java.util.List;

import org.zerock.domain.CompanySearchVO;
import org.zerock.domain.CompanyVO;
import org.zerock.domain.CompanySearchCriteria;

public interface CompanySearchService {
	
	//
	public CompanySearchVO register(CompanySearchVO company);
	
	//
	public CompanySearchVO get(String CompId);
	
	//
	public boolean modify(CompanySearchVO company);
	
	//
	public boolean remove(String CompId);
	
	//public List<CompanyVO> getList();
	
	public List<CompanySearchVO> getList(CompanySearchCriteria cri);
	
	public List<CompanyVO> getAutoSearch(CompanySearchCriteria cri);
	//
	public int getTotal(CompanySearchCriteria cri);
}
