package com.mcbt.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mcbt.board.service.ReplyService;
import com.mcbt.board.vo.ReplyVO;
import com.webjjang.util.PageObject;

// 자동 생성 - @Controller, @Service, @Repository, @Component, @RestController,
// @~~Advice -> component-scan 설정 : servlet-context.xml, root-contenxt.xml
@RestController
@RequestMapping("/reply")
public class ReplyController {

	// 자동 DI
	@Autowired
	@Qualifier("rsi")
	private ReplyService replyService;

	@GetMapping(value = "/list.do", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	// ResponseEntity : 실행 상태 코드와 함께 실행결과를 클라이언트에서 전달할때 사용하는 객체
	public ResponseEntity<Map<String, Object>> list(@RequestParam(defaultValue = "1") Long repPage, @RequestParam(defaultValue = "5") Long repPerPageNum,
		Long no) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		// 댓글에 대한 페이지 정보
		PageObject replyPageObject = new PageObject(repPage, repPerPageNum);
		
		map.put("pageObject", replyPageObject);
		map.put("list", replyService.list(replyPageObject, no));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	@PostMapping(value = "/write.do", consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE}, produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> write(@RequestBody ReplyVO vo) throws Exception {
		
		replyService.write(vo);
		return new ResponseEntity<String> ("댓글이 등록되었습니다.",HttpStatus.OK);
	}
}
