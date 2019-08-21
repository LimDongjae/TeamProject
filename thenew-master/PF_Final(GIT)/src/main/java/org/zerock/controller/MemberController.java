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
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;
import org.zerock.util.PagingUtil;
import org.zerock.validator.IdNotDuplicatedValidator;
import org.zerock.validator.MemberValidator;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;

	@Autowired
	private IdNotDuplicatedValidator idNotDuplicatedValidator;

	// 커맨드 객체(자바빈) 초기화
	@ModelAttribute // request에 저장?
	public MemberVO initVO() {
		return new MemberVO();
	}

	@GetMapping("/list")
	public ModelAndView process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {
		if (log.isDebugEnabled()) {
			log.debug("pageNum : " + currentPage);
		}

		// 총 회원수
		int count = memberService.getMemberCount();

		// 페이징 유틸
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "list");

		List<MemberVO> list = null;
		if (count > 0) {
			// mybatis는 여러개를 map으로 묶어서 보낸다
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = memberService.getMemberList(map);
		} else {
			list = Collections.emptyList();
		}

		// ModelAndView 객체가 반환되는 것이라 미리 생성함
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/selectList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}

	@GetMapping("/detail")
	public ModelAndView process(@RequestParam("userid") String userid) {
		if (log.isDebugEnabled()) {
			log.debug("userid : " + userid);
		}
		MemberVO member = memberService.getMember(userid);
		return new ModelAndView("member/selectDetail", "member", member);
	}

	@GetMapping(value = "/insert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String form() {
		return "member/insertForm";
	}

	@PostMapping(value = "/insert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String submit(MemberVO memberVO, BindingResult result) {
		if (log.isDebugEnabled()) {
			log.debug("memberVO : " + memberVO);
		}
		new MemberValidator().validate(memberVO, result);
		idNotDuplicatedValidator.validate(memberVO, result);
		if (result.hasErrors()) {
			return form();
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		memberVO.setUserpw(encoder.encode(memberVO.getUserpw()));
		memberService.insertMember(memberVO);
		return "redirect:/";
	}

	// selectDetail.do에서 userid값 넘김
	@GetMapping(value = "/update", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ModelAndView form(@RequestParam("userid") String userid) {
		MemberVO memberVO = memberService.getMember(userid);
		// view 이름 속성명 속성값
		return new ModelAndView("member/updateForm", "memberVO", memberVO);
	}

	@PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String submit(MemberVO memberVO, BindingResult result, SessionStatus status) {
		// 유효성체크
		new MemberValidator().validate(memberVO, result);
		if (result.hasErrors()) {
			return "member/updateForm";
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		memberVO.setUserpw(encoder.encode(memberVO.getUserpw()));
		memberService.updateMember(memberVO);
		// session에 저장된 model을 삭제하는 이벤트 발생
		status.setComplete();
		return "redirect:/";
	}

	@GetMapping("/delete")
	public String deleteform() {
		return "member/deleteForm";
	}

	@PostMapping("/deletePro")
	public String deleteprocess(@RequestParam("userid") String userid, HttpSession session) {
		memberService.deleteMember(userid);
		return "redirect:/customLogout";
	}
}