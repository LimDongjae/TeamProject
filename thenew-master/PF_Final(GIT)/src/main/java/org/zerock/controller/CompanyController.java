package org.zerock.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.util.PagingUtil;
import org.zerock.validator.CIdNotDuplicateValidator;
import org.zerock.validator.CompanyValidator;

import lombok.extern.log4j.Log4j;

import org.zerock.domain.CompanyVO;
import org.zerock.service.CompanyService;

@Controller
@RequestMapping("/company/*")
@Log4j
public class CompanyController {
	@Resource(name = "companyService")
	private CompanyService companyService;
	
	@Autowired
	private CIdNotDuplicateValidator cidNotDuplicatedValidator;

	// 커맨드 객체(자바빈) 초기화
	@ModelAttribute // request에 저장?
	public CompanyVO initVO() {
		return new CompanyVO();
	}

	@GetMapping("/clist")
	public ModelAndView process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {
		if (log.isDebugEnabled()) {
			log.debug("pageNum : " + currentPage);
		}

		// 총 회원수
		int count = companyService.getCompanyCount();
		// 페이징 유틸
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "clist.do");

		List<CompanyVO> list = null;
		if (count > 0) {
			// mybatis는 여러개를 map으로 묶어서 보낸다
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());

			list = companyService.getCompanyList(map);
		} else {
			list = Collections.emptyList();
		}

		// ModelAndView 객체가 반환되는 것이라 미리 생성함
		ModelAndView mav = new ModelAndView();
		mav.setViewName("company/comselectList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}

	@GetMapping("/cdetail")
	public ModelAndView detailprocess(@RequestParam("compid") String compid) {
		if (log.isDebugEnabled()) {
			log.debug("compid : " + compid);
		}
		CompanyVO company = companyService.getCompany(compid);
		return new ModelAndView("company/comselectDetail", "company", company);
	}

	@GetMapping(value = "/cinsert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String form() {
		return "company/cominsertForm";
	}

	@PostMapping(value = "/cinsert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String submit(CompanyVO companyVO, BindingResult result) {
		if (log.isDebugEnabled()) {
			log.debug("CompanyVO : " + companyVO);
		}
		new CompanyValidator().validate(companyVO, result);
		cidNotDuplicatedValidator.validate(companyVO, result);

		if (result.hasErrors()) {
			return form();
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		companyVO.setComppw(encoder.encode(companyVO.getComppw()));
		companyService.insertCompany(companyVO);

		return "redirect:/company/cdetail?compid=" + companyVO.getCompid();
	}

	// selectDetail.do에서 compid값 넘김
	@GetMapping(value = "/cupdate", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ModelAndView updateform(@RequestParam("compid") String compid) {
		CompanyVO companyVO = companyService.getCompany(compid);
		// view 이름 속성명 속성값
		return new ModelAndView("company/cupdateForm", "companyVO", companyVO);
	}

	@PostMapping(value = "/cupdate", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String updatesubmit(CompanyVO companyVO, BindingResult result, SessionStatus status) {
		// 유효성체크
		new CompanyValidator().validate(companyVO, result);
		System.out.println(companyVO);
		if (result.hasErrors()) {
			System.out.println(result);
			return "company/cupdateForm";
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		companyVO.setComppw(encoder.encode(companyVO.getComppw()));
		companyService.updateCompany(companyVO);
		// session에 저장된 model을 삭제하는 이벤트 발생
		status.setComplete();

		return "redirect:/company/cdetail?compid=" + companyVO.getCompid();
	}

	@GetMapping("/cdelete")
	public String deleteform() {
		return "company/comdeleteForm";
	}

	@GetMapping("/cdeletePro")
	public String deleteprocess(@RequestParam("compid") String compid, HttpSession session) {
		companyService.deleteCompany(compid);
		session.invalidate();
		return "redirect:/";
	}
}
