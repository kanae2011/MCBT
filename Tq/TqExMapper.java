package com.mcbt.tq.mapper;

import java.util.List;
import java.util.Map;

import com.mcbt.tq.vo.TqExVO;

public interface TqExMapper {
	
	public List<TqExVO> list (Map<String, Object> map) throws Exception;
	
	public Long getTotalRow(Long no) throws Exception;
	
	public TqExVO exWriteForm(Long no) throws Exception;
	
	public int exWrite(TqExVO vo) throws Exception;
	
	public int exUpdate(TqExVO vo) throws Exception;
	
	public int exDelete(TqExVO vo) throws Exception;

}
