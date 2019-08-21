package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.EstiReplyPageDTO;
import org.zerock.domain.EstiReplyVO;
import org.zerock.mapper.EstimateMapper;
import org.zerock.mapper.EstiReplyMapper;

import lombok.Setter;
//import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
//@AllArgsConstructor
public class EstiReplyServiceImpl implements EstiReplyService {
	@Setter(onMethod_ = @Autowired)
	private EstiReplyMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private EstimateMapper estimateMapper;

	@Transactional
	@Override
	public int register(EstiReplyVO vo) {
		log.info("register......" + vo);
		EstimateMapper.updateReplyCnt(vo.getEno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public EstiReplyVO get(Long rno) {
		log.info("get......" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(EstiReplyVO vo) {
		log.info("modify......" + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		EstiReplyVO vo = mapper.read(rno);
		EstimateMapper.updateReplyCnt(vo.getEno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<EstiReplyVO> getList(Criteria cri, Long eno) {
		log.info("get Reply List of a Estimate " + eno);
		return mapper.getListWithPaging(cri, eno);
	}

	// 댓글의 페이징 처리
	@Override
	public EstiReplyPageDTO getListPage(Criteria cri, Long eno) {
		return new EstiReplyPageDTO(mapper.getCountByEno(eno), mapper.getListWithPaging(cri, eno));
	}

}
