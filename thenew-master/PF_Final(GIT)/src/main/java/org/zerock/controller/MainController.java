package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
	
	// 회사 설립 목적 페이지 맵핑
	@GetMapping("/aboutCompany")
	public void aboutCompany() {
		
	}
	
	// 회사 맴버 소개 및 소감 페이지 맵핑
	@GetMapping("/aboutMember")
	public void aboutMember() {
		
	}
	
	// 회사 연혁 페이지 맵핑
	@GetMapping("/aboutHistory")
	public void aboutHistory() {
		
	}
	
	// 회사 오시는 길 페이지 맵핑
	@GetMapping("/aboutLocation")
	public void aboutLocation() {
		
	}
	
	// 사이트 맵 페이지 맵핑
	@GetMapping("/aboutSiteMap")
	public void aboutSiteMap() {
		
	}

}