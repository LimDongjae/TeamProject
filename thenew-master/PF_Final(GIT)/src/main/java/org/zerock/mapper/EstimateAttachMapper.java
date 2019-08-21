package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.EstimateAttachVO;

public interface EstimateAttachMapper {

	public void insert(EstimateAttachVO vo);
	public void delete(String uuid);
	public List<EstimateAttachVO> findByEno(Long eno);
	public void deleteAll(Long eno);
	public List<EstimateAttachVO> getOldFiles();

}