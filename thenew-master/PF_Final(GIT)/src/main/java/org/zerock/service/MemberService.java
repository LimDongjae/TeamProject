package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemberList(Map<String,Object> map);
	public int getMemberCount();
	public void insertMember(MemberVO memberVO);
	public MemberVO getMember(String userid);
	public void updateMember(MemberVO member);
	public void deleteMember(String userid);

}
