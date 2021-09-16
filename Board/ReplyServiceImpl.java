package com.mcbt.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.board.mapper.ReplyMapper;
import com.mcbt.board.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;

// 자동생성 - @Controller, @Service, @Repository, @Component, @RestCotroller,
//   @~Advice : root-context.xml, servlet-context.xml 설정
@Service
// private 변수에 대한 자동 DI - 생성자
@AllArgsConstructor
@Qualifier("rsi")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;

	// 1. 댓글 목록
	@Override
	public List<ReplyVO> list(PageObject pageObject, Long no) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(no));
//		log.info("list().pageObject : " + pageObject + ", no : " + no);
		// Mabatis에서 파이메터로 한개만 받으므로 하나로 합쳐 줬다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("no", no);
		return mapper.list(map);
	}
	// 2. 댓글 보기
	@Override
	public ReplyVO view(Long rno) throws Exception {
		return mapper.view(rno);
	}
	@Override
	public int getTotalRow(Long no) throws Exception {
		return mapper.getTotalRow(no);
	}

	// 4. 댓글 입력
	@Override
	public int write(ReplyVO vo) throws Exception {
		return mapper.write(vo);
	}
	// 5. 댓글 수정
	@Override
	public int update(ReplyVO vo) throws Exception {
		return mapper.update(vo);
	}
	// 6. 댓글 삭제
	@Override
	public int delete(ReplyVO vo) throws Exception {
		return mapper.delete(vo);
	}
}
