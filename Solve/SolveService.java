package com.mcbt.solve.service; 

import java.util.List;

import com.mcbt.solve.vo.SolveVO;
import com.mcbt.test.vo.TestExVO;
import com.mcbt.test.vo.TestVO;


public interface SolveService {

	// 랜덤함수
	public long getCnt(String lev) throws Exception;
	
	// 문제 푼 회차 계산하기
	public int getMax(String id) throws Exception;
	
	// 랜덤으로 문제 번호 10개 가져오기
	public int[] random(String lev, int[] random) throws Exception;
	
	// 문제 가져오기
	public TestVO quiz(int no) throws Exception;
	
	// 보기 가져오기
	public List<TestExVO> ex(int no) throws Exception;
	
	// 다음 문제로 넘어가기
	public int next(SolveVO vo) throws Exception;
	
	// 점수 계산하기
	public long score(SolveVO vo) throws Exception;
	
	// 점수 DB에 넣기
	public int scoreIn(SolveVO vo, long correct) throws Exception;
	
	// 사용자가 푼 문제 가져오기
	public TestVO answerQuiz(int no) throws Exception;
	
	// 보기 가져오기
	public List<TestExVO> answerEx(int no) throws Exception;
	
}
