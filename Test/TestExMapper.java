package com.mcbt.test.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.EscapedErrors;

import com.mcbt.test.vo.TestExVO;

public interface TestExMapper {

	public List<TestExVO> list (Map<String, Object> map) throws Exception;
	
	public TestExVO exWriteForm(Long no)throws Exception;
	
	public int exWrite(TestExVO vo) throws Exception;
	
	public int exUpdate(TestExVO vo) throws Exception;
	
	public int exDelete(Long no) throws Exception;
	
	
}
