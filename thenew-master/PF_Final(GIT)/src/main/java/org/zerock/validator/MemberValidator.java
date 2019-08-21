package org.zerock.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.zerock.domain.MemberVO;

@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userid", "required.memberVO.userid");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userpw", "required.memberVO.userpw");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "required.memberVO.username");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userphone", "required.memberVO.userphone");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "useremail", "required.memberVO.useremail");
	}

}
