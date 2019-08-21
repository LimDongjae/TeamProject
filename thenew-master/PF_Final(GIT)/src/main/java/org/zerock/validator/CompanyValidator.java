package org.zerock.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.zerock.domain.CompanyVO;

@Component
public class CompanyValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return CompanyVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compid", "required.companyVO.compid");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "comppw", "required.companyVO.comppw");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compname", "required.companyVO.compname");		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compdate", "required.companyVO.compdate");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compcontent", "required.companyVO.compcontent");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compphone", "required.companyVO.compphone");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compdomain", "required.companyVO.compdomain");
	}

}
