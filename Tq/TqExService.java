package com.mcbt.tq.service;

import java.util.List;

import org.springframework.ui.Model;

import com.mcbt.tq.vo.TqExVO;

public interface TqExService {

	public List<TqExVO> list(Model model, Long no) throws Exception;
	
	public TqExVO exWriteForm(Long no) throws Exception;
	
	public int exWrite(TqExVO vo) throws Exception;
	
	public int exUpdate(TqExVO vo) throws Exception;
	
	public int exDelete(TqExVO vo) throws Exception;
	
}
