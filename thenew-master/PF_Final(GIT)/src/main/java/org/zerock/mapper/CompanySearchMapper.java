package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CompanySearchVO;
import org.zerock.domain.CompanyVO;
import org.zerock.domain.CompanySearchCriteria;

public interface CompanySearchMapper {

	//@Select("select * from tbl_company")
	public List<CompanySearchVO> getList();
	
	public int insert(CompanySearchVO company);
	
	public void insertSelectKey(CompanySearchVO company);
	
	public CompanySearchVO read(String CompId);
	
	public int delete(String CompId);
	
	public int update(CompanySearchVO company);
	
	public List<CompanySearchVO> getListWithPaing(CompanySearchCriteria cri);
	
	public int getTotalCount(CompanySearchCriteria cri);
	
	public List<CompanyVO> getAutoSearching(CompanySearchCriteria cri);
	
}
