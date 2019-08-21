package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.EstiReplyVO;

public interface EstiReplyMapper {
	public int insert(EstiReplyVO vo);
	public EstiReplyVO read(Long eno);
	public int delete(Long eno);
	public int update(EstiReplyVO reply);
	public List<EstiReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("eno") Long eno);
	public int getCountByEno(Long eno);
}
