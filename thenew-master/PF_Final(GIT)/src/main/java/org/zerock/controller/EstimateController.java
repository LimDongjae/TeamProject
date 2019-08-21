package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.EstimateAttachVO;
import org.zerock.domain.EstimateVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.EstimateService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/estimate/*")
@AllArgsConstructor
public class EstimateController {

	private EstimateService service;

	// register.jsp로 가기위한 매핑
	@GetMapping("/estimate")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	// list를 보기 위한 매핑
	@GetMapping("/estimatelist")
	// model: 컨트롤러에서 뷰로 전환할 때 데이터를 가지고 있는 객체. 컨트롤러가 뷰로 model 객체를 넘겨 뷰에서 model 객체의 데이터 이용 가능
	public void estimatelist(Criteria cri, Model model) {
		log.info("estimatelist: " + cri);
		// service에서 리턴된 list값을 list라는 attribute로 만들어 보낸다.
		model.addAttribute("list", service.getList(cri));
		// model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 새글 등록 하기위한 매핑
	@PostMapping("/estimate")
	@PreAuthorize("isAuthenticated()")
	public String register(EstimateVO estimate, RedirectAttributes rttr) {
		log.info("==========================");
		log.info("register: " + estimate);
		if (estimate.getAttachList() != null) {
			estimate.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(estimate.getContent());
		log.info("==========================");
		service.register(estimate);
		rttr.addFlashAttribute("result", estimate.getEno());
		return "redirect:/estimate/estimatelist";
	}

	// get.jsp와 modify jsp로 이동하기 위해서 사용하는 매핑
	// get.jsp로 이동하는 경우에는 값을 전달받아서 이동한다.
	@GetMapping({ "/get", "/modify" })
	// @ModelAttribute: 서브밋된 폼의 내용을 저장해서 전달받거나, 다시 뷰로 넘겨서 출력하기 위해 사용되는 오브젝트
	// 이 오브젝트는 @RequestParam과 달리 요청 파라미터의 타입이 모델 오브젝트의 프로퍼티 타입과 일치하는지를 포함한 다양한 검증 기능을 수행한다.
	public void get(@RequestParam("eno") Long eno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("estimate", service.get(eno));
	}


	// 수정을 위한 매핑
	// 로그인한 사용자와 글의 작성자가 일치해야 한다.
	@PreAuthorize("principal.username == #estimate.writer")
	@PostMapping("/modify")
	
	public String modify(EstimateVO estimate, Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + estimate);

		if (service.modify(estimate)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/estimate/estimatelist" + cri.getListLink();
	}
	
	// 삭제를 위한 매핑
	// 로그인한 사용자와 글의 작성자가 일치해야 한다.
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("eno") Long eno, Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove..." + eno);
		List<EstimateAttachVO> attachList = service.getAttachList(eno);
		if (service.remove(eno)) {
			// delete Attach Files
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		// 컨트롤러에서 요청을 처리한 후 list 페이지로 이동
		return "redirect:/estimate/estimatelist" + cri.getListLink();
	}
	
	// 첨부되어 있는 파일을 삭제하는 메소드
	private void deleteFiles(List<EstimateAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files...................");
		log.info(attachList);
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}

	// 첨부되어 있는 파일을 가져오기 위한 매핑
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<EstimateAttachVO>> getAttachList(Long eno) {
		log.info("getAttachList " + eno);
		return new ResponseEntity<>(service.getAttachList(eno), HttpStatus.OK);
	}
}
 