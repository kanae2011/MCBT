package com.mcbt.tq.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcbt.tq.service.TqReplyService;
import com.mcbt.tq.vo.TqReplyVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

// 자동 생성 - @Controller, @Service, @Repository, @Component, @RestController,
// @~~Advice -> component-scan 설정 : servlet-context.xml, root-contenxt.xml
@RestController
@RequestMapping("/replies")
@Log4j
public class TqReplyController {

	// 자동 DI
	@Autowired
	@Qualifier("tqrsi")
	private TqReplyService service;
	
	// 1. 게시판 댓글 리스트 - 검색 / list.do - get -> list.json 불가능 : xml만 서비스
	@GetMapping(value = "/list.do",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
						} )
	// ResponseEntity : 실행 상태 코드와 함께 실행결과를 클라이언트에서 전달할때 사용하는 객체
	public ResponseEntity<Map<String, Object>> list(
//	public ResponseEntity<List<ReplyVO>> list(
			@RequestParam(defaultValue = "1") long repPage,
			@RequestParam(defaultValue = "5") long repPerPageNum,
			long no)
		throws Exception {
		Map<String, Object> map = new HashMap<>();
		// 댓글에 대한 페이지 정보
		PageObject replyPageObject = new PageObject(repPage, repPerPageNum);
		log.info("list().replyPageObject : " + replyPageObject + ", no : " + no);
		
		map.put("pageObject", replyPageObject);
		map.put("list", service.list(replyPageObject, no));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
//		return new ResponseEntity<>(service.list(replyPageObject, no),
//				HttpStatus.OK);
	}
	
	//2. 게시판 댓글보기 생략 - 리스트에 내용이 다 나온다.
	
	//3. 게시판 댓글 등록 폼 / /board/view.do 포함.
	
	//3-1. 게시판 등록 처리 / write.do - post
	@PostMapping(value = "/write.do", 
//			consumes = "aplication/json",
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
//			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> write(@RequestBody TqReplyVO vo) throws Exception {
		log.info("write().vo : " + vo);
		
		// db에 데이터 저장하기
		service.write(vo);
		
		return new ResponseEntity<String>
		("댓글이 등록되었습니다.",HttpStatus.OK);
//		(URLEncoder.encode("댓글이 등록되었습니다.","utf-8"),HttpStatus.OK);
	}
	
	//4. 게시판 글수정 폼 / /board/view.do 포함.
	
	//4. 게시판 글수정 처리 / update.do - patch
	@PatchMapping(value = "/update.do",
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> update(@RequestBody TqReplyVO vo) throws Exception {
		
		log.info("update().vo : " + vo);
		
		int result = service.update(vo);
		
		// 전달되는 데이터의 선언
		String msg = "게시판 글수정이 성공적으로 되었습니다.";
		HttpStatus status = HttpStatus.OK;
		
		if(result == 0) {
			msg = "게시판 수정 실패 - 정보를 확인해 주세요.";
			status = HttpStatus.NOT_MODIFIED;
		}
		
		log.info("update().msg : " + msg);
		
		return new ResponseEntity<String>(msg, status);
	}
	
	//5. 게시판 글삭제 / delete.do - delete 방식
	@DeleteMapping(value = "/delete.do",
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> delete(@RequestBody TqReplyVO vo)
			throws Exception {
		
		log.info("delete().vo : " + vo);
		
		int result = service.delete(vo);

		// 전달되는 데이터의 선언
		String msg = "게시판 삭제가 성공적으로 되었습니다.";
		HttpStatus status = HttpStatus.OK;
		
		if(result == 0) {
			msg = "게시판 삭제 실패 - 정보를 확인해 주세요.";
			status = HttpStatus.NOT_MODIFIED;
		}
		
		log.info("update().msg : " + msg);
		
		return new ResponseEntity<String>(msg, status);
	}
	

}
