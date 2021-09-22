package com.mcbt.tq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.tq.mapper.TqReplyMapper;
import com.mcbt.tq.vo.TqReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 자동생성 - @Controller, @Service, @Repository, @Component, @RestController
@Service
// private 변수에 대한 자동 DI - 생성자
@AllArgsConstructor
@Qualifier("tqrsi")
@Log4j
public class TqReplyServiceImpl implements TqReplyService {
	
	private TqReplyMapper mapper;

	@Override
	public List<TqReplyVO> list(PageObject pageObject, Long no) throws Exception {
		// TODO Auto-generated method stub
		// 게시판 글번호에 맞는 전체 데이터 갯수 가져오기
		pageObject.setTotalRow(mapper.getTotalRow(no));
		log.info("list().pageObject : " + pageObject + ", no : " + no);
		// Mybatis에서 파이메터로 한개만 받으므로 하나로 합쳐 줬다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("no", no);
		return mapper.list(map);
	}

	@Override
	public int write(TqReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("write().vo : " + vo);
		return mapper.write(vo);
	}
	
	@Override
	public int update(TqReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("update().vo : " + vo);
		return mapper.update(vo);
	}
	
	@Override
	public int delete(TqReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("delete().vo : " + vo);
		return mapper.delete(vo);
	}

	@Override
	public Long getTotalRow() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
