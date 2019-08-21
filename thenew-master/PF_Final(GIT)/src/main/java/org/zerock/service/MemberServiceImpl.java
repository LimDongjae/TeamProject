package org.zerock.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zerock.mapper.MemberMapper;

import org.zerock.domain.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberMapper")
	private MemberMapper memberMapper;

	@Override
	public List<MemberVO> getMemberList(Map<String, Object> map) {
		return memberMapper.getMemberList(map);
	}

	@Override
	public int getMemberCount() {

		return memberMapper.getMemberCount();
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		memberMapper.insertMember(memberVO);

	}

	@Override
	public MemberVO getMember(String userid) {
		
		return memberMapper.getMember(userid);
	}

	@Override
	public void updateMember(MemberVO member) {

		memberMapper.updateMember(member);
	}

	@Override
	public void deleteMember(String userid) {

		memberMapper.deleteMember(userid);
	}

}