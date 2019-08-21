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
public class CIdNotDuplicateValidator implements Validator {

	@Resource(name="companyService")
	private CompanyService companyService;	

	@Resource(name="memberService")
	private MemberService memberService;	
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return CompanyVO.class.isAssignableFrom(clazz);
	}
	

	@Override
	public void validate(Object target, Errors errors) {

		CompanyVO companyVO = (CompanyVO)target;
		
		//아이디 중복 체크(비어있지 않은 경우 한건의 데이터 받아서 검사)
		if(companyVO.getCompid() != null && !companyVO.getCompid().isEmpty()) {
			CompanyVO company = companyService.getCompany(companyVO.getCompid());
			MemberVO member = memberService.getMember(companyVO.getCompid());
			//받은 한건의 데이터가 비어있지 않으면 검사
			if((company != null && company.getCompid().equals(companyVO.getCompid())) || (member != null && member.getUserid().equals(companyVO.getCompid()))) {
				//아이디 중복
				errors.rejectValue("compid", "duplicatedId");
			}
		}
	}
	

}
