package com.mcbt.tq.mapper;

import java.util.List;
import java.util.Map;

import com.mcbt.board.vo.BoardVO;
import com.mcbt.test.vo.TestVO;
import com.mcbt.tq.vo.TqVO;
import com.webjjang.util.PageObject;

public interface TqMapper {

	// 1. 게시판 리스트
	public List<TqVO> list(Map<String, Object> map);

	// 1-1. 게시판 리스트의 페이지 처리를 위한 전체 데이터 갯수
	public Long getTotalRow(PageObject pageObject);

	// 2. 게시판 글보기
	public TqVO view(Long no);

	// 3. 게시판 글쓰기
	public int write(TqVO vo);
	
	// 3-2. 게시판 보기 글쓰기
	public TqVO write02(Long no);
	
	//정답 등록
	public int right(TqVO vo);

	// 4. 게시판 글수정
	public int update(TqVO vo);

	// 5. 게시판 글삭제
	public int delete(TqVO vo);
	
	// 글번호 최대값 가져오기
	public long getMax();
}
