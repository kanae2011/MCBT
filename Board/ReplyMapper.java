package com.mcbt.board.mapper;

import java.util.List;
import java.util.Map;

import com.mcbt.board.vo.ReplyVO;

public interface ReplyMapper {

	// 1. 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ReplyVO> list(Map<String, Object> map);
	// 1-1. 댓글 전체 데이터 가져오기 - 페이지 처리(화면에 보여주는 페이지네이션)
	public int getTotalRow(Long no);

	// 2. 게시판 보기
	public ReplyVO view(Long rno);
	// 3. 게시글 작성
	public int write(ReplyVO vo);
	// 4. 게시글 수정
	public int update(ReplyVO vo);
	// 5. 게시글 삭제
	public int delete(ReplyVO vo);
	
}
