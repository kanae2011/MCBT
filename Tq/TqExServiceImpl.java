package com.mcbt.tq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mcbt.tq.mapper.TqExMapper;
import com.mcbt.tq.vo.TqExVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
@Qualifier("tqexsi")
public class TqExServiceImpl implements TqExService{

	private TqExMapper mapper;
	
	@Override
	public List<TqExVO> list(Model model, Long no) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Map<String, Object> map = new HashMap<>();
				
				map.put("model", model);
				map.put("no", no);
				
				return mapper.list(map);
			}
	
	@Override
	public TqExVO exWriteForm(Long no) throws Exception {
		// TODO Auto-generated method stub
		log.info("exWriteForm().no : " + no);
		return mapper.exWriteForm(no);
	}

	@Override
	public int exWrite(TqExVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("exWrite().vo : " + vo);
		
		return mapper.exWrite(vo);
	}

	
	@Override
	public int exUpdate(TqExVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("exUpdate().vo : " + vo);
		
		return mapper.exUpdate(vo);
	}

	@Override
	public int exDelete(TqExVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("exDelete().no : " + vo);
		
		return mapper.exDelete(vo);
	}


}
