package com.mcbt.solve.service; 

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.solve.mapper.SolveMapper;
import com.mcbt.solve.vo.SolveVO;
import com.mcbt.test.vo.TestExVO;
import com.mcbt.test.vo.TestVO;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("ssi")
@Log4j
public class SolveServiceImpl implements SolveService {

	@Inject
	private SolveMapper mapper;
	
	public long getCnt(String lev) throws Exception {
		// TODO Auto-generated method stub
		log.info("getCnt.lev : " + lev);
		return mapper.getCnt(lev);
	}
	
	// 랜덤으로 문제 번호 10개 가져오기
	@Override
	public int[] random(String lev, int[] random) throws Exception {
		// TODO Auto-generated method stub		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lev", lev);
		map.put("random", random);
		
		return mapper.random(map); 
	}

	// 문제 푼 회차 계산하기
	public int getMax(String id) throws Exception {
		log.info("getMax() 실행 중.......................");
		return mapper.getMax(id);
	}
	
	// 문제 가져오기
	@Override
	public TestVO quiz(int no) throws Exception {
		log.info("no : " + no);
		
		return mapper.quiz(no);
	}

	// 보기 가져오기
	@Override
	public List<TestExVO> ex(int no) throws Exception {
		// TODO Auto-generated method stub
		log.info("no : " + no);
		
		return mapper.ex(no);
	}

	// 다음 문제로 넘어가기
	@Override
	public int next(SolveVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("vo : " + vo);
		
		return mapper.next(vo);
	}
	// 점수 계산하기
	@Override
	public long score(SolveVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("score.vo : " + vo);
		
		return mapper.score(vo);
	}
	
	// 점수 DB에 넣기
	@Override
	public int scoreIn(SolveVO vo, long correct) throws Exception {
		log.info("scoreIn");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("vo", vo);
		map.put("correct", correct);
		return mapper.scoreIn(map);
	}

	// 사용자가 푼 문제 가져오기
	@Override
	public TestVO answerQuiz(int no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.answerQuiz(no);
	}

	// 사용자가 푼 문제의 보기 가져오기
	@Override
	public List<TestExVO> answerEx(int no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.answerEx(no);
	}

	
	
}
