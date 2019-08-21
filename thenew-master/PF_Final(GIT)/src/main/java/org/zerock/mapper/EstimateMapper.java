package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.EstimateVO;

public interface EstimateMapper {
	
	public List<EstimateVO> getList();
	public List<EstimateVO> getListWithPaging(Criteria cri);
	public void insert(EstimateVO estimate);
	public Integer insertSelectKey(EstimateVO estimate);
	public EstimateVO read(Long eno);
	public int delete(Long eno);
	public int update(EstimateVO estimate);
	public int getTotalCount(Criteria cri);
	
	public static void updateReplyCnt(@Param("eno") Long eno, @Param("amount") int amount) {
		
	}
}
