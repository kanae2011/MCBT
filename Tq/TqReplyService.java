package com.mcbt.tq.service;

import java.util.List;

import com.mcbt.tq.vo.TqReplyVO;
import com.webjjang.util.PageObject;


public interface TqReplyService {
	
	// 1. 댓글 리스트 - 페이지 처리 - Mybatis의 메서드들은 파라메터의 갯수를 한개만 받도록 작성되어 있다.
	// list(PageObject pageObject, Long no)
	// Map - "pageObject":pageObject, "no":no
	public List<TqReplyVO> list(PageObject pageObject, Long no) throws Exception;
	
	// 1-1. 댓글 전체 데이터 가져오기 - 페이지 처리(화면에 보여주는 페이지네이션)
	public Long getTotalRow() throws Exception;
	
	// 2. 댓글 보기 생략 - 리스트에 다 표시가 되므로 생략
	
	// 3. 댓글 쓰기
	public int write(TqReplyVO vo) throws Exception;
	
	// 4. 댓글 수정
	public int update(TqReplyVO vo) throws Exception;
	
	// 5. 댓글 삭제
	public int delete(TqReplyVO vo) throws Exception;

}
