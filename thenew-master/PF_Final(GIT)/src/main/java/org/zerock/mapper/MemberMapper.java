package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.zerock.domain.MemberVO;

@Repository("memberMapper")
public interface MemberMapper {
	public MemberVO read(String userid);
	
	public List<MemberVO> getMemberList(Map<String,Object> map);
	public int getMemberCount();
	public void insertMember(MemberVO member);
	public MemberVO getMember(String userid);
	public void updateMember(MemberVO member);
	public void deleteMember(String userid);
}
