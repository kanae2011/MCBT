package com.mcbt.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mcbt.board.service.BoardService;
import com.mcbt.board.vo.BoardVO;

import com.webjjang.util.PageObject;

// 자동 생성 - @Controller, @Service, @Repository, @Component, @RestController,
// @~~Advice -> component-scan 설정 : servlet-context.xml, root-contenxt.xml
@Controller
@RequestMapping("/board")
public class BoardController {
	private final String MODULE = "board";

//	private final String MODULE = "board";

	// 자동 DI
	@Autowired
	@Qualifier("bsi")
	private BoardService boardService;
	
	// 1. 게시판 리스트 - 검색 / list.do - get
	@GetMapping("/list.do")
	// @ModelAttribute - 전달 받은 변수의 값을 model에 담아서 JSP까지 보내준다. 변수 이름으로 사용
	public String list(Model model, @ModelAttribute PageObject pageObject) throws Exception { 
		model.addAttribute("list", boardService.list(pageObject));
		model.addAttribute("listCnt", boardService.countArticle(pageObject));
		// /WEB-INF/views + /board/list + .jsp -> servlet-context.xml 정보
		return MODULE + "/list";
	}

	@GetMapping("/write.do")
	public String writeForm() {
		return MODULE + "/write";
	}
	
	//3-1. 게시판 등록 처리 / write.do - post
	@PostMapping("/write.do")
	public String write(BoardVO vo, HttpSession session) throws Exception {

//		String writer = (String) session.getAttribute("id");
		// db에 데이터 저장하기
//		vo.setWriter(writer);
		boardService.write(vo);
		
		return "redirect:list.do";
	}

	@GetMapping("/view.do") 
	// Model 객체 - 처리된 데이터를 JSP에 전달
	// no, inc - 숫자 타입 : 원래는 String으로 데이터 전달. 없으면 null이된다. null을 숫자로
	// 변환하는 과정에서 오류가 난다.
	public String view(Model model, Long no, int inc, HttpSession session,
			@ModelAttribute PageObject pageObject) throws Exception {
		
		model.addAttribute("vo", boardService.view(no, inc, session));
		
		return MODULE + "/view";
	}
	
	//4. 게시판 글수정 폼 / update.do - get
	@GetMapping("/update.do")
	public String updateForm(Model model, Long no, HttpSession session) throws Exception {
		// jsp에 수정할 데이터를 보내야 한다. 데이터가 DB에 있다. view()
		model.addAttribute("vo", boardService.view(no, 0, session));
		return MODULE + "/update";
	}
	
	//4. 게시판 글수정 처리 / update.do - post
	@PostMapping("/update.do")
	public String update(BoardVO vo) throws Exception {
		
		boardService.update(vo);
		
		return "redirect:list.do";
	}

	
	//5. 게시판 글삭제 / delete.do - get
	@GetMapping("/delete.do")
	public String delete(BoardVO vo, PageObject pageObject) throws Exception {

		boardService.delete(vo);
		
		return "redirect:list.do?page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}

}
