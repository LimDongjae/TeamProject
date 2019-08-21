package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.EstimateAttachVO;
import org.zerock.domain.EstimateVO;

public interface EstimateService {
	
	public void register(EstimateVO estimate);
	public EstimateVO get(Long eno);
	public boolean modify(EstimateVO estimate);
	public boolean remove(Long eno);
	
	// public List<BoardVO> getList();
	public List<EstimateVO> getList(Criteria cri);
	
	//추가
	public int getTotal(Criteria cri);

	public List<EstimateAttachVO> getAttachList(Long eno);
	public void removeAttach(Long eno);
}
