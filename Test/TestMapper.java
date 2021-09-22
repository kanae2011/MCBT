package com.mcbt.test.mapper;

import java.util.List;
import java.util.Map;

import com.mcbt.test.vo.TestVO;
import com.webjjang.util.PageObject;

public interface TestMapper {

	//1.문제 목록
	public List<TestVO> list(Map<String, Object> map);
	
	//2.문제 목록 전체 데이터 가져오기 
	public long getTotalRow(PageObject pageObject);
	
	//3.문제 보기
	public TestVO view(Long no);
	
	//4.문제 등록
	public int write(TestVO vo);

	//5.문제 수정
	public int update(TestVO vo);
	
	//6.문제 삭제
	public int delete(Long no);
	
	//가장 큰번호 문제 
	public long getMax();
	
	//정답 등록
	public int right(TestVO vo);
	
	
}
