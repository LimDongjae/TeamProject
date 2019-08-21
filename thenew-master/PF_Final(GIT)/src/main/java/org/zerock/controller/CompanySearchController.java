package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CompanySearchVO;
import org.zerock.domain.CompanySearchCriteria;
import org.zerock.domain.CompanySearchPageDTO;
import org.zerock.service.CompanySearchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/companySearch/*")
@AllArgsConstructor
public class CompanySearchController {

	private CompanySearchService service;
	

	//페이징처리, 회사 검색기능
	@GetMapping("/list")
	public void list(CompanySearchCriteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new CompanySearchPageDTO(cri, total));
		
		model.addAttribute("autosearch", service.getAutoSearch(cri));
	}
	
	
	@PostMapping("/register")
	public String register(CompanySearchVO company, RedirectAttributes rttr) {
		
		log.info("register" + company);
		
		service.register(company);
		
		rttr.addFlashAttribute("result", company.getCompId());
		
		return "redirect:/company/list";
		
		
	}
	
	
	@GetMapping("/get")
	public void get(@RequestParam("CompId") String CompId, Model model) {
		
		log.info("/get");
		model.addAttribute("company", service.get(CompId));
	}
	
	@PostMapping("/modify")
	public String modify(CompanySearchVO company, RedirectAttributes rttr) {
		log.info("modify:" + company);
		
		if(service.modify(company)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/company/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("CompId") String CompId, RedirectAttributes rttr) {
		
		log.info("remove" + CompId);
		if (service.remove(CompId) ) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/company/list";
	}
	

}
