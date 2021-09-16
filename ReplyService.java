package com.mcbt.board.service;

import java.util.List;

import com.mcbt.board.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface ReplyService {
	
	// 1. 댓글 목록
	public List<ReplyVO> list(PageObject pageObject, Long no) throws Exception;
	public int getTotalRow(Long no) throws Exception;
	// 2. 댓글 상세보기
	public ReplyVO view(Long rno) throws Exception;
	// 3. 댓글 입력
	public int write(ReplyVO vo) throws Exception;
	// 4. 댓글 수정
	public int update(ReplyVO vo) throws Exception;
	// 5. 댓글 삭제
	public int delete(ReplyVO vo) throws Exception;
	
}
