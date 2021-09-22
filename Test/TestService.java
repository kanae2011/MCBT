package com.mcbt.test.service;

import java.util.List;

import com.mcbt.test.vo.TestVO;
import com.webjjang.util.PageObject;

public interface TestService {

	//1.문제 제작 목록
	public List<TestVO> list(PageObject pageObject,String lev) throws Exception;
	
	//2.문제 제작 보기
	public TestVO view(Long no) throws Exception;
	
	//3.문제 등록
	public int write(TestVO vo) throws Exception;
	
	//4.문제 수정
	public int update(TestVO vo) throws Exception;
	
	//5.문제 삭제
	public int delete(Long no) throws Exception;
	
	//가장 큰 번호 가져오기 
	public long getMax() throws Exception;
	
	//정답 
	public int right(TestVO vo) throws Exception;
}
