package com.mcbt.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mcbt.test.mapper.TestExMapper;
import com.mcbt.test.vo.TestExVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
@Qualifier("texsi")

public class TestExServiceImpl implements TestExService {

	private TestExMapper mapper;
	
	@Override
	public List<TestExVO> list(Model model, Long no) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		map.put("model", model);
		map.put("no", no);
		
		return mapper.list(map);
	}

	@Override
	public TestExVO exWriteForm(Long no) throws Exception {
		// TODO Auto-generated method stub
		log.info("exWriteForm().no : " + no);
		return mapper.exWriteForm(no);
	}

	@Override
	public int exWrite(TestExVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("write().vo : " + vo);
		
		return mapper.exWrite(vo);
	}

	@Override
	public int exUpdate(TestExVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("update().vo : " + vo);
		
		return mapper.exUpdate(vo);
	}

	@Override
	public int exDelete(Long no) throws Exception {
		// TODO Auto-generated method stub
		log.info("delete().no : " + no);
		
		return mapper.exDelete(no);
	}



	

}
