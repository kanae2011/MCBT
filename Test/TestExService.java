package com.mcbt.test.service;

import java.util.List;

import org.springframework.ui.Model;

import com.mcbt.test.vo.TestExVO;

public interface TestExService {

	//1.보기 목록
	public List<TestExVO> list(Model model, Long no) throws Exception;
	
	
	public TestExVO exWriteForm(Long no) throws Exception;
	
	//3. 보기 등록
	public int exWrite(TestExVO vo) throws Exception;
	
	//4.보기 수정
	public int exUpdate(TestExVO vo) throws Exception;
	
	//5.보기 삭제 
	public int exDelete(Long no) throws Exception;

}
