package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.zerock.domain.CompanyVO;


public interface CompanyService {
	public List<CompanyVO> getCompanyList(Map<String,Object> map);
	public int getCompanyCount();
	public void insertCompany(CompanyVO companyVO);
	public CompanyVO getCompany(String companyid);
	public void updateCompany(CompanyVO company);
	public void deleteCompany(String companyid);
}
