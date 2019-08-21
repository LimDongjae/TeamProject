package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.zerock.domain.CompanyVO;

@Repository("companyMapper")
public interface CompanyMapper {

	public CompanyVO read(String compid);
	
	public List<CompanyVO> getCompanyList(Map<String, Object> map);

	public int getCompanyCount();
	public void insertCompany(CompanyVO companyVO);
	public CompanyVO getCompany(String companyid);
	public void updateCompany(CompanyVO company);
	public void deleteCompany(String companyid);
}
