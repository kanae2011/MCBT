package com.mcbt.tq.service;

import java.util.List;

import com.mcbt.test.vo.TestVO;
import com.mcbt.tq.vo.TqVO;
import com.webjjang.util.PageObject;

public interface TqService {
	
	// 1. 문제 출제 게시판 리스트
	public List<TqVO> list(PageObject pageObject,String lev, String accept) throws Exception;

	// 2. 게시판 글보기
		public TqVO view(Long no) throws Exception;
		
		// 3. 게시판 글쓰기
		public int write(TqVO vo) throws Exception;
		
		// 3-1. 게시판 보기 글쓰기
		public TqVO write02(Long no) throws Exception;
		
		//정답 
		public int right(TqVO vo) throws Exception;
		
		// 4. 게시판 글수정
		public int update(TqVO vo) throws Exception;
		
		// 5. 게시판 글삭제
		public int delete(TqVO vo) throws Exception;
		
		//가장 큰 번호 가져오기 
		public long getMax() throws Exception;
}
