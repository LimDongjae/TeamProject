package org.zerock.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.zerock.mapper.CompanyMapper;
import org.zerock.domain.CompanyVO;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

	@Resource(name="companyMapper")
	private CompanyMapper companyMapper;

	@Override
	public List<CompanyVO> getCompanyList(Map<String, Object> map) {
		return companyMapper.getCompanyList(map);
	}

	@Override
	public int getCompanyCount() {

		return companyMapper.getCompanyCount();
	}

	@Override
	public void insertCompany(CompanyVO companyVO) {
		companyMapper.insertCompany(companyVO);

	}

	@Override
	public CompanyVO getCompany(String compid) {

		return companyMapper.getCompany(compid);
	}

	@Override
	public void updateCompany(CompanyVO company) {

		companyMapper.updateCompany(company);
	}

	@Override
	public void deleteCompany(String compid) {

		companyMapper.deleteCompany(compid);
	}

}
