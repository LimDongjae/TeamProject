package org.zerock.security;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.CompanyVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.CompanyMapper;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CompanyUser;
import org.zerock.security.domain.CustomUser;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Setter(onMethod_ = { @Autowired })
	private CompanyMapper companyMapper;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userName);

		MemberVO member = memberService.getMember(userName);

		if (member != null) {
			// userName means userid
			MemberVO vo = memberMapper.read(userName);
			log.warn("queried by member mapper: " + vo);
			return vo == null ? null : new CustomUser(vo);
		} else {
			CompanyVO vo = companyMapper.read(userName);
			log.warn("queried by company mapper: " + vo);
			return vo == null ? null : new CompanyUser(vo);
		}
	}

}
