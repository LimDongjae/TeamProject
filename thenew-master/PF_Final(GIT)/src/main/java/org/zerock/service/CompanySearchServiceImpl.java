package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CompanySearchVO;
import org.zerock.domain.CompanyVO;
import org.zerock.domain.CompanySearchCriteria;
import org.zerock.mapper.CompanySearchMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CompanySearchServiceImpl implements CompanySearchService {

	@Setter
	private CompanySearchMapper mapper;
	
	
	@Override
	
	public CompanySearchVO register(CompanySearchVO company) {
		
		log.info("register..." + company);
		
		mapper.insertSelectKey(company);
		return company;
	}

	@Override
	public CompanySearchVO get(String CompId) {
		
		log.info("get....." + CompId);
		
		return mapper.read(CompId);
	}

	@Override
	public boolean modify(CompanySearchVO company) {
		
		log.info("modify.."+ company);
		
		return mapper.update(company) == 1;
	}

	@Override
	public boolean remove(String CompId) {
		
		log.info("remove..." + CompId);
		
		return mapper.delete(CompId) == 1;
	}

	@Override
	public List<CompanySearchVO> getList(CompanySearchCriteria cri) {
		
		log.info("get List with criteria1:" + cri);
		
		return mapper.getListWithPaing(cri);
	}

	@Override
	public int getTotal(CompanySearchCriteria cri) {
		
		log.info("getTotalCount");
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<CompanyVO> getAutoSearch(CompanySearchCriteria cri) {
		
		log.info("get Search criteria:" + cri);
		
		return mapper.getAutoSearching(cri);
	}
//
//	@Override
//	public List<CompanyVO> getList() {
//		
//		log.info("getList.........");
//		
//		return mapper.getList();
//	}


}
