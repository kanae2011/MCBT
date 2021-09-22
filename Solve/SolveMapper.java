package com.mcbt.solve.mapper; 

import java.util.List;
import java.util.Map;

import com.mcbt.solve.vo.SolveVO;
import com.mcbt.test.vo.TestExVO;
import com.mcbt.test.vo.TestVO;


public interface SolveMapper {
	
	// 갯수
	public long getCnt(String lev);
	
	// 문제 푼 회차 계산하기
	public int getMax(String id);

	// 랜덤으로 문제 번호 10개 가져오기
	public int[] random(Map<String, Object> map);
	
	// 문제 가져오기
	public TestVO quiz(int no);
	
	// 보기 가져오기
	public List<TestExVO> ex(int no);

	// 다음 문제로 넘어가기
	public int next(SolveVO vo);
	
	// 점수 계산하기
	public long score(SolveVO vo);
	
	// 점수 DB에 넣기
	public int scoreIn(Map<String, Object> map);
	
	// 사용자가 푼 문제 가져오기
	public TestVO answerQuiz(int no);
		
	// 사용자가 푼 문제의 보기 가져오기
	public List<TestExVO> answerEx(int no);
	
}
