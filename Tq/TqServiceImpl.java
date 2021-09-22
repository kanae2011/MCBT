package com.mcbt.tq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.mcbt.tq.vo.TqVO;
import com.mcbt.test.vo.TestVO;
import com.mcbt.tq.mapper.TqMapper;

import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

//자동 생성
@Service
//타입이 같은 객체들이 많은경우
//
@Qualifier("tqsi")
@Log4j
public class TqServiceImpl implements TqService {

	// mapper를 이용해서 DB처리해야한다.
	// 자동 DI 적용 - @Setter : lombok, @Autowired : spring, @Inject : java
	@Inject
	private TqMapper mapper;

	@Override
	public List<TqVO> list(PageObject pageObject,String lev, String accept) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("pageObject" + pageObject);

		Map<String, Object> map = new HashMap<>();
		// 승인여부별 모아보기
		map.put("accept", accept);
		// 난이도별 모아보기
		map.put("lev", lev);
		// 전체 페이지
		map.put("pageObject", pageObject);
		// 검색
		map.put("key", pageObject.getKey());
		map.put("word", pageObject.getWord());
		
		return mapper.list(map);
	}

	@Override
	public TqVO view(Long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int write(TqVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}
	
	@Override
	public TqVO write02(Long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write02(no);
	}

	@Override
	public int update(TqVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(TqVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}
	
	@Override
	public long getMax() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getMax();
	}
	
	@Override
	public int right(TqVO vo) throws Exception{
		return mapper.right(vo);
	}

}
