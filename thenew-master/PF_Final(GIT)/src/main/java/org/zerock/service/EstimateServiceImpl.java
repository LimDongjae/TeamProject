package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.EstimateAttachVO;
import org.zerock.domain.EstimateVO;
import org.zerock.mapper.EstimateAttachMapper;
import org.zerock.mapper.EstimateMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EstimateServiceImpl implements EstimateService{

	@Setter(onMethod_ = @Autowired)
	private EstimateMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private EstimateAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(EstimateVO estimate) {
		log.info("register......" + estimate);
		mapper.insertSelectKey(estimate);
		if (estimate.getAttachList() == null || estimate.getAttachList().size() <= 0) {
			return;
		}
		estimate.getAttachList().forEach(attach -> {
			attach.setEno(estimate.getEno());
			attachMapper.insert(attach);
		});
		System.out.println(estimate.getContent());
	}

	@Override
	public EstimateVO get(Long eno) {
		log.info("get......" + eno);
		return mapper.read(eno);

	}

	@Transactional
	@Override
	public boolean modify(EstimateVO estimate) {
		log.info("modify......" + estimate);
		attachMapper.deleteAll(estimate.getEno());
		boolean modifyResult = mapper.update(estimate) == 1;
		
		//modifyResult가 있고, attachList가 존재하며 크기가 0보다 클 경우에만 실행
		if (modifyResult && estimate.getAttachList() != null && estimate.getAttachList().size() > 0) {
			estimate.getAttachList().forEach(attach -> {
				attach.setEno(estimate.getEno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long eno) {
		log.info("remove...." + eno);
		attachMapper.deleteAll(eno);
		return mapper.delete(eno) == 1;
	}

	@Override
	public List<EstimateVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<EstimateAttachVO> getAttachList(Long eno) {
		log.info("get Attach list by eno" + eno);
		return attachMapper.findByEno(eno);
	}

	@Override
	public void removeAttach(Long eno) {
		log.info("remove all attach files");
		attachMapper.deleteAll(eno);
		
	}


}
