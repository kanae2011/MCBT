package com.mcbt.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.test.mapper.TestMapper;
import com.mcbt.test.vo.TestVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;


//자동생성DI
@Service
@Qualifier("testsi")
@Log4j

public class TestServiceImpl implements TestService{

	@Inject
	private TestMapper mapper;
	
	@Override
	public List<TestVO> list(PageObject pageObject,String lev) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("pageObject : " + pageObject);
		
		Map<String, Object> map = new HashMap<>();
		map.put("lev", lev);
		map.put("pageObject", pageObject);
		
		return mapper.list(map);
	}
	

	@Override
	public TestVO view(Long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int write(TestVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("writeService " );
		return mapper.write(vo);
	}

	@Override
	public int update(TestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}


	@Override
	public long getMax() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getMax();
	}
	
	
	@Override
	public int right(TestVO vo) throws Exception{
		return mapper.right(vo);
	}

}
