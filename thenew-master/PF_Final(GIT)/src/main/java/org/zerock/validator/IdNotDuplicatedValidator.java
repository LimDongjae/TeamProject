package org.zerock.validator;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.zerock.domain.CompanyVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.CompanyService;
import org.zerock.service.MemberService;

@Component
public class IdNotDuplicatedValidator implements Validator {
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="companyService")
	private CompanyService companyService;

	@Override
	public boolean supports(Class<?> clazz) {
		
		return MemberVO.class.isAssignableFrom(clazz);
	}
	

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVO = (MemberVO)target;
		
		//아이디 중복 체크(비어있지 않은 경우 한건의 데이터 받아서 검사)
		if(memberVO.getUserid() != null && !memberVO.getUserid().isEmpty()) {
			System.out.println(memberVO.getUserid());
			MemberVO member = memberService.getMember(memberVO.getUserid());
			if(member != null)
				System.out.println(member.getUserid());
			CompanyVO company = companyService.getCompany(memberVO.getUserid());
			if(company != null)
				System.out.println(company.getCompid());
			//받은 한건의 데이터가 비어있지 않으면 검사
			if((member != null && member.getUserid().equals(memberVO.getUserid())) || (company != null && company.getCompid().equals(memberVO.getUserid()))) {
				//아이디 중복
				errors.rejectValue("userid", "duplicatedId");
			}
		}
	}
	
	
}
