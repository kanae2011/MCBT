package com.mcbt.test.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcbt.test.service.TestExService;
import com.mcbt.test.service.TestService;
import com.mcbt.test.vo.TestVO;
import com.mcbt.test.vo.TestExVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test")
@Log4j
public class TestController {
	
	private final String MODULE = "test";
	
	@Autowired
	@Qualifier("testsi")
	private TestService service;
	
	@Autowired
	@Qualifier("texsi")
	private TestExService exservive; 
	
	
	//1.문제 목록
	@GetMapping("/list.do")
	public String list(Model model, @ModelAttribute PageObject pageObject,String lev)throws Exception{

		log.info("TestController_list().pageObject : " + pageObject + ".....");
		model.addAttribute("list", service.list(pageObject,lev));

		
		return MODULE + "/list";
	}
	
	
	//2.문제 보기
	@GetMapping("/view.do")
	public String view(Model model, @ModelAttribute PageObject pageObject,Long no) throws Exception{
		
		log.info("TestController_view()pageObject " + pageObject);
		model.addAttribute("vo", service.view(no));
		//보기 목록 호출
		testEx(model,no);
		
		return MODULE + "/view";
	}
		
	//3-1.문제 등록폼
	@GetMapping("/testReg01.do")
	public String writeForm() {
		
		log.info("TestController_writeForm()");
		
		return MODULE + "/testReg01";
	}
		
	//3-2.문제 등록
	@PostMapping("/testReg01.do")
	public String write(TestVO vo,int perPageNum)throws Exception{
	
		log.info("TestController_write().vo : " + vo);
		service.write(vo);
	
		
		return "redirect:testReg02.do?no=" + service.getMax();
	}
	
	//4-1.보기 등록
	@GetMapping("/testReg02.do")
	public String exWriteForm(Model model,Long no, TestExVO vo)throws Exception{
		
		log.info("exWriteForm : " + vo);
		
		model.addAttribute("vo", service.view(no));
		model.addAttribute("exList", exservive.list(model, no));
		
		return MODULE + "/testReg02";
	}
	
	//4-2.보기 등록
	@PostMapping("/testReg02.do")
	public String exWrite(TestExVO vo)throws Exception{
		
		log.info("exWrite : " + vo);
		exservive.exWrite(vo);
		
		return "redirect:testReg02.do?no=" + service.getMax();
	}
	
	//5-1.정답 등록
	@GetMapping("/testReg03.do")
	public String rightForm(TestVO vo)throws Exception{
		
		log.info("rightForm : " + vo);
		
		
		return MODULE + "/testReg03";
	}
	
	//5-2.정답 등록
	@PostMapping("/testReg03.do")
	public String right(TestVO vo)throws Exception{
		
		service.right(vo);
		
		int result = service.right(vo);
		if(result == 0)throw new Exception("정답 등록 실패");
		log.info("right().result" + result);
		
		return "redirect:list.do";
	}
	
	
	//4-1.문제 수정폼
	@GetMapping("/update.do")
	public String updateForm(Model model,Long no)throws Exception{
		log.info("TestController_updateForm().no : " + no);
		model.addAttribute("vo", service.view(no));
		
		return MODULE + "/update";
	}
	
	//4-2.문제 수정
	@PostMapping("/update.do")
	public String update(TestVO vo,RedirectAttributes rttr,PageObject pageObject) throws Exception{
		log.info("TestController_update().vo : " + vo);
		
		int result = service.update(vo);
		if(result == 0)throw new Exception("TestController_update False : 수정 데이터 확인 요망");
		
		log.info("update().result : " + result);
		rttr.addFlashAttribute("msg", "문제 수정 완료");
		
		return "redirect:update.do?no=" + vo.getNo() 
				+ "&page=" + pageObject.getPage() 
				+ "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	//5.문제 삭제
	@GetMapping("/delete.do")
	public String delete(Long no,int perPageNum,RedirectAttributes rttr)throws Exception{
		log.info("TestController_delete().no : " + no);
		
		int result = service.delete(no);
		if(result == 0)throw new Exception("TestController_delete False : 삭제 데이터 확인 요망");
		rttr.addFlashAttribute("msg", "문제 삭제 완료");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	
	//6.보기 
	public void testEx(Model model,Long no)throws Exception{
		
		model.addAttribute("testEx", exservive.list(model, no));
	}
}
