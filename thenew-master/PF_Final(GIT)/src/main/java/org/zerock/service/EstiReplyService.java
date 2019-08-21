package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.EstiReplyPageDTO;
import org.zerock.domain.EstiReplyVO;

public interface EstiReplyService {
	public int register(EstiReplyVO vo);
	public EstiReplyVO get(Long rno);
	public int modify(EstiReplyVO vo);
	public int remove(Long rno);
	public List<EstiReplyVO> getList(Criteria cri, Long eno);
	public EstiReplyPageDTO getListPage(Criteria cri, Long eno);
}
